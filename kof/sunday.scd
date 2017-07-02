


p.push();
p.bpm(89.9);


(
SynthDef(\one,{|a=0.01,freq=50,r=1,amp=0.2,slope=2|
    var env = EnvGen.kr(Env.perc(a, r, amp), doneAction: Done.freeSelf);
    var sig = VarSaw.ar(freq,0,env**slope*8pi);
    sig = sig * env;
    Out.ar(0,Splay.ar(sig));
}).add;
)

(
Pbind(
  \instrument, \one,
  \freq, Pseq([60,65,67,69].midicps,inf) / Pseq([1,1,1,1/2,1/4],inf) / 1.5,
  \dur, 0.666666 * Pseq([1,1,1/2,2,4,8],inf),
  \slope, Pwhite(0.02,80,inf),
  \amp, Pwhite(0.01,0.2,inf),
  \a, Pwhite(0.0001,0.2,inf),
  \r, Pwhite(0.1,8,inf),
).play();
)



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
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);


