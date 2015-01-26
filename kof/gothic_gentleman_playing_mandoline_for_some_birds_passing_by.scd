s.reboot;

(
  (
    Ndef(\mm).quant= 2.0;
    Ndef(\mm,{Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,1.5,1,1.25,1,2,3,1.5,4,1,1,1])});

    Ndef(\fil).quant= 2.0;
    Ndef(\fil,{Select.kr(Stepper.kr(Impulse.kr(1/2)),1200*[1,1.5,1,1.25,1,2,3,1.5,4,1,1,1]).lag(1)});

    Ndef(\lfo).quant= 2.0;
    Ndef(\lfo,{Splay.kr(SinOsc.kr(1/64/fib(12))).exprange(0.001,1)});
  );

  SynthDef(\fading,{|freq=432,dur=1,mod =1,amp = 0.5|
                    var sig,sig1,sig2,env1,env2;
                    mod = Ndef(\mm).kr;
                    env1 = EnvGen.ar(Env([0,1,0],[0.002,dur/2*Ndef(\lfo).kr],[3,-3]));
                    env2 = EnvGen.ar(Env([0,1,0],[dur/2*Ndef(\lfo).kr,dur],[3,-3]),doneAction:2);
                    sig1 = Blip.ar(freq * mod * (1.0001**(1..12)),(2+(amp*10)).round(1),mul:2/(1..12));
                    sig2 = LFSaw.ar(freq * mod / 1.5pi * (1.01**(1..12)),mul:1/(1..12));
                    sig = (sig1 * env1) + (sig2 * env2);
                    sig = RLPF.ar(sig,Ndef(\fil).kr);
                    sig = CompanderD.ar(sig,0.4,1,0.25);


                    Out.ar(0,Splay.ar(sig,0.5,amp));
                   }).add;
  (
    Pdef(\melod,{
      Ppar([
        Pbind(\instrument,\fading,\dur,Pseq([Pn(1,6),Pn(1/16,64)],inf),\freq,Pseq(([60,60,72,59]+36).midicps,inf),\amp,0.6),
        Pbind(\instrument,\fading,\dur,Pseq([Pn(1/8,6),Pn(1/4,2)],inf),\freq,Pseq(([60,60,72,59]).midicps,inf),\amp,Pwhite(0.3,0.4,inf)),
        Pbind(\instrument,\fading,\dur,Pseq([Pn(2,6),Pn(1/16,32)],inf),\freq,Pseq(([60,60,72,59]+24).midicps,inf),\amp,0.2),
        Pbind(\instrument,\fading,\dur,Pseq([Pn(8,6),Pn(1/16,32)],inf),\freq,Pseq(([60,60,72,59]-12).midicps,inf),\amp,0.1),
        Pbind(\instrument,\fading,\dur,Pseq([Pn(16,6),Pn(1/16,32)],inf),\freq,Pseq(([60,60,72,59]-36).midicps,inf),\amp,0.4)
      ])
    }).play(quant:2);
  );

  (
    Ndef(\dark_kick).quant = 16.0;
    Ndef(\dark_kick).fadeTime = 0.02;

    Ndef(\dark_kick,{Splay.ar(
      FreeVerb.ar(
        Delay2.ar(
          CombN.ar(
            SinOsc.ar(LFSaw.ar([4.4,5.5]).range(44,99)) * LFPulse.ar(4/[1,2,4,8]);
            ,0.02,0.133,0.5)
        )
        ,0.33,2,0.75)
    )}).play;
  );

  (
    Ndef(\highfreq).fadeTime = 8.0;
    Ndef(\highfreq).quant = 16.0;
    Ndef(\highfreq,{
      Splay.ar(
        AllpassN.ar(
          HPF.ar(
            SinOsc.ar(Decay.ar(Impulse.ar(44/fib(8)),0.0015+SinOsc.ar(1/4/(1.0001**(1..8)))).range(5,11000),mul:0.12) * Decay.ar(Impulse.ar(16/fib(8)),0.5)
            ,3000)
          ,0.025,4,8)
        ,0.5,1)}).play;
    Ndef(\highfreq).mold(2);
  );

)
