
p.push();
p.bpm(103.68)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var f = 103.68 * 2 * [1,2,1.33334,1/1.5];
    var mod = Duty.kr([1,2,3,4]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var tem = ~tempo*2/[1,2,3,4];
  var sig = LFSaw.ar(f/mod,Pulse.ar(tem)*2pi) * Pulse.ar(tem);
  var ll = tem/f*10;
  sig = sig + (sig * Pulse.ar(tem/1.5));
  10.do{|i|
      
  sig = DelayN.ar(sig,ll,ll);
  sig = MoogVCF.ar(sig,f*2,LFDNoise1.kr(i+1/16*~tempo).range(0.001,0.999));
  sig = Normalizer.ar(sig);
  };
  Splay.ar(sig,0.25,0.75);
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
