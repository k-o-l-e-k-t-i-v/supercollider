


p.push();
p.bpm(89)
~tempo={LFNoise1.kr(1/15).range(1.45,1.65)};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=4;
~one={
    var mod3 = Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var mod2 = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) / mod3;
    var mod = Duty.kr(1/8/~tempo,0,Dseq([1,2,1.5,1.33333],inf))  * mod2;
  var sig = SinOsc.ar(150*mod+[0,0.1]/[1,1/1.5,1.333,1]) * (LFTri.ar(~tempo/[1,2,3,4])**1.25);
  Splay.ar(sig,0.95,0.25);
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
