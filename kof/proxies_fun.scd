///////////////////////////////////////////////////////////////////// 1

p = ProxySpace.push(s);

///////////////////////////////////////////////////////////////////// 2
(
  ~mod = {Duty.kr(1/8,0,Dseq([1,2,1,4,1,0.5,1,0.25],inf))};
  ~mod.quant = 2;

  ~m = {Duty.kr(4,0,Dseq([1,2,1.5,1.25,4,0.5],inf))};
  ~m.quant = 2;
);
///////////////////////////////////////////////////////////////////// 3

(
(
  ~a.quant = 2;
  ~a.fadeTime = 16.0;
  ~a = {
    var freqs = ([60,67,48,65]).midicps; 
    var sig = LFSaw.ar(freqs * ~mod * ~m * (1.000001**(1..8)));
    sig = sig * Decay.ar(Impulse.ar(4/fib(8)),0.75);
    sig = Resonz.ar(sig,freqs * ~m.ar.lag(1/8) * ~mod + LFSaw.ar(1*(1.0001**(1..8))).range(-8,8));
    sig = LPF.ar(sig,freqs * ~m * (~mod+1));

    Splay.ar(sig,0.6,0.95,0.5);
  }
);

(
  ~b.quant = 2.0;
  ~b.fadeTime = 2.0;
  ~b = {
    var sig = WhiteNoise.ar(1!2);
    sig = RHPF.ar(sig,LFSaw.ar(8/fib(12,1,3)).exprange(600,16000),0.2);
    sig = sig * Decay.ar(Impulse.ar(8/fib(12,1,3)),0.5);

    Splay.ar(sig,0.3,0.15);
  }
);

(
  ~c = {
    var sig = SinOsc.ar(66!2 + ( 250 * Decay.ar(Impulse.ar(2/[1,2]),0.145)));
    sig = Resonz.ar(sig+LFSaw.ar(66,mul:0.4),66.2+SinOsc.ar(1/4/fib(4)).range(-20,20) );
    sig = sig * Decay.ar(Impulse.ar(2/[1,2]),1.5);
    Splay.ar(sig,0.2,0.4);
  };
  ~c.quant = 2.0;
  ~c.fadeTime = 8.0;
);


(
  ~eff = {
    var sig = ~a + ~b + ~c;
    var sigL = LPF.ar(sig,150*SinOsc.ar(1/4.01).range(0.5,3));
    var sigM = BPF.ar(sig,450*SinOsc.ar(1/8.014).range(0.5,2),4);
    var sigH = HPF.ar(sig,1000*SinOsc.ar(1/16.013).range(0.5,10));

    sigL = CompanderD.ar(sigL,0.75,1,1/3,0.2,0.2,LFTri.ar(1/12.14).range(0.5,1.5));
    sigM = CompanderD.ar(sigM,0.75,1,1/2,0.02,0.02,LFTri.ar(1/13.14).range(0.5,1.5));
    sigH = CompanderD.ar(sigH,0.75,1,1/3,0.01,0.01,LFTri.ar(1/14.14).range(0.5,1.5));
 
    sig = sigL + sigM + sigH;

    sig = Limiter.ar(sig,0.95,0.02);
    sig = FreeVerb.ar(sig,0.133,2);

    Splay.ar(sig,0.2,1,SinOsc.ar(1/8).range(-0.2,0.2))
  };
);

///// run it
~eff.play;
)

