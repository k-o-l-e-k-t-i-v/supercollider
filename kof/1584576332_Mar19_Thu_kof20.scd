



p.push();
p.bpm(115*2);

// one synth ///////////////////////////////////////

(

~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  var sig = LFSaw.ar(50*[1,1.5,2,4/3]) * (LFTri.ar(~tempo/4/[1,2,3,4])**2);
  sig = sig * Pulse.ar(~tempo/[1,2,3,4]);
  
/*
  3.do{|i|
      sig = CombL.ar(sig,~tempo/4,~tempo/2,1);
    sig = AllpassL.ar(sig,i+1/2/~tempo,1/(4+i)/~tempo,3);
    sig = LeakDC.ar(sig);
    sig = Normalizer.ar(sig);
  };
  */
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.95,0.0045);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// sw synth ///////////////////////////////////////

(
~sw.ar(2);
~sw.quant=24;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0].rotate(1);
  var base = Duty.kr(4/~tempo,0,Dseq([60,65,67,61],inf)).midicps*4;
  var imp = PulseDivider.kr(~tick.kr,24/(1..24).nthPrime,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.02,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [] ++ LFSaw.ar(base/(((24/(1..24).nthPrime).log).scramble),mul:0.25);
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~sw.play;
);
~sw.stop(4);
~sw.clear;
~sw.pause;
~sw.resume;

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
