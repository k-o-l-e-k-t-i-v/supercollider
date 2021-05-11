p.push();
~tempo = {3/4*(121.35)/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=6;
~one.fadeTime=0.1;
~one={
    var duty = Duty.kr([1,2,3]/4/~tempo,0,Dseq([0,2,4],inf));
    var sig = SinOsc.ar(base*harm*(1+(duty/12))) * LFPulse.ar(~tempo/(1+12/(duty)));
    sig = Mix(sig);
    Splay.ar(sig,0.5,0.35);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
