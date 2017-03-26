
p.push();
p.bpm(90);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var notes = TChoose.kr(Impulse.kr(~tempo*[1,2,3,4]/64),[60,65,56,58,72].midicps /.x [1,2,1.5,1/2]);
  var sig = (BrownNoise.ar(0.4!4)+Dust.ar(50!4) * LFPulse.ar(~tempo*[1,2,3,4,8,16],0,0.001));
  sig = LPF.ar(sig,LFSaw.kr(~tempo/8/[1,2,3,4]).range(100,15000));
  sig = CombN.ar(sig,1/50,1/notes+LFNoise2.kr(~tempo/16).range(-0.0001,0.0001),4/~tempo) + VarSaw.ar(notes);
  sig = LPF.ar(sig,LFSaw.kr(~tempo/32/[1,2,3,4]).range(100,15000));
  sig = Resonz.ar(sig,notes+SinOsc.ar(notes/10,mul:2),LFNoise2.kr(~tempo/16/[1,2,3,4]).exprange(0.002,0.52));
  sig = Normalizer.ar(sig) * (LFTri.kr(~tempo/[1,2,3,4]/16)**2);
  Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
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
