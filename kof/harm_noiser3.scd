
p.push();

p.bpm(90);

// harm synth ///////////////////////////////////////

(
  ~harm.ar(2);
  ~harm.quant=4;
  ~harm.fadeTime=3;
  ~harm={
    var speed = 1/2/(1..8) * ~tempo;
    var master = Duty.kr(16/speed,0,Dseq([1,1.33333,2,1.5,4].pyramid,inf));
    var change = Impulse.kr(speed);
    var tonic = Duty.kr(8/speed,0,Dseq([1,5/4,3/2,15/8].scramble.pyramid,inf)) ;
    var mel = Duty.kr(16/speed,0,Dseq([0,2,0,4,0,6,0,1].scramble.octcps,inf));
    var f = mel * tonic + SinOsc.kr(1/6/(1..4),mul:0.3) /  master / [1,1/2,2];
    //var sig = SinOsc.ar(f,mul:LFNoise2.kr(1/16!8)) +PinkNoise.ar(0.1!8);
    var sig = BrownNoise.ar(1!8);

    sig = Vibrato.ar(sig,[3,4,5,6,5,6,7],0.02) ;//SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
    sig = LPF.ar(sig,2000);
    //sig = MoogFF.ar(sig,f*4,3.5);
    //sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),1/f,1/f*4,4);
    sig = Resonz.ar(sig,f,0.4);
    sig= CombN.ar(sig,4/f,2/f,8);
    sig = LeakDC.ar(sig);
    sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),4/f,2/f,8);
    sig = CompanderD.ar(sig,3/4,1,1/10);
    //sig = sig * LFSaw.ar(speed);
    Splay.ar(sig,0.335,0.45);
  };
  ~harm.play;
  ~harm[1] = \filter -> {|sig| DWGReverbC1C3.ar(LPF.ar(HPF.ar(sig,200),3500),[4020,4000])/2+sig;};
);
~harm.stop(4);
~harm.clear;
~harm.pause;
~harm.resume;

[5/4,3/2,15/8]
[9/8,4/3,5/3,2]

[6/5,5/4,4/3,3/2,5/3,2/1]


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
