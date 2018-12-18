



p.push();


b = Buffer.alloc(s,2048,1);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50);
  RecordBuf.ar(sig,b.bufnum);
  Splay.ar(sig,0.5,0.25);
};
//~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = VOsc.ar(b.bufnum,50);
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
