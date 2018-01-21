p.push();
p.bpm(121)


// ticky synth ///////////////////////////////////////

(
~ticky.ar(2);
~ticky.clock = p.clock;
~ticky.quant=16;
~ticky.fadeTime=4;
~ticky={
  var sig = PinkNoise.ar(0.1) * Pulse.ar(~tempo/16*[1,4,8,12,14,16,15,17,1/2,1/4]*4);
  sig = CombN.ar(sig,2/50,1/50,~tempo/[8,2,1,1/2]);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~ticky.play;
);
~ticky.stop(4);
~ticky.clear;
~ticky.pause;
~ticky.resume;

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
