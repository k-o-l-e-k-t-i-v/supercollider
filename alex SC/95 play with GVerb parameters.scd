p=ProxySpace.push(s);

(
~osc1.mold(4);
~osc1[0]={BPF.ar(BrownNoise.ar(0.2!2),freq:\freq.kr,rq:SinOsc.ar(0.125).range(0.001, 1))*0.4};
~osc1[1]=\set-> Pbind(\args, [\freq], \dur, 12, \freq, Pseq([200,400,100,500],inf));
~osc1[10]=\filter-> {arg in; GVerb.ar(in,1,10)};


~osc2.mold(8);
~osc2[0]={BPF.ar(WhiteNoise.ar(0.2!2).clip(0,0.1)+LFSaw.ar(3/5/[1,2,3,5,8]).lag(0.002)
	,freq:\freq.kr,rq:SinOsc.ar(3/5/[5,8]).range(0.001, 1))*0.2};
~osc2[1]=\set-> Pbind(
	\args, [\freq,\b],
	\dur, 0.5,
	\freq, Pseq([200,400,100,500],inf));
~osc2[10]=\filter-> {arg in; GVerb.ar(in,roomsize:2,revtime:\rev.kr,drylevel:1)};
~osc2[11]=\set->Pbind(\args, [\rev],\dur, 6, \rev, Prand([0.2,1,3,0.5],inf));


~osc3.mold(4);
~osc3[0]={BPF.ar(PinkNoise.ar(0.2!2),freq:\freq.kr,rq:0.1)*10};
~osc3[1]=\set-> Pbind(\args, [\freq], \dur, 1, \freq, Prand([45,55,65],inf));
~osc3[10]=\filter-> {arg in; GVerb.ar(LPF.ar(in,\f2.kr),1,0.5,0,spread:1,drylevel:0,add:in)};
~ocs3[11]=\set-> Pbind(\args, [\f2], \dur, 1, \f2, Pseq([Pseries(200,20,30),800],inf));
)
//play all
(
~osc1.play;
~osc2.play;
~osc3.play;
)