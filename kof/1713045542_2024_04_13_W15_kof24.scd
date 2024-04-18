p.push();


~tempo = {110/120};

// ptnc synth ///////////////////////////////////////

(
~ptnc.ar(2);
~ptnc.quant=0;
~ptnc.fadeTime=2;
~ptnc={
    var base = [220,440,880,880*2];
    var harm = (2**([1/2,2/3,3/4,4/5]/5+1));
    var env = Decay.ar(Impulse.ar(~tempo*4/[2,3,4,5]),0.1);
    var sig = SinOsc.ar(base*harm,mul:env);
    Splay.ar(sig,0.5,0.25);
};
~ptnc.play;
);
~ptnc.stop(4);
~ptnc.clear;
~ptnc.pause;
~ptnc.resume;
