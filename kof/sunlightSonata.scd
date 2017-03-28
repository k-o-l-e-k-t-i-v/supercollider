
p.push();
s.latency = 0.2;
// message synth ///////////////////////////////////////

(
~message.ar(2);
~message.clock = p.clock;
~message.quant=2;
~message.fadeTime=0.2;
~message={

var mod = Duty.kr((4..7).nthPrime,0,Dseq([1,2,1.5,1.33333,2,4,8,16],inf));
  var carr = 96.midicps/mod;
  var t = SinOsc.ar(carr/(1..17).nthPrime) * LFTri.ar(1/2400/(7..24).nthPrime,mul:36.midicps);
  var a = Perlin3.ar(t[0],t[1],t[2]/[1,2,3]).range(0,1);
  var f = Perlin3.ar(t[3],t[4],t[5]/[1,2,3]).range(400,15000)/[4,8]/mod.lag(1/400);
  var p = Perlin3.ar(t[6],t[7],t[8]/[1,2,3]).range(-2pi,2pi);
  var pan = Perlin3.ar(t[9],t[10],t[11]/[1,2,3]).range(-1,1);
  var cad = Perlin3.ar(t[12],t[13],t[14]/[1,2,3]).range(1/4,4).round(1/4/[1,2,3,4]);
  var sig = SinOsc.ar(f,phase:p,mul:a) * Pulse.ar(cad/(1..17).nthPrime);
  var magic = Perlin3.ar(t[0],t,SinOsc.ar(f/[8.00001,4.001,0.501]))/8;
  //sig = sig * Pulse.ar(cad/(7..24).nthPrime);
 // sig = CombN.ar(sig,2/f.sqrt,2/f,4);
  sig = LeakDC.ar(sig);
  sig = HPF.ar(sig,5);
  sig = HPF.ar(sig,5);

  sig = LPF.ar(sig,20000);
  sig = LPF.ar(sig,20000);

  sig = CompanderD.ar(sig * SinOsc.ar(f/100-0.001),3/4,1/2,1) + SinOsc.ar(f*[1/2,1/4]-0.01,mul:0.2) * SinOsc.kr(f/1600/(1..17))+ LeakDC.ar(magic) ;
  sig = Compander.ar(sig/4 ,Pulse.ar(1/2),0.1,1,0.1,LFNoise1.kr(1/32!16).range(1/100,3/4),LFNoise1.kr(1/32!16).range(1/100,3/4)) + (SinOsc.ar([50,60],Pulse.ar(1/2)*0.25pi,mul:Pulse.ar(1/2),mul:0.12) * LFTri.kr(1/120));
  sig = Limiter.ar(sig,0.25) ;
  Splay.ar(sig,0.5,0.25,pan);
};
~message.play;
);
~message.stop(60);
~message.clear;
~message.pause;
~message.resume;


(
  ~master.quant=4;
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
