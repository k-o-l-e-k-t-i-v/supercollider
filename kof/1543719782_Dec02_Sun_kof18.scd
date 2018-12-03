

(
    SynthDef(\playbuf_1, { |freq=440,bufnum = 0, outbus = 0, amp = 0.5, loop = 0,
        pan = 0, rate = 1.0|
        var data;
        data = Osc.ar(bufnum,freq);//PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 0, 0, loop);
        FreeSelfWhenDone.kr(data);
        data = LPF.ar(data,440);
        Out.ar(outbus, Pan2.ar(data, pan, amp));
    }).store;

)



b = Buffer.alloc(s,2048,1);


(
    ~recorder={
        var t = LFSaw.ar(4800/2048*[1,1.50001,1/[1,1.0001,1.001]]*[1,1.001,1.01,1.000001]) * [2,2,32]*pi;
        var sig = Perlin3.ar(t[0].cos+1,t[1].sin+1,t[2].sin+1) * LFSaw.ar(100);
        sig = Mix.ar(sig);
        sig = RecordBuf.ar(LeakDC.ar(sig),b.bufnum,0,1,1);
    };
)


p.push();

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var sig = Osc.ar(b.bufnum,50+(0.001,0.002..0.1),Pulse.ar(4/[1,2,3,4]));
        16.do{|n|
            sig = AllpassL.ar(sig,(n+1)/50,1/(500+(n/10000)),1);
            sig = LeakDC.ar(sig);
            sig = Normalizer.ar(sig);
        };
        sig = BPeakEQ.ar(sig,55*[1,2,4,8,16],4,LFNoise1.kr(1/16*[1,2,3,4,5,6]).range(-96,12));
        Splay.ar(sig,0.95,0.5,SinOsc.kr(1/[3,4])/2);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = BPeakEQ.ar(sig,55*[1,2,4,8,16],4,LFNoise1.kr(1/16*[1,2,3,4,5,6]).range(-12,12));
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
