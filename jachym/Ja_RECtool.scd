s.plotTree();

(
var colBack, colFront, colText, colActive;
var infoText, recButton;
var nameFile, recGroup, recBuffer, recObject, infText;

SynthDef(\rec, {|bufnum|
	DiskOut.ar(bufnum, In.ar(0,2));
}).add;

colBack = Color.new255(30,30,30);
colFront = Color.new255(255,255,255);
colText = Color.new255(120,120,120);
colActive = Color.new255(200,50,50);
w = Window.new("ja_REC", Rect(1000,200,200,50));
w.alpha_(0.95);
w.alwaysOnTop_(true);
w.background_(colBack).front;
infText = StaticText.new(w,Rect(50,11,100,27)).string_("Press to start REC").stringColor_(colText);

recButton.add(Button(w, Rect(15, 15, 20, 20))
	.states_([
		["||",colFront,colBack],
		[">>",colFront,colActive]
	])
	.action_({ arg butt;
		if(butt.value == 1) {
			nameFile = "C:" +/+ "SC_" ++ Date.localtime.stamp ++ ".flac".standardizePath;
			recGroup = Group.new(nil, \addToTail); // start this like last before REC, node to TAIL
			recBuffer = Buffer.alloc(s, 262144, 2);
			recBuffer.write(nameFile,"flac","int16",0,0,true);
			recObject = Synth.tail(recGroup, \rec, [\bufnum, recBuffer]);
			infText.close;
			infText = StaticText.new(w,Rect(50,11,100,27)).string_("Recording").stringColor_(colText);
		};
		if(butt.value == 0) {
			recObject.free;
			recBuffer.close;
			recBuffer.free;
			recGroup.free;
			infText.close;
			infText = StaticText.new(w,Rect(50,11,170,27)).string_("Saved to: \n" ++ nameFile).stringColor_(colText);
		};
	})
);
w.front;
)

