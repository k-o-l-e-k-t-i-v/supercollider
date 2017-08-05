




p.push();
p.bpm(90);

// osc synth ///////////////////////////////////////

(
~osc.ar(2);
~osc.clock = p.clock;
~osc.quant=4;
~osc.fadeTime=2;
~osc={
    var mod = Duty.kr([4,16,32]*4/~tempo,0,Dseq([1,2,1.5,1.33333,1.66667,1,2,4,1.125],inf));
  var f = 432/[1,2]/[1,1.5,1.33333]*mod;
  var sig = LocalIn.ar(3) + (Dust.ar(f).lag(1/f) * Pulse.ar( ~tempo * 2 / [1,2,3] ));// * TChoose.kr(Impulse.kr(~tempo/16!3),[1,4,1/2,2,1/2])));
  sig = DelayN.ar(sig,256/f,1/f);
  
  sig = 
  BPF.ar(sig,f,LFNoise2.kr(~tempo/4!3).exprange(0.01,0.4),mul:LFNoise2.kr(~tempo/16!3).exprange(0.9857,0.9));// * LFNoise1.kr(~tempo/3!3).range(0.9,1.032);
  
  //sig = CombN.ar(sig,1/4,2/f,1/4);
  LocalOut.ar(sig,3);  

  sig = Perlin3.ar(sig[0]+SinOsc.ar(f/2.01,add:1,mul:0.01),sig[1]+SinOsc.ar(f/16+0.0324,add:1,mul:0.01),sig[2]+SinOsc.ar(f/[1,2,4,16,320,3200],mul:0.1).range(0,1/64));
  sig = LeakDC.ar(sig) * LFTri.ar(~tempo/16/[1,2,3]);
  sig = AllpassN.ar(sig,64 / f,[1.01,2,4] /.x f,4);
  sig = CompanderD.ar(sig + Resonz.ar(sig,f,LFNoise2.kr(~tempo/64!3).range(0.01,0.4),mul:LFNoise1.kr(~tempo/16!3)),3/4,1/1.5,1);
  sig = CompanderD.ar(sig + LPF.ar(sig,500,mul:LFNoise1.kr(~tempo/16!3)),3/4,1/1.5,1);
  sig = CompanderD.ar(sig + HPF.ar(sig,5000,mul:LFNoise1.kr(~tempo/16!3)),3/4,1/1.5,1);
  Splay.ar(sig,0.75,0.3333,SinOsc.kr([6.9,7.1]+LFNoise1.kr(~tempo/4!2)));
};
~osc.play;
);
~osc.stop(4);
~osc.clear;
~osc.pause;
~osc.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
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

10.for({|n| n.postln;});


LocalIn.help
