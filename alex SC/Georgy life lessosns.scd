{Limiter.ar(Pan2.ar(Mix.fill(20,{SinOsc.ar((1..20)*200)})),0.8,0.1)}.play;

{Limiter.ar(Pan2.ar(Mix.fill(20,{CombN.ar(Pulse.ar((120..130)),0.1,1/120)})),0.5,0.1)}.play;


s.scope(2);

{CombN.ar(Pulse.ar(1,0.01)*WhiteNoise.ar(0.1),0.1,1/120)}.play;


{Limiter.ar(CombN.ar(Pulse.ar(10),0.5,1/80,10)*Pulse.ar([4,5]),1)}.play;


{Limiter.ar(CombN.ar(Pan2.ar(Mix.fill(20,{SinOsc.ar((1..20)*200)})),0.1,1/200),0.2)}.play;


{Limiter.ar(Pulse.ar(1,0.1),0.5)}.plot(1000);


GVerb