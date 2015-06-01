

(
~fun.quant=2;
~fun.fadeTime=2;
~fun={
    var mod = Duty.kr(4,0,Dseq([1,2,4,8]*0.25pi,inf));
    var sig = (Blip.ar(43.2,[10,20,40,80,2]) ++ WhiteNoise.ar(0.1!2) ++ LFSaw.ar(50) ++ SinOsc.ar(10000/mod,mul:0.2)).scramble;
    sig = sig * (Decay.ar(Impulse.ar(1/[2,4,8],(0..7)++[0.25,0.5]/8),[1,2,4])**2);
    sig = Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(80.001,16000));
    sig = GVerb.ar(sig,[10,20,100,8])/2+sig;
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,1);
};
~fun.play;
);
~fun.stop(7);

