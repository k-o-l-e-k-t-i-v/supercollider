

SynthDef(\playbuf_1, { |bufnum = 0, outbus = 0, amp = 0.5, loop = 0,
    pan = 0, rate = 10.0|
    var data;
    data = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 0, 0, loop);
    data = Mix(Resonz.ar(data,[36,48,60].midicps,0.4));
    data = Normalizer.ar(data);
    //data = data/4 * Pulse.ar(4);
    FreeSelfWhenDone.kr(data);
    Out.ar(outbus, Pan2.ar(data, pan, amp));
}).store;
