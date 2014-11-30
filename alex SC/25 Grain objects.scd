s.scope(2);


///////////////GrainFM -ar (numChannels: 1, trigger: 0, dur: 1, carfreq: 440, modfreq: 200, index: 1, pan: 0, envbufnum: -1, maxGrains: 512, mul: 1, add: 0)


//test


(

Ndef(\grainFM1).fadeTime=1;
Ndef(\grainFM1).quant=1;

Ndef(\grainFM1,{
	~sig=GrainFM.ar( 2,
		trigger:Impulse.kr(1),
		dur:Stepper.kr(Impulse.kr(0.5),1, 1,10,1),
		carfreq:LFNoise1.kr(20).range(50,500).round(50),
		modfreq:LFNoise1.kr(10).range(LFNoise1.kr(0.75).range(50,800),2000).round(50),
		index:1.5,pan:SinOsc.kr(0.25)
	    );
	 ~sig=FreeVerb.ar(LPF.ar(~sig,200),mix:0.3,room:SinOsc.kr(0.5).range(0.5,2),damp:SinOsc.kr(0.5).range(0.3,0.8));
	 ~sig=CombN.ar(~sig, 0.8,0.2,1, 0.5);

}).play;
)

Ndef(\grainFM1).clear;

//radio ghosts
(

Ndef(\ghosts).fadeTime=1;
Ndef(\ghosts).quant=1;

Ndef(\ghosts,{
	~sig=GrainFM.ar( 2,
		trigger:Impulse.kr(10),
		dur:Stepper.kr(Impulse.kr(0.5),1, 1,2,1),
		carfreq:SinOsc.kr(1).range(0.2,10),
		modfreq:LFNoise1.kr(20).range(120,440),
		index:1.5,pan:SinOsc.kr(0.25)
	    );
	~sig=LPF.ar(~sig,100);

}).play;
)

Ndef(\ghosts).clear;


(
Ndef(\tick).fadeTime=1;
Ndef(\tick).quant=1;

Ndef(\tick,{
	~sig=GrainFM.ar( 2,
		trigger:Impulse.kr(5),
		dur:0.5,
		carfreq:200,
		modfreq:LFNoise0.kr(0.5).range(10, 500).round(10),

		index:1.5,pan:SinOsc.kr(0.25)
	    );
	~sig=LPF.ar(~sig,50);

}).play;
)

Ndef(\tick).clear;

// LFSaw.ar(LFNoise0.kr(1).range(10, 50).round(10)).squared*BrownNoise.kr(0.2)


////////////////GrainIn - ar (numChannels: 1, trigger: 0, dur: 1, in, pan: 0, envbufnum: -1, maxGrains: 512, mul: 1, add: 0)


(

Ndef(\grainIn1).fadeTime=1;
Ndef(\grainIn1).quant=1;

Ndef(\grainIn1, {

	~puf=GrainIn.ar(2,
		trigger:Impulse.kr([1,2]),
		dur:[2,1],
		in:LPF.ar(VarSaw.ar(200/[2,3])*Pulse.kr([1,2],0.2),175),
		pan:SinOsc.kr(0.25),
		envbufnum:-1,
		maxGrains:256);
	~puf=FreeVerb.ar(
		CombN.ar(~puf,LFNoise1.kr(0.25).range(0.4,1),LFNoise1.kr(0.25).range(0.2,0.4),1),
		mix:0.5,
		room:SinOsc.kr(0.25).range(0.2, 1),
		damp:0.8);

}).play;

)

/////////////////GrainSin - ar (numChannels: 1, trigger: 0, dur: 1, freq: 440, pan: 0, envbufnum: -1, maxGrains: 512, mul: 1, add: 0)


(

Ndef(\GrainSin1).fadeTime=1;
Ndef(\GrainSin1).quant=1;

Ndef(\GrainSin1, {

	~tin=GrainSin.ar(2,
		trigger:Impulse.kr([0.25,0.1]),
		dur:8,
		freq:[200,150],
		pan:SinOsc.kr(0.25));
	~tin=LPF.ar(~tin,100);

}).play;

)
