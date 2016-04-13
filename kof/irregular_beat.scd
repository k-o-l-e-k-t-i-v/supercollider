


(
  p.clock.tempo_(170/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

(
  ~one.ar(2);
  ~one.quant=2;
  ~one.fadeTime=0.2;
  ~one={
    var mini = Duty.kr([4,2,1,1/4],0,Dseq([3,6,-5,0],inf));
    //         |       |       |       |       |  
    var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0,
    ].pyramid.rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5*[1,2,3,4]],[3,-7]),imp * hit);
    var sig = SinOsc.ar(50!2 + mini + (env**80*1600));
    sig = sig * env;
    sig = CompanderD.ar(sig,3/4,1/2,1/2,0.002,0.13);
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
    var mini = Duty.kr([4,2,1,1/4],0,Dseq([1,-1,2,-2],inf));
    //         |       |       |       |       |  
    var pat = [
      1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,1,0,0,1,0,0,0,
      1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0,
    ].pyramid.rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05*[1,2,3,4]],[3,-7]*mini),imp * hit);
    var sig = LFNoise2.ar(16000/[1,2,4,8]);
    sig = sig * env;
    sig = CompanderD.ar(LPF.ar(sig,3800),3/4,1/2,1/2,0.002,0.13);
    Splay.ar(sig,0.35,0.25);
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
~three.fadeTime=4.2;
~three={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(43.2*[1,2,1.25,1.3333],mul:0.95);
  sig = sig *LFSaw.ar(~tempo.kr/16/[1,2,3,4]).exprange(0.001,1) ;
  sig = MoogFF.ar(sig,432,LFNoise2.kr(1/4!4).range(1.1,3.9));
  Splay.ar(sig,0.75,0.75,SinOsc.kr(7));
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;


// four synth ///////////////////////////////////////

(
~four.ar(2);
~four.quant=2;
~four.fadeTime=0.2;
~four={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,0,0,1,1,1,0,1,0,0,0].pyramid.rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[3.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(LFSaw.ar(2).exprange(1/4,9000));
  sig = BPF.ar(sig,60+LFSaw.ar(1/32).range(1,16000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;

// revr filter ///////////////////////////////////////

(
  ~revr.quant=1;
  ~revr.fadeTime=7;
  ~revr={
    var synths = p.playingProxies;
    var high,mid,low;
    var sig = [];
    synths.collect{|n| if(n!=\revr){sig=sig++p.[n.asSymbol];}};

    //sig = Resonz.ar(sig,MouseX.kr(50,16000,(1..8)),MouseY.kr(0.01,1,(1..4)/16))/4;
    //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
    //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
    sig = DWGReverb.ar(Mix.ar(sig),4000,mix:0.2);
    sig = CompanderD.ar(sig,3/4,1/2,1/2,0.0002,0.13);
    low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2,0.12);
    mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/1.24,1/2,0.012)/2;
    high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/1.16,1/2,0.00012)/2.5;
    sig = CompanderD.ar(Mix.ar(high+mid+low).flat,3/4,1/1.1,1/1.1,0.02);
    sig = DelayN.ar(sig,[0,0.02]);
    Splay.ar(sig,0.75,0.045,SinOsc.kr(1/7));
  };
  ~revr.play;
);
~revr.stop(7);
~revr.clear;
