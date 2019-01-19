


b.free;
b=Buffer.alloc(s,48000*4,1);

p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
    var t = LFNoise1.ar([2,4,80])*2pi;
  var sig = Perlin3.ar(t[0].cos,t[1].sin,t[2].sin);
  //sig = Normalizer.ar(Mix(sig));
  sig = RecordBuf.ar(Mix(sig),b.bufnum,loop:0);
};
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// shaper synth ///////////////////////////////////////

(
~shaper.ar(2);
~shaper.clock = p.clock;
~shaper.quant=4;
~shaper.fadeTime=4;
~shaper={
    var f = [60,65,71,67].midicps/2;
  var sig = Shaper.ar(b.bufnum,SinOsc.ar(50)/10+LFSaw.ar(1/4));
  sig = LeakDC.ar(sig);
  //sig = LPF.ar(sig,f*2);
  sig = sig.softclip;
  //RecordBuf.ar(Mix(sig),b.bufnum,0,0.05,1,loop:1);
//  sig = MoogFF.ar(sig,1500,3.2) + LPF.ar(sig,500);
  
  Splay.ar(sig,0.5,0.5);
};
~shaper.play;
);
~shaper.stop(4);
~shaper.clear;
~shaper.pause;
~shaper.resume;
