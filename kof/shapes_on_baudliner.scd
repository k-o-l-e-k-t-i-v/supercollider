
s.boot;

(
Ndef(\saw).fadeTime = 2.0;
Ndef(\saw,{
	Splay.ar(
		BBandPass.ar(
			CombN.ar(
				SinOsc.ar((1..32)*8pi,0,1/(1..32)) * LFSaw.ar(8/(1.50001**(1..32))).squared
				,0.02*(1..32),4/(1..32),32/(1..32)) * 64
			,SinOsc.ar(4/(1..32)).range(22*(1..32),22000/(1..32)),1/8/(1..32)).softclip
		,0.5,1,0.5)
}).play;
)
