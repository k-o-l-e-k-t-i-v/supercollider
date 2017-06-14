(
    p.push();
    p.bpm(90);
    s.latency = 0.2;
)




// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar(~tempo/[1,2]));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// pauline synth ///////////////////////////////////////

(
~pauline.ar(2);
~pauline.clock = p.clock;
~pauline.quant=8;
~pauline.fadeTime=4;
~pauline={
  var sig = AudioIn.ar([1,2]);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  sig = RHPF.ar(sig,LFTri.kr(~tempo/64/[1,2,3,4]).range(200,2000),LFTri.kr(~tempo/32/[1,2,3,4]).range(0.01,0.4));
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~pauline.play;
);
~pauline.stop(4);
~pauline.clear;
~pauline.pause;
~pauline.resume;


// pauline2 synth ///////////////////////////////////////

(
~pauline2.ar(2);
~pauline2.clock = p.clock;
~pauline2.quant=8;
~pauline2.fadeTime=4;
~pauline2={
  var sig = AudioIn.ar([1,2]);
  sig= sig * Pulse.ar(~tempo/16/[1,2,3,4]);
  sig = CombN.ar(sig,1/50,1/LFNoise2.kr(~tempo/32).range(50,5000).round(250),4);
  Splay.ar(sig,0.5,0.05);
};
~pauline2.play;
);
~pauline2.stop(4);
~pauline2.clear;
~pauline2.pause;
~pauline2.resume;


(
  //s.latency=0.2;
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
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)
