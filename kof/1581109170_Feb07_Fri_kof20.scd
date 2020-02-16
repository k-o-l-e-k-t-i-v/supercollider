

p.push();



p.bpm(88.3)
z = Buffer.alloc(s,48000,4)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.4;
~one={
  var sig = LFSaw.ar(47.5+(0.01..0.1)+SinOsc.kr(~tempo/32/[3,4,5,6]));
  var vol = (LFTri.ar(~tempo/[1,2,3,4])**LFNoise2.kr(~tempo/360!4).exprange(0.1,8));
  var pre = sig;
  sig = LPF.ar(pre,160+LFNoise2.kr(~tempo/600!4).exprange(0.001,19000)) + BPF.ar(pre,7600/[1,2,4,8]+SinOsc.kr(~tempo/600/[1,2,3,4]).range(0,15000),0.2);
  sig =  sig * vol + LPF.ar(pre * Pulse.ar(~tempo*4/[4,3,2,1]) / 9.0, 15090/[1,2,4,8]);
  //sig = BPF.ar(sig,22000/4*(1..4),0.7) * ToggleFF.ar(Impulse.ar(~tempo/(1..4))).lag(0.1);
  sig = CompanderD.ar(sig,3/4,1/3,1);
  sig = Splay.ar(sig,SinOsc.kr(~tempo/16).range(0.021,0.95),0.25);
  sig = BufDelayL.ar(z.bufnum,sig,Perlin3.kr(LFSaw.kr(~tempo/2/[4,3,2,1]),LFNoise1.kr(~tempo/16!4),LFNoise1.kr(~tempo/16!4))/40);
  Splay.ar(sig,1,1);
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
  ~master = {|wet=0.25,lp=8500,hp=250,len=20,rev = 8|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  //sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
