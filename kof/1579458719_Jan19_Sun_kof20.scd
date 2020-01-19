p.push();
p.bpm(88.07*1.125*1.333334*2);
88.07*1.125*1.333334
132.1050660525/60


~tempo={LFNoise2.kr(1/15).range(2.201751100875-0.1,2.201751100875+0.1)*1.5};

b = Buffer.alloc(s,48000,4);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0.4;
~one={
  var mod = Duty.kr([4,15,32]/4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var env = Pulse.ar(~tempo/([1,2,3,4])) + (LFSaw.ar(40.01)**LFNoise1.kr(~tempo/4).exprange(0.2,2));
  var sig = SinOsc.ar(40+(env**LFNoise2.kr(~tempo/4).range(0.1,90)*LFNoise2.kr(~tempo/32/[1,2,3,4]).exprange(40.01,13000)),env) * env;
  sig = BufDelayL.ar(b.bufnum,sig,LFTri.ar(~tempo/128/[1,2,3,4].reverse)/64);
  sig = sig + Formant.ar(40**1.125/mod,8000.01**1.33333/mod,16000.001**3/4/mod,env)/LFNoise2.kr(~tempo/[1,2,3]).exprange(1.01,20);
  Splay.ar(sig,0.35,0.75);
};
~one.play;
);
~one.stop(120);
~one.clear;
~one.pause;
~one.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
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
