

p.push();

b = Buffer.alloc(s,16,48000);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=0.4;
~one={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = LFSaw.ar([50,49.994,49.9859]*mod);
  sig = BufDelayL.ar(b.bufnum,sig,SinOsc.ar(1/16,mod/(12/((2..17).log*12))**MouseX.kr(0.001,2)*2pi).exprange(0.00001,0.02));
  //sig = AllpassL.ar(sig*LFSaw.ar(4/[1,2,3]),4/50,mod/50);
  sig = LPF.ar(sig,1450);
  Splay.ar(sig,0.85,0.15);
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
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[3500,3501],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
