
p.push();
p.bpm(125)

// klack synth ///////////////////////////////////////

(
~klack.ar(2);
~klack.clock = p.clock;
~klack.quant=[16,0];
~klack.fadeTime=0.02;
~klack={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var l = 2.5;
  var mod = LFSaw.kr(LFNoise2.kr(~tempo/320!2).range(4,90).round(4/~tempo))**LFNoise2.kr(~tempo/32!6).range(0.1,4.9)*LFNoise2.kr(~tempo/32!2).exprange(0.1,0.9);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,l],[3,-3]),imp * hit);
  var sig = SinOsc.ar(45+(env**80*450),Perlin3.ar(env**mod,env**(mod*1.01),env**(mod*1.001))*8pi);
  sig = sig * env;
  sig = MoogVCF.ar(sig,450*[4],mod+0.1) + LPF.ar(sig,450);
  Splay.ar(sig,0.75,0.5);
};
~klack.play;
);
~klack.stop(4);
~klack.clear;
~klack.pause;
~klack.resume;


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
