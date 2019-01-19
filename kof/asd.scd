
s.reboot;
p=ProxySpace.push(s);
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
~one.fadeTime=16;
~one={
	var mod = Duty.kr([8,16,32],0,Dseq([1,1.5,2,1.33334],inf));
	var f = 75/(1.0,1.001..1.01)/mod;
  var sig = [];
  var x = LFTri.ar(1/16) ** 2;
  var y = LFSaw.ar(1/32);
  8.do{|i|
    sig = sig ++ VOsc.ar(x.range(i*8,i*8+8)+SinOsc.kr(1/320),f);
  };
  sig = SelectX.ar(y.range(0,7),sig);
	sig = BPF.ar(sig,250*[1,2,4],0.2/[1,2,4]);
	sig = GVerb.ar(sig,50)/2+sig;
  Splay.ar(sig,0.5,0.525);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


s.scope