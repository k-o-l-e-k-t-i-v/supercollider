


p.push();
p.bpm(121.333)



b = Buffer.read(s,"/home/kof/src/sc/sounds/156664__juskiddink__cello-c-string-resonance.wav");
b = Buffer.read(s,"/home/kof/src/sc/sounds/207956__altemark__cymbal.wav");
b = Buffer.read(s,"/home/kof/src/sc/sounds/339816__inspectorj__hand-bells-f-single.wav");
b = Buffer.read(s,"/home/kof/src/sc/sounds/116968__cbeeching__cymbal-bell-1.wav");
b = Buffer.read(s,"/home/kof/src/sc/sounds/156664__juskiddink__cello-c-string-resonance.wav");
b = Buffer.read(s,"/home/kof/src/sc/sounds/violin.wav");
Platform.resourceDir 


(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// player synth ///////////////////////////////////////

(
    ~sampleOne.ar(2);
    ~sampleOne.quant=16;
    ~sampleOne.fadeTime=2.02;
    ~sampleOne={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.00001;
        var pos =  LFTri.ar(~tempo/320/[1.001,1.00001,1.000001,1.00000001]);
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.2,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),hit, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  //sig = sig 
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,LFSaw.ar(~tempo/16).range(1,1/1.5),1); 
        Splay.ar(sig.flat,0.15,0.5);
    };
    ~sampleOne.play;
);
~sampleOne.stop(7);
~sampleOne.clear;

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
