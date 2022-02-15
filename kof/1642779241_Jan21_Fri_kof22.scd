
p.push();
p.bpm(121.35);


(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 24;
  ~counter.quant = 24;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=24;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=0.4;
~one={
    var base = Duty.kr(24/[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf))*[1500,15000,50,25];
    var del = LFNoise2.ar(240/~tempo/[12,2,3,4]).exprange(0.025*~tempo,~tempo/4);
    var pulse = CombL.ar(Pulse.ar(~tempo/[2,3,4,12]) ,del,del,~tempo*4);
    var sig = SinOsc.ar(base!2+(pulse**2*(base*0.25)),pulse*2pi) * pulse;
    sig = sig * Pulse.ar(~tempo*4/[1,2,3,4]);
    sig = CombL.ar(sig,del,del/8,2);
    //sig = sig * Pulse.ar(~tempo/2/[1,2,3,4]);
    sig = BPF.ar(sig,base,LFNoise2.kr(~tempo*4!4).exprange(0.00001,0.5)) + (sig/2*Pulse.ar(~tempo/[1,2,3,4]));
    sig = GVerb.ar(sig,60,3)/4 + sig;
    sig = LeakDC.ar(sig);
    //sig= BPF.ar(sig,base,3,LFNoise2.kr(~tempo*1/240!2).exprange(0.00001,0.5))/4 + (sig/4*Pulse.ar(~tempo*2/[1,2,3,4]));
    //sig = GVerb.ar(sig,90,7,0.5,LFNoise1.ar(~tempo/4/[1,2,3]).exprange(0.01,1.0))/8+sig;
  Splay.ar(sig,0.95,0.0015);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// dig synth ///////////////////////////////////////

(
~dig.ar(2);
~dig.quant=24;
~dig.fadeTime=0.02;
~dig={
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
    var sig = SinOsc.ar(45!2+(env**40*90),env**40*2pi);
  sig = sig * env;
  Splay.ar(sig,0.005,0.5);
};
~dig.play;
);
~dig.stop(4);
~dig.clear;
~dig.pause;
~dig.resume;
