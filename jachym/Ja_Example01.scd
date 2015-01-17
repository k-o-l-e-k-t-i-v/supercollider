s.reboot;
s.scope;

(
SynthDef ("drum1", { arg freq = 50, dur = 0.5, vol = 0.4;
	var tone, env;

	tone = SinOsc.ar(SinOsc.kr([10,25,50],0,0.5,0.5)*[freq,freq+5,freq+10] ,[0,1/8pi,1/4pi], vol);
	env = EnvGen.ar( Env([0,1,0.8,0],[dur * 0.1,dur * 0.35,dur * 0.55]), doneAction: 2);

	Out.ar(0,Decay2.ar([tone, tone] * env,0.00005,0.0003));

}).add;

SynthDef ("drum2", { arg freq = 50, dur = 0.5, vol = 0.4;
	var tone, env;

	tone = SinOsc.ar(LFSaw.kr([3,4])*freq ,0, vol);
	env = EnvGen.ar( Env([0,1,0.8,0],[dur * 0.1,dur * 0.2,dur * 0.7]), doneAction: 2);

	Out.ar(0,[0, tone] * env);
}).add;

SynthDef ("surf1", {arg freq = 150, dur = 6, vol = 0.2 ;
	var toneLeft = SinOsc.ar([SinOsc.ar(freq+12,0,vol,vol*2.1),freq],0,vol,vol*2.1);
	var toneRight = SinOsc.ar([freq,SinOsc.ar(freq+10,1.5pi,vol,vol*2.1)],1.5pi,vol,vol*2.1); //*SinOsc.kr(0.5,0.5pi,0.5,0.5)
	var glitch = LFSaw.kr([30,32,34,38],0,vol,vol*2.1);

	var env = EnvGen.ar( Env([0,1,0.6,0],[dur * 0.1,dur * 0.7,dur * 0.2]), doneAction: 2);
	Out.ar(0, [toneLeft * glitch * env, toneRight * glitch * env]);

}).add;

)


Synth("surf1", [\freq, 150,\dur, 6]);
Synth("drum2",[\freq, 60, \dur, ~loopTime*0.35, \vol, 0.25]);

(
~busSrf_freq = Bus.control(s);
~cntDrum = 0;
~cntSurf = 0;
~loopTime = 0.5;

Tdef(\loopSurf).play;
Tdef(\loopDrum).play;
)

(
Tdef(\loopSurf).quant = 2.0;
Tdef(\loopSurf, {

	loop {
		~busSrf_freq.set(400);
		~surfOne = Synth("surf1", [\freq, 400,\dur, 18, \vol, 0.1]);
		~surfOne.map(\freq,~busSrf_freq);
		6.wait;

		Synth("surf1", [\freq, 220,\dur, 10, \vol, 0.1]);
		~busSrf_freq.set(300);
		2.wait;

		~busSrf_freq.set(350);
		4.wait;

		~busSrf_freq.set(400);

		4.wait;

		if((~cntSurf == 2),
			{
				~cntSurf = 0;
				~busSrf_freq.set(280);
				//Synth("surf1", [\freq, 350,\dur, 6, \vol, 0.03]);
			},{
				~cntSurf = ~cntSurf + 1;
		});
		("CntSurf1 : " +  ~cntSurf).postln;
	}
}).play;
)


(
Tdef(\loopDrum).quant = 2.0;
Tdef(\loopDrum, {
	loop {
		Synth("drum1",[\freq, 25, \dur, ~loopTime*0.75, \vol, 0.2]);
		(~loopTime*0.15).wait;

		Synth("drum2",[\freq, 155, \dur, ~loopTime*0.5, \vol, 0.1]);
		(~loopTime*0.65).wait;
		if ((~cntDrum >= 6),
			{

				if ((~cntDrum <= 8),
					{
						Synth("drum1",[\freq, 45, \dur, ~loopTime*0.15, \vol, 0.15]);
						".....".postln;
					},{
						Synth("drum1",[\freq, 115, \dur, ~loopTime*0.25, \vol, 0.15]);
						//Synth("drum2",[\freq, 885, \dur, ~loopTime*0.15, \vol, 0.15]);
						~cntDrum = 0;
						"-----".postln;
					}
				);
			},{
				Synth("drum1",[\freq, 65, \dur, ~loopTime*0.15, \vol, 0.15]);
		});
		~cntDrum.postln;
		~cntDrum = ~cntDrum + 1;
		(~loopTime*0.25).wait;
	}
}).play;

)

(
Tdef(\loopDrum).stop(2);
Tdef(\loopSurf).stop(2);
)