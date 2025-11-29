module app;

struct EFI_TABLE_HEADER {
	ulong a;
	uint b, c, d, e;

}

<<<<<<< HEAD
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
=======
void render(double iv) {
}

void gemMain(string[] args) {
	Main.initMultiThread(args);
	MainWindow win = new MainWindow("Hello World");
	win.setDefaultSize(200, 100);
	//win.add(new Label("Hello World"));
	auto btn = new Button("press me", GtkIconSize.BUTTON);
	btn.setAlignment(32, 32);
	win.add(new Button("press *this*!"));
	win.showAll();
	auto tsk = new Task!(() {
		enum tps = 1;
		enum maxSkip = 5;
		enum skipTicks = 1_000_000 / tps;
		auto nextTick = getTime();
		double interpolation = 1.0;
		while (.running) {
			//writeln("hello");
			auto loops = 0;

			while (getTime() > nextTick && loops < maxSkip) {
				writefln("hi: %.52f", interpolation);
				nextTick += skipTicks;

				loops += 1;
			}

			auto interp = double(getTime() + skipTicks - nextTick) / double(skipTicks);
			interpolation = interp;

			render(interp);
		}
	});
	tsk.executeInNewThread();
	Main.run();

	

	.running = false;
}
>>>>>>> ebecf743ea8d03882cd8f542a432d28589b29363
