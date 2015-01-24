
s.reboot();
s.freeAll;

(
  Ndef(\d).play;
  Ndef(\d).fadeTime = 0.02;
  Ndef(\d).quant = 2.0;
  Ndef(\d).play;
)

(
  ~f = {|freq| Splay.ar(LPF.ar(SinOsc.ar(freq * MouseX.kr(0.5,4).round(1/8) * (1.001**(1..24)),mul:1.1/(1..24)),SinOsc.kr(1/(1..24)).range(44,8800)) ) };
  Ndef(\d)[0] = ~f;
)


(
  Ndef(\d)[1] = \set -> Pdef(\aa,
                             {Pbind(
                               \dur,Pseq([1/8],inf),
                               \freq,Prand([60,60-12,60-24,72].midicps,inf) +.x Pseq(#[0,1,2,7,11].midicps,inf)
                             )}
                            ).quant_(2);
  Pdef(\aa).play;
)

Ndef(\d)[2] = \filter -> {|in| AllpassC.ar(Pulse.ar(4)*in,MouseY.kr(0.002,0.2),MouseY.kr(0.002,0.2,1),8)};


// ^^ control with mouse
