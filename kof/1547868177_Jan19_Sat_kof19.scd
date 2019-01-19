s.reboot;
49000.sqrt
2**16
p.push();
b = Buffer.alloc(s,1024,1);
(
  ~record.ar(3);
  ~record.clock = p.clock;
  ~record.quant=4;
  ~record.fadeTime=4;
  ~record={
    var sig = LFPulse.ar(500+SinOsc.ar(16.0,mul:50));
    RecordBuf.ar(sig,b,0,0.1);
  sig;
  };
);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  
 var sig = IFFT(b);
 sig = Normalizer.ar(sig);
  //sig = PitchShift.ar(sig,0.15,0.25);
 //sig = Normalizer.ar(sig);
 //sig = CombN.ar(sig,1/2,1/10,1); 
 Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
