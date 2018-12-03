



p.push();


b = Buffer.alloc(s,512,2);


// rec synth ///////////////////////////////////////

(
    ~rec.ar(2);
    ~rec.clock = p.clock;
    ~rec.quant=2;
    ~rec.fadeTime=4;
    ~rec={
        var sig = SinOsc.ar(2,SinOsc.ar(4.01)*2pi+Pulse.ar(4));
        sig = NumChannels.ar(sig,2);
        RecordBuf.ar(sig/2,b.bufnum,0,0.133,0.7);
        Splay.ar(sig,0.5,0.25);
    };
);
~rec.stop(4);
~rec.clear;
~rec.pause;
~rec.resume;


// pll synth ///////////////////////////////////////

(
    ~pll.ar(2);
    ~pll.clock = p.clock;
    ~pll.quant=2;
    ~pll.fadeTime=4;
    ~pll={
        var sig = Osc.ar(b.bufnum,50*[1,2,1.5]*[1,1.0001]);
        8.do{|n|
            sig = AllpassL.ar(sig,(n+1)/50,(n+1)/50,1);
            sig = CompanderD.ar(sig,3/4,1/2,1);
            sig = BPF.ar(sig,[500,1500,5000]/4,0.2,mul:LFNoise1.kr(1!3)/[1,2,3]);
        };
        sig = NumChannels.ar(sig,2);
        RecordBuf.ar(sig,b.bufnum,0,0.133,0.7);
        Splay.ar(sig,0.5,0.25);
    };
    ~pll.play;
);
~pll.stop(4);
~pll.clear;
~pll.pause;
~pll.resume;
