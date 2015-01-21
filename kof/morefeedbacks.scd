
s.reboot;


// hm.. I have no idea how that works

{f=LocalIn.ar([0,1]).tanh;LocalOut.ar(LPF.ar(f+SinOsc.ar([11,11.1]),LFSaw.ar(1.0001**(0..8)).range(44,10000)));}.play;


s.scope;
