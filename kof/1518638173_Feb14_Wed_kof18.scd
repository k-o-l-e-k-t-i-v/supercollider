


p.push();
p.bpm(120)


// intro synth ///////////////////////////////////////

(
~intro.ar(2);
~intro.clock = p.clock;
~intro.quant=4;
~intro.fadeTime=4;
~intro={
    var mel2 = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1);
    var mel = Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1) * mel2;
    var a = LFSaw.ar(~tempo / 32 * [1,2,[3,5]] ) * 4;
    var perl = Perlin3.ar(a[0],a[1],a[2]);
    var f = 8000/[1,2,4,8,16,32,1.5,1,1.33333].reverse+[0.0,0.01] + (perl*8.08/4) / mel;
  var sig = Formant.ar( f , f /.x 8, f /.x 4 + perl ) * SinOsc.ar( f / 4.0188, perl*2pi,mul: 0.5) * (LFSaw.ar(~tempo/4*((1..32).reciprocal+1))**4);
  Splay.ar(sig,0.25,0.75);
};
~intro.play;
);
~intro.stop(4);
~intro.clear;
~intro.pause;
~intro.resume;
