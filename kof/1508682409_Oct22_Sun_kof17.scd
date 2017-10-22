
p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar([1/32,1/16,50.01+[0.001,0,-0.001]]).range(0,10);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = Compander.ar(sig,Pulse.ar(2),0.1,1,0.1);
  Splay.ar(sig,0.5,0.85);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// blink synth ///////////////////////////////////////

(
~blink.ar(2);
~blink.clock = p.clock;
~blink.quant=[16,0];
~blink.fadeTime=0.02;
~blink={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = Blip.ar(5000+(env**40*10000)+SinOsc.ar(8,mul:pi),200);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~blink.play;
);
~blink.stop(4);
~blink.clear;
~blink.pause;
~blink.resume;

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
