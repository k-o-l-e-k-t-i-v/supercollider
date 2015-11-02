

(
  p.clock.tempo_(2);
);

// mld synth ///////////////////////////////////////

(
~mld.ar(2);
~mld.quant=2;
~mld.fadeTime=4;
~mld={
  var mod = Duty.kr(16/~tempo.kr,0,Dseq([1,2,1.5,1.3333]*43.2*pi,inf));
  var sig = LFSaw.ar(mod/[1,1.5,1.25,1.3333],mul:0.5);
  sig = LPF.ar(sig,800) * LFTri.ar(~tempo.kr/[1,2,4,8]).exprange(0.0001,1);
  Splay.ar(sig,0.5,0.5);
};
~mld.play;
);
~mld.stop(4);
~mld.clear;
~mld.pause;
~mld.resume;

