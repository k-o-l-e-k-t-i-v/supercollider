


(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);


(
  ~tempo = 1;
  ~offset = (0..7)/8;
  t = TempoClock.new(~tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)




// mantra synth ///////////////////////////////////////

(
~mantra.quant=1;
~mantra.fadeTime=4.02;
~mantra={
  //         |     |     |     |     |     |     |     |  
  var pat = [1,0,1,0,1,1];
  var imp = PulseDivider.kr(~tick.kr,fib(8)*8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var freq = Select.kr(PulseCount.kr(hit)%8,[8,16,4,32,16*1.5,32/1.5,32/1.25,16/1.5]);
  var oct = Select.kr(PulseCount.kr(hit)/4%8,[0,12,24,-12,0,14,7,-14]);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.3],[3,-3]),imp * hit);
  var sig = Formant.ar(36.midicps*freq/([1,1.5,1.25,1.125]*pi) + SinOsc.kr(1/4/fib(8)).range(-0.3,0.3),([55,58,60,65]+oct).midicps,LFNoise2.kr(1/4).range(10,1000) + SinOsc.ar([4,5,6,7]).range(-10,10) );
  sig = MoogFF.ar(sig,([55,58,60,36]+oct).midicps,LFNoise2.kr(1/8!8).range(0.1,3.2))+sig / 2;
  sig= HPF.ar(sig,90).softclip * LFNoise2.kr(1/4!8).range(0.01,1);
  sig = LPF.ar(sig,3000);
  sig = Limiter.ar(sig.distort);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~mantra.play;
  ~mantra[20] = \filter -> {|in| GVerb.ar(LPF.ar(in,1500)+HPF.ar(in,300),[10,40],[2,3,4,5],spread:[20,90],drylevel:0.9)/4+in};
  ~mantra[22] = \filter -> {|in| CompanderD.ar(in,3/4,1/2,1/4)};
);
~mantra.stop(7);
~mantra.clear;
