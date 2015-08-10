



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


(
  var tempo = 8/3;
  var offset = (0..7)/8;
  t = TempoClock.new(tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};
  
  offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
)


// s1 synth ///////////////////////////////////////

(
~s1.quant=1;
~s1.fadeTime=0.02;
~s1={
  var imp = PulseDivider.kr(~tick.kr,4);
  var env = EnvGen.ar(Env([0.001,1,0.001],[m.kr(0,1),m.kr(0,2)*8],[3,-3]),imp);
  var sig = SinOsc.ar(40 * (env ** (m.kr(0,3)*100) * (m.kr(0,4)*8000))) * SinOsc.ar(8000*env*m.kr(0,5));
  sig = sig * env;
  sig = CombN.ar(sig,1,m.kr(0,7),1) + sig;
  sig = RLPF.ar(sig,m.kr(0,6) * 16000);
  sig = GVerb.ar(sig,m.kr(0,8)+1*100);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.25,0.5);
};
e.addMix(~s1,postVol:true);
~s1.play;
);
~s1.stop(7);
~s1.clear;
