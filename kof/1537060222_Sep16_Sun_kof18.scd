
p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333]*.x[1,1.5],inf)).lag(1/2);
    var env = {EnvGen.ar(Env([0.001,1,0.001],[0.002,LFNoise1.kr(1/4).range(0.5,1.5)],[3,-3]),Impulse.ar(4))};
    var f = Duty.kr(16/~tempo,0,Dseq([60,65,69,67],inf)).midicps.lag(1/4)/mod + SinOsc.ar(4/3,mul:Amplitude.ar(~kick.ar)*50);
  var sig = [] ++ (VarSaw.ar(f)+1) ++ (LFSaw.ar([1/4+(1..8).reciprocal,1/16])*2);
  sig = Perlin3.ar(sig[0]*env,sig[1]*~kick.ar,sig[2]);
  sig = MoogVCF.ar(sig,f*[2,4,1.5],env**4+0.001) * env;
  sig = LeakDC.ar(sig);
  sig = CombN.ar(sig*env,4/f,1/f,1/2);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.125);
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
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*2pi);
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
