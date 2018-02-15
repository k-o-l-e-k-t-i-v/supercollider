


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
    ~sampleOne.quant=4;
    ~sampleOne.fadeTime=2.02;
    ~sampleOne={
        var mod = 2/[1,2,4/3,1.5];//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.001;
        var pos =  0.0;//LFTri.ar(~tempo/32);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = LFTri.ar(~tempo/16/[1,2,3,4]) ** 2;//EnvGen.ar(Env([0.001,1,0.001],[0.502,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),1, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  //sig = sig 
        sig = sig * (LFTri.ar(~tempo/[1,2,3,4]/4) ** 1.6);
        sig = CompanderD.ar(sig,3/4,LFSaw.ar(~tempo/16).range(1,1/1.5),1); 
        Splay.ar(sig.flat,0.15,0.5,SinOsc.ar(~tempo*2));
    };
    ~sampleOne.play;
);
~sampleOne.stop(7);
~sampleOne.clear;


