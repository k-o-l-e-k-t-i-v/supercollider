

p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
    var f = TChoose.kr(Impulse.kr(1/15/[1,2,3]),43.2*.x[1,2,4,8]/.x(2**([204,1108,408,600,102]/1200)));
  var pos = SinOsc.ar([1/150/[1,2,3]*LFSaw.ar(f/1000.01),1/150/[1,2,3]*LFSaw.ar(f/100.00023),1/150/[1,2,3]]).range(0,2pi);
  var sig = SinOsc.ar(f/.x[1,2,1.00012377213]).range(0,LFSaw.ar(1/15/[1,2,3]));
  var perl = Perlin3.ar(pos[0].cos,pos[1].sin,pos[2]+sig) * LFTri.kr(1/15/[1,2,3]);
  perl = Vibrato.ar(perl,[6,7,8],0.12);
  sig = LPF.ar(perl,4320*2);
  Splay.ar(sig,0.5,0.75);
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
  ~master = {|wet=0.15,lp=4320,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  wet = LFTri.ar(1/15/[1,2,3]**2);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  //sig = NumChannels.ar(sig,2);
  sig = CompanderD.ar(BPF.ar(sig,4320*3.0/8*(1..8),0.2),3/4,1/2,1);
  sig = [] ++ Mix(sig[0]++sig[2]++sig[4]++sig[6]) ++ Mix(sig[1]++sig[3]++sig[5]++sig[7]);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
