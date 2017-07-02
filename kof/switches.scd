
p.push();
p.bpm(90);


// switch synth ///////////////////////////////////////

(
~switch.ar(2);
~switch.clock = p.clock;
~switch.quant=2;
~switch.fadeTime=4;
~switch={
  var sig = [
      SinOsc.ar(50),
      LFNoise2.ar(90),
      Pulse.ar(~tempo*4),
      SinOsc.ar(500,mul:0.1),
      SinOsc.ar(250,mul:0.1),
      SinOsc.ar(10000,mul:0.1),
      Pulse.ar(~tempo*8),
      VarSaw.ar(150,mul:0.4),
      Pulse.ar(~tempo*3),
      WhiteNoise.ar(0.2)
  ];
  var t = SinOsc.ar([~tempo/16,~tempo/[1,2,3,4],50*((1..8))]) + LFTri.ar(1/360/((1..8)));
  var sel = Perlin3.ar(t[0],t[1],t);
  sig = SelectX.ar(sel * 4,[
    LPF.ar(sig,500),
HPF.ar(sig,5000),
Resonz.ar(sig,500)
  ]);
  sig = SelectX.ar(sel * (sig.size+1),sig);
  sig = LeakDC.ar(sig);
  sig = Normalizer.ar(sig)/8;
  sig = Compander.ar(sig, Pulse.ar(~tempo*4/(1..8)),0.1,1,0.1);
  Splay.ar(sig,0.5,0.75);
};
~switch.play;
);
~switch.stop(4);
~switch.clear;
~switch.pause;
~switch.resume;

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


Select.help
