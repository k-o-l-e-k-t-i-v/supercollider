// History, as it was on Wed Jun 10 13:20:52 2015.

[
[ 0, 'me', "Ndef(\\src).fadeTime = 4;" ],
[ 0.824856606, 'me', "Ndef(\\src).quant = 2;" ],
[ 7.843918005, 'me', "(
Ndef(\\src, {
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
});
)" ],
[ 53.609767509, 'me', "Ndef(\\src).play;" ],
[ 149.273460452, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,2);
});
)" ],
[ 156.664234329, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,1);
});
)" ],
[ 170.706321421, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).range(0.1,2));
});
)" ],
[ 183.943650439, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).range(0.1,2),0.1);
});
)" ],
[ 189.893230283, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).range(0.1,2),0.1,10);
});
)" ],
[ 191.964448226, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).range(0.1,2),0.01,10);
});
)" ],
[ 198.916575205, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).range(0.1,2),0.91,10);
});
)" ],
[ 205.6869356, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).range(0.1,2),0.01,10);
});
)" ],
[ 229.264400157, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).range(0.01,2));
});
)" ],
[ 233.26507269, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(1/4).exprange(0.01,2));
});
)" ],
[ 238.784570625, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.01,2));
});
)" ],
[ 247.759667188, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
            \\freq, [10000, 2000, 1000, 500, 250, 125, 125/2].choose,
            \\decay, [0.1, 0.2, 0.4, 1].choose,
        ]
        ), Rand(-1, 1));
    }.sum;
    sig = HighShelf.ar(src, \\shelfFreq.kr(1000), \\shelfslope.kr(1));
	Greyhole.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.02,2));
});
)" ],
[ 254.47187681, 'me', "(
Ndef(\\src, {
	var sig;
    var src = 10.collect{
        Pan2.ar([HPF, LPF, ComplexRes].choose.performKeyValuePairs(\\ar,[
            \\in, [Impulse, LFPulse].choose.ar(
                [4, 2, 1, 1/2, 1/3, 1/4, 1/6].choose,
                iphase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                phase: [0, 1/4, 1/8, 1/2, 1/3].choose,
                width:  [0.001, 0.0001, 0.01, 0.1, 0.2].choose,
                mul:    [1, 2, 3, 4].choose.reciprocal * [1, -1].choose
            ),
        �