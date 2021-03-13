
p.push();

~tempo={88/120};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
    var pulse = Pulse.ar(~tempo.kr*4/[1,2,3,4,5,6,7,8,9,10,11,12]);
    var sig = SinOsc.ar(50!2,pulse) * pulse;
    sig = CombL.ar(sig,1/24/~tempo,1/48/~tempo,1);
  Splay.ar(sig,0.95,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.clock = p.clock;
~high.quant=[16,0];
~high.fadeTime=0.02;
~high={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);
~high.stop(4);
~high.clear;
~high.pause;
~high.resume;
