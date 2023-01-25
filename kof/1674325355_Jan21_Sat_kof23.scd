


p.push();
~tempo = {(SinOsc.kr(1/37.5).range(-1,1)+110)/60}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0.1;
~one={
    var disharm = SinOsc.kr(~tempo/37.5*4/[1,2,3,4],mul:0.05);
    var harm = [4/3,3/2,2/1,4] *.x Duty.kr(16/~tempo,0,Dseq(1+(1/[1,3,5,2]),inf)) *.x Duty.kr(1/4/~tempo,0,Dseq((1/[1,3,5,2]),inf)) + disharm;
    
    var sig = SinOsc.ar([40,[40,80],80*1.5]*harm);
    sig = sig * Pulse.ar(~tempo*4/[1,2,3,4])/16 + sig;
    //sig = CombL.ar(sig,8/~tempo,8/~tempo,37.5)/16+sig;
    Splay.ar(sig,SinOsc.kr(~tempo/37.5).range(0,1),0.055);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
