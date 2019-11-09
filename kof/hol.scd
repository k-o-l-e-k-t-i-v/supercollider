


p.push
s.latency=0;
p.bpm(480)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=[16,3];
~one={
    var mod2 = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var mod = Duty.kr(2/4/~tempo,0,Dseq([1,2,1.5,1.33333],inf))*mod2 ;
  var sig = SinOsc.ar([5000.01,500.001,250.02,50.03]/[4,8,1.5]/mod,SinOsc.ar(4/32/[1,2,1.0001]).range(0,1))**LFSaw.ar(1/4/[1,2,3,4]);
  Splay.ar(sig,0.95,0.05,SinOsc.ar(1/8)/[4,4.01]);
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
~kick.quant=[16,1/3];
~kick.fadeTime=0.12;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var len = SinOsc.kr(1/32).range(1/4,4);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,len],[3,-3]),imp * hit)};
  var sig = SinOsc.ar(50!2+(env**2*80),env**80*8pi);
  var slide = 1/SinOsc.ar(1/16).range(1,1600);
  sig = sig * DelayN.ar(env,slide,slide);
  Splay.ar(sig,0.0,0.5,SinOsc.kr(32)/1000.0);
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
