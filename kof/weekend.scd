p.push()


(
  (
    p.clock.sched(p.clock.timeToNextBeat(1 * 16),{ 
      f = Tdef(\f,{loop{~simple_thing.rebuild; 64.wait;};};);
      f.play();

    });
  );
)

s.latency = 0.2;

// simple_thing synth ///////////////////////////////////////

(
  ~simple_thing.ar(2);
  ~simple_thing.clock = p.clock;
  ~simple_thing.quant=0;
  ~simple_thing.fadeTime=16;
  ~simple_thing={
    var x = {[0,0,0,7,-4,12,24,-12,-24].choose}!3;
    var a = ([36,36,28]+x).midicps * [{([1,4,8,1/2,1/4,1.5,1.33333]*.x[1,1/2,1/1.33333,1/1.5,1.5,1.333333]).choose}!3];
    var b = SinOsc.kr({1/16/[1,2,3,4,5,6,7].nthPrime.choose}!3) * 8pi;
var c = [0.1,0.25,0.22].scramble;
    var sig = [
      SinOsc.ar(a, b, mul:c),
      VarSaw.ar(a/8, 0, b/8pi, mul:c),
      Decay.ar(Dust.ar({[1,4,8,16].choose}!3) + Impulse.ar(1/4/[1,2,3,4]),[0.1,0.01,0.001],mul:c) * WhiteNoise.ar(0.2!3),
      LFPar.ar(a,mul:c.scramble),
      Pulse.ar(4/[1,2,3],mul:c) * SinOsc.ar(a**4/[1,2,3],b * Pulse.ar(4),mul:c)
    ];
    sig = SelectX.ar(SinOsc.kr(1/4/{(1..24).nthPrime.choose}!3).range(0,sig.size),sig);
    Splay.ar(sig,0.25,0.5,SinOsc.kr({[4,5,6,7,1/50].choose}!2)/1.5);
  };
  ~simple_thing.play;
);
~simple_thing.stop(4);
~simple_thing.clear;
~simple_thing.pause;
~simple_thing.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=2,rev = 2|
    var sig = In.ar([0,1]);
    var orig = sig;
    var fx;
    //fx = Limiter.ar(sig,0.95);
    sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
    fx = LPF.ar(sig,lp);
    fx = HPF.ar(fx,hp);
    fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
    sig = SelectX.ar(wet,[orig,fx]);
    sig = CompanderD.ar(sig,3/4,1/1.1,1);
    sig = NumChannels.ar(sig,2);
    ReplaceOut.ar(0,sig);
  };
  p.moveNodeToTail(\master);
);
