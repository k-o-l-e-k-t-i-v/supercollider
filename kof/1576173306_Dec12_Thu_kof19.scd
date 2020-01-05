
p.push();

b = Buffer.alloc(s,16,48000);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.4;
~one={
    var f = [60,65,67].midicps;
    var detune = SinOsc.kr(1/16/[1,2,3]).range(0.000001,0.01);
  var sig = SinOsc.ar(1/2);
  sig = BufDelayL.ar(b.bufnum,sig,SinOsc.ar(f/((1..16)**detune),mul:0.5,add:0.5)+SinOsc.ar(f/64,mul:0.1));
  sig = LeakDC.ar(sig);
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
