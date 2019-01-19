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
        var sig = LFNoise0.ar(48000/2!64);
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
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var mel = Duty.kr(4/~tempo,0,Dseq([7,4,7,1,7,11],inf));
        var mod = 1*(2..16).log2;//Duty.kr([8,16,32],0,Dseq([1,1.5,2,1.33334],inf));
        var f = [36,36+4,36+mel].midicps/(1.0,1.0001..1.002)/mod;
        var sig = [];
        var x = LFTri.ar(1/4);
        var y = LFTri.ar(1/120/mod);
        8.do{|i|
            sig = sig ++ VOsc.ar(x.range(i*8+0.01,i*8+8-0.01),f);
        };
        sig = SelectX.ar(y.range(0,7),sig);
        sig = LPF.ar(sig,15555/mod);
        //sig = BPF.ar(sig,250*[1,2,4],0.2/[1,2,4]);
        //sig = GVerb.ar(sig,50)/6+sig;
        sig = LeakDC.ar(sig.softclip);
        sig = CompanderD.ar(sig,1/2,1/2,1);
        Splay.ar(sig,0.25,0.225);
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
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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


