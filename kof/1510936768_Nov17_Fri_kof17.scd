
p.push();
s.latency=0.5;
Tdef(\reb,{loop{~one.rebuild;16.wait;}}).play;
Tdef(\reb).stop;
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var f = {(250..1800).choose.round(220*(2**([5,7,9,12,0,11,12+7].choose/12)))}!3+SinOsc.ar(16/(1..3),mul:0.5) / {[1,2,4,1.5,1.3334].choose}!3;
  var sig = SinOsc.ar(f,mul:0.125) * LFTri.ar(16/(1..24));
  sig = AllpassN.ar(sig,1/4,1/f,1);
  sig = CombN.ar(sig,4/f,2/f+(LFNoise2.kr(4).range(0.0001,0.001)/1000),1);
  sig = sig * LFTri.ar(8/(1..24),mul:1);
  Splay.ar(sig,0.5,0.25);
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
