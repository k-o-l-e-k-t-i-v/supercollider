



// ss synth ///////////////////////////////////////

(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=2.2;
    ~ss={
        var mod = Duty.kr((8..1),0,Dseq([1,2,1.5,1.25,2,4],inf)).lag(1/40);
        var sig = CombN.ar(Mix.ar(LFNoise2.ar(1510*(1..8))),1/15*mod,1/150/mod,2)*Pulse.ar(4/fib(8));
        sig = Resonz.ar(sig,1500/(1+(1..8).reciprocal*4)/mod,LFNoise2.kr(8!8).exprange(0.01,1.25));
        Splay.ar(sig,0.5,0.025,SinOsc.kr(1/[3,4])*pi);
    };
    ~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;


// puls synth ///////////////////////////////////////

(
~puls.ar(2);
~puls.quant=2;
~puls.fadeTime=4;
~puls={
  var sig = Pulse.ar(4/fib(8))*SinOsc.ar(50*(1+(1..8).reciprocal));
  Splay.ar(sig,0.5,0.25);
};
~puls.play;
);
~puls.stop(4);
~puls.clear;
~puls.pause;
~puls.resume;
