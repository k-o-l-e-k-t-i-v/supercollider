
s.reboot;

p.push();
p.bpm(90);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = Decay.ar(AudioIn.ar([1]) > 0.25,0.94) * Normalizer.ar(AudioIn.ar([2]));
  //sig = AllpassN.ar(sig,1,1/100,1);
  //sig = CombN.ar(sig,1/5,1/500,1);
  Splay.ar(sig,0.05,0.005);
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
  ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.5,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig;
    var mod = Duty.kr([1/16,8,16,32],0,Dseq([1,2,1.5,1.33333,1/1.5,1/1.3333333,1/2],inf)).lag(1/50);
    var f = 250/[1,2,1.5,1.3333333] + SinOsc.ar([5,6,7],mul:0.1) / mod;
    var t = SinOsc.ar([1/8,1,f]) + LFSaw.ar(1/6000,mul:10);
    var per = Perlin3.ar(t[0],t[1],t[2]);
   sig = SinOsc.ar(~tempo*[1,2,3,4],per*LFNoise2.kr(~tempo/16/[1,2,3,4]).range(0.5pi,8pi),mul:0.25) * LFTri.kr(~tempo/16/[1,2,3,4]);
   
   sig = Normalizer.ar(sig)/2;
   sig = CombC.ar(sig,8,128/f,8);
   sig = LPF.ar(sig,f*2);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// perlmachine synth ///////////////////////////////////////

(
~perlmachine.ar(2);
~perlmachine.clock = p.clock;
~perlmachine.quant=16;
~perlmachine.fadeTime=4;
~perlmachine={
    var mod = Duty.kr(Dseq([16,8,16,4,16,32]*.x[1,1/2,1/4,1/8,1/16],inf)/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var f = [220,110,440]/mod;
    var sig = SinOsc.ar([1/220,~tempo/4,~tempo]*f) + LFSaw.kr(~tempo/[160,250,5000],mul:4) * SinOsc.ar(f*1.5);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * Pulse.ar(~tempo*2/[1,2,3]);
  sig = AllpassC.ar(sig/4,1/4,[1.5,1.33333,4]/f,1/4*[1,2,4] * LFNoise2.kr(~tempo/32!3).range(0.15,4.75));
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = LPF.ar(sig,f*2);
  //sig = AllpassL.ar(sig,1,4/f,4);
  Splay.ar(sig,0.5,0.5);
};
~perlmachine.play;
);
~perlmachine.stop(4);
~perlmachine.clear;
~perlmachine.pause;
~perlmachine.resume;
