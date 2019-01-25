
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
        var sig = LFNoise0.ar(48000/16!64);
        64.do{|i|
            sig[i] = sig[i] ** (1/(i+2).log2);
            RecordBuf.ar(Mix(sig[i]),b.first.bufnum+i,loop:0);
        };
        sig;
    };
);


p.bpm(121.5/2);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=2;
~one={
    var base = ([36,36+7,36+11]+12).midicps;
	var mod = Duty.kr([8,16,32]/~tempo,0,Dseq([1,1.5,2,1.33334],inf)).lag(1/8);
	var f = base/(1.0,1.001..1.01)/mod.lag(~tempo/[1,2]) + SinOsc.kr(~tempo*4/[1,2,3],mul:0.2);
  var sig = [];
  var x = LFTri.ar(~tempo/16.1/[1,2,3]) ** 2;
  var y = LFTri.ar(~tempo/32/[1,2,3]);
  8.do{|i|
    sig = sig ++ VOsc.ar(x.range(i*8+0.01,i*8+8-0.01)+SinOsc.kr(~tempo/320/[1,2,3],mul:0.2),f);
  };
  sig = SelectX.ar(y.range(0.1,7.9),sig);
	sig = BPF.ar(sig,f*[1,2,4],0.2);
    sig = CompanderD.ar(Normalizer.ar(sig)/2,3/4,1/2,1);
//	sig = GVerb.ar(sig,50)/2+sig;
  Splay.ar(sig,0.5,0.1225);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

s.scope
