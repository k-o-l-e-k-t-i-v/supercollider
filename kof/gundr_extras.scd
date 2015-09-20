
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


//resender
(
  m = NetAddr("127.0.0.1", 12000);

  // output triggers
  o = OSCFunc({ arg ...args;
               args.postln;
               m.sendMsg("/trig",args[1],args[0][3]);
              },'/tr', s.addr);
)


s.freeAll;


(
  p.clock.tempo_(250/60*2);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


// saw synth ///////////////////////////////////////

(
  ~saw.quant=2;
  ~saw.fadeTime=4.2;
  ~saw={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,48*fib(4),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[5.002,0.5],[3,-3],curve:'exp'),imp * hit);
    
      var sig = LFSaw.ar(50/(1+(1..8).reciprocal)+SinOsc.ar(2).range(-8,8),(1..16)/(env*[320,16,8,64]+1)).distort;
    //var sig = WhiteNoise.ar(50/(1+(1..8).reciprocal),(1..16)/(env*[32,16,8,64]+1)).distort;
    //var sig = LFSaw.ar(50/(1+(1..8).reciprocal),(1..16)/(env*[32,16,8,64]+1)).distort;
    
      sig = LPF.ar(sig,800+LFNoise2.kr(1/4/fib(4)).range(0,10000));
    //SendTrig.ar(K2A.ar(hit*imp),0,LFSaw.ar(~tempo*16).range(0,10));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~saw.play;
);
~saw.stop(7);
~saw.clear;

// saw2 synth ///////////////////////////////////////

(
  ~saw2.quant=2;
  ~saw2.fadeTime=4.2;
  ~saw2={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[3.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(500/[4,8,16,32]+SinOsc.ar(4).range(-4,4),(1..16)/(env*[320,160,8,64]+1)).distort;
      sig = LPF.ar(sig,800+LFNoise2.kr(1/4/fib(4)).range(0,10000));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~saw2.play;
);
~saw2.stop(7);
~saw2.clear;



// gver filter ///////////////////////////////////////

(
  ~gver.quant=1;
  ~gver.fadeTime=1;
  ~gver={
    var high,mid,low;
    var sig = ~saw + ~saw2;
    sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/2 + sig;
    low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
    mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.75,0.25);
  };
  ~gver.play;
);
~gver.stop(7);
~gver.clear;

// grayhole filter ///////////////////////////////////////

(
~grayhole.quant=1;
~grayhole.fadeTime=1;
~grayhole={
  var high,mid,low;
  var sig = ~saw + ~saw2;
  
  sig = GVerb.ar(LPF.ar(sig,800)+HPF.ar(sig,500),100,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.5);
};
~grayhole.play;
);
~grayhole.stop(7);
~grayhole.clear;

