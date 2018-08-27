


b=Buffer.alloc(s,48000,2);
p.push();
p.bpm(90)


// writer synth ///////////////////////////////////////

(
~writer.ar(2);
~writer.clock = p.clock;
~writer.quant=2;
~writer.fadeTime=4;
~writer={
    var mod = Duty.kr(16/~tempo*(1..4),0,Dseq([1,2,1.5,1.33333]**.x[1,1.5,2],inf))*[1,2,1.5];
  var sig = Pulse.ar(~tempo*2/(1..4)).softclip;
  sig = RLPF.ar(sig,10000/mod);
  sig = LeakDC.ar(sig);
  sig = AllpassC.ar(sig,1/4,1/((50,50.001..50.1)*mod),1);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,1/2,1/4,1);
  Splay.ar(sig,0.5,0.25);
};
~writer.play;
);
~writer.stop(4);
~writer.clear;
~writer.pause;
~writer.resume;



(
  ~master.quant=16;
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
