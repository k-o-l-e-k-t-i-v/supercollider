



Sdef.help
p.push()
p.bpm(60);

(
  p.clock.sched(p.clock.timeToNextBeat(1 * 16),{ 
   4
  });
);

Sdef(\xyz).trig;
Sdef(\xyz, 1, {SinOsc.kr(10)});
Sdef(\xyz).plot(true);


{SinOsc.ar(500,mul:0.2) * Sdef(\xyz).kr}.play;


 (
 ~simple.ar(2);
 ~simple.clock = p.clock;
 ~simple.quant=2;
 ~simple.fadeTime=4;
 ~simple={
   var sig = SinOsc.ar(500!2) * Sdef(\x).kr;
   Splay.ar(sig,0.5,0.25);
 };
 ~simple.play;
 );
 ~simple.stop(4);
 ~simple.clear;
 ~simple.pause;
 ~simple.resume;
