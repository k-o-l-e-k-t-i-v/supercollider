

p.push;

(
  s.latency=0.2;
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

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var change = 1.5/8/[1,2,4];
    var base = 220 * TChoose.kr(Impulse.kr(change),[1,2,1/1.5,1/1.333333,1/4,1/2]);
    var ht = TWChoose.kr( Impulse.kr(change),[0,102,306,600,804,1008],[3,2,3,2,3,1],1) + SinOsc.kr(1/4/(1..3)+0.1,mul:0.01);
    //var ht = TChoose.kr( Impulse.kr(change),[0,306,600,1008]) + SinOsc.kr(23/(1..12)+0.1,mul:0.1);
    var f = base * (2**(ht/1200)).lag([1,2,3]*2);
    var mod = LFTri.ar(change/8,mul:2pi);
  var sig = SinOsc.ar([f/2,f,change/32],mod).range(mod/2,mod*2) * (LFTri.ar(change/16));
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = sig * (LFTri.ar(change));
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = sig.softclip;
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,4000);
  sig = Vibrato.ar(sig,[7,8,9]);
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(30);};});
}.fork;  
)

TRand.help

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  //sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = CompanderD.ar(sig,3/4,1,1/3)*1.333;
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
