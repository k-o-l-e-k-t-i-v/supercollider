

(
  p=ProxySpace.push(s.reboot);
);

// paranormal synth ///////////////////////////////////////


(
  d = Tdef(\a,{
    loop{
      (
        ~paranormal.quant=1;
        ~paranormal.fadeTime=5.02;
        ~paranormal={
          var freq = 4320/4/([[8,16,32].choose,[2,4].choose,[4,2,8,1].choose,[1,2,4].choose]*[1,1.5,0.5,1.5,0.75].scramble*2pi)* (1.00001**(1..8)) + SinOsc.kr(1/16/(1..8)).range(-2,2);
          var phase = SinOsc.ar(freq*(1.0001**(1..8)));
          var sig = SinOsc.ar(freq,phase*2pi,mul:0.75);

          sig = sig ** (1.001**(1..8));
          sig = Resonz.ar(sig,freq * LFNoise2.kr(1/4!4).range(0.5,1.5),0.2)*2+sig;
          sig = CompanderD.ar(sig,3/4,1/2,1/4);
          Splay.ar(sig.flat.softclip,1,0.5);
        };
        ~paranormal.play;
      );
      4.sleep;
      (
        ~paranormal2.quant=1;
        ~paranormal2.fadeTime=5.02;
        ~paranormal2={
          var freq = 4320/([[8,16,32].choose,[2,4].choose,[4,2,8,1].choose,[2,1.5,1].choose]*[1,1.5,4,8,0.75].scramble*2pi)* (1.00001**(1..8)) + SinOsc.kr(1/15/(1..8)).range(-2,2);
          var phase = SinOsc.ar(freq*(1.00014**(1..8)));
          var sig = SinOsc.ar(freq,phase*2pi,mul:0.5);

          sig = sig ** (1.001**(1..8));
          sig = Resonz.ar(sig,freq * LFNoise2.kr(1/4!4).range(0.5,1.5),0.2)*2+sig;
          sig = CompanderD.ar(sig,3/4,1/2,1/4);
          Splay.ar(sig.flat.softclip,1,0.5);
        };
        ~paranormal2.play;
      );
      4.sleep;

    };
  });
  d.play;
)

~paranormal.stop(7);
~paranormal.clear;
