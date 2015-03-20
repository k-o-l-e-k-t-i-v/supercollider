// might still need fixing.



// sync your computers by ending a clock around.
// this should be done without anything running, as it replaces the TempoClock.default
// but it can be done any time.

// rohrhuber 2005
(
var quant = [4.0, 0];
var clockURL, myName;
var coll, chat, sync;
var w, v, chatout, syncBut, chatWin;

var width = 304;
var height = 304;
var font = Font("Monaco", 7);
var log = true;
var file;



/////////////////////////////////////////////
myName = "kof"; // chat nick name

clockURL = "192.168.1.106"; 			// the clock url to which to sync
///////////////////////////////////////////

// clockURL = clockURL ? Library.at(\kirchturmURL) ? "127.0.0.1";
//myName = myName ?? {"Henry" + ["I", "II", "III", "IV", "V"].choose};

coll = Collective.default;
sync = ClockSync.new;
chat = Chat.new;

if(log) {
	file = File("chat_log_" ++ Date.localtime.stamp, "w");
	file.write(format("-------------%-------------\n", Date.getDate.asString) )
};


////////////////////////// GUI ///////////////////////////////

w = Window("Kolektiv" + myName, Rect(Window.screenBounds.width - width - 6, 10, width, height));

w.onClose = { sync.stop; chat.stop; if(log) { file.close }; };

w.view.decorator = FlowLayout(w.view.bounds);
w.view.background = Color.grey(0.8);

w.view.decorator.shift(10, 0);

Button(w, Rect(0,0, 60, 35)).states_([
	["ping", Color.black, Color.clear]
]).action_({ sync.ping(4) });

syncBut = Button(w, Rect(0,0, 60, 35)).states_([
	["sync", Color.black, Color.clear],
	["wait...", Color.black, Color.clear],
	["OK.", Color(0.3, 0.9, 0.8), Color.black]
]).action_({
	sync.sync(quant);
});


w.view.decorator.shift(3, 0);

NumberBox(w, Rect(0,0, 25, 20)).value_(quant[0]).action_({ |v| quant[0] = v.value });
NumberBox(w, Rect(0,0, 25, 20)).value_(quant[1]).action_({ |v| quant[1] = v.value });
//SCTextView(w, Rect(0,0, 80, 16)).string_(myName).font_(Font("Helvetica", 11))
//				.action_({|v|
//					myName = v.string
//				});


w.view.decorator.nextLine.shift(10, 4);

v = TextView(w, Rect(0,0, 120, 21)).string_(clockURL).font_(Font("Monaco", 7));
v.stringColor = Color.grey(0.3);

Button(w, Rect(0,0, 30, 21)).states_([
	["set", Color.black, Color.clear]
]).action_({
	clockURL = v.string;
	coll.hubIP = clockURL;
	Library.put(\kirchturmURL, clockURL);
});

StaticText(w, Rect(0, 0, 120, 21)).string_("I'm" + coll.myIP).font_(Font("Monaco", 7)).mouseDownAction_({ coll.myIP.postln });

w.view.decorator.nextLine.shift(10, 4);
chatWin = TextView(w, Rect(0,0, width - 25, height - 126))
.resize_(5)
.font_(font)
.hasVerticalScroller_(true)
.autohidesScrollers_(true);

w.view.decorator.nextLine.shift(10, 4);
chatout = TextView(w, Rect(0,0, width - 25, 30))
.resize_(8)
.font_(font)
.usesTabToFocusNextView_(false);

chatout.keyDownAction_({ arg view, char;
	if(char === Char.tab)
	{
		chat.talk(view.string);
		AppClock.sched(0.01, { view.string = "" });
	}
});
chatout.focus;
w.front;

///////////////////////////// actions ///////////////////////////////

chat.recvMsgAction = { |x|
	defer {
		chatWin.string = chatWin.string ++ x
	};
	if(log) { file.write(x.asString) };
};
sync.waitingAction = { defer { w.view.background = Color(0.9, 0.7, 0.6).vary; syncBut.value = 1} };
sync.setClockAction = { defer { w.view.background = Color.grey(0.1);
	r { syncBut.value = 2; 1.wait; syncBut.value = 0; }.play(AppClock)
};
};
sync.recvPingAction = {
	defer { r {
		w.view.background = Color.grey(1);
		0.2.wait;
		w.view.background = Color.grey(0.8);
	}.play(AppClock) };
}

)