p.push();
p.bpm(120);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=1;
~one={
  var sig = LocalIn.ar(4) + (Pulse.ar(~tempo*2/[1,2,3,4]) * BrownNoise.ar(1!4));
  var f = Duty.kr(4*[1,2,3,4]/~tempo,0,Dseq([60,64,68,72,36,40,44,36,48].midicps*.x[1,2,1/2,1.5,4/3,2,1,1.5,8],inf)) + BrownNoise.ar(0.75!4);
  f = f / Duty.kr(64/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  sig = DelayN.ar(sig,8/f,1/8/f);
  sig = BPF.ar(sig,f*[1,2,1,1.5],0.012);
  sig = LeakDC.ar(sig);
  sig = sig.distort * 0.996;
  LocalOut.ar(sig);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  //sig = CombN.ar(sig/1.5,1,1/f,2) * sig;
  sig = Compander.ar(sig,Pulse.ar(~tempo/2/[1,2,3,4]),0.1,1,0.1);
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+((1..4)/10.0*(env**80)*5),env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



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
