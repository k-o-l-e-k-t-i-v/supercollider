s.reboot;

(
    SynthDef(\oscill,{|freq = 440,amp=0|
                      Out.ar(0,SinOsc.ar(freq,mul:amp));
                     }).add;
)
