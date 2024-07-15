p.push();


~freq = {4850.75};
~tempo = {110/60};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var oct = Duty.kr([1,2,3,4]/~tempo,0,Dseq([8,16,8,32,8,64,8,16,8,4/3],inf));
    var chord = 2**([1,11,5,8]/12+1);
    var sig = SinOsc.ar(~freq/[2,4,8,16]/oct*chord,LFNoise1.kr(~tempo/36!4)*2pi,mul:LFSaw.kr(~tempo/[1,2,3,4])**2);
    
    sig = LFPulse.ar(~tempo*2/[1,2,3,4])*sig;
    sig = CombL.ar(sig,192/~freq,36/~freq,2)/24+sig;
    sig = GVerb.ar(sig,90,5)/16+sig;
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(30);
~one.clear;
~one.pause;
~one.resume;

Delay
