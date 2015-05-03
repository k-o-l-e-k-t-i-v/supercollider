
p=ProxySpace.push(s)
s.plotTree;
(
w=ProxySpace.push(s);
~w1.play;
~w1.quant=1;
~w1.mold(4);
~w1[0]= {

	SinOsc.ar(\freq.kr,add:WhiteNoise.ar(\vol.kr))* Decay.kr(Impulse.kr(\b.kr),decayTime:\decay.kr);
};
~w1[1]=\set-> Pbind(\args, [\b, \freq, \vol,\decay],
	\dur, Pseq([2,4,1],inf),
	\freq, Pseq([80,Prand([200,700,400],1),10],inf),
	\b,Pseq([[5,4],[7,3],0],inf),
	\vol, Pseq([0.1,0,0],inf),
	\decay, Pseq([0.5,1.5,0.1],inf)).trace;
~w1[30]=\filter-> {arg in; FreeVerb.ar(in,room:1)};
)

// (dur: 2, freq:Pseq([2000,40,600],inf)).play;
Pn((dur:2, freq:200)).play;
().play;


(
ProxySynthDef(\ju, {
	arg sustain, amp, f2;
	var sig, fenv, env;

	env=EnvGen.kr(Env(),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr, \freq.kr*4],[sustain*0.5]),timeScale:sustain);

	sig= BPF.ar(WhiteNoise.ar(amp)+BrownNoise.ar(amp),freq:fenv,rq:SinOsc.kr(f2).range(0.001,1));
	sig=sig*env;

}).add;

ProxySynthDef(\pin, {
	arg sustain, amp;
	var sig, env,fenv;
	env=EnvGen.kr(Env(),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr, \freq.kr*4],[sustain*0.5]),timeScale:sustain);

	sig=SinOsc.ar(fenv)*env*amp;
}).add;

ProxySynthDef(\bum4, {
	arg sustain, amp;
	var sig, env,fenv;
	env=EnvGen.kr(Env.new([0,1,0],[0.5,0.5]),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env.new([\freq.kr*4, \freq.kr],[sustain*0.05]));

	sig=SinOsc.ar(fenv)*env*amp;
}).add;



)
(
g=ProxySpace.push(s);
~g1.play;
~g1.quant=1;
~g1[0]=Pbind(\instrument, \bum4, \dur, Pseq([Pn(0.2, 4), Rest(0.25), 0.1],inf),
	\legato, 0.6,
	\amp, Pseq([Pn(0.6, 3), 0.7, 1,0.7],inf),
	// \octave,2,
	// \degree, 6,
	\freq, Pseq([Pn(60, 3), 65, 10,65],inf),
	// \freq, 35.midicps
);
// ~g1[30]=\filter-> {arg in; FreeVerb.ar(in, room:2,add:in)};
)

(
q=ProxySpace.push(s);
~q1.play;
~q1.quant=1;
~q1[0]=Pbind(\instrument, \ju, \dur, Pseq([0.5,1,Rest(2)],inf),
	\legato, 0.7,
	\amp, 0.4,
	\f2,Pseq([Pn(10, 6),Pn(2,3),Pn(5,3)],inf),
	\freq,80 );
~q1[30]=\filter-> {arg in; FreeVerb.ar(in, room:2,add:in)};
)

(
f=ProxySpace.push(s);
~f1.play;
~f1.quant=1;
~f1[0]=Pbind(\instrumnet, \pin, \dur, Pseq([0.1,Rest(4.4), 0.2,Rest(2.8)],inf),
	\legato, 1, \amp, 0.7,
	\octave, [4,3],
	\degree, Pseq([[4,2], 1, [8,4], 1,[2,6],1,[4,6]],inf),
	\strum, 0.24,
);
~f1[30]=\filter-> {arg in; CombN.ar(in,decaytime:1)};
~f1[31]=\filter-> {arg in; FreeVerb.ar(in, room:1,damp:0,add:in)};
)
