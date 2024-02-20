

p.push();
~tempo={110/120*2}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=2;
~one={
    var len = LFNoise1.ar(~tempo/4!4,0.1,1.0);
    var fourth = Duty.kr([4,8,16,24]/~tempo,0,Dseq([1,8,3,5],inf));
    var harm = 2**((([1,5,8,fourth])/12)+1);
    var sig = LFSaw.ar(300/[4,2,1/8,8]*harm,mul:0.1);
    sig = sig + SinOsc.ar(300/[1,2,1/4,8]*harm,mul:0.2) * Decay.ar(Impulse.ar(~tempo*4/[1,2,3,4]),len);
    sig = LPF.ar(sig,[1400,2400]);
    sig = GVerb.ar(sig,[60,70,80],3)/16+sig;
    Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear(30);
~one.pause;
~one.resume;
