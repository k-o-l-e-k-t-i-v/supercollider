



p.push();

p.bpm(120);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = LocalIn.ar(2);
  var base = Duty.kr(16/~tempo*[1,2,4],0,Dseq([60,65,60,67,60,69,60,72,48].midicps * 2 /.x [1,2,1/2,1.5],inf));
  var f = base / [1,2,1/1.5] + SinOsc.kr((1..4)/16,mul:0.5);
  var q = 0.02;
  sig = Clip.ar(sig,-0.99,0.99) * 0.9995;
  sig = sig + DelayN.ar(sig,1/f,1/f);
  sig = sig + LPF.ar(Pulse.ar(~tempo*2/[1,2,3]) * BrownNoise.ar(0.75!4), f * 4 );
  sig = MoogFF.ar(sig,f*2,LFNoise1.kr(~tempo/32!3).range(1.1,3.5)) + sig;
  sig = LPF.ar(sig,f) + sig;
  sig = AllpassN.ar(sig,1/f,1/f,1/4);
  sig = CompanderD.ar(sig,3/4,1/LFSaw.kr(~tempo/[1,2,3]*4).exprange(0.0001,4),1);
  sig = HPF.ar(sig,50);
  LocalOut.ar(NumChannels.ar(sig,2)/8);
  sig = CombN.ar(sig,1/f,1/f,2) / 4 + sig / 2 * SinOsc.ar(f/2,Pulse.ar(~tempo*2/[1,2,3]));
  Splay.ar(sig,0.75,0.25);
};
~one.play;
//~one[8] = \filter -> {|sig| LFSaw.ar(~tempo*4/[1,1.5])**2*sig};
~one[10] = \filter -> {|sig| DWGReverbC1C3.ar(NumChannels.ar(sig,2),[6000,6001],1/[10,11])/[5,6]+sig};
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


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
