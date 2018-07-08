p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
    var oct = Duty.kr(16/~tempo*[1,2,3],0,Dseq([4,8,4,16,2,4,8,2,4,16,1,2].pyramid,inf));
    var mod2 = Duty.kr(64/~tempo*[1,2,3],0,Dseq( [1,2,1/2,4/3,1/2,4,8,2,1].pyramid,inf));
    var mod = Duty.kr(4/~tempo*[1,2,3],0,Dseq( [1,2,1/2,4/3,1/2,4,8,2,1].pyramid,inf));
    var f  = 60 * oct * [1,mod*oct,mod*1.25] + SinOsc.ar(16/[1,2,3],mul:2) / mod2;
  var sig = Formant.ar(f/mod,f[1],f[2]) * Pulse.ar(4/[1,2,3]) + SinOsc.ar(f,Pulse.ar(4/[1,2,3])) / 2 + VarSaw.ar(f,Pulse.ar(4/[1,2,3]),mul:LFSaw.ar(1/4/[1,2,3])) / 1.5;
  sig = LeakDC.ar(sig/8);
  sig = CombC.ar(sig,4/f,2/f,128/f) / 4 + sig;
  sig = LPF.ar(sig,f);

  Splay.ar(sig,0.5,0.15);
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
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
