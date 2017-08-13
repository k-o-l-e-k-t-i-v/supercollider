
p.push();

// roatate synth ///////////////////////////////////////

(
~roatate.ar(2);
~roatate.clock = p.clock;
~roatate.quant=2;
~roatate.fadeTime=4;
~roatate={
    var t = LFSaw.ar(50).range(0,2pi);
    var x = t.cos;
    var y = t.sin;
    var z = 0;
    var angle = LFSaw.ar(1/600).range(0,8pi);
    var nx = (angle.cos * x) - (angle.sin * y);
    var ny = (angle.sin * x) - (angle.cos * y);
    var nz = (angle.sin * x) - (angle.sin * y);
    var sig = Perlin3.ar(nx,ny,nz);
  Splay.ar(sig,0.5,0.25);
};
~roatate.play;
);
~roatate.stop(4);
~roatate.clear;
~roatate.pause;
~roatate.resume;
