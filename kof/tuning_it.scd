
p.push();
p.bpm(89);

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// harmonics synth ///////////////////////////////////////

(
~harmonics.ar(2);
~harmonics.clock = p.clock;
~harmonics.quant=8;
~harmonics.fadeTime=1;
~harmonics={
  var mod = Duty.kr(16/~tempo/[1,2,1/64],0,Dseq(([1,2,1,1.5] *.x [2,1,1.5,1.333333]).scramble,inf));
  var change = TWChoose.kr(Impulse.kr(~tempo/16/[8,2,1]),[60,48,72,36],[1,1,0.2,0.1],1) / mod ;
  var temp = TWChoose.kr(Impulse.kr(~tempo/16!3),[1,4,1/2,1/4],[1,1,0.2,0.1],1);
  var fq = change.midicps *.x TChoose.kr(Impulse.kr(~tempo!3),[[1,1,1],[1,2,1],[1,1,2],[1,1,1.5],[1,1,4/3],[1,2,1.5,1,2,3]]) + LFNoise2.kr(~tempo/32!3,mul:0.1333);
  var sig = SinOsc.ar(fq) + SinOsc.ar(fq/2,Pulse.ar(~tempo/[1,3,5,7])) + Formant.ar(fq,LFTri.kr(~tempo/16/[1,2,4],mul:fq/2,add:fq),LFTri.kr(~tempo/4/[1,2,4],mul:fq/2,add:fq),mul:0.82);
  sig = LPF.ar(sig,LFNoise2.kr(~tempo/16).range(500,9000)) + (HPF.ar(sig,LFNoise2.kr(~tempo/4).range(120,1200))*Pulse.ar(~tempo*temp));
  sig = (sig * Pulse.ar(~tempo*2/[1,3,5,7])*0.5) + (ToggleFF.kr(Impulse.kr(~tempo/[1,3,5,7])) * (Decay.kr(Impulse.kr(~tempo),1.5)*sig ) ) + (sig**LFNoise2.kr(~tempo/4).range(1,3));
  
  sig = Vibrato.ar(sig,[3,4,5,7]);
  sig = RLPF.ar(CombN.ar(sig,1/fq,8/fq,[0.2,1/2,1]),fq*4)/8+sig;
  sig = CompanderD.ar(sig.distort.softclip,3/4,1/1.22,1);
  sig = MoogFF.ar(sig,fq*2,2.5);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  sig = HPF.ar(sig,33.midicps);
  sig = HPF.ar(sig,33.midicps);
  Splay.ar(sig,0.93,0.33,SinOsc.kr(LFNoise2.kr(1/120/~tempo).range(6.3/2,7.7*2))/4 );
};
~harmonics.play;
);
~harmonics.stop(4);
~harmonics.clear;
~harmonics.pause;
~harmonics.resume;


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
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(33.midicps!2,env**20*4pi);
  sig = sig * env + ~kick2.ar;
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
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(36.midicps!2,env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,3,5,7]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,[1,2,3,4]*5000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
