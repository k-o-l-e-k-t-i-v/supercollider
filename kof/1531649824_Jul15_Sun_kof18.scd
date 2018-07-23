

p.push();


// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.clock = p.clock;
~saw.quant=4;
~saw.fadeTime=4;
~saw={
    var f = 43.2 *4* Duty.kr(16/~tempo*[1,2,3],0,Dseq((2**([102,408,600,1100].scramble.pyramid/1200)),inf)).lag(1/4);
  var tt = LFSaw.ar(f/4/[1,2,3]).range(0,2pi);
  var x = tt.cos;
  var y = tt.sin;
  var z = SinOsc.ar(f,tt,add:LFTri.ar(f/16).range(1,4),mul:LFTri.ar(f/[1,2,1.5]))/100 + LocalIn.ar(3);
  var sig = Perlin3.ar(x,y,z);
  sig = CombN.ar(sig,16/f,4/f,1/4);
  sig = LPF.ar(sig,f);
  sig = LeakDC.ar(sig);
  LocalOut.ar(DelayN.ar(sig,1/f,1/f));
    Splay.ar(sig,0.5,0.75);
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;
