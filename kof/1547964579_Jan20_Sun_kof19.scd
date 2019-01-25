

s.boot;
p.push();
a = Buffer.alloc(s,2048,1);
b = Buffer.alloc(s,2048,1);

// fftmash synth ///////////////////////////////////////

(
~fftmash.ar(2);
~fftmash.clock = p.clock;
~fftmash.quant=4;
~fftmash.fadeTime=4;
~fftmash={
    var sig;
    var pre1 = LFTri.ar(500);
    var pre2 = SinOsc.ar(50);
    var chain = PV_Mul( FFT(a,Mix(pre1)) , FFT(b,Mix(pre2)) );

  sig = Normalizer.ar(IFFT(chain));
  //sig  = LPF.ar(sig,1500);
  Splay.ar(sig,0.5,0.25);
};
~fftmash.play;
);
~fftmash.stop(4);
~fftmash.clear;
~fftmash.pause;
~fftmash.resume;
