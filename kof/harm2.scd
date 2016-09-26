


// harm synth ///////////////////////////////////////

(
  ~harm.ar(2);
  ~harm.quant=2;
  ~harm.fadeTime=8;
  ~harm={
    var speed = 1/4/(1..4);
    var master = Duty.kr(1/speed,0,Dseq([1,2,1.33333,1.5],inf));
    var change = Impulse.kr(speed);
    var f = TChoose.kr(change,[3,4].octcps) * TChoose.kr(change,[1,5/4,3/2,15/8]) + SinOsc.kr(1/6/(1..4),mul:0.3) /  master;
    var sig = Formant.ar(f,f*[2,1.6666],f*[1.5,2],mul:LFNoise2.kr(1/16!32)) * (LFTri.ar(speed)**2);
    sig = Vibrato.ar(sig,[3,4,5,6,5,6,7],0.22) ;//SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
    //sig = MoogFF.ar(sig,f*4,3.5);
    sig = Resonz.ar(sig,f,0.2);
    sig = CompanderD.ar(sig,3/4,1/4,1/2);
    Splay.ar(sig,0.95,0.5);
  };
  ~harm.play;
  ~harm[1] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,200),3500),[4020,4000])/8+sig;};
);
~harm.stop(4);
~harm.clear;
~harm.pause;
~harm.resume;

[5/4,3/2,15/8]
[9/8,4/3,5/3,2]

[6/5,5/4,4/3,3/2,5/3,2/1]
