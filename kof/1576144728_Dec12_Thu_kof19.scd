
p.push();
p.bpm(90);
b = Buffer.alloc(s,4,48000)

// none synth ///////////////////////////////////////

(
~none.ar(2);
~none.quant=4;
~none.fadeTime=0.1;
~none={
    var hit = 8;
    var last = Duty.kr(4/~tempo,0,Dseq([60,68,65,71],inf)).lag(1);
    var freq = [60,65,67,last].midicps/2;
    var del = SinOsc.ar(freq,mul:0.5)+0.5;
  var sig = SinOsc.ar(1);
  sig = BufDelayL.ar(b.bufnum,sig,del);
  sig = LPF.ar(sig,freq*2);
  Splay.ar(sig,0.95,0.75);
};
~none.play;
);
~none.stop(4);
~none.clear;
~none.pause;
~none.resume;


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
