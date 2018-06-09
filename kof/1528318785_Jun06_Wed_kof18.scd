

p.push();
p.bpm(4/5*120);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=7;
~one={
    var f = TChoose.kr(Impulse.kr(1/5!3),[60,72,24,65,48,53].midicps);
    var mod = Duty.kr(16*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333,1,4,8],inf));
  var pls = [4,2,1,3]*~tempo/4;
    var t = LFTri.ar(~tempo/4/[1,2,3,4]+(f/mod/4+0.01),0,Pulse.ar(pls));
  var z = SinOsc.ar(f/mod/10+[0,0.0001,0.041,0.000001],Pulse.ar(pls/4));
  t = Wrap.ar(VarSaw.ar(~tempo/16/[1,2,3,4]) + (t ** z) + t - z) ; 
  t = LeakDC.ar(t) * LFPulse.ar(pls) * LFTri.ar(~tempo/4/[1,2,3,4]);
  t = CombC.ar(t,mod/f*4,mod/f,2);
  t = BPF.ar(t,f,0.1) + LPF.ar(t,1500);
  Splay.ar(t,0.75,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  s.latency=2/3;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

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
