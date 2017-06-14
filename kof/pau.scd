(
    s.reboot;
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
  var sig = VarSaw.ar([51,5000.1],0,mul:LFSaw.ar(~temp*4/[1,2,3,4]));
  Splay.ar(sig,0.15,0.25);
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
  Splay.ar(sig,0.15,0.5);
};
~pauline.play;
);
~pauline.stop(4);
~pauline.clear;
~pauline.pause;
~pauline.resume;


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
