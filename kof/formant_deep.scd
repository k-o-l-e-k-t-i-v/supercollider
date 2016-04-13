


(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


Tdef(\driver).quant=2;
Tdef(\driver,{loop{~one.rebuild;8.wait;}}).play;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=7.2;
~one={
  var freq = {[432,432/4,432.1/2,432.01/8].choose/[1,1.25,4/3,2,4,8].choose/[1,1.25,1.3333,2].choose**[1,4/3,1.25].choose}!3;
  var sig = Formant.ar(freq,freq*2+SinOsc.kr(1/4,mul:80),freq/4,mul:1/(1..3));
  sig = sig * LFTri.ar(~tempo.kr/[1,2,3,4]).exprange(0.001,1);
  sig = Vibrato.ar(sig,[4,5,6,7],0.2);
  sig = DWGReverb.ar(sig,4000,mix:0.25);
  sig = sig + LPF.ar(sig,800);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
