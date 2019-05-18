



p.push();

// perl1 synth ///////////////////////////////////////

(
~perl1.ar(2);
~perl1.quant=2;
~perl1.fadeTime=4;
~perl1={
    var note = {[60,65,67,72,84,36].choose}!3 + SinOsc.kr(1/[6,7,8],mul:0.01);
    var pos = LFTri.ar(note/4).range(10,LFSaw.kr(1/16).range(10,200));
  var sig = [[SinOsc.ar(note.midicps/[1,15/8,2]/1.5,mul:[6,3,2,1,1/2,1/4].normalize)*4+5+LFTri.ar([1,2,3]/60,mul:6)], [LFTri.ar(1/6/(2..20))*8.17], SinOsc.ar(note.midicps/[1.5,4/3,2]-0.01)+2];
  sig = Perlin3.ar(sig[0],sig[1],pos-sig[2]) *.x Perlin3.ar(sig[2],pos-sig[1],sig[0]);
  sig = SelectX.ar(LFTri.kr(1/16/[1,1.1]).range(0,sig.size+1),sig);
  //sig = LeakDC.ar(sig.softclip);
  sig = Resonz.ar(sig,note.midicps*2,0.2)*4;
  sig = MoogVCF.ar(sig,note.midicps*8,0.12);
  sig = HPF.ar(sig,13);
  Splay.ar(sig,0.05,0.5,0.0,false);
};
~perl1.play;
);
~perl1.stop(4);
~perl1.clear;
~perl1.pause;
~perl1.resume;
