

p.bpm(90)
p.push();


// noiseHarmonics synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar([20,41,82]!2+(env**90*80),env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


(
~noiseHarmonics.ar(2);
~noiseHarmonics.clock = p.clock;
~noiseHarmonics.quant=4;
~noiseHarmonics.fadeTime=4;
~noiseHarmonics={
    var mod = LFTri.ar(~tempo/[2,3,4]/4).exprange(1/40,1);
    var f = [60,72.02,48.001].midicps /.x TChoose.kr(Impulse.kr(~tempo/[2,3,4]),[1,2,1.333335,1.5,2,1/2,1/1.333333,1/1.5]) + SinOsc.kr(~tempo/[1,2,3]/4.1,mul:1/4);
  var sig = Formant.ar(f,f/10,f*4.0144).range(mod/2,mod*2) + SinOsc.ar(1/f,mul:1/8).range(mod/4,mod*4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LFTri.ar(~tempo/[2,3,4]) * 2;
  sig = LeakDC.ar(sig);
  sig = CombL.ar(sig,256/f,256/f,8);
  sig = Vibrato.ar(sig,[6,7,8],0.1);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  //sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.5);
};
~noiseHarmonics.play;
);
~noiseHarmonics.stop(4);
~noiseHarmonics.clear;
~noiseHarmonics.pause;
~noiseHarmonics.resume;


// kick synth ///////////////////////////////////////
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
