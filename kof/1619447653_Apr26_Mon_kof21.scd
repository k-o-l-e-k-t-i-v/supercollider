p.push();


~tempo={0.8634};


// metric_tick synth ///////////////////////////////////////

(
~metric_tick.ar(2);
~metric_tick.quant=4;
~metric_tick.fadeTime=4;
~metric_tick={
    var width = LFNoise1.kr(~tempo/24/(1..12)).range(1,40);
    var base = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf))  * [60,65].midicps;
    var noise = Perlin3.ar( LFTri.ar(( 1+((1..12)/12) *2pi)*base).sin+1*width , LFSaw.ar(base*4*(1+(1/(1..12)))).cos+1 , LFSaw.ar(base*(1+(1/(1..12)))).sin+1 );
    var sig = noise * Decay.ar(Impulse.ar(~tempo/2*(1+(1/(1..12)))),0.1*(1..12)) + (noise*Pulse.ar(~tempo*4/[1,2,3,4])/10);
    //sig = sig + (CombC.ar(sig,4/3/~tempo,4/3/~tempo,~tempo/2)*ToggleFF.ar(Impulse.ar(~tempo/4)));
    sig = LPF.ar(sig,500) + HPF.ar(sig,12000);
  Splay.ar(sig,0.25,0.95);
};
~metric_tick.play;
);
~metric_tick.stop(16);
~metric_tick.clear;
~metric_tick.pause;
~metric_tick.resume;


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
