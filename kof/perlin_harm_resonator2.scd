


~tempo={121.5/60}

// harm synth ///////////////////////////////////////

(
  ~harm.ar(2);
  ~harm.quant=2;
  ~harm.fadeTime=2;
  ~harm={
    var speed = 1/8/(1..6);
    var master = Duty.kr(1/speed*16,0,Dseq([1,1.33333,2,1.5].pyramid,inf));
    var change = Impulse.kr(speed);
    var tonic = Duty.kr(1/speed*2,Dseq([1,1.3333,1.5,1.666666,2].scramble.pyramid,inf)) ;
    var mel = Duty.kr(1/speed,0,Dseq([1,2,3,4,1,2,3,5].scramble.octcps,inf));
    var f = mel / tonic /  master;
    //var sig = SinOsc.ar(f,mul:LFNoise2.kr(1/16!8)) +PinkNoise.ar(0.1!8);
    var t =  LFSaw.ar([1/200,1/400/[1,2,3.4],f/1000]) * f*10*LFSaw.ar(1/40/[1,2,3,4,5,6]);
    var sig = Perlin3.ar(t[0],t[1],t[2]);

    sig = Vibrato.ar(sig,[3,4,5,6,5,6,7],0.2) ;//SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
    sig = LPF.ar(sig,LFSaw.ar(1/160/[1,2,3,4]).range(100,18000));
    //sig = MoogFF.ar(sig,f*4,3.5);
    //sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),1/f,1/f*4,4);
    //sig = Resonz.ar(sig,f,0.04);
    sig = sig * Pulse.ar(speed);
    sig= CombC.ar(sig,1/f,1/f*4,8);
    sig = LeakDC.ar(sig);
    sig = AllpassC.ar(sig * (LFTri.ar(speed)**8),1/f,1/f*10,8);
    sig = CompanderD.ar(sig,3/4,1,1/10);
    sig = Limiter.ar(sig);
    //sig = sig * LFSaw.ar(speed);
    Splay.ar(sig,0.75,0.25);
  };
  ~harm.play;
  ~harm[1] = \filter -> {|sig| GVerb.ar(LPF.ar(HPF.ar(sig,200),3500),[90,100])+sig;};
);
~harm.stop(4);
~harm.clear;
~harm.pause;
~harm.resume;

[5/4,3/2,15/8]
[9/8,4/3,5/3,2]

[6/5,5/4,4/3,3/2,5/3,2/1]
