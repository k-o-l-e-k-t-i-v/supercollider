
s.boot;

(
Ndef(\a).fadeTime = 4;
Ndef(\a).quant = 2;

Ndef(\a,{
	var octave,tune,base,d1,d2,f,detune,sig;
	octave = Duty.kr(32,0,Dseq([1.5,2,1,1.25]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar(1/[4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(8/fib(8)),(1..8)/7);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = sig + (HPF.ar(PinkNoise.ar(0.005!4),(1..12)*220)) * LFSaw.ar(1/4/fib(12)).range(0,1);
	sig = sig + (SinOsc.ar(f*(1..8)*d2-detune,mul:0.005/(1..8)));
	sig = CompanderD.ar(sig,SinOsc.ar(1/4/(1..8)).range(0.25,0.75),1,1/6,0.002,0.02);


	sig = AllpassN.ar(sig.distort!4,0.25*d1.lag(1),0.25,4);

	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);



	Splay.ar(
		sig.distort.softclip
)}).play;
)



