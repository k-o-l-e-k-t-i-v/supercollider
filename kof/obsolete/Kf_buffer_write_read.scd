
(
var sec = 2;
var rate = 48000;
)

(
// allocate a buffer for writinig into
s = Server.local;
s.sendMsg("/b_alloc", 0, rate * sec,2);
)


//write into the buffer with a BufWr (still overwriting)
(

var recspeed = [1,1];

Ndef(\rec).quant = 2.0;
Ndef(\rec,{
	var mod,sig;
	mod = Select.kr(Stepper.kr(Impulse.kr(1/[1,2,4,8])),[4,8,2,4,8,2,4,8,1,4,8,1.5]).lag(0.1);
	sig = Splay.ar(
		 LFPulse.ar([1,2,4,8]).squared * SinOsc.ar(4320/([2pi,8pi,1.5pi,4pi,16pi,32pi]*mod));
	,0.5,1);

	BufWr.ar(sig, 0, LFSaw.ar(1/sec*recspeed).range(0,rate * sec));

	0; // zero output
}).play;
)

// no sound so far just rec


///////////////////////////////////////// VV


//read it with a BufRd
(
var speed = [0.5,2];

Ndef(\play).fadeTime = 2.0;
Ndef(\play).quant = 2.0;

Ndef(\play,{
	Splay.ar(
		FreeVerb.ar(
			    BufRd.ar(2, 0, LFSaw.ar(1/sec*speed,mul:rate*sec)) * 0.5 * LFPulse.ar(8/[1,2])
		)
	).clip(-1,1)
}).play;
)
