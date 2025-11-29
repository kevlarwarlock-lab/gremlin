module app;

struct EFI_TABLE_HEADER {
	ulong a;
	uint b, c, d, e;

}

struct EFI_SYSTEM_TABLE {
	EFI_TABLE_HEADER hdr;

	wchar* FirmwareVendor;
	uint FirmwareRevision;
	void* ConsoleInHandle;
	void* ConIn;
	void* ConsoleOutHandle;
	EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* ConOut;
	void* StandardErrorHandle;
	EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* StdErr;

}

struct EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL {
	void* reset;
	ulong function(EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, wchar*) outputString;

}

extern (C):
void efi_main(void* imageHandle, EFI_SYSTEM_TABLE* systemTable) {

while(true){

	systemTable.ConOut.outputString(systemTable.ConOut,cast(wchar*)"HELLO\n"w.ptr);

}
//	return;
}
