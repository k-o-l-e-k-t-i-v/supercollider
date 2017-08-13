


p.push();


// sroubovice synth ///////////////////////////////////////

(
~sroubovice.ar(2);
~sroubovice.clock = p.clock;
~sroubovice.quant=2;
~sroubovice.fadeTime=4;
~sroubovice={
    var r = 2pi;
    var f = LFSaw.ar(50,mul:2pi);
    var pos = LFSaw.ar(90,mul:2pi) + LFSaw.ar(1/500,mul:100);
  var t = [f,f,pos];
  var x = t[0].cos + 1 / 2 * r;
  var y = t[1].sin + 1 / 2 * r;
  var z = t[2].sin + 1 / 2 * r;
  var sig = Perlin3.ar(x,y,z);
  sig = SinOsc.ar(f,sig*2pi);
  Splay.ar(sig,0.5,0.25);
};
~sroubovice.play;
);
~sroubovice.stop(4);
~sroubovice.clear;
~sroubovice.pause;
~sroubovice.resume;
