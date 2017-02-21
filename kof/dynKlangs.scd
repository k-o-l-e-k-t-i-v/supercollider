


p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var notes = [60,62,67].midicps;
  var amps = LFSaw.kr(1/~tempo/[1,2,4]);
  var phases = LFSaw.ar(1/4/~tempo/[2,3,4])*pi;
  var sig = DynKlang.ar(`[notes,amps,phases]);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


Klang.help
