

(
  ~a.quant=4;
  ~a.fadeTime=2;
~a={
  var mod = Perlin3.ar(LFSaw.ar(1/4)).range(0.01,0.25);
  var freq = Perlin3.ar(LFSaw.ar(1/[1,1,2,3]),LFSaw.ar(1/16),LFSaw.ar(50)+(LFSaw.ar(1/50)*50)).range(50,15000).round(250);
  var sig = Formant.ar(freq,freq/4,freq*4);
  sig = BBandPass.ar(sig,[50,100,10000]++((1..6)*100),mod) * ToggleFF.ar(CoinGate.ar(0.25,Impulse.ar(16!8))).lag(1/10);
  sig = Limiter.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = NumChannels.ar(sig,2);
  Pan2.ar(sig,SinOsc.kr(1/3));
};
~a.play;
)

CoinGate.help
