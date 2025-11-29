module app;

import core.time;

import std.stdio;
import std.parallelism;

import gtk.Bin;
import gtk.MainWindow;
import gtk.Label;
import gtk.Main;
import gtk.Button;
import gtk.IconSize;

__gshared bool running = true;

auto getTime() {

	auto now = MonoTime.currTime();
	auto ticksPer = now.ticksPerSecond();

	auto micros = now.ticks * 1_000_000 / ticksPer;

	return micros;
}

void render(double iv) {
}

void main(string[] args) {
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
