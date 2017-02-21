

p.push();


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=3500,hp=250,len=40,rev = 2|
    var sig = In.ar([0,1]);
    var orig = sig;
    var fx;
    //fx = Limiter.ar(sig,0.95);
    sig = CompanderD.ar(sig,3/4,1/1.3,1);
    fx = LPF.ar(sig,lp);
    fx = HPF.ar(fx,hp);
    fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
    sig = SelectX.ar(wet,[orig,fx]);
    sig = NumChannels.ar(sig,2);
    ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);

// message synth ///////////////////////////////////////

(
  ~message.ar(2);
  ~message.clock = p.clock;
  ~message.quant=16;
  ~message.fadeTime=5;
  ~message={
    var mod = [1,2,1.5].choose;
    var f = ({[60,48,63,67].choose/mod}!3).midicps/{[1,2,1/2,1/4].choose}!3+(SinOsc.ar(1/4/[8,9,10])*3);
    var special = Perlin3.ar(SinOsc.ar(f/8).range(0,1),SinOsc.ar(1/{(_**2!16).choose+1/32}!3).range(0,1),SinOsc.ar(1/32).range(0,1));
    var sig = SinOsc.ar(f/2,SinOsc.kr(1/4/[13,14,15])*2pi,mul:LFNoise2.kr(1/16/[1,2,3]));
    sig = sig * special;
    sig = sig + (SinOsc.ar(f*2+SinOsc.kr(1/4/[10,11,12]),mul:0.02));
   sig = HPF.ar(sig,20);
   sig = HPF.ar(sig,20).softclip * Pulse.ar(4/[1,2,3]).softclip;
    Splay.ar(sig,0.3335,0.5,SinOsc.ar(f/100)/4);
  };
  ~message.play;
);
~message.stop(4);
~message.clear;
~message.pause;
~message.resume;

Tdef(\reb).stop;
(
  p.clock.sched(p.clock.timeToNextBeat(1 * 16),{ 
    Tdef(\reb,{loop{ ~message.rebuild; 32.wait;}}).play;

  });
);
