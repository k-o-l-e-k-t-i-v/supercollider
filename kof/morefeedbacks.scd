
s.reboot;


// hm.. I have no idea how that works

{f=LocalIn.ar([0,1]).tanh;LocalOut.ar(GVerb.ar(BPF.ar(f+SinOsc.ar([88,88.1]),LFSaw.ar(1.001**(0..8)).range(44,10000))));}.play;


s.scope;
