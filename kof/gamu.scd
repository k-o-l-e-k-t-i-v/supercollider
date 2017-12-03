



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~sss.ar(2);
    ~sss.quant=2;
    ~sss.fadeTime=2.02;
    ~sss={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.05);
    };
    ~sss.play;
);
~sss.stop(7);
~sss.clear;


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
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
