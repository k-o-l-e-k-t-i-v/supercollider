

p.push
~ratio={1/0.864}
p.bpm(120*1/0.864)

// one synth ///////////////////////////////////////


(
~one.ar(2);
~one.quant=10;
~one.fadeTime=4;
~one={
    var mod2 = Duty.kr(100/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var mod = Duty.kr(10/~tempo,0,Dseq([1,2,1.5,1.33333],inf))*mod2;
    var f = 100/[1,1.5,2,1.333334]/mod;
  var sig = SinOsc.ar(f*~ratio*.x[0.1,1,10,100],mul:[1,0.5,0.25,0.125]) * (LFTri.ar(~tempo/(1..10))**2);
  sig = sig + Pulse.ar(~tempo/(1..10),mul:0.1);
  Splay.ar(sig,0.95,0.15,SinOsc.kr(~tempo/10)/4);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 10;
  ~counter.quant = 10;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// metric_kick synth ///////////////////////////////////////

(
~metric_kick.ar(2);
~metric_kick.quant=[10,0];
~metric_kick.fadeTime=0.02;
~metric_kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002/~ratio,1.0/~ratio],[3,-3]),imp * hit)};
  var sig = SinOsc.ar(100*~ratio,env**100*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.25);
};
~metric_kick.play;
);
~metric_kick.stop(4);
~metric_kick.clear;
~metric_kick.pause;
~metric_kick.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
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




