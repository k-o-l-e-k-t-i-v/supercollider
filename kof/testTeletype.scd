
p.push()
p.bpm(120)

~simple.quant = 4;
~simple = {SinOsc.ar(50, Pulse.ar(~tempo))};
~simple.play;
