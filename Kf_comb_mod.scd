s.boot;


(

Ndef(\ss).quant = 2.0;
Ndef(\ss).fadeTime = 2.0;
t = Tuning.harmonic;

Ndef(\ss,{|mod = 8,mod2 = 32|
	~freqs = t.cents.at([1,2,7,11,21]) / (mod * pi);
	~sig = (SinOsc.ar(~freqs,SinOsc.kr(~freqs/2000.1377).range(-1,1),mul:0.5) * VarSaw.ar(~freqs/mod2*([1,2,4,8,16]+0.01),0,SinOsc.ar(0.02).range(0.2,0.8)).squared);
	~efx = CombN.ar(~sig,0.01,0.11,0.5,0.3735,~sig) + (WhiteNoise.ar(0.1!4) * Decay.ar(Impulse.ar(8/[1,2,4,8]))) + (SinOsc.ar(60,60.001)*Decay.ar(Impulse.ar(4/[1,2,4,8]),mul:0.75)) + (LFSaw.ar(~freqs*4*1.5) * LFSaw.ar(1/16/[1,2,4,8],mul:0.5).squared);

	Splay.ar(
		HPF.ar(
		RLPF.ar(
			FreeVerb.ar(~efx,0.133,1,0.5,0.5875,~efx),
			SinOsc.ar((1..4)/100.14728).range(30,2000),mul:0.55,add:~efx/1.5) * SinOsc.ar((1..8)/100.13).range(0.001,0.9),
			10)
).softclip}).play;

)

Ndef(\ss).stop(10)