
p.push()
p.bpm(88)
z = Buffer.alloc(s,48000,2);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var detune = SinOsc.kr(~tempo/4/(1..24)) + 1 * 2.5;
  var sig = Pulse.ar(50+detune,mul:1/(1..24)) * LFTri.ar(~tempo/4/(1..24));
  sig = LPF.ar(sig,150+LFTri.ar(~tempo/4).exprange(0.001,150));
  sig = BufDelayL.ar(z,Splay.ar(sig),LFSaw.kr(~tempo*8/[1,2,3,4]).range(0.1,0.9));
  Splay.ar(sig,LFNoise1.kr(~tempo/64),0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// onee synth ///////////////////////////////////////

(
~onee.ar(2);
~onee.quant=4;
~onee.fadeTime=4;
~onee={
  var sig = SinOsc.ar(50!2,Pulse.ar(~tempo*2));
  Splay.ar(sig,0.5,0.25);
};
~onee.play;
);
~onee.stop(4);
~onee.clear;
~onee.pause;
~onee.resume;

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
