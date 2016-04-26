

(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);




(
  p.clock.tempo_(120/60*2);
  
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
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,
  ].rotate(1);
  var duty = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**[20,40]*8pi) + SinOsc.ar(10000/[1,4/3,8,4]/duty,mul:0.86*(env**50));
  sig = sig * env.pow(4);
  Splay.ar(sig,0.05,0.5);
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
  var imp = PulseDivider.kr(~tick.kr,[3,4,2,1]*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.99,0.005],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000/[1,2,1.5,2]);
  sig = sig * env.pow(4);
  Splay.ar(sig,0.75,0.5);
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
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),4000)+sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/1.2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
