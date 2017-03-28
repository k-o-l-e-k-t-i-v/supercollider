
p.push();
// message synth ///////////////////////////////////////

(
~message.ar(2);
~message.clock = p.clock;
~message.quant=2;
~message.fadeTime=4;
~message={
  var mod = Duty.kr(16*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
  var t = LFTri.ar(16/(7..24).nthPrime,0,Pulse.ar(1/16/(7..24).nthPrime)) * LFTri.ar(1/64/(7..24).nthPrime,mul:12.midicps);
  var a = Perlin3.ar(t[0],t[1],t[2]/[1,2,3,4]).range(0,1);
  var f = Perlin3.ar(t[3],t[4],t[5]/[1,2,3,4]).range(5000,15000)/[1,2,4]/mod.lag(1/40);
  var p = Perlin3.ar(t[6],t[7],t[8]/[1,2,3,4]).range(-2pi,2pi);
  var pan = Perlin3.ar(t[9],t[10],t[11]/[1,2,3,4]).range(-1,1);
  var cad = Perlin3.ar(t[12],t[13],t[14]/[1,2,3,4]).range(1/4,16).round([1,2,3,4]);
  var sig = SinOsc.ar(f,phase:p,mul:a) * Pulse.ar(cad/(1..17).nthPrime);
  //sig = sig * Pulse.ar(cad/(7..24).nthPrime);
  sig = CombN.ar(sig,2/f.sqrt,2/f,4);
  sig = LeakDC.ar(sig);

  sig = CompanderD.ar(sig,3/4,1/2,1) + SinOsc.ar(50);
  sig = Limiter.ar(sig,0.5);
  sig = BPF.ar(sig,[60,36,24,72].midicps/2/mod,LFNoise2.kr(1/32/(1..17).nthPrime).range(0.002,1));
  Splay.ar(sig,0.5,0.5,pan);
};
~message.play;
);
~message.stop(4);
~message.clear;
~message.pause;
~message.resume;


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
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
