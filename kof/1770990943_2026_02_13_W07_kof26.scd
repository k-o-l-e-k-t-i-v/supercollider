p.push();
p.bpm(83);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=36;
~one.fadeTime=2;
~one={
    var mod2 = Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var mod = 1/(1+Duty.kr([90,16,36,48]/~tempo,0,Dseq([1,5,8,11]/12,inf))**2);
    var sig = SinOsc.ar([200,400,100,150]*mod2*mod) * Pulse.ar(~tempo*2/[1,2,3,4]).softclip;
    Splay.ar(sig,0.95,0.15);
};
~one.play;
);
~one.stop(30);
~one.clear;
~one.pause;
~one.resume;
