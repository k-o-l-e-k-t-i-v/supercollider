

p.push
p.bpm(87.9)

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0.4;
~one={
    var f = 50;
  var sig = WhiteNoise.ar(1!2) ;
  var r = LFSaw.ar(~tempo/4/[1,2,3,4]).exprange(1/10000,8);
  20.do{
  sig = BPeakEQ.ar(sig,14000/16*(1..16),r,SinOsc.kr(~tempo/4/(1..16)).range(0,-64) );
  };
  sig = LPF.ar(sig,14000);
  sig = HPF.ar(sig,50);
  //sig = sig * Pulse.ar(~tempo*2/[1,2,3,4]);
  Splay.ar(sig,0.5,0.125);
};
//~one.play;

~one2.ar(2);
~one2.quant=0;
~one2.fadeTime=0.1;
~one2={
    var detune = LFTri.kr(~tempo/[1,2,3]/16).range(0,4);
    var f = [
        Duty.kr(16/~tempo,0,Dseq([60,56,64,65],inf)),
        Duty.kr(1/[1,2,3]/~tempo,0,Dseq([60,65,67,60],inf)),
        Duty.kr(2/[1,2,3]/~tempo,0,Dseq([60,56,48,36],inf)),
        Duty.kr(16/~tempo,0,Dseq([60,56,63,62],inf)),
        Duty.kr(32/~tempo,0,Dseq([60,64,63,48],inf)),
        Duty.kr(64/~tempo,0,Dseq([60,56,36,49],inf))
    ].midicps.lag(1/40) / [1,2,2,1] +  SinOsc.kr(1/[4,5,6,7,1/13,1/17,1/21],mul:detune);
  var sig = [
      SinOsc.ar(f*2),
      WhiteNoise.ar(1),
      Pulse.ar(~tempo*8),
      LFTri.ar(f/2),
      BrownNoise.ar(1),
      Pulse.ar(f/2)
  ];
  var side;
  var r = LFSaw.ar(~tempo/4/[1,2,3,4]).exprange(1/10000,8);
  sig = sig * (LFTri.kr(~tempo/[1,1,2,3,12,24]/4)**2);
  sig = SelectX.ar(LFSaw.ar(~tempo/16/[1,1,3,4]) * (sig.size+1),sig);
  //sig = MoogFF.ar(sig,f*[1.5,1,4,4/1.5],LFNoise1.kr(~tempo/16!4).range(0.2,3.5));
 20.do{
  sig = BPeakEQ.ar(sig,16000/8*(1..8),r,SinOsc.kr(~tempo/64/(1..8)).range(0,-64) );
  }; 
  sig = sig + ~one.ar;
  side = sig;
  10.do{|n|
  side = DelayN.ar(side,~tempo/4,~tempo/24);
  side = CombC.ar(side,~tempo/2,1/(f+((n+detune)/1003)),~tempo);
  side = LeakDC.ar(side);
  side = Normalizer.ar(side);
  };
  sig = sig + (side);
  
   sig = MoogFF.ar(sig,f*[8,4,4,8]/[1.5,1,4,4/1.5],LFNoise1.kr(~tempo/16!4).range(0.2,3.5));
  Splay.ar(sig,0.25,0.25);
};
~one2.play;
);
~one2.stop(4);
~one2.clear(60);
~one2.pause;
~one.resume;
