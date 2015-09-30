b = Buffer.read(s,"sounds/beat2.wav");
b.free;
b = Buffer.read(s,Platform.resourceDir ++ "\/sounds\/beat4.wav");
p=ProxySpace.push(s);

~sample.clear;
~sample.play(vol:0.7, fadeTime:1);
(~sample[0]={
	var sig, env;
	sig=PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum),\trig.tr);
	sig=PitchShift.ar(sig,[0.1,1],SinOsc.kr([0.5,1]).range(0.1,1));

})

~sample[1]=\set->Pbind(\args, [\trig], \dur,3, \trig, 1);
~sample[30]=\filter-> {arg in;  GVerb.ar(in,roomsize:40)};


//FRAMES CHANNELS START STOP

//numSamples=numFrames * numChannels;

g=Buffer.read(s,Platform.resourceDir ++"\/sounds/Anyways.wav");
r=Buffer.read(s,"C:/Program Files/SuperCollider-3.7alpha1/sounds/AyyWhereAllMyLadiesAt.wav");

f=Buffer.read(s,"C:/Program Files/SuperCollider-3.7alpha1/sounds/beat.wav");
f.play;
f.zero;
f.numFrames;
g.zero;
g.play;
g.read(Platform.resourceDir ++"\/sounds/Anyways.wav");
Buffer.freeAll;

f=Buffer.read(s,"C:/Program Files/SuperCollider-3.7alpha1/sounds/beat.wav",22345,f.numFrames-22345);


~beat.play( vol:1.5, fadeTime:2);
(
~beat[0]={
	var sig, env;
	sig=PlayBuf.ar(g.numChannels,g.bufnum,BufRateScale.kr(g.bufnum),trigger:\trig.tr);
	sig=PitchShift.ar(sig,0.01,\f2.kr,timeDispersion:4);
};
)
~beat[1]=\set-> Pbind(\args, [\trig], \dur, 2, \trig, 1);
~beat[2]=\set->Pbind(\args, [\f2], \dur,3, \f2, Pseq([0.2,6,4,0.1],inf));
~beat[3]=\set->Pbind(\args, [\length], \dur,3, \length, Pseq([0.2,1,0.5,0.1],inf));

~beat[20]=\filter-> {arg in; GVerb.ar(in,40,10,add:in)};


~beattwo[1]={ PitchShift.ar(~beat.ar,0.01,0.1,timeDispersion:1)};
~beattwo.play( vol: 0.7, fadeTime:1);




///play with f2 and duration!


~guy.play( vol:1.5, fadeTime:2);
(
~guy[0]={
	var sig, env;
	sig=PlayBuf.ar(r.numChannels,r.bufnum,BufRateScale.kr(r.bufnum),trigger:\trig.tr);
	sig=PitchShift.ar(sig,0.002,\f2.kr,0.7,1);
};
)
~guy[1]=\set-> Pbind(\args, [\trig], \dur, 8, \trig, 1);
~guy[2]=\set->Pbind(\args, [\f2], \dur,3, \f2, Pseq([0.1,0.8],inf));
~guy[3]=\set->Pbind(\args, [\length], \dur,3, \length, Pseq([0.2,1,0.5,0.1],inf));

~guy[20]=\filter-> {arg in; GVerb.ar(in,40,10,add:in)};


~f.play(vol:2, fadeTime:1);
~f.scope;
~f.clear;
(
~f[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.4],[\step, \welch]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*8,\freq.kr],[0.04,0.1],[\welch, \step]),\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\lin, \welch]),\trig.tr);

	sig=LFPulse.ar(fenv!2,penv,add:ClipNoise.ar([0.8,0.8])*Decay2.ar(Impulse.ar([2,0.5]),decayTime:0.1)).lag([0.1,0.2]);
	sig=sig*env-0.25;
};
)
~f[1]=\set->Pbind(\args, [\trig], \dur, 0.3, \trig, 1);
~f[2]=\set->Pbind(\args, [\freq], \dur, 0.5, \freq, Pseq([5100,6500,4000,1200,2000,5000,3000],inf));

~f[30]=\filter-> {arg in; FreeVerb.ar(in,room:0.5,add:in*0.5)};






~v.play(vol:2, fadeTime:1);
~v.scope;
~v.clear;
(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[2,7],[\lin, \welch]),\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\lin,\welch]),\trig.tr);

	sig=FreeVerb2.ar(Dust.ar(LFNoise1.ar([0.125,0.5]).range(15,50)).lag(0.01),Dust.ar(LFNoise2.ar([0.25,0.15]).range(2,30)).lag(0.002),mix:LFNoise2.ar(2).range(1,5),room:2);
	sig=sig*env;
};
)
~v[1]=\set->Pbind(\args, [\trig], \dur, 6, \trig, 1);
~v[2]=\set->Pbind(\args, [\freq], \dur, 0.5, \freq, Pseq([5100,6500,4000,1200,2000,5000,3000],inf));

~v[28]=\filter-> {arg in; PitchShift.ar(in,2,\ratio.kr(0.1,2),timeDispersion:0.2)};
~v[29]=\set->Pbind(\args, [\ratio], \dur, 5, \ratio, Pseq([0.5,1,3,0.2,0.5,1],inf));
~v[30]=\filter->{arg in; LPF.ar(in, \lpf.kr(4400,14))};

~v[31]=\filter-> {arg in; GVerb.ar(in,roomsize:2,revtime:15,add:in*20)};




{ClipNoise.ar([0.5,0.6])}.play;
{FreeVerb.ar(Dust.ar(LFNoise2.kr([1,5]).range(5,500)),5,2)}.play;