


p.push();

p.bpm(120)



// hq synth ///////////////////////////////////////

(
~hq.ar(2);
~hq.clock = p.clock;
~hq.quant=4;
~hq.fadeTime=6;
~hq={
    var f = 15000/((1..10)**SinOsc.ar(MouseX.kr(1,0.001),add:1,mul:4)) + LFDNoise1.kr(~tempo*5000/[1,2,3,4]);
  var sig = SinOsc.ar(f) * Pulse.ar(MouseY.kr(~tempo/16,~tempo*16));
  sig = CombC.ar(sig,~tempo/50,~tempo/50,~tempo) * sig ;
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  Splay.ar(sig,0.15,0.05);
};
~hq.play;
);
~hq.stop(4);
~hq.clear;
~hq.pause;
~hq.resume;

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
