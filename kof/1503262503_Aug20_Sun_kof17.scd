

p.push();
p.bpm(135);

~tempo.quant = 16;
~tempo.mold(1);
~tempo = {LFNoise0.kr(1/15).range(1.4,1.6) + LFNoise0.kr(1/4).range(-0.01,0.01) };



// threecomplex synth ///////////////////////////////////////

(
~threecomplex.ar(2);
~threecomplex.clock = p.clock;
~threecomplex.quant=16;
~threecomplex.fadeTime=0.1;
~threecomplex={
    var base = 93.75 *.x Duty.kr(16/~tempo*[1,2,4],0,Dseq([1,2,4,0.5],inf)).lag(1/40);
    var detune = LFSaw.kr(~tempo/4/[1,2,3])**4*2;
    var f = base + ([0.01,1.001,2.0246] / 8 * detune) / (2..4).log;
    var mod = 1/[2,1,3] * Duty.kr(1*((1..8)**2),0,Dseq([
        1,2,1.5,1.333331,2,1.5,1.333333*1.125,
        1,2,1.5,1.333331,2,1.3333333,1.333333*1.666666,
        1,2,1.333335,1.333331/2,2,1,1.333333*1.666666,
        1,2,1.5,1.333331/4,2,1/1.33333,1.333333*1.666666,
    ],inf));
    var shift1 = LFTri.ar(1/4*LFNoise1.kr(1/600!8).exprange(0.000001,40.01)) * SinOsc.ar(1/4);
    var shift2 = LFTri.ar(1/8*LFNoise1.kr(1/600!8).exprange(0.00001,40.01)) * SinOsc.ar(1/4.01);

  var t = SinOsc.ar(f*mod+LFNoise0.kr(f/4!8,mul:1),add:1.0,mul:detune);
  var sig = Perlin3.ar(t,DC.ar(1)+shift1,DC.ar(1)+shift2) * (Pulse.ar(~tempo/[1,2,3,4,5,6,7,8])+BPF.ar(BrownNoise.ar(0.01!8),f/16)*LFNoise1.kr(1/32!3)**LFNoise2.kr(~tempo/32!3).range(0.1,0.9)).softclip; 
  sig = CombL.ar(sig,4.0001/f.lag(1/100),2.01/f.lag(1/4),LFNoise2.kr(~tempo/16).range(0.1,2));
  sig = LPF.ar(sig,15000);
  sig = LPF.ar(sig,5000);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1);//LFNoise1.kr(1/4).range(1/32,1));
  Splay.ar(sig,0.75,0.15);
};
~threecomplex.play;
);
~threecomplex.stop(4);
~threecomplex.clear;
~threecomplex.pause;
~threecomplex.resume;


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
