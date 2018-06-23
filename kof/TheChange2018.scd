

SynthDef(\playbuf_1, { |bufnum = 0, outbus = 0, amp = 0.5, loop = 0,
    pan = 0, rate = 1.0|
    var data;
    data = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 0, 0, loop);
    FreeSelfWhenDone.kr(data);
    Out.ar(outbus, Pan2.ar(data, pan, amp));
}).store;
