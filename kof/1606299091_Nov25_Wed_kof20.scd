
((2..33).nthPrime%(1..32).nthPrime).log
60.midicps/((2..33).nthPrime%(1..32).nthPrime).log
// one synth ///////////////////////////////////////

~tempo={LeakDC.kr(LFNoise1.kr(15,mul:0.15))};

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar([36,29,22].midicps*(1000/(2..33).nthPrime.log.exp),(1..32).nthPrime/32.nthPrime*2pi,1/(2..33).log) * LFPulse.ar(1,(2..33).nthPrime.log.exp/(~tempo*100),0.05).lag(1/30);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=0;
~two.fadeTime=1;
~two={
    var sig = SinOsc.ar(2500*(LFSaw.kr([1,2,3,4],mul:8).log.exp)) * Pulse.ar(121.35/120/[3,4,1,1/4],mul:[1/2,1/2,1,1/4]);
  Splay.ar(sig,0.5,0.05);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
