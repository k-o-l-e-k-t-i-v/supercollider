


// harm synth ///////////////////////////////////////

(
  ~harm.ar(2);
  ~harm.quant=2;
  ~harm.fadeTime=2;
  ~harm={
    var speed = 1/16/(1..3);
    var master = Duty.kr(1/speed*16,0,Dseq([1,1.33333,2,1.5].pyramid,inf));
    var change = Impulse.kr(speed);
    var tonic = Duty.kr(1/speed*8,Dseq([1,5/4,3/2,15/8].scramble.pyramid,inf)) ;
    var mel = Duty.kr(1/speed,0,Dseq([1,2,3,4,3,4,5,6].scramble.octcps/[2,4,1,1,1],inf));
    var f = mel * tonic /  master;
    //var sig = SinOsc.ar(f,mul:LFNoise2.kr(1/16!8)) +PinkNoise.ar(0.1!8);
    var t =  SinOsc.ar([1/200,1/5,f/10]) * f/10;
    var sig = Perlin3.ar(t[0],t[1],t[2]);

    sig = Vibrato.ar(sig,[3,4,5,6,5,6,7],0.02) ;//SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
    sig = LPF.ar(sig,LFSaw.ar(1/16/[1,2,3,4]).range(100,10000));
    //sig = MoogFF.ar(sig,f*4,3.5);
    //sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),1/f,1/f*4,4);
    sig = Resonz.ar(sig,f,0.84);
    sig= CombN.ar(sig,1/f,1/f*4,1);
    sig = LeakDC.ar(sig);
    sig = AllpassN.ar(sig * (LFTri.ar(speed)**8),1/f,1/f*10,1/2);
    sig = CompanderD.ar(sig,3/4,1/2,1/100);
    sig = Limiter.ar(sig);
    //sig = sig * LFSaw.ar(speed);
    Splay.ar(sig,0.95,0.5);
  };
  ~harm.play;
  ~harm[1] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,200),3500),[4020,4000])+sig;};
);
~harm.stop(4);
~harm.clear;
~harm.pause;
~harm.resume;

[5/4,3/2,15/8]
[9/8,4/3,5/3,2]

[6/5,5/4,4/3,3/2,5/3,2/1]
