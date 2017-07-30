
p.push();


// noiseSaw synth ///////////////////////////////////////

(
~noiseSaw.ar(2);
~noiseSaw.clock = p.clock;
~noiseSaw.quant=2;
~noiseSaw.fadeTime=4;
~noiseSaw={
    var change = Impulse.kr(~tempo/4);
    var mod = Duty.kr([4,8,16]/.x[1,2,3]/~tempo,0,Dseq([0.75,0.33335,0.75,0.5,0.125,0.3333,0.66666],inf)).lag(1/4);
    var f = [220.001,110.3*8,11.1,22.001]/(mod+1)+SinOsc.ar([7,8,9]+SinOsc.kr(1/4,mul:4));
  var sig = VarSaw.ar(f+(1..12).log,mul:SinOsc.ar(f*2)/(1..12)) + Resonz.ar(LFNoise0.ar(15000!2),f*4,0.02);
  sig = LPF.ar(sig,15000);
  sig = HPF.ar(sig,40);
  
  Splay.ar(sig,0.5,0.25);
};
~noiseSaw.play;
);
~noiseSaw.stop(4);
~noiseSaw.clear;
~noiseSaw.pause;
~noiseSaw.resume;

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
