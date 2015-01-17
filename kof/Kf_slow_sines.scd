(
Ndef(\ss).fadeTime = 2.0;
Ndef(\ss).quant = 2.0;

Ndef(\ss,{
	~b = ([63-12,67-12]+24).midicps / 3pi;
	~mod = SinOsc.ar(~b/1024.0).range(0.00001,0.015);
	Splay.ar(

		AllpassC.ar(
		RLPF.ar(
				SinOsc.ar([~b*pi/2,~b*pi/3,~b*pi,~b*1.5]*LFNoise1.ar(8!8).lag(4).range(0.999-~mod,1.01+~mod),mul:0.133) * LFSaw.ar(8/[1,2,3,5,8,13]).squared

			,880) +
	Pan2.ar(
		BPF.ar(
				OnePole.ar(WhiteNoise.ar(0.4!8),SinOsc.kr([0.03,0.08]).range(0.1,0.9)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),{ExpRand()*0.5}!8)
			,2200+LFNoise0.ar(2!4).range(-400,4000).lag(0.001))
		,SinOsc.kr(2.01))
			,0.00133,0.00133,1.133)
)}).play;
)

Ndef(\ss).stop(20);


NdefMixer(s);