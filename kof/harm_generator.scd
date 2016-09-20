


// harm synth ///////////////////////////////////////

(
  ~harm.ar(2);
  ~harm.quant=2;
  ~harm.fadeTime=8;
  ~harm={
    var speed = 1/2/(1..32);
    var master = Duty.kr(1/speed,0,Dseq([1,2,1.33333,1.5],inf));
    var change = Impulse.kr(speed);
    var f = TChoose.kr(change,[5,3,1,3,3,2,6,4].octcps) * TChoose.kr(change,[9/8,4/3,5/3,2]) + SinOsc.kr(1/6/(1..4),mul:0.3) / TChoose.kr(Impulse.kr(speed/4),[1,2,1.5,1.33333]) * master;
    var sig = Formant.ar(f,f*[9/8,4/3,5/3,2],f*[2,4,8],mul:0.2) * (LFTri.ar(speed)**2);
    sig = Vibrato.ar(sig,[3,4,5,6],0.2) * SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
    sig = MoogFF.ar(sig,f*master,3.5);
    sig = CompanderD.ar(sig,3/4,1,1/2);
    Splay.ar(sig,0.95,0.5);
  };
  ~harm.play;
  ~harm[1] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5000),[3000,4000])+sig;};
);
~harm.stop(4);
~harm.clear;
~harm.pause;
~harm.resume;

[5/4,3/2,15/8]
[9/8,4/3,5/3,2]

[6/5,5/4,4/3,3/2,5/3,2/1]
