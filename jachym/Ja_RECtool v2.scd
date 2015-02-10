s.plotTree();

(
SynthDef(\rec, {|bufnum|
	DiskOut.ar(bufnum, In.ar(0,2));
}).add;

~colBack = Color.new255(30,30,30);
~colFront = Color.new255(255,255,255);
~colText = Color.new255(120,120,120);
~colActive = Color.new255(200,50,50);
w = Window.new("ja_REC", Rect(1000,200,200,50));
w.alpha_(0.95);
w.alwaysOnTop_(true);
w.background_(~colBack).front;
~infoText = StaticText.new(w,Rect(50,11,100,27)).string_("Press to start REC").stringColor_(~colText);

~recButtons.add(Button(w, Rect(15, 15, 20, 20))
	.states_([
		["||",~colFront,~colBack],
		[">>",~colFront,~colActive]
	])
	.action_({ arg butt;
		if(butt.value == 1) {
			~nameFile = thisProcess.platform.recordingsDir + ".flac";
			~recG = Group.new(nil, \addAfter);
			~recBuf = Buffer.alloc(s, 262144, 2);
			~recBuf.write(nil,"flac","int16",0,0,true);
			~recObject = Synth.tail(~recG, \rec, [\bufnum, ~recBuf]);
			~infoText.close;
			~infoText = StaticText.new(w,Rect(50,11,100,27)).string_("Recording").stringColor_(~colText);
		};
		if(butt.value == 0) {
			~recObject.free;
			~recBuf.close;
			~recBuf.free;
			~recG.free;
			~infoText.close;
			~infoText = StaticText.new(w,Rect(50,11,170,27)).string_("Saved to: \n" ++ ~nameFile).stringColor_(~colText);
		};
	})
);
w.front;
)
