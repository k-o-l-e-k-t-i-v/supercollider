

p.push();
p.bpm(121.5/2);


// cork synth ///////////////////////////////////////

(
~cork.ar(2);
~cork.clock = p.clock;
~cork.quant=16;
~cork.fadeTime=4;
~cork={
  var sig = Pulse.ar(~tempo*2) * LFSaw.ar(~tempo/4);
  sig = CombC.ar(sig,~tempo/32,~tempo/32,3);
  sig = LeakDC.ar(sig).softclip;
  Splay.ar(sig,0.5,0.25);
};
~cork.play;
);
~cork.stop(4);
~cork.clear;
~cork.pause;
~cork.resume;

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
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(32+(env**20*32),env**40*8pi);
  sig = sig * env;
  sig = sig + (CombN.ar(sig,1,~tempo/4,1)*LFPulse.ar(~tempo/4/[1,2,3,4],0.75));
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// mel synth ///////////////////////////////////////

(
~mel.ar(2);
~mel.clock = p.clock;
~mel.quant=[16,0];
~mel.fadeTime=0.02;
~mel={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333,4,8,12,16],inf)) ;
  var f = 320 + (2**[3,5,9].log2*(320/mod));
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(f);
  sig = sig * env;
  sig = sig + (CombN.ar(sig,1,~tempo/4,1)*LFPulse.ar(~tempo/4/[1,2,3,4],0.75));
  Splay.ar(sig,0.75,0.15);
};
~mel.play;
);
~mel.stop(4);
~mel.clear;
~mel.pause;
~mel.resume;


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
