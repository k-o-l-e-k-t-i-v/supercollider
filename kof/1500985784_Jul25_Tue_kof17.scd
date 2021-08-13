p=ProxySpace.push(s)
p.push();
p.bpm(120)


~tempo={1}

// switch1 synth ///////////////////////////////////////

(
~switch1.ar(2);
~switch1.clock = p.clock;
~switch1.quant=24;
~switch1.fadeTime=2;
~switch1={
  var sig = [
    LFSaw.ar(50),
    VarSaw.ar(50*[1,2,4,8]),
    WhiteNoise.ar(0.5),
		SinOsc.ar(1500*(1+(1/(1..12))),mul:0.2)
  ];

  var sel = LFSaw.kr(~tempo/4);
  RandSeed.kr(Impulse.kr(~tempo/24),2021);
  sig = Select.ar(sel.range(0,sig.size+1),sig) * CombN.ar(LFPulse.ar(~tempo/[1,2,3,4]),1/50,1/50,1/4);
  sig = CombL.ar(sig,1/4,1/4,4);
  Splay.ar(sig,0.95,0.25);
};
~switch1.play;
);
~switch1.stop(4);
~switch1.clear;
~switch1.pause;
~switch1.resume;

(1..16).log

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=2;
~kick.fadeTime=4;
~kick={
  var sig = Pulse.ar(~tempo/[2,3,4,5].log);
  Splay.ar(sig,0.5,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var f = 60.midicps * [1,2,4] /.x (2..32).log+LFNoise1.kr(~tempo/32!32,mul:1/4);
  var sig = SinOsc.ar(f,mul:0.1) * Pulse.ar(~tempo/[1,2,3,4]).softclip;
 sig = sig * VarSaw.ar(f/2);
 sig= sig * SinOsc.ar(f);
 sig = sig ** LFNoise2.kr(~tempo/32/(1..16)).range(0.1,4);
 //sig = CombN.ar(sig,1,4/f,2);
 sig  = LeakDC.ar(sig);
 sig = Normalizer.ar(sig);
  Splay.ar(sig,0.5,0.75);
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
