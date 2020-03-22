
p.push;
q = Buffer.allocConsecutive(8*8,s,512,1);
(
    g=a[0].bufnum;
    ~consec.ar(2);
    ~consec.quant=0;
    ~consec={
        var f = 50;
        var sig;// = LFNoise1.ar(48000/16!64);
        64.do{|i|
        //    sig[i] = sig[i] ** (1/(i+2).log2);
        var sig = PlayBuf.ar(1,g,1,startPos:i/64,loop:1);
            RecordBuf.ar(Mix(sig[i]),q[i],loop:1);
        };
        sig;
    };
);



// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var f = 50/(1.0,1.01..1.1);
        var sig = [];
        var x = LFSaw.ar(~tempo/4);
        var y = LFSaw.ar(~tempo/3);
        8.do{|i|
            sig = sig ++ VOsc.ar(x.range(q[0].bufnum+i*8,q[0].bufnum+i*8+8)+SinOsc.kr(~tempo/[256,256]),f);
        };
        sig = SelectX.ar(y.range(0,7),sig);
       // sig = BPF.ar(sig,500,0.52);
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

