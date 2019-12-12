p.push();

b=Buffer.alloc(s,4,48000);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.1;
~one={
    var amd = LFSaw.ar(1/16)*10;
    var detune = SinOsc.kr(7.5/[1,1.001,1.01,1.00001])*amd;
    var lag = SinOsc.ar(50.001+detune)+1;
    var strike = BufDelayL.ar(b.bufnum,SinOsc.ar(1),lag);
    var sig = strike;
    sig = LeakDC.ar(sig);
    //sig = LPF.ar(sig,2000);
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
