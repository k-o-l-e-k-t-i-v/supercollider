s.boot
s.scope
p = ProxySpace.push(s).makeTempoClock
p.clock.tempo_(127/60)
~aaa.play
~aaa[0] = {SinOsc.ar(90!2, mul:\amp.kr(0.1)); }
(
~aaa.qenv(\amp, \e1, 1, Env([0,1,0.4], [0.01,0.09], [5,-8]));
~aaa.qenv(\amp, \e2, 1, Env([0,0.5,0], [0.01,1.18], [5,-3]));
~aaa.qenv(\amp, \e3, 0.5, Env([0,0.5,0], [0.01,0.28], [5,-3]));
~aaa.qenv(\amp, \ocas, 6, Env([0,1,0], [0.2,5.8], [5,-13]));
// ~aaa.qselect(\amp, \intro, [\e1, \e1, \e1, \e2, \e3]);
~aaa.qselect(\amp, \intro, Pseq([
 Pseq([Pn(\e1,3), \e2], 3),
 Pn(\e1,2), \e3,
 \ocas
]));
)

~aaa.qplay(\amp, \intro, 16, 12)
~aaa.qplot(\amp, \intro, 1000)
~aaa.qstop(\amp)
