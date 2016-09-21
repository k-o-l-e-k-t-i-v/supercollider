


// harm synth ///////////////////////////////////////

(
  ~harm.ar(2);
  ~harm.quant=2;
  ~harm.fadeTime=2;
  ~harm={
    var speed = 2;
    var master = Duty.kr(8/speed,0,Dseq([1,1.33333,1.6666667,2,1.5].scramble.pyramid,inf));
    var change = Impulse.kr(speed);
    var tonic = Duty.kr(4/speed,0,Dseq([1,2,1.5,1.33333,1.666666666].scramble.pyramid,inf)) ;
    var mel = Duty.kr(32/speed,0,Dseq([4,5,2,4,4,4,2].scramble.pyramid.octcps,inf));
    var f = mel / tonic /  master;
    //var sig = SinOsc.ar(f,mul:LFNoise2.kr(1/16!8)) +PinkNoise.ar(0.1!8);
    var t =  LFTri.ar([f/8,1/10/[1,2,3,4,5,6],f/160]) * f*LFSaw.ar(1/4/[1,2,3,4,5,6]);
    var sig = Perlin3.ar(t[0],t[1],t[2]);

    sig = Vibrato.ar(sig,[3,4,5,6,5,6,7],0.2) ;//SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
    sig = LPF.ar(sig,LFSaw.ar(1/16/[1,2,3,4,5,6]).range(100,8900));
    sig = MoogFF.ar(sig,f*[1,2,1.5,1.666667,1.3333333,2],0.5);
    //sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),1/f,1/f*4,4);
    //sig = Resonz.ar(sig,f,0.04);
    sig = sig * Pulse.ar(speed);
    sig= CombN.ar(sig,1/f*4,1/f,2)+sig;
    sig = LeakDC.ar(sig);
    //sig = AllpassC.ar(sig * (LFTri.ar(speed)**8),1/f,1/f*10,4);
    //sig = CompanderD.ar(sig,1/2,2,1);
    sig = Limiter.ar(sig);
    //sig = sig * LFSaw.ar(speed);
    Splay.ar(sig,0.45,0.85);
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
