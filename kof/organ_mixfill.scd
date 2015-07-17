

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



(
  var tt = Tdef(\tt,{

    // organs synth ///////////////////////////////////////

    loop{
      (
        ~organs.quant=2;
        ~organs.fadeTime=3.11;
        ~organs={
          var note = ({[48,60,36].choose - ([0,1,2,3]*7).choose}!3 ).midicps * ({[16,8].choose }!3) / ({[1.5,2,4,1,1.5,1.25].choose}!3 * pi);
          var sig = Mix.fill(300,{|i|LFSaw.ar(note+(i/2000.0)+[0.01,0.02],mul:0.05)});
          (note).postln;
          sig = RLPF.ar(sig,43.2+Line.kr(1,8000,8)) * Pulse.ar(4/fib(8));
          sig = Normalizer.ar(sig)/2;
          //sig = BPF.ar(sig,16000/(1..12),1.2,mul:LFDNoise1.kr(1!12).exprange(0.01,0.8));
          sig = GVerb.ar(sig,40,6,0.01,0.21,45);
          sig = CompanderD.ar(sig,1/2,1/2,1/2);
          Splay.ar(sig.flat,0.5,0.5);
        };
        ~organs.play;
      );
      /////////////////////
      (
        ~organs2.quant=2.5;
        ~organs2.fadeTime=1.11;
        ~organs2={
          var note = ({[48,60,36].choose - ([0,1,2,3]*7).choose}!3 ).midicps * ({[16,8].choose }!3) / ({[1.5,2,4,1,1.5,1.25].choose}!3 * pi);
          var sig = Mix.fill(100,{|i|VarSaw.ar(note+(i/2000.0)+[0.01,0.02],mul:0.05)});
          (note).postln;
          sig = RLPF.ar(sig,43.2+Line.kr(1,18000,4)) * Pulse.ar(1/fib(8));
          sig = Normalizer.ar(sig)/2;
          //sig = BPF.ar(sig,16000/(1..12),1.2,mul:LFDNoise1.kr(1!12).exprange(0.01,0.8));
          sig = GVerb.ar(sig,80,6,0.01,0.21,55);
          sig = CompanderD.ar(sig,1/2,1/2,1/2);
          Splay.ar(sig.flat,0.5,0.5);
        };
        ~organs2.play;
      );
      /////////////////////

      16.wait;
    };
  };);

  tt.play;
)

~organs.clear;
