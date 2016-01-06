
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(100)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

//resender
(
    m = NetAddr("127.0.0.1", 12000);

    // output triggers
    o = OSCFunc({ arg ...args;
                 args.postln;
                 m.sendMsg("/trig",args[1],args[0][3]);
                },'/tr', s.addr);
)


(
  p.clock.tempo_(60/60/10);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


////////////////////////////////////////////////////


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=1;
    ~one={
        var imp = Impulse.ar(~tempo/4,(0..3)/4);
        var sig = Decay2.ar(imp,0.02,1/4);
        sig = sig * SinOsc.ar([700,71]+(sig**20*200),mul:0.5);
        SendTrig.ar(imp,0,sig.abs*255);
        Splay.ar(sig,0.5,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// three synth ///////////////////////////////////////

(
~three.ar(2);
~three.quant=2;
~three.fadeTime=0.2;
~three={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.502,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(50!2),
  Pulse.ar(4!2),
  SinOsc.ar(50!2),
  LFSaw.ar(50!2),
  SinOsc.ar(50!2),
  SinOsc.ar(500!2),
  SinOsc.ar(50!2),
  LFNoise2.ar(5000!2),
  SinOsc.ar(50!2),
];
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
    Splay.ar(sig,0.75,0.15,SinOsc.ar(1/4));
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;



// combinee synth ///////////////////////////////////////

(
  ~combinee.ar(2);
  ~combinee.quant=2;
  ~combinee.fadeTime=5.2;
  ~combinee={
    //         |       |       |       |       |  
    var mod = Duty.kr([4,3,2,1],0,Dseq([1,2,1.5,1.25],inf));
    var pat = [1,1,1,1,1,0,0,0,1,0,1,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002*[10,100,1,2000],0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      SinOsc.ar(50!2),
      SinOsc.ar(5000!2/mod,mul:0.1),
      SinOsc.ar(50!2*mod),
      LFNoise2.ar(400),
      SinOsc.ar(5000!2/mod/2,mul:0.1),
      SinOsc.ar(50!2),
      SinOsc.ar(5000!2*mod,mul:0.1),
      Dust.ar(12000),
      SinOsc.ar(50!2*2/mod),
      SinOsc.ar(5000!2/mod/4,mul:0.1),
      SinOsc.ar(50!2),
    ];
    sig = PitchShift.ar(sig,0.1,1/(mod*(1..8)))+sig/2;
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    sig = Normalizer.ar(sig)*3/4;
    sig = sig * env;
    sig = CombN.ar(sig,1/4,LFSaw.ar(1/[4,1,40,400]).range(1/4,1/80),16)/16+sig/2;
    sig = GVerb.ar(sig,20,4)/2+sig;
    Splay.ar(sig,0.75,0.25,SinOsc.kr([1,2,3,4]));
  };
  ~combinee.play;
);
~combinee.stop(4);
~combinee.clear;
~combinee.pause;
~combinee.resume;
