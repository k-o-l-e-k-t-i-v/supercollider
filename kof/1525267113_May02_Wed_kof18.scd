p.push();
p.bpm(120);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
    var f = 50!2+(LFTri.kr(~tempo/120)**2*50);
  var sig = SinOsc.ar(f,Pulse.ar(~tempo));
  sig = sig * Pulse.ar(~tempo);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.clock = p.clock;
~saw.quant=[4,3];
~saw.fadeTime=4;
~saw={
    var mel = Duty.kr(4*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(0.1);
    var f = 1000 + (LFTri.kr(~tempo/120/[1,2,3,4])**1.125*2) / mel;
    var interval = ~tempo/[1,2,3,4];
  var sig = SinOsc.ar(f,Pulse.ar(interval)) ** (LFNoise2.kr(interval/16)+1) * LFTri.ar(interval);
  //sig = CombN.ar(sig,1,1,~tempo/2);
  Splay.ar(sig,0.5,0.15);
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;

(
  s.latency=0.25;
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

~saw.resume;
