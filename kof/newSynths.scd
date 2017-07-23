
p.bpm(89.6);

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(40!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.clock = p.clock;
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(40!2,env**100*8pi) + BrownNoise.ar(env**20);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=1;
~one={
    var f = [110.01,440.043,880] +.x LFNoise1.kr(~tempo*8!12).range(-1.001,1.001) / TChoose.kr(Impulse.kr(~tempo/8/[2,4,8]),[1,2,4,1.5,1.333,1.66666,1/2,1/4]) * TChoose.kr(Impulse.kr(~tempo/96/[2,4,8]),[1/2,1,2,4,1.5,1.333,1.66666]);
  var sig = SinOsc.ar(f,[0,pi],mul:SinOsc.ar(f+(TChoose.kr(Impulse.kr(~tempo/4!4),(1..7)).reciprocal)*f) ) ** LFTri.ar(~tempo/8/(1..4)).range(0.1,2.9) * VarSaw.ar(f/2+(_*0.001337!4));
    //sig =  sig * (Pulse.ar(~tempo*[1,2,3,4]));// * LFTri.ar(~tempo/2/[1,2,3])).range(0.01,0.8);
    sig = LeakDC.ar(sig);
    //sig=  CombL.ar(sig,~tempo/2,((1..3).reciprocal+1*8)/f,~tempo);
    sig = Normalizer.ar(sig)/2;
    //sig = sig * Pulse.ar(~tempo*2)/4;
    sig=  CombC.ar(sig,~tempo/2,((1..3).reciprocal+LFNoise2.kr(~tempo/64!3).range(0.95,1.05)*2)/f,~tempo);
    sig = LPF.ar(sig,f*2);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = LeakDC.ar(sig);
    sig = Compander.ar(sig,~kick.ar + ~kick2.ar,0.1,1,0.1);
    Splay.ar(sig,0.5,0.225,SinOsc.kr(~tempo/[3.01,4.021])/2);
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
