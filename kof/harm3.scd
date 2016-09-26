


// harm synth ///////////////////////////////////////

(
  ~harm.ar(2);
  ~harm.quant=2;
  ~harm.fadeTime=2;
  ~harm={
    var speed = 1/16/(1..8);
    var master = Duty.kr(1/speed,0,Dseq([1,1.33333,2,1.5].pyramid,inf));
    var change = Impulse.kr(speed);
    var tonic = Duty.kr(1/speed*8,Dseq([1,5/4,3/2,15/8].scramble.pyramid,inf)) ;
    var mel = Duty.kr(1/speed*16,0,Dseq([1,2,3,4,3,4,5,6].scramble.octcps,inf));
    var f = mel * tonic + SinOsc.kr(1/6/(1..4),mul:0.3) /  master;
    //var sig = SinOsc.ar(f,mul:LFNoise2.kr(1/16!8)) +PinkNoise.ar(0.1!8);
    var sig = PinkNoise.ar(1!8);
    sig = Vibrato.ar(sig,[3,4,5,6,5,6,7],0.22) ;//SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
    //sig = MoogFF.ar(sig,f*4,3.5);
    sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),1/f,1/f,32);
    sig = Resonz.ar(sig,f,0.4) * LFSaw.ar(speed);
    sig= CombN.ar(sig,1/f,1/f*10,16);
    sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),1/f,1/f*10,8);
    sig = CompanderD.ar(sig,3/4,1/2,1/10);
    //sig = sig * LFSaw.ar(speed);
    Splay.ar(sig,0.95,0.95);
  };
  ~harm.play;
  ~harm[1] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,200),3500),[4020,4000])/2+sig;};
);
~harm.stop(4);
~harm.clear;
~harm.pause;
~harm.resume;

[5/4,3/2,15/8]
[9/8,4/3,5/3,2]

[6/5,5/4,4/3,3/2,5/3,2/1]
