

p.disconnect();
p.push();
p.bpm(90);

s.latency=0.2;

// one synth ///////////////////////////////////////
(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=2,rev = 1.5|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

(
~desync.kr(1);
~desync.mold(1);
~desync.quant = 16;
~desync.fadeTime= 5;
)
(
~desync = {
  //Line.kr(0.0001,1.000001,60).exprange(1.000001,1.5).poll;
  LFNoise2.kr(1/120).range(~tempo.kr-0.0033,~tempo.kr+0.0033).poll;
}; 
)



(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=0.1;
~one={
  var sig;
  var tone = TChoose.kr(Impulse.kr(~desync.kr/1/4/[1,2,4]),[60,36,48].midicps *.x [2,4,1.5,1.3333,1/2] /.x [1,1/2,1,1/1.5,1/(1+1/3)] );
  var t = [] ++ LFSaw.ar([1/16,1/[3,4,5],1/1200]*~desync.kr) + SinOsc.kr(1/12000) + Pulse.ar(~desync.kr/[1,2,4]);
  sig = Perlin3.ar(t[0],t[1],t[2]) + (Formant.ar(tone,tone*4,tone*8)*0.1);// * (Perlin3.ar(tone[0],tone[1],tone[2])*1/4) * SinOsc.ar(~desync*tone);
  sig = Compander.ar(sig,LFSaw.ar(~desync.kr*[1/2,1,2]),0.1,1,0.1);
  sig = sig + (WhiteNoise.ar(0.01)*Pulse.ar(~desync/[4,3,2,1],mul:[0.1,0.2,0.3,0.4]));
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  
  Splay.ar(sig,0.135,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

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
  ~tick = { Impulse.kr( ~desync.kr * 4 ); };
);
