



p.push();
b.free;

b = Buffer.allocConsecutive(8*8,s,512,1);
(
    ~consec.ar(3);
    ~consec.clock = p.clock;
    ~consec.quant=4;
    ~consec.fadeTime=4;
    ~consec={
        var f = 50;
        var sig = LFNoise1.ar(48000/16!64);
        64.do{|i|
            sig[i] = sig[i] ** (1/(i+2).log2);
            RecordBuf.ar(Mix(sig[i]),b[i],loop:0);
        };
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
    var f = 50/(1.0,1.01..1.1);
  var sig = [];
  var x = LFSaw.ar(1/4);
  var y = LFSaw.ar(3);
  8.do{|i|
    sig = sig ++ VOsc.ar(x.range(i*8,i*8+8)+SinOsc.kr(1/5),f);
  };
  sig = SelectX.ar(y.range(0,7),sig);
  sig = BPF.ar(sig,500,0.52);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
