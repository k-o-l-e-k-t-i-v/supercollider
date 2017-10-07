

s.boot;
p.push();

p.bpm(90);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var base = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var f = 5000/base*(2**(TChoose.kr(Impulse.kr(~tempo/16),[1,5,7,0,11,12,24]/12)));
  var sig = Pulse.ar(~tempo/[1,2,3,4]).softclip * VarSaw.ar(f,mul:0.7/[1,2,3,4]);
  sig = CombL.ar(sig*Pulse.ar(f/100),1/f,2/f,8);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.005,0.15);
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
