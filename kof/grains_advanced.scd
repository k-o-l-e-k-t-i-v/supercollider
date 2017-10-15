
p.push();

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");
// grain synth ///////////////////////////////////////

p.bpm(45);

(
~grain.ar(2);
~grain.clock = p.clock;
~grain.quant=2;
~grain.fadeTime=4;
~grain={
    var st = LFNoise2.kr(~tempo/64);
    var en = LFNoise2.kr(~tempo/64);
    var sel = LFSaw.ar(~tempo).range(st,en) + LFSaw.ar(256/2,mul:0.001);
  var sig = GrainBuf.ar(2,Impulse.ar(512),4/512,b,1,sel);
  //sig = CombL.ar(sig,~tempo/16,~tempo/16,~tempo);
  //sig = AllpassN.ar(sig,~tempo/32,~tempo/32,~tempo/2);
  sig = HPF.ar(sig,20);
  Splay.ar(sig,0.5,0.25);
};
~grain.play;
);
~grain.stop(4);
~grain.clear;
~grain.pause;
~grain.resume;


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
