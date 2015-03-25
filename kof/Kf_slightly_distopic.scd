s.boot;


(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;

Ndef(\a,{
	var mod,lfo,sig1,sig2,sig3;
	mod = Select.kr(Stepper.ar(Impulse.ar(1/8/[4,8,7,13,21,55])),[1,1,1,1.5,3,1/2,1/2,1,1.5]);
	lfo = SinOsc.kr(1/8).range(0.00001,0.2);
	sig1 = SinOsc.ar([99,99.1],LFNoise0.ar(1/2!8).lag(lfo)*8pi,mul:0.5) * Decay.ar(Impulse.ar(8/[1,2,3,5,8]),0.15);
	sig2 = VarSaw.ar([440,440*1.25]/([1,1.5,1.25,3,1,0.5,0.125]*(mod*pi))+LFNoise0.kr(4!4).lag(0.1),LFNoise0.ar(1/2!8).lag(lfo)*8pi,lfo,mul:0.25) * VarSaw.ar(1/8/[4,8,7,13,21,55],{ExpRand()*8pi}!8).squared;
	sig3 = HPF.ar(WhiteNoise.ar(0.15!4) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),0.15),8800);
	Splay.ar(
		sig1 + sig2 + sig3
)}).play;

Ndef(\a)[1] = \filter -> {|in| Vibrato.ar(in,6+(1/[1,2,4,8]),0.1/[1,2,4,8])};
Ndef(\a)[2] = \filter -> {|in| FreeVerb.ar(in,0.333,10,mul:0.93,add:in/2)};
Ndef(\a)[3] = \filter -> {|in| RLPF.ar(in,SinOsc.ar([77,77.1]).range(110,2000),mul:0.33,add:in)};

)