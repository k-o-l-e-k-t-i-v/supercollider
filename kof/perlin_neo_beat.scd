
s.boot();
p.push();

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


p.bpm(90);

// neo_beat synth ///////////////////////////////////////

(
~neo_beat.ar(2);
~neo_beat.clock = p.clock;
~neo_beat.quant=16;
~neo_beat.fadeTime=0.04;
~neo_beat={
var frac = 1/32;

var sp = 1/32;
  var pat1 = LFSaw.ar([1,1/1,1/2560/1/[1,2,3,4]]*~tempo/sp) + LFSaw.kr(1/20001*~tempo);
  var pat2 = LFSaw.ar([1,1/2,1/2560/1/[1,2,3,4]]*~tempo/sp) + LFSaw.kr(1/20002*~tempo);
  var pat3 = LFSaw.ar([1,1/4,1/2560/1/[1,2,3,4]]*~tempo/sp) + LFSaw.kr(1/20003*~tempo);
  
  var sig1 = Perlin3.ar(pat1[0],pat1[1],pat1[2]).round(frac);
  var sig2 = Perlin3.ar(pat2[0],pat2[1],pat2[2]).round(frac);
  var sig3 = Perlin3.ar(pat3[0],pat3[1],pat3[2]).round(frac);
  
  var sig;
  var mod3 = Duty.kr(256/~tempo/[1,2,3,4],0,Dseq([1,2,1/4,1/2],inf));
  var mod2 = Duty.kr(128/~tempo/[1,2,3,4],0,Dseq([1,2,1.5,1.33333],inf)) * mod3;
  var mod = Duty.kr(64/~tempo/[1,2,3,4],0,Dseq([1,2,1.5,1.33333],inf)) * mod2;
  
  var cad = 8 / [1,2,3,4];
  var note = Duty.kr(1/8/~tempo,0,Dseq([60,72,60,48,60,55,60,84],inf)).midicps * 8;

  sig1 = SinOsc.ar(50+Pulse.ar(sig1*~tempo*cad),Pulse.ar(sig1*~tempo*cad)) * sig1;
  sig2 = SinOsc.ar(note/mod,Pulse.ar(sig2*~tempo*cad),mul:0.15) * sig2;
  sig3 = RLPF.ar(WhiteNoise.ar(sig3),sig3.range(150,15000),0.2) * sig3;
 
  sig = CompanderD.ar(sig1+sig2+sig3,3/4,1/2,1);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  //sig = sig * Pulse.ar(~tempo*4/[1,2,3,4]);

  Splay.ar(sig,0.5,0.5);
};
~neo_beat.play;
);
~neo_beat.stop(4);
~neo_beat.clear;
~neo_beat.pause;
~neo_beat.resume;


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
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+(env**50*500),env**80*8pi);
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
