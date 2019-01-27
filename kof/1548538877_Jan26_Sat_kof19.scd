


p.push();

2**16
b = Buffer.alloc(s,48000,2);
b.free;


// rec_fade synth ///////////////////////////////////////

(
~rec_fade.ar(2);
~rec_fade.clock = p.clock;
~rec_fade.quant=2;
~rec_fade.fadeTime=4;
~rec_fade={
  var sig = LFNoise1.ar(125!2) + LFNoise1.ar(50!2) + LFNoise1.ar(16!2);
  sig = Normalizer.ar(sig);
  RecordBuf.ar(sig,b.bufnum,loop:0);
//  Splay.ar(sig,0.5,0.25);
};
//~rec_fade.play;
);
~rec_fade.stop(4);
~rec_fade.clear;
~rec_fade.pause;
~rec_fade.resume;

// dusts synth ///////////////////////////////////////

(
~dusts.ar(2);
~dusts.clock = p.clock;
~dusts.quant=4;
~dusts.fadeTime=4;
~dusts={
    var progression = 1;
    var mid = Duty.kr([16,32,64]/~tempo/progression,0,Dseq([60,64,60,62,65,67,64,72].pyramid,inf));
  var f = [mid[0],mid[1],mid[2]].midicps * 2 + SinOsc.kr([1,2.01,4.0201]);
  var sig = Shaper.ar(b.bufnum,LFSaw.ar(f)/10+SinOsc.ar(f/2.01)/5+LFSaw.ar(~tempo/32/[1,2,4])) * LFTri.ar(~tempo/[16,32,64]*progression);
  sig = MoogVCF.ar(sig,f,LFNoise1.kr(~tempo/4/[2,3,4]).range(0.1,0.5));
  sig = sig + Mix(LPF.ar(sig,f));
  sig = HPF.ar(sig,5);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.75,0.45);
};
~dusts.play;
);
~dusts.stop(4);
~dusts.clear;
~dusts.pause;
~dusts.resume;

(
  ~master.quant=4;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
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




