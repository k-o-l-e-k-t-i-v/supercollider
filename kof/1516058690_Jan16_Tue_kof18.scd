


p.push()
p.bpm(120);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr([1,2,4]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar([~tempo/[1,2,3],~tempo/16/[1,2,3],500/mod+SinOsc.ar(~tempo*4).range(0,5/mod)]).range(0,LFTri.ar(~tempo/[1,2,3]/64).exprange(0.21,4));
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * Decay.ar(Impulse.ar(~tempo*2/[1,2,3]),1);
  sig = CombN.ar(sig,1/~tempo,1/~tempo,~tempo);
  Splay.ar(sig,0.5,0.75);
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
