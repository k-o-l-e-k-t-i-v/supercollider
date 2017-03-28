
p.push;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.clock = p.clock;
~formant.quant=2;
~formant.fadeTime=4;
~formant={
  var t = SinOsc.ar([1,1/2,1/[1,2,3,4]],Pulse.ar(~tempo/[1,2,3,4])*2pi) + SinOsc.kr(1/400/[1,2,3,4]);
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = Formant.ar(50,sig[1].range(5,1500),sig[2].range(5,1500));
  sig = MoogFF.ar(sig,15000/[1,8,1.5,4],sig.range(0.5,3.5));
  Splay.ar(sig,0.5,0.5);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.0],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**33*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
