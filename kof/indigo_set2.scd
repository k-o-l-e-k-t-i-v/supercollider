Kolektiv(\kof)
Kolektiv(\kof).free


History.current.saveCS("/tmp/secondSession.scd")





(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// weirdo synth ///////////////////////////////////////

(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*40*env).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.55);
};
~weirdo.play;
);
~weirdo.stop(7);
~weirdo.clear;


// kick synth ///////////////////////////////////////

(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin.wav");

// player synth ///////////////////////////////////////

(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,4,-0.25,1/8,16]*0.25;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.402,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);
~ssm.stop(7);
~ssm.clear;

// crack synth ///////////////////////////////////////

(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~crack.play;
);
~crack.stop(7);
~crack.clear;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~crack + ~ssm + ~kick + ~weirdo;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),[70,40],[3,4,5,6],spread:[40,90])/2 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
