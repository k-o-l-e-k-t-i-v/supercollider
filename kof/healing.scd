


p.push();
p.bpm(90);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var c = ~tempo*2;
  var d = Duty.kr(32*[1,2,3,4]/~tempo,0,Dseq(([48,36,60,72] +.x [0,3,5,7,12]).scramble,inf)).midicps + LFSaw.ar(~tempo/4/[1,2,3,4]).lag(1.5);
  var tone = ([12].midicps / [1,2,2,3] + d)/2;
  var a = SinOsc.ar([1.5/(1..7),1.5/[128,64,32]/400,1/[32,64,128]/400]);
  var t = Perlin3.ar(a[0],a[1],a[2]) / tone / LFNoise2.kr(1/16/32/[1,2,3,4]).range(10,1000);
  var sig = SinOsc.ar(tone/10000,SinOsc.ar(SinOsc.ar(t*(1..7)/7).range(tone/8pi,tone) ) * 8pi ) * Pulse.ar(c/[1,3,7,9]).softclip;
  sig = sig * SinOsc.kr(1.5/7/(1..7)).exprange(0.0001,1);
  sig = CombN.ar(sig,~tempo/[1,2,4,8]/d,~tempo/[1,2,4,8]/d,[1,2,3,4]);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1).softclip;
  sig = LPF.ar(sig,2000);
  Splay.ar(sig,0.25,0.3335);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.clock = p.clock;
~one2.quant=8;
~one2.fadeTime=4;
~one2={
  var tone = [38,65].midicps;
  var a = SinOsc.ar([1.5/(1..7),1.5/[128,64,32]/400,1/[32,64,128]/400]);
  var t = Perlin3.ar(a[0],a[1],a[2]) / tone / 10;
  var sig = SinOsc.ar(tone/10000,SinOsc.ar(SinOsc.ar(t*(1..7)/7).range(tone/8pi,tone) ) * 8pi );// * Pulse.ar(1.5*[1,3,7,9]);
  sig = sig * SinOsc.kr(1.5/7/(1..7)).exprange(0.0001,1);
  Splay.ar(sig,0.5,0.25);
};
~one2.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;




s.latency = 0.5;
