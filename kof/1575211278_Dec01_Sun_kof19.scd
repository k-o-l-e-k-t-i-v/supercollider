p.push();



// lr synth ///////////////////////////////////////

(
~lr.ar(2);
~lr.quant=0;
~lr.fadeTime=0.04;
~lr={
  var sig = SinOsc.ar([50,50],Pulse.ar(4/[1,2,3,4])) * Pulse.ar(4/[1,2,3,4]);
  Splay.ar(sig,1,0.5);
};
~lr.play;
);
~lr.stop(4);
~lr.clear;
~lr.pause;
~lr.resume;


p.bpm(121.5)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=[8,1/4];
~one.fadeTime=0.1;
~one={
    var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/2);
  var sig = LFSaw.ar(86.4/(1/[2,3,4,5].log2) /mod)*SinOsc.ar(7.01/[1,2,3,4]+1/2);
  sig = RLPF.ar(sig,LFSaw.ar(~tempo*4/[1,2,3,4]).range(50,15000));
  Splay.ar(sig,0.85,0.35);
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
