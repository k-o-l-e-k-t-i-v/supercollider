

(
  p=ProxySpace.push(s.reboot);
//  e=ProxySubmix.new(\filter);
);


// zeman synth ///////////////////////////////////////

(
~weirdo.quant=1;
~weirdo.fadeTime=0.02;
~weirdo={
  var sig = AudioIn.ar([0,1]);
  var pure = sig;
    var x,y;
    //#x,y = Rotate2.ar(sig[0],sig[1],SinOsc.ar(1/fib(4)));
    //sig = [x,y];
  //sig = Normalizer.ar(sig);
  sig = PitchShift.ar(sig,0.25,LFNoise2.kr(1/4!8).range(0.95,1.125)) * LFNoise2.kr(1/4!8);
  sig = MoogFF.ar(sig,LFNoise2.kr(1/4!4).range(200,12000),3.5*LFNoise2.kr(0.1!4)) + sig;
  sig = GVerb.ar(HPF.ar(sig,50) + LPF.ar(sig,8000),[10,90],[3,4,5,6],spread:[5,90])/4 + sig;
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig.flat + pure,0.75,1);
};
//      e.addMix(~zeman,postVol:true);
~weirdo.play;
);
~weirdo.stop(7);
~weirdo.clear;

