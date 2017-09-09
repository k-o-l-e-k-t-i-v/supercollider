

// player synth ///////////////////////////////////////

(
    ~.ar(2);
    ~.quant=2;
    ~.fadeTime=2.02;
    ~={
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
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~.play;
);
~.stop(7);
~.clear;


p.push();

b = fill(1,{LFSaw.ar(40)},5120);

// one synth ///////////////////////////////////////
b = Buffer.read(s,Platform.resourceDir ++ "/sounds/stetson.wav");

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
  var f = [1,2,4,8]*16;
  var sig = Shaper.ar(b,LFTri.ar(1/f/[1,2,4,8,16,1/2]) + SinOsc.ar(1/[4,5,6,7,8],mul:0.000001));
  sig = LPF.ar(sig,2500);// + RHPF.ar(sig,3000);
  sig = LeakDC.ar(sig);
  sig = BRF.ar(sig,4000/8*(1..8),1,mul:LFNoise2.kr(1/64!8)) * 2;
  sig = CombN.ar(sig,4/f,512/f,1/4);
  //sig = Normalizer.ar(sig)/2;
  Splay.ar(sig,0.75,0.75,SinOsc.ar(1/7)/4);
};
~one.play;
);
~one.stop(30);
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
  sig = CompanderD.ar(sig,3/4,1/1.5,1/2);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
