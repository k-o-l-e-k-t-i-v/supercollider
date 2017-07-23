


p.push();
p.bpm(120*3/4);

~tempo = {LFTri.kr(1/600).range(0.75,1.25)};


// simple synth ///////////////////////////////////////

(
~simple.ar(2);
~simple.clock = p.clock;
~simple.quant=4;
~simple.fadeTime=4;
~simple={
    var mod = Duty.kr(8/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var pos = LFSaw.ar(~tempo/(1..16)).exprange(15000.00,50);
  var sig = BPF.ar(Dust.ar(pos),pos,LFNoise2.ar(~tempo!16).range(0.01,0.4));
  RandSeed.kr(Impulse.ar(pos/100),123);
  sig = Normalizer.ar(sig) * Pulse.ar(~tempo/[1,2,3]*.x[1,1.5,2,3]).softclip;
  sig = SinOsc.ar(sig.range(5,5000).round(250/mod) ,sig*(1/8)*pi,mul:0.3) * Pulse.ar(~tempo/[1,2,3]*.x[1,1.5,2,3]).softclip;
  sig = CompanderD.ar(LPF.ar(sig,15000) + (sig/10),3/4,1/2,1);
  sig = CombN.ar(sig,~tempo/2,~tempo/2,4);
  Splay.ar(sig,0.665,0.25);
};
~simple.play;
);
~simple.stop(4);
~simple.clear;
~simple.pause;
~simple.resume;


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
