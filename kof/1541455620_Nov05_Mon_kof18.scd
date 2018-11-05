
p.push();
s.latency=0.2;
p.bpm(88)
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(16*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333,4,8,1/4,1/8],inf));
    var base = [72,60,48].midicps/mod *.x [2,5,7,9].log2;
    var ramp = LFTri.ar(base*[2,5,7,9].log2)**(LFNoise2.kr(~tempo/16/[1,2,3,4])**1.5) + SinOsc.kr(base/32 + 0.01);
  var sig = SinOsc.ar(base*ramp,ramp*2pi)/2 * LFTri.kr(~tempo/16/[1,2,3,4]);
  sig = BPF.ar(sig,base,1);
  sig = BPF.ar(sig,base+10,1);
  sig = BPF.ar(sig,base*2-5,1);
  sig = LeakDC.ar(sig) * SinOsc.ar(base) ** SinOsc.ar(base/160);
  //sig = Normalizer.ar(sig) * Pulse.ar(base/160);
  sig = AllpassC.ar(sig,3,LFNoise1.kr(~tempo/32!8)**2/1000.0+0.01,3);
  sig = AllpassC.ar(sig,3,LFNoise1.kr(~tempo/32!8)**2/1000.0+0.01,3);
  sig = AllpassC.ar(sig,3,LFNoise1.kr(~tempo/32!8)**2/1000.0+0.01,3);
  //sig = SelectX.ar(LFSaw.kr(1/[1,0.01])*sig.size,sig );
  sig = Resonz.ar(sig,base*2,0.001+LFTri.kr(~tempo/16/[1,2,3,4]).exprange(0.0001,0.5));
  sig = Normalizer.ar(sig);
  sig = LPF.ar(sig,8000);
  Splay.ar(sig,0.15,0.25);
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
