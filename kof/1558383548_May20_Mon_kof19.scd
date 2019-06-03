
s.reboot;
p.push();
p.bpm(120)
~tempo={LFNoise1.kr(1/4).range(0.5,2)}
(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
// litmus synth ///////////////////////////////////////

(
~litmus.ar(2);
~litmus.quant=4;
~litmus.fadeTime=4;
~litmus={
    var mod = Duty.kr(4/[1,2,3]/~tempo,0,Dseq([0,0,7,0,12,24,0,-7,-12],inf));
    var notes = Duty.kr(16/[1,2,3]/~tempo,0,Dseq([60,65,60,67,60,69]-mod,inf));
  var sig = [] ++ SinOsc.ar([notes].midicps*.x[1,2,1.5,1.33333,1,2,1.3333,1.5]);
  sig = sig.scramble;
  sig = SelectX.ar(SinOsc.ar(1/1.midicps).range(0,sig.size+1),sig);
  Splay.ar(sig,0.25,0.15);
};
~litmus.play;
);
~litmus.stop(4);
~litmus.clear;
~litmus.pause;
~litmus.resume;
