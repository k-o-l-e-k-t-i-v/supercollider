(
  p.clock.tempo_(120/60);

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
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[-30,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**[100,40,400,200]*1000));
    sig = sig * env;
    Splay.ar(sig,0.15,0.5);
  };
  ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// five synth ///////////////////////////////////////

(
  ~five.ar(2);
  ~five.quant=2;
  ~five.fadeTime=0.2;
  ~five={
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      SinOsc.ar(50!2,SinOsc.ar(50)*pi),
      LFNoise2.ar(500!2),
      Pulse.ar(50!2) * Pulse.ar(4),
      LFNoise0.ar(5000!2),
      SinOsc.ar(500!2,SinOsc.ar(50)*pi),
      LFNoise2.ar(500!2),
      Pulse.ar(150!2) * Pulse.ar(2),
      LFNoise0.ar(15000!2),
     ]/3;
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    //sig = sig * env;
    Splay.ar(sig,0.75,0.15);
  };
  ~five.play;
);
~five.stop(4);
~five.clear;
~five.pause;
~five.resume;



// two synth ///////////////////////////////////////

(
  ~two.ar(2);
  ~two.quant=2;
  ~two.fadeTime=0.2;
  ~two={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.25*[1,2,3,10]],[-3,3],curve:'exp'),imp * hit);
    var sig = Blip.ar(43.2*[2,2,2,4]/mod,[4,20,40,80]) + LFNoise2.ar(16000/[1,2,3,4],mul:0.5);
    sig =  sig + SinOsc.ar(10000+(1000/(1..4))/mod,SinOsc.ar(4)*2pi,mul:LFNoise2.kr(4!4));
    sig = sig * env;
    Splay.ar(sig,0.15,0.15);
  };
  ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// four synth ///////////////////////////////////////

(
  ~four.ar(2);
  ~four.quant=2;
  ~four.fadeTime=0.2;
  ~four={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4*[1,2,4,8],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50!2,SinOsc.ar(50/[1,2,1.5,2])*pi);
    sig = CombN.ar(sig,1/4,Dust.ar(8000).range(0.1,0.5).lag(0.1),4)/4;
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;

p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(10)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

// seven synth ///////////////////////////////////////

(
~seven.ar(2);
~seven.quant=2;
~seven.fadeTime=4;
~seven={
  var sig = Dust.ar(LFSaw.ar(1/8/[1,2,3,4]).exprange(0.001,16000));
  sig= CombN.ar(sig,1/10,LFNoise2.kr(1!4).exprange(1/10,1),8);
  sig = LeakDC.ar(sig);
  //sig = GVerb.ar(sig,100,30)/4+sig;
  //sig = LPF.ar(sig,16000/[10,20,3,15]);
  Splay.ar(sig,0.75,0.5,SinOsc.kr([4,3,2,1]));
};
~seven.play;
);
~seven.stop(4);
~seven.clear;
~seven.pause;
~seven.resume;


// ff filter ///////////////////////////////////////

(
  ~ff.quant=1;
  ~ff.fadeTime=1;
  ~ff={
    var high,mid,low;
    var sig = ~one.ar+~two.ar+~three.ar+~four.ar+~six.ar+~seven.ar;

    sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    sig = CombN.ar(sig,4,[4,8,16],32)+sig;
    sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
    low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.15,0.1);
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;
