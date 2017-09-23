




p.push();
p.bpm(96);

60/7.5

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[4,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = LPF.ar(PitchShift.ar(~one.ar,[0.1,0.2,0.3,0.4],env**0.2+0.25),15000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
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
~one.quant=8;
~one.fadeTime=4;
~one={
    var r = LFTri.kr(~tempo/16).exprange(1/16/[1,2,3,4]+LFNoise2.kr(1/(1..12),mul:0.01),2);
    var mod = Duty.kr(16*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,2,1],inf));
  var pos = SinOsc.ar(~tempo/[600,6000]);
  var f = 45*(2**([102,304,600,1004]/1200))/mod;
  var sig =SinOsc.ar(f,SinOsc.ar(~tempo/16/[8.0001,8.0002,16.0345])*2pi/100,mul:LFTri.ar(~tempo/16/(1..4))**1.5 ).range(0,2pi);
  var x,y;
  sig = CombL.ar(sig,256/f,1/f.lag(1/10),4);
  x = (sig.cos+1) * r;
  y = (sig.sin+1) * r;
  sig = Perlin3.ar(pos[0],pos[1],x) + Perlin3.ar(pos[0],y,pos[1]) * LFTri.ar(1/16/(1..4));
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,3000);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.15);
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
