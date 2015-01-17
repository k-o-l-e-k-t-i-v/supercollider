
Ndef(\sinusa,{	SinOsc.ar(440!2) * Pulse.ar(1)})
Ndef(\sinusa).play


Ndef(\del1,{CombC.ar(\in1.ar([0,0]),1,0.25,1)})
Ndef(\del1).play


Ndef(\del1)<<>.in1 Ndef(\sinusa)
