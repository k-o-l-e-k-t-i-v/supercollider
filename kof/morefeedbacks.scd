
s.reboot;


// hm.. I have no f**cking idea how that works

{f=LocalIn.ar([0,1]).tanh;LocalOut.ar(GVerb.ar(BPF.ar(f+SinOsc.ar([88,88.01]),LFSaw.ar([11,22,33,44]).range(44,22000))));}.play;


s.scope;
