


p.push();

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=5000,hp=150,len=30,rev = 3|
    var sig = In.ar([0,1]);
    var orig = sig;
    var fx;
    //fx = Limiter.ar(sig,0.95);
    sig = CompanderD.ar(sig,3/4,1/1.6,1);
    fx = LPF.ar(sig,lp);
    fx = HPF.ar(fx,hp);
    fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
    sig = SelectX.ar(wet,[orig,fx]);
    sig = NumChannels.ar(sig,2);
    ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// perl synth ///////////////////////////////////////

(
  ~perl.ar(2);
  ~perl.clock = p.clock;
  ~perl.quant=2;
  ~perl.fadeTime=4;
  ~perl={
    var notes = [60,72,36].midicps * 4;
    var pat= [
      [1,2,1]/(1..16),
      [1/4,1/2,1]/(1..16),
      [1/3,1/1.5,1]/(1..16),
    ];
    var off = LFSaw.kr([6,3,1/60]/(1..16));
    var t1 = SinOsc.ar(pat[0]).range(1+off,2+off);
    var freq = Perlin3.ar(t1[0],t1[1],t1[2]) * notes + notes * (1+(1..16).reciprocal);

    var t2 = SinOsc.ar(pat[1]).range(1+off,2+off);
    var phase = Perlin3.ar(t2[0],t2[1],t2[2]) * (1..16)/2*pi;

    var t3 = SinOsc.ar(pat[2]).range(1+off,2+off);
    var amp =  Perlin3.ar(t3[0],t3[1],t3[2]) / (1..16);


    var sig = SinOsc.ar(freq,phase,mul:amp);
    Splay.ar(sig,0.5,0.25);
  };
  ~perl.play;
);
~perl.stop(4);
~perl.clear;
~perl.pause;
~perl.resume;
