
(
~w.quant_(2,-1);
~w={var i,s,d,e;

	i = Impulse.ar(1/4,(0..15)++[0.5]/16);

	d = EnvGen.ar(Env([0.002,[1,0.75],0.00001],[0.002,[2,1,2,0.1]],[50,-10]),i);
	s = SinOsc.ar([50,90,50,90]*(d.pow(15)*2+1)) * d + (PinkNoise.ar(d.pow(5)));

	i = Impulse.ar(1/16,(0..7)+0.5/8);
	d = EnvGen.ar(Env([0.002,[1,0.75],0.00001],[0.002,[2,1,2,0.1]/4],[50,-10]),i);
	s = (WhiteNoise.ar(d.pow(5)/4)) + s;

	s = LPF.ar(s,LFTri.ar(1/8/[1,2,4,8,3.5,2.33]).exprange(12000.01,40));

	i = Impulse.ar(1/16,(0..7)/8);
	d = EnvGen.ar(Env([0.002,[1,0.75],0.00001],[0.002,[2,1,2,0.1]],[50,-10]),i);
	s = (WhiteNoise.ar(d.pow(5)/4)) + s;

	i = Impulse.ar(1/16,(0..7)+0.45/8);
	d = EnvGen.ar(Env([0.002,[1,0.75],0.00001],[0.002,[2,1,2,0.1]*8],[-3,4]),i);

	e = HPF.ar(s,10000);
	e = CombN.ar(s,TExpRand.ar(0.0002,0.042,Impulse.ar(1/8)).lag(1/8),TExpRand.ar(0.02,0.1,Impulse.ar(1/4)).lag(1/4),4) / 3 * d;
	e = OnePole.ar(e,SinOsc.ar(1/8/(1..8)).range(0,1));

	s = GVerb.ar(s,8,3,0.02,0.05,3,0.5,0.2,0.7)/15 + (s / 3 * 2) + e;

	s = CompanderD.ar(s,0.75,1/1.2,1/6);

	Splay.ar(s,0.1);
};
~w.play;
)