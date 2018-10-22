

p.push();
p.makeTempoClock;
p.bpm(121.5);
~tempo={LFNoise2.kr(1/15!3).range(1.96,2.04)};
~tempo.mold(3);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var alter = Duty.kr(8/~tempo,0,Dseq([5,7,5,7,5,2,3,11,2,2,2],inf));
    var mod2 = Duty.kr(32/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
    var mod = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf)) * mod2;
  var f = 60.midicps*[1,2,4]/mod * ([2,3,alter,11]).log2 + SinOsc.kr([3,5,11].log2 * 4.32);
  var sig = Pluck.ar(WhiteNoise.ar(1!3),Impulse.ar(~tempo*2/[1,2,3]),[1,2,4]/f,[4,2,1]/f,LFNoise2.kr(1/15!3).range(0.1,1.5));
  sig = (LPF.ar(sig,f)*4).distort;
  sig = MoogFF.ar(sig,f*4,0.2);
  sig = CombL.ar(sig,~tempo,~tempo*[1.01,1.0],3);
  Splay.ar(sig,0.5,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


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
