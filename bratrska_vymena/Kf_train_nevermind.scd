
s.reboot;

(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{
	~h = 10000 + (LFNoise1.ar(1!2).round(0.25).range(-1,1));
	~l = 25;
	~tempo = 8/[1,2,4,8];
	~t1 = Decay.ar(Impulse.ar(~tempo), 0.004).squared;
	~t2 = Decay.ar(Impulse.ar(~tempo), 0.2);
	~t3 = Decay.ar(Impulse.ar(~tempo),1);

	~sig = SinOsc.ar([~h,~h] - (~t1.range(0,~h-~l) * ~t2),{ExpRand()}!2);

	Splay.ar(

		~pre2 = RLPF.ar(
			Vibrato.ar(
				~sig * ~t3
				,[4,5,6,7],0.2)
			,432);

		~pre1 = CombN.ar(~pre2,0.333,0.0333,0.333,mul:0.13,add:~pre2).softclip;

		GVerb.ar(
			~pre1
			,1,mul:0.2,add:~pre1)
)}).play;
)


Ndef(\a).play;
