


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=5;
~one={
  var sig = AudioIn.ar([0,1]);// + SinOsc.ar(50,SinOsc.ar(3)*pi,mul:0.7);
  //sig = PitchShift.ar(sig,0.25,0.99902);
  sig = Resonz.ar(sig,160*[1,2,4,8]);
 // sig = CombN.ar(sig,1/4,1,16)+sig;
 // sig = DelayN.ar(sig,1/4,1/(1..4)) + sig;
  //sig = RLPF.ar(sig,500*[1,2,4,8]);
  //sig = sig + SinOsc.ar(50*1.25,mul:0.2);
  sig =  Normalizer.ar(sig);
  //sig = sig * Pulse.ar(8/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,200,10,spread:90)+sig/2;
  sig = CompanderD.ar(sig,3/4,1/1.5,1/2);

  Splay.ar(sig,0.005,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5!2+(env**100*2000));
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.502*[1,2,3,4],0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Dust.ar(14000);
  sig = LPF.ar(sig,1600/[1,5,800,900]);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;




// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~one.ar + ~two.ar;

  sig = Resonz.ar(sig,MouseX.kr(100,16000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
