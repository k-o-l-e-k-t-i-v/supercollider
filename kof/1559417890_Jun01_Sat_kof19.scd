

p.push();
p.bpm(120)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var mod = 1/[1,2,4,8]/Duty.kr([4,16,32,64]/~tempo,0,Dseq([1,2,1.5,1.33333,2,15/8,4,4/3],inf));
  var sig = Resonz.ar(Pulse.ar(4/[1,2]),LFSaw.ar(4/[1,2,3,4]).range(50,1500),LFNoise1.kr(1/16).range(0.01,0.5));
  sig = CombL.ar(sig,1/50,mod/[50.1,50.2,50.3,50.04],1/2*[1,2,4,8]);
  Splay.ar(sig,0.15,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
