



p.push();
p.bpm(120);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(4/~tempo/[1,2,3],0,Dseq([1,2,1,1.5,1,3],inf));
    var f = 1100*[1,1.5,mod]/mod;
  var sig = SinOsc.ar(f) + SinOsc.ar(f+0.01) * RLPF.ar(VarSaw.ar(f,SinOsc.ar(f/8)),LFSaw.ar(1/16/[1,2,3,4]).range(f,f*2),LFSaw.ar(1/4/[1,2,3,4]));
  sig = sig * Pulse.ar(4/[1,2,3,4]);
  sig = BPF.ar(sig,f,0.2);
  Splay.ar(sig,0.5,0.25);
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
