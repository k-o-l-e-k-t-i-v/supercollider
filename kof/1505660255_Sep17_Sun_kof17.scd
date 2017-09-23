




p.push();


p.bpm(48);


// sonoo synth ///////////////////////////////////////

(
~sonoo.ar(2);
~sonoo.clock = p.clock;
~sonoo.quant=2;
~sonoo.fadeTime=4;
~sonoo={
    var cad = (2..13).log*~tempo/16;
    var base = 48 *.x [1,1.5,1.33333,2,4,16] / TChoose.kr(Impulse.kr(cad/32),[1,2,1/2,1.5,1.3333]);
    var t = LFSaw.ar(cad+((1..12)/10000)/32).range(0,2pi) + SinOsc.ar(base,SinOsc.ar(1/(1..12))*2pi,mul:1/4);
    var x = t.cos+1;
    var y = t.sin+1;
  var sig = SinOsc.ar(2**([102,306,600,804,1008].scramble/1200) * base)+1 * (LFTri.ar(cad)).range(0,2);
  sig = Perlin3.ar(sig,x,y) * LFTri.ar(cad);
  sig = LeakDC.ar(sig) * Pulse.ar(cad/2);
  sig = CombN.ar(sig,8/base,1/base,2);
  //sig = CombL.ar(sig/2,4/base,1/base,1/4);
  sig = LPF.ar(sig,8000);
  Splay.ar(sig,0.75,0.5,SinOsc.ar(7.5/4)/4);
};
~sonoo.play;
);
~sonoo.stop(4);
~sonoo.clear;
~sonoo.pause;
~sonoo.resume;

2.log

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
