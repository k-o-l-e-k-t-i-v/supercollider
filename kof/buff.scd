RecordBuf.help
i
(
{
  p.stop(30);
  ~master.play;
  30.wait;
  p.clean;
}.fork;  
)
(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
);

b = Buffer.alloc(s, 44100 * 8.0, 2);


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=0.1;
    ~one={
        var f = TChoose.kr(Impulse.kr(1/4!3),[60,65,64,71,67,36,52,53].midicps) * 2 + SinOsc.ar(1/[1,2,3,4],mul:2);
        var t = LFSaw.ar([1/4,1/500,f*[1,2,4,0.5]]) * 2 + LFSaw.ar(1/800,mul:4400);
        var sig = Perlin3.ar(t[0],t[1],t[2]) ;
        sig = sig * Pulse.ar(4/[1,3,2,4]);
        sig = sig + LocalIn.ar(2);
        
        sig = SelectX.ar(LFTri.ar(1/16/[1,2,3])**4*2,[LPF.ar(sig,f),DFM1.ar(sig,f,0.12), BPF.ar(sig,f,0.02)]) ;
        sig = DelayN.ar(sig,1/15000,1/15000);
       // sig = Normalizer.ar(sig);
        
        sig = NumChannels.ar(sig,2)/1.05;
        sig = Limiter.ar(sig);
        LocalOut.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        //RecordBuf.ar(sig,0,1,0.5,loop:1);
        //sig = PlayBuf.ar(2,0,1,loop:1);
        //sig = sig;

        Splay.ar(sig,0.95,0.5);
    };
    ~one.play;
   // ~one[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5500),[4000,4100])};
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0;
  ~master = {|wet=0.25,lp=2500,hp=150,len=30,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

PlayBuf.help
