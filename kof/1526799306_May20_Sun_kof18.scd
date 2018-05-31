


p.push();
p.bpm(90.0);




// triTone synth ///////////////////////////////////////

(
~triTone.ar(2);
~triTone.clock = p.clock;
~triTone.quant=[16,0];
~triTone.fadeTime=4;
~triTone={
    var f = [60,[67,63,60].scramble,72].midicps * 4 / Duty.kr(128/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) + SinOsc.ar(~tempo*8,mul:1/4);
    var mod = Duty.kr(16*[1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/4) + SinOsc.ar(~tempo*32/[1,2,3],mul:LFSaw.ar(~tempo*1,mul:1/32)**1.5);
    var ph = [SinOsc.ar(~tempo/f/[4,3,12]),SinOsc.ar(f/[1,2.001,4.00037]/mod),SinOsc.ar(~tempo/f/[6,7,8])];
  var sig = SinOsc.ar(f,ph[0],mul:LFTri.kr(~tempo/4/2)) * SinOsc.ar(f*mod,ph[1],mul:LFTri.kr(~tempo/4/4)/2) + SinOsc.ar(f/mod,ph[2],mul:LFTri.kr(~tempo/128)/4);
  sig = sig * LFTri.ar(~tempo/4/[1,2,3]);
  sig = CombN.ar(sig,~tempo/2,~tempo/4,~tempo).distort + sig;
  sig = LeakDC.ar(sig/2);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = sig * Pulse.ar(~tempo*8);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.05);
};
~triTone.play;
);
~triTone.stop(4);
~triTone.clear;
~triTone.pause;
~triTone.resume;



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
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,(1..8).nthPrime,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.25],[3,-3]*LFNoise1.kr(~tempo/4).range(0.5,4)),imp * hit)};
  var sig = SinOsc.ar(30.midicps+(env**40*30.midicps)+(BrownNoise.ar(env**200)*1000),env**40*2pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,1,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,1,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,1,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,(1..7).nthPrime,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(env!2);
  sig = HPF.ar(sig,LFNoise1.kr(~tempo/4!4).range(500,15000));
  sig = sig * env;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.15,0.05,SinOsc.ar(~tempo*7.4999));
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


(
  ~master.quant=16;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  wet = LFTri.ar(~tempo/4/[1,2,3,4]);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

(
  s.latency=0.499;
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
