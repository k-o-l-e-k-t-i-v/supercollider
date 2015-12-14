

p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(10)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

(
  p.clock.tempo_(140/60*2);
  
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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(50 * 1.5,SinOsc.ar(4).range(-pi,pi)),
    LFNoise0.ar(1600,mul:0.2),
    SinOsc.ar(50 * 1.25,SinOsc.ar(1.5).range(-pi,pi)),
    LFNoise1.ar(16000,mul:0.2),
    SinOsc.ar(50 * 1.125,SinOsc.ar(8).range(-pi,pi)),
    LFNoise2.ar(1000,mul:0.2),
    SinOsc.ar(50 * 1.5,SinOsc.ar(40).range(-pi,pi)),
    LFNoise0.ar(12000,mul:0.2),
  ];
  
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = Resonz.ar(sig,LFNoise2.kr(4!2).range(400,16000),0.2) + LPF.ar(sig,400);
  //sig = Normalizer.ar(sig,0.9,0.1);
  //sig = sig * env;
  sig = AllpassN.ar(sig,1,1/400,16);
  Splay.ar(sig,0.95,0.5,SinOsc.ar(1));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var mod = Duty.kr([1,2,3,4]/~tempo.kr,0,Dseq([100,10,50,200],inf)).lag(1);
  var mod2 = Duty.kr(8/~tempo,0,Dseq([1,2,1.5,1.25,4],inf));
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,60,50,75/mod2]+(env**mod*[100,200,1500,1000])+SinOsc.ar(1/4.1,mul:pi),SinOsc.ar([1/4])*pi);
  sig = sig + (Dust.ar(1000!4)).lag(0.001);
  sig = sig.distort + sig / 2 * env;
  Splay.ar(sig,0.15,0.8);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~one.ar+~two.ar+~three.ar+~four.ar+~six.ar+~seven.ar;

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/16;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
