

p.push();
p.bpm(141.33/2);


// kick_test synth ///////////////////////////////////////

(
~kick_test.ar(2);
~kick_test.clock = p.clock;
~kick_test.quant=[16,0];
~kick_test.fadeTime=0.02;
~kick_test={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3]),imp * hit);
  var perl = Perlin3.ar(env,env**2*40,env**LFSaw.ar(~tempo/4)*LFSaw.ar(~tempo/16000)*40);
  var sig = SinOsc.ar(50!2+(perl*150),env**80*8pi*perl);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kick_test.play;
);
~kick_test.stop(4);
~kick_test.clear;
~kick_test.pause;
~kick_test.resume;
