p.push();


s.sendMsg(\b_alloc,800,1024);
s.listSendMsg([\b_gen,800,\cheby,8] ++ {1.0.rand.squared}.dup(6));

// one synth ///////////////////////////////////////

// player synth ///////////////////////////////////////
(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.45,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/violin.wav");
(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var mod = Duty.kr((1..16).nthPrime*4,0,Dseq([1,2,1.5,1.33333],inf));
  var f = TChoose.kr(Impulse.kr(1/(1..16).nthPrime),([60,36,48,72,24,12,84]).midicps)/mod;// + mod.octcps;
  var t = LFTri.ar([f,1/f,1/16/(1..16).nthPrime]) + LFSaw.ar(1/500/(1..9));
  var perl = Perlin3.ar(t[0],t[1],t[2]);
  //var sig = Shaper.ar((1..9),LFTri.ar(1/f * ((1..16).nthPrime%16))**1.001 ) * (LFTri.kr(1/16/(1..16).nthPrime)**4);
  var sig = Shaper.ar(b,perl/100000+LFSaw.kr(1/6000/(1..16)) ) * (LFTri.kr(1/(1..16).nthPrime)**2);
  sig = LPF.ar(sig,1500);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


Shaper.help
