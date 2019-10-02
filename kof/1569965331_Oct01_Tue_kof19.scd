

p.push();
p.bpm(138.88)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=0.4;
~one={
    var mod = Duty.kr([16,32,1,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) + (SinOsc.kr(~tempo/[1,2,3,4])/40000);
    var mod1 = Duty.kr(4*[16,32,1,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) + (SinOsc.kr(~tempo/[1,2,3,4])/40000);
    var mod2 = Duty.kr(16*[16,32,1,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) + (SinOsc.kr(~tempo/[1,2,3,4])/40000);
    var ll = LFSaw.ar(~tempo/16/[1,2,3,4]).range(1/15000,1/50);
    var base = [60,36,72,48].midicps*mod*mod1/mod2/~ratio;
  var sig = LFPulse.ar((base/mod)+(base/mod1)+(base*mod2));
  sig = sig * SinOsc.ar(base/mod2,mul:SinOsc.ar(~tempo*2/[1,2,3,4]))+LFSaw.ar(base/mod1,mul:SinOsc.kr(~tempo/4/[1,2,3,4]));
  sig = sig + DelayN.ar((LFTri.ar(~tempo)**2/2*LFSaw.ar(base/mod+(base/2*mod1)+(base/4/mod2))),ll,ll);
  sig = sig * (Pulse.ar(~tempo*2/[1,2,3,4])/2);
  sig = DelayL.ar(sig,ll,ll);
  sig = BPF.ar(sig,SinOsc.ar(~tempo/[1,2,3,4]).range(base/4,base*4),LFNoise1.kr(~tempo/16!4).exprange(0.01,0.5));
  Splay.ar(sig,0.95,0.75);
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
~kick.quant=[16,0];
~kick.fadeTime=0.02;
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
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75],[3,-3]),imp * hit);
  var sig = SinOsc.ar(40!2+(env**20*400),env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.0,0.25);
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
