

p.push();
p.bpm(88);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=[4,0];
~one.fadeTime=0.12;
~one={
    var mod = Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) + SinOsc.kr(1/[1,2,3,4]*~tempo).range(0.001,0.02);
    var del = ~tempo/SinOsc.ar(~tempo/4*[1,2,3,4]).range(16,1600);
    var puls = DelayN.ar(LFTri.ar(4/[1,2,3,4]*~tempo)**1.5,del,del);
  var sig = SinOsc.ar([50,50.0005,500/mod,250*mod],mul:[1,1,0.2,0.14]) * puls;
  Splay.ar(sig,0.95,0.2);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
