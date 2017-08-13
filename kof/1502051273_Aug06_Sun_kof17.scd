

p.push();
p.bpm(90);

// pulsar synth ///////////////////////////////////////

(
~pulsar.ar(2);
~pulsar.clock = p.clock;
~pulsar.quant=4;
~pulsar.fadeTime=4;
~pulsar={
    var pul = Pulse.ar(~tempo/[1,1/1.5,4/3]);
  var sig = SinOsc.ar(43.2+(pul*pi),pul) * pul.softclip(-0.9,0.9);
  Splay.ar(sig,0.5,0.75);
};
~pulsar.play;
);
~pulsar.stop(4);
~pulsar.clear;
~pulsar.pause;
~pulsar.resume;


// rezonator synth ///////////////////////////////////////

(
~rezonator.ar(2);
~rezonator.clock = p.clock;
~rezonator.quant=2;
~rezonator.fadeTime=4;
~rezonator={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = ~pulsar.ar;
  //sig = CombN.ar(sig,~tempo,~tempo,4);
  sig = CombL.ar(sig,2/432+SinOsc.kr(4).range(-0.001,0.001),1/4/43.2+SinOsc.ar(~tempo).range(-0.001,0.001),LFNoise1.kr(1/4).range(0.5,4));
  sig = Compander.ar(sig,~pulsar.ar,3/4,LFNoise1.kr(1/32).range(1/2,2),LFNoise1.kr(1/32).range(1/2,2));
  sig = PitchShift.ar(sig,0.2,mod);
  Splay.ar(sig,0.5,0.25,SinOsc.kr(7));
};
~rezonator.play;
);
~rezonator.stop(4);
~rezonator.clear;
~rezonator.pause;
~rezonator.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.335,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5111],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
