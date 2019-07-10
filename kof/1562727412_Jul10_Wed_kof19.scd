

p.push();
p.bpm(90)
s.latency=1;

Tdef(\reb,{loop{~one.rebuild; (15).wait;}}).play;
Tdef(\reb2,{loop{~two.rebuild; (15).wait;}}).play;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=7;
~one={

  var f = ([48,[60.1,60]+12,48]).midicps * {[1/2,1,2,1.5,1.333334].choose}!3 / [1/2,1/4,1/1.333334,15/8,1,2,1.5,4,8].choose + SinOsc.kr([5,6,7],mul:pi) + SinOsc.kr(~tempo/[2,3,4]*1.01,mul:1.5);
  var sig = ([]++LFSaw.ar([f.choose,f.choose*0.99]) ++ LFTri.ar([~tempo/64,~tempo/32])) + 1 + LFTri.kr([~tempo/640/(1..f.size),0,0],mul:4) + SinOsc.kr(f*2,mul:0.1);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LFTri.ar(~tempo/16/(1..(sig.size)));
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,f);

  Splay.ar(sig,0.15,0.35,SinOsc.kr(~tempo/[1,1.01]*4));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// one synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=0;
~two.fadeTime=7;
~two={

  var f = ([48,[60.1,61]-12,48]).midicps * {[1/2,1,2,1.5,1.333334].choose}!3 / [1/2,1/4,1/1.333334,15/8,1,2,1.5,4,8].choose + SinOsc.kr([5,6,7]+0.01,mul:pi) + SinOsc.kr(~tempo/[2,3,4]+0.0013,mul:1.5);
  var sig = ([]++LFSaw.ar([f.choose,f.choose*0.99]) ++ LFTri.ar([~tempo/64,~tempo/32])) + 1 + LFTri.kr([~tempo/640/(1..f.size),0,0],mul:4) + SinOsc.kr(f*4,mul:0.1);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LFTri.ar(~tempo/16/(1..(sig.size)));
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,f*2);

  Splay.ar(sig,0.15,0.35,SinOsc.kr(~tempo/[1,1.01]/4.01));
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


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
  //fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
