


p.push();
p.bpm(117);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
    var mod1 = LFNoise2.kr(~tempo/32!3).range(0.5,1.5);
    var mod2 = LFNoise2.kr(~tempo/32!3).range(0.5,1.5);
    var f = TChoose.kr(Impulse.kr(~tempo/16/[1,2,3]),[1000,500,250,125,2000,3000,1500,150,100]) + SinOsc.kr([4,5,50]).range(-1pi,1pi);
    var l = LFNoise2.kr(~tempo/[1,2,3]/16) * 4;
  var sig = Pulse.ar(~tempo*4/[1,2,3]).softclip;
  var env = Decay.ar(sig,l);
  sig= CombN.ar(sig,mod1/f,mod2/f,l)/4+sig;
  sig = RLPF.ar(HPF.ar(sig,50),f,SinOsc.kr(1/16).range(0.1,0.5)) * LFTri.kr(~tempo/16/[1,2,3]);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.5);
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
