Kolektiv(\alex);

currentEnvironment.print;
currentEnvironment.free;
//p.arProxyNames.collect({arg n; var synth=(p[n.asSymbol]); synth.stop(30)});
(
p=ProxySpace.push(s);
p.makeTempoClock;
ProxySynthDef.sampleAccurate = true;
p.clock.tempo = 127/60;
)
p.gui;

AutoIDE.run;

~zum1.clear;
~zum1.stop(freeTime:60);
~zum1.play(vol:0.4, fadeTime:4, numChannels:2).quant_(4);
(~zum1[0]=Pbind(
	\instrument, \zum,
	\amp, 2,
	\legato, 0.2,
	\pan, Pseq([-1,1],inf),
	\freq, [45,47]+30,
	\dur, 2,
);)
~zum1[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(820,2)),0.7)};
~zum1[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in,8,[2,1],mul:0.2)+in,0.7)};


~kickt.scope;
~kickt.clear;
~kickt.stop(freeTime:60);
~kickt.play(vol:0.4, fadeTime:4, numChannels:2).quant_(4);
(~kickt[0]=Pbind(
	\instrument, \kick,
	\amp, 1,
	\legato, 0.5,
	\pan, Pseq([-1,1],inf),
	\freq, [45,47]+40,
	\dur, 2,
);)
~kickt[3]=\filter->{arg in; LPF.ar(in,\lpf4.kr(420,2))};
~kickt[4]=\filter->{arg in; GVerb.ar(in,80,[2,1],mul:0.2)+in};




~aural1.clear;
~aural1.stop(fadeTime:60);
~aural1.play(vol:0.01, fadeTime:4, numChannels:2).quant_(4);
(~aural1[0]=Pbind(
	\instrument, \aural,
	\amp,Prand([0.8,0.4,0.6],inf)/8,
	\legato, 1.5,
	\octave, Prand([[5,6],[4,3],[5,4],[3,6]],inf)+Prand([1,2,(-1)],inf),
	\degree, Prand([[1,5],[4,6],[6,2],[2,4],[2,6],[8,2]],inf),
	\dur, Pseq([Pn(8,20),Pn(2,20),Pn(0.5,20)],inf),
);)
~aural1[5]=\filter->{arg in; GVerb.ar(in,[40,60],[8,4],mul:0.4)+in};
~aural1[6]=\filter->{arg in; LPF.ar(in,\lpf3.kr(2000,4))};
~aural1[7]=\set->Pbind(\args, [\lpf], \dur,1, \lpf, Pseq([1000,600,800,200],inf));
// ~aural1[7]=nil;


////////////////raaawww

~imp.clear;
~imp.stop(freeTime:60);
~imp.play(vol:4, fadeTime:4, numChannels:2).quant_(4);
(~imp[0]=Pbind(
	\instrument, \imp,
	\amp, 2,
	\legato, Pseq([0.7,0.4],inf),
	\den,28,
	\hpf,280,
	\dur, 16,
);)
~imp[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(800,2)),0.7)};
~imp[4]=\set->Pbind(\args, [\lpf4], \dur,4,\lpf4, Pseq([820,600,400,1200,400,600,820],inf));
~imp[5]=\filter->{arg in; GVerb.ar(in,[180,120],[4,6],mul:0.8)+in};
~imp[5]=nil;


//////continous kick small interval

~kick3.clear;
~kick3.stop(freeTime:10);
~kick3.play(vol:0.2, fadeTime:4, numChannels:2).quant_(4);
(~kick3[0]=Pbind(
	\instrument, \kick,
	\amp, 1,
	\legato, 0.4,
	\pan, Pseq([-1,01],inf),
	\freq, [45,47]+15,
	\dur, 0.2,
);)
~kick3[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(420,2)),0.7)};
~kick3[4]=\set->Pbind(\args, [\lpf4], \dur,4,\lpf4, Pseq([820,600,400,320,400,600,820],inf));
~kick3[5]=\filter->{arg in; GVerb.ar(in,8,[2,1],mul:0.2)+in};


/////////rhm kick  //TOCANELE

~kick4.clear;
~kick4.stop(freeTime:60);
~kick4.play(vol:1, fadeTime:4, numChannels:2).quant_(4);
(~kick4[0]=Pbind(
	\instrument, \kick,
	\amp, 1,
	\legato, Pseq([0.9,0.7],inf),
	\pan, Pseq([-1,0,1,-1,0,1,1,-1],inf),
	\freq, [45,47]+45,
	\top, 20,
	\dur, Pseq([Pseq([2,[0.5!3,1!2,-0.5].flatten,1].convertRhythm)],inf),
);)
~kick4[3]=\filter->{arg in; LPF.ar(in,\lpf8.kr(420,2))};
~kick4[4]=\set->Pbind(\args, [\lpf8], \dur,4,\lpf8, Pseq([120,160,200,320,280,160,800,1200],inf));
//~kick4[5]=\filter->{arg in; GVerb.ar(in,80,[2,3],mul:0.2)*SinOsc.kr(0.125).range(0.4,0.9)+in};
~kick4[3]=nil;
~kick4[6]=\filter->{arg in; in*SinOsc.kr(0.125).range(0.1,1)};

~zit2.clear;
~zit2.stop(freeTime:60);
~zit2.play(vol:1.2, fadeTime:4, numChannels:2,group:z, group:m).quant_(4);
(~zit2[0]=Pbind(
	\instrument, \zit,
	\amp, 0.8,
	\dur,Pseq([Pseq([2,[0.5!3,1!2,-0.5].flatten,1].convertRhythm)],inf),

	\pan, 0,
	\octave, Pseq([Pn(3,11),Pn(2,11),Pn(4,11)],inf),
	\hpf, 200,
	\legato, 0.2,
	\noise, 0.1,
););
~zit2[3]=\filter->{arg in; AllpassC.ar(in,0.02)};
//~zit2[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in,40,4,mul:0.2)+in)};
~zit2[4]=nil;




///////////////////////rhm high freq nice

~kick.clear;
~kick.stop(freeTime:60);
~kick.play(vol:0.01, fadeTime:4, numChannels:2).quant_(4);
(~kick[0]=Pbind(
	\instrument, \kick,
	\amp, Pseq([1,0.5],inf),
	\legato, Pseq([Pseries(0.9,-0.05,15),Pseries(0.1,0.05,40)],inf),
	\pan, Pseq([-1,0,1],inf),
	\freq, [45,47]+Pseq([10,20,15,5],inf),
	\dur, Pseq([Pseq([2,[0.5!3,-0.2,0.7,0.7,0.5,-2,1!2,-0.5].flatten,1].convertRhythm),
		// Pseq([2,[0.5!2,-3].flatten,1].convertRhythm),

		Rest(2)],inf),
);)
~kick[3]=\filter->{arg in; Limiter.ar(LPF.ar(in,\lpf4.kr(3820,2)),0.7)};
//~kick[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in,8,[2,3],mul:0.2)*SinOsc.kr(1/32).range(0.7,2)+in,0.7)};




~bumnoise.clear;
~bumnoise.stop(fadeTime:120);
~bumnoise.play(vol:0.2, fadeTime:4, numChannels:2).quant_(4);
(~bumnoise[0]=Pbind(
	\instrument, \bum,
	\amp,1,
	\legato, 0.5,
	\freq,[65,67]-15,
	\noise, Pseq([Pn(0.02,6),Pn(0.002,6),Pn(0.1,6)],inf),
	\dur, Pseq([Pseq([2,[0.25!6,-1].flatten,4].convertRhythm),
		//Pseq([2,[0.25!3,-0.5,0.25!3,-0.5].flatten,1].convertRhythm),
	],inf)
);)
~bumnoise[6]=\filter->{arg in; GVerb.ar(in,120,damping:SinOsc.kr(0.125).range(0.3,0.8),mul:0.1,add:in*0.9)};
~bumnoise[7]=\filter->{arg in; Limiter.ar(in, 0.7)};


//////////////////////////////////////// single bum noise

~bumnoise1.clear;
~bumnoise1.stop(fadeTime:60);
~bumnoise1.play(vol:0.8, fadeTime:4, numChannels:2).quant_(4);
(~bumnoise1[0]=Pbind(
	\instrument, \bum,
	\amp,1,
	\legato, 0.4,
	\freq,[65,67]-15,
	\noise, Pseq([Pn(0.1,6),Pn(0.02,6),Pn(0.2,6)],inf),
	\dur, Pseq([Pn(4,8),Pseq([1,0.5,Rest(2.5)],1)],inf),
);)
~bumnoise1[6]=\filter->{arg in; GVerb.ar(in,120,damping:SinOsc.kr(10).range(0.3,0.8),earlyreflevel:SinOsc.kr(10).range(1.3,0.2),mul:0.1,add:in*0.9)};
~bumnoise1[7]=\filter->{arg in; Limiter.ar(in, 0.7)};



//////////////////////////


~bum.clear;
~bum.stop(freeTime:60);
~bum.play(vol:0.7, fadeTime:4, numChannels:2).quant_(4);
(~bum[0]=Pbind(
	\instrument, \bum,
	\legato,Pseq([0.8,0.2],inf),
	\amp, Pseq([1,0.5],inf),
	\dur,2,
	\pan, 0,
	\freq, [45,45]+15,
	\noise,0.9,

););
~bum[3]=\filter->{arg in; LPF.ar(in,\lpf4.kr(180,2))};
~bum[4]=\filter->{arg in; Limiter.ar(GVerb.ar(in,2,2,mul:0.2)+in)};
~bum[4]=nil;




~drujba.clear;
~drujba.stop(fadeTime:20);
~drujba.play(vol:0.02, fadeTime:4, numChannels:2,group:d).quant_(4);
(~drujba[0]=Pbind(
	\instrument, \zit,
	\amp,1,
	\legato, 0.5,
	\freq,80,//Prand([200,400,1200,100,65,200,400],inf),
	\noise, 0.9,
	\dur, Pseq([0.2],inf),
);
d=Group.new;

);
~drujba[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,[40,80],revtime:LFSaw.kr(1/16).range(4,40),damping:SinOsc.kr(0.125).range(0.6,0.9),mul:0.1,add:in*0.5),0.7)};
~drujba[7]=\filter->{arg in; LPF.ar(in, SinOsc.kr(1/32).range(6400,400))};




~otto1.clear;
~otto1.stop(fadeTime:60);
~otto1.play(vol:0.4, fadeTime:4, numChannels:2, group:g).quant_(4);
(~otto1[0]=Pbind(
	\instrument, \oto,
	\amp,Pseq([0.7,0.4,0.3],inf),
	\legato, 3,
	\dur, 8,
	\octave, Pseq([Pn([3,2],4),Pn([1,2],4),Pn([6,4],2)],inf)+2,
	\degree, [2,3]+Pseq([5,3,2,1],inf),
	\dist, Pseq([Pseries(2,1,40),Pseries(400,(-1),20)],inf),

);
g=Group.new;
);
~otto1[3]=\filter->{arg in; LPF.ar(in,2800)};
~otto1[4]=\filter->{arg in; Rotate2.ar(Mix.new(in),Mix.new(DelayN.ar(HPF.ar(in,\hpf.kr(2000)),1,0.5)),SinOsc.kr(0.25))};
~otto1[6]=\filter->{arg in; Limiter.ar(GVerb.ar(in,[60,80],[10,8],mul:0.6,add:in*0.2))};
~otto1[7]=nil;

//////////


~beez1.clear;
~beez1.stop(fadeTime:60);
~beez1.play(vol:0.05, fadeTime:4, numChannels:2).quant_(4);
(~beez1[0]=Pbind(
	\instrument, \beez,
	\amp,Prand([0.8,0.4,0.6],inf)/8,
	\legato, 2,
	\octave, Prand([[5,6],[4,3],[5,4]],inf)-2,
	\degree, Prand([[1,3],[4,2],[4,2],[2,4],[2,6],[8,2]],inf),
	\dur, 8,//Pseq([Pn(8,20),Pn(2,20),Pn(0.5,20)],inf),
);)
~beez1[5]=\filter->{arg in; GVerb.ar(in,[40,60],[2,4],mul:0.1)+in};
~beez1[6]=\filter->{arg in; LPF.ar(in,\lpf3.kr(2000,4))};
~beez1[7]=\set->Pbind(\args, [\lpf], \dur,1, \lpf, Pseq([1000,600,800,1200],inf));
// ~beez1[7]=nil;