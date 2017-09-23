
p.push();
p.bpm(45);


// symmtery synth ///////////////////////////////////////

(
~symmtery.ar(2);
~symmtery.clock = p.clock;
~symmtery.quant=4;
~symmtery.fadeTime=4;
~symmtery={
    var ml = LFTri.ar(~tempo/512)**2*4;
    var f = 45;
  var sig = SinOsc.ar([f,f/16,f/128],mul:ml);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  sig = sig * LFTri.ar(~tempo);
  Splay.ar(sig,0.15,SinOsc.ar(f,LFNoise1.kr(~tempo/320)));
};
~symmtery.play;
);
~symmtery.stop(4);
~symmtery.clear;
~symmtery.pause;
~symmtery.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=20,rev = 3|
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
