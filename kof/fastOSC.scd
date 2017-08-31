
p.push();

(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);

(
  n = NetAddr("127.0.0.1", 12000);  //for sending to processing
  OSCFunc({|msg|
    //msg.postln;  //debug
    n.sendMsg(*msg);
  }, '/trig');
)
().play



// one synth ///////////////////////////////////////

(
  ~one.ar(2);
  ~one.quant=8;
  ~one.fadeTime=0.1;
  ~one={
    var speed = 48000/60;
    var mod = LFTri.ar(1/30/[1,1.1,1.001],mul:8) ** 1.4;
    var mel = Duty.kr([4,16,32],0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar([1/600,1/16,[60,48,67].midicps/2/mel]).range(mod/2,mod*2);
    
    sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LFTri.kr(1/[4,16,32]) ;
    SendReply.ar(Impulse.ar(speed),'/trig',sig*255);

    sig = Limiter.ar(sig,0.9).softclip;
    
    Splay.ar(sig,0.65,0.75);
  };
  ~one.play;
);
~one.stop(10);
~one.clear;
~one.pause;
~one.resume;



(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
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
