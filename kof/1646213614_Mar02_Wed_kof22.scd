

p.push
~tempo={121.35/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.4;
~one={
    var puls = Pulse.ar(~tempo);
    var sig = SinOsc.ar([50,60],puls*2pi) * puls;
    var len = LFSaw.kr(~tempo*4).exprange(1/2,4.001).lag(0.1);
    sig = CombN.ar(sig,len/~tempo,len/~tempo,1);
  Splay.ar(sig,0.5,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
