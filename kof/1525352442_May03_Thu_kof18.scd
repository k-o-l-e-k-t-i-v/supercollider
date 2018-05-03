
p.push
p.bpm(142.5/4)

(
n = [
"/home/kof/Downloads/sounds/63862__moppetron__stayingalive-tamburin.wav",
"/home/kof/Downloads/sounds/354140__inspectorj__triangle-4-hard-hit-a.wav",
"home/kof/Downloads/sounds/360327__inspectorj__triangle-8-hard-hit-a.wav",
]
);

b = Buffer.read(s,n[0]);


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(120);};});
}.fork;  
)

(
  s.latency=0.1;
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
    ~sample_one.ar(2);
    ~sample_one.quant=4;
    ~sample_one.fadeTime=0.2;
    ~sample_one={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0001;
        var pos = [0,0.5,0.25,0.75] * LFSaw.ar(~tempo/16*[1,2,3,4]);
        //         |       |       |       |       |  
        var pat = [
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0, 
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0, 
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0, 
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1, 
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        sig = Resonz.ar(sig,LFDNoise1.kr(~tempo/32!4).range(50,15000),env);
        Splay.ar(sig.flat,0.75,0.75);
    };
    ~sample_one.play;
);
~sample_one.stop(7);
~sample_one.clear;



b = Buffer.read(s,n[1]);


// player synth ///////////////////////////////////////

(
    ~sample_two.ar(2);
    ~sample_two.quant=4;
    ~sample_two.fadeTime=2.02;
    ~sample_two={
        var mod = (1) + (2**([1,3,5,7,11,12]/12)) / Duty.kr([1,2,3,4,5,6,7]*16/~tempo,0,Dseq([1,2,1.5,1.33333,4,8,16,32],inf));
        var spread = 0.001;
        var pos = 1/(1..8);
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,6,7,8]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/3,1);
        Splay.ar(sig.flat,0.5,0.005);
    };
    ~sample_two.play;
);
~sample_two.stop(7);
~sample_two.clear;


(
  ~master.quant=16;
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
