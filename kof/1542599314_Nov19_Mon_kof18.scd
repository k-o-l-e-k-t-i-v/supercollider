

p.push();
p.bpm(120)

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

// a synth ///////////////////////////////////////

(
~a.ar(2);
~a.clock = p.clock;
~a.quant=2;
~a.fadeTime=4;
~a={
    var mod = Duty.kr([16,64,128]/~tempo,0,Dseq([2,3,5,7,9].log2,inf));
  var sig = SinOsc.ar(50*mod/[1,100,1000]);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = Formant.ar(50*mod,sig.abs*1500,sig.abs*500) * sig;
  sig = LeakDC.ar(sig);
  sig = CombN.ar(sig,1/4,1/50*mod,1);
  Splay.ar(sig,0.5,0.25);
};
~a.play;
);
~a.stop(4);
~a.clear;
~a.pause;
~a.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**50*4pi) + VarSaw.ar(50,0,env**40);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,1,1,1, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.5);
  sig = HPF.ar(sig,env**40*8000/[1,2,3,4]+8000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;



(
  ~master.quant=2;
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
// aa filter ///////////////////////////////////////

(
~aa.quant=1;
~aa.fadeTime=1;
~aa={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\aa){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverbC1C3.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.5,0.25);
};
~aa.play;
);
~aa.stop(7);
~aa.clear;
