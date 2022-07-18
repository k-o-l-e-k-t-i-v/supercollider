


s.restart;

p.push();


p.bpm(121.35)


(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 8;
  ~counter.quant = 8;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=0.4;
~one={
    var nd = Duty.kr(24/[1,2,4]/~tempo,0,Dseq([67,60,65,60,63,60,62],inf));
    var mel = Duty.kr(16/[1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var base = [48,nd,24].midicps * [mel,mel/2] + SinOsc.kr(~tempo/4/[1,2,3,4]);
    var patt =  SinOsc.ar(~tempo/[1,2,4]/360).range(1.001,8);
    var sig = Perlin3.ar(LFSaw.ar([base,2/(1+base)],mul:2pi).cos + 1, LFSaw.ar(~tempo/patt,mul:2pi).cos+1,LFSaw.ar(~tempo/patt,mul:2pi).sin+1 );
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    //sig = CombL.ar(sig,2/base,4/base,~tempo/2);
    //sig = GVerb.ar(HPF.ar(sig,900),90)/2+sig;

    Splay.ar(sig,0.95,0.0125);
};
~one.play;
);
~one.stop(40);
~one.clear;
~one.pause;
~one.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=24;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(30+(env**40*200),env**60*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.15);
};
//~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=24;
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = WhiteNoise.ar(0.4!3);
    sig = BPF.ar(sig,16000/[1,4,8],0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;



