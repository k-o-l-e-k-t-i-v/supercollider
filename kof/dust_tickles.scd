s.latency = 0.2;

p.bpm(45);

p.push();
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
  var sig = Dust.ar(900)*Pulse.ar(1.5*[1,2,4,8]);
  sig = HPF.ar(sig,[1,2,3,4]*3000); 
  Splay.ar(sig,0.5,0.25);
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
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(55!2,env**60*4pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// clean synth ///////////////////////////////////////

(
~clean.ar(2);
~clean.clock = p.clock;
~clean.quant=4;
~clean.fadeTime=0.4;
~clean={
  var base = TChoose.kr(Impulse.kr(~tempo/32),[[65,63,60],[60,60,65],[60,60,48],[60,36,48]]);
  var mel = [
    0,2,0,4, 0,3,0,5, 0,2,0,4, 0,1,0,4,
  ];
  var div = Duty.kr(4/~tempo,0,Dseq([1,2,1/2,1/4,1.5,1.33333,1,1],inf));
  var transpose = Duty.kr((1..8)*4/~tempo,0,Dseq([0,-12,0,12 ,0,24,0,-24 ,0,0,0,0],inf));
  var shift = Duty.kr((1..8)/~tempo,0,Dseq(mel,inf));
  var freq = (base + shift + transpose).midicps / div;
  var sig = SinOsc.ar(freq,Pulse.ar(~tempo*2/(1..8).nthPrime)*0.01pi+SinOsc.kr(~tempo/(1..8)/64),mul:LFNoise2.kr(~tempo/16!8,mul:1/3));
  var t = [] ++ SinOsc.ar(~tempo/[4,32]) ++ SinOsc.ar(freq,Pulse.ar(~tempo/(1..8).nthPrime))/4 + LFSaw.ar(~tempo/1200,mul:40);
  sig = Perlin3.ar(t[0],t[1],t) * Pulse.ar(~tempo*4/(1..8).nthPrime).softclip;
  sig = LeakDC.ar(sig);
  sig = CombN.ar(sig,1/freq,1/freq,~tempo/2/(1..8)*8)/8 + sig;
  sig = CompanderD.ar(sig,3/4,1/1.25,1);

  //sig = sig * (LFTri.ar(1/[16,8,3,32])**1.9);
  Splay.ar(sig,0.25,0.75);
};
~clean.play;
);
~clean.stop(4);
~clean.clear;
~clean.pause;
~clean.resume;
