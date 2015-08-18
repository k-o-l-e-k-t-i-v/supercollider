



(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);


(
  ~tempo = 8/3;
  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)



// multi_synth synth ///////////////////////////////////////

(
  ~multi_synth.quant=1;
  ~multi_synth.fadeTime=0.02;
  ~multi_synth={
    var pat = [
    // |       |       |       |       |
      [1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0], // kick
      [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0], // stick
      [0,0,1,0,0,0,1,0,0,0,1,0,0,1,1,1], // hat
      [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]  // bass
    // |       |       |       |       |
    ];

    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
    var hit = 4.collect{|i| Select.kr(PulseCount.kr(imp)%pat[i].size,pat[i])};
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,[1.5,0.5,0.15,4.5]],[3,-3]),imp * hit);

    var frq = 66.6;

    var sig = [
      SinOsc.ar(frq+(env**40*400),mul:0.5),
      SinOsc.ar(frq+(env**40*1000),mul:0.5),
      HPF.ar(WhiteNoise.ar(0.15),[8000,1200]),
      Formant.ar(frq*[10,20,40]/TExpRand.kr(1,12,hit[3]*imp!2).round(pi)+(env**4*10),frq*2,400),
    ];

    sig = sig * env;

    Splay.ar(sig.flat,0.75,0.75);
  };
  ~multi_synth.play;
  //~multi_synth[20] = \filter -> {|i| CompanderD.ar(i,3/4,1/2,1/2)/2+i};
  ~multi_synth[22] = \filter -> {|i| GVerb.ar(i,60,[2,3,4,5],spread:[20,80])/8+i};
);
~multi_synth.stop(7);
~multi_synth.clear;
