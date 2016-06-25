


(
  p.clock.tempo_(133/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// swing synth ///////////////////////////////////////

(
~swing.ar(2);
~swing.quant=2;
~swing.fadeTime=1;
~swing={
  //var mod = Duty.kr(1/40,0,Dseq([1,2,1.5,1.33333],inf));
  var t = LFTri.ar([1/1500,1/1600,4]/4000) ** LFTri.ar(1/4000/(1..4),mul:4.9,add:0.1);
  var f = Perlin3.ar(t[0],t[1],t[2]).exprange(50.0*[1,2,1.5,1.33333],18500);
  var sig = LFSaw.ar(f/[4,1.3333,2,1.5],mul:0.14) * LFTri.ar(1/4/[1,2,3,4]).exprange(0.01,1);
  sig = Resonz.ar(sig,f/[1,2,1.33333,4],0.2);
  sig = CompanderD.ar(sig,5/4,1/2,1);
  Splay.ar(sig,0.5,0.65);
};
~swing.play;
);
~swing.stop(4);
~swing.clear;
~swing.pause;
~swing.resume;
