



(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);


(
  ~tempo = 90/60;
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
) 


(

// kick synth ///////////////////////////////////////

(
~kick.quant=1;
~kick.fadeTime=0.02;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,9.5],[3,-3]),imp * hit);
  var sig = Mix.fill(4,{|i|SinOsc.ar(50+(i/10)+(env**40*[400+i,80,90]),i*pi)});
  sig = HPF.ar(sig,50);
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);

  //hh  synth ///////////////////////////////////////

  (
  ~hh.quant=1;
  ~hh.fadeTime=0.02;
  ~hh={
    //         |       |       |       |       |  
    var pat = [0,0,1,0,0,0,0,0,0,0,1,0,1,1,1,1];
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,0.15],[3,-3]),imp * hit);
    var sig = HPF.ar(WhiteNoise.ar(1!4),[2000,6000,8000,12000]);
    sig = Resonz.ar(sig,12000+(env**10*8000));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~hh.play;
  );
 
  // saw synth ///////////////////////////////////////

  (
  ~saw.quant=1;
  ~saw.fadeTime=0.02;
  ~saw={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
    var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)%4,[1,2,1.5,1.25]);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.33*2,16],[3,-3]),imp * hit);
    var sig = Formant.ar([24,12].midiratio*8/mod+(env*0.2*40),[250,500,750,1000],200)*4;
    sig = Resonz.ar(sig,500,LFNoise2.kr(1/~tempo/fib(4)).range(0.1,0.9))*3;
    sig = PitchShift.ar(sig,0.04,LFNoise2.kr([1,2,4,1/4,1/2]).range(0.95,2)) * LFNoise2.kr(4);
    sig = sig * env;
    Splay.ar(sig,0.75,0.05);
  };
  ~saw.play;
  );


)
  ~sin.stop(7);
  ~sin.clear;
 

   ~saw.stop(7);
  ~saw.clear;
  
  
   ~hh.stop(7);
  ~hh.clear;
  
  
  
  
  ~kick.stop(7);
~kick.clear;
