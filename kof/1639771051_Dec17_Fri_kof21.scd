

p.push();
~tempo = {0.864};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=12;
~one.fadeTime=0.04;
~one={
    var mel = Duty.kr(1/[1,2,3,4]/4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar(35!2+(Pulse.ar(0.864*1/32.001*[4,3,2,1])*440/mel),SinOsc.ar(0.864/[1,2,3,4])+1*2pi);
    Splay.ar(sig,0.5,0.095);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=4;
~two={
    var mod = (1+(1/(1..24))).log;
    var sig = LFSaw.ar([440/mod,44.001,LFTri.ar((1..4)/24/mod).exprange(1.0001,24)])*2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2]*LFSaw.ar(1/(1..4)/24,mul:20));
    sig = LeakDC.ar(sig);
    sig = LPF.ar(sig,1500);
    sig = CombL.ar(sig,1,1/44.01/mod,2);
  //  sig = CompressorD.ar(sig,sig,3/4,1,1);
    Splay.ar(sig,0.95,0.0525);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
