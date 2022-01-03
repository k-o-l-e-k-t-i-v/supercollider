
s.reboot
p.push();

// one synth ///////////////////////////////////////


a = (2..129).nthPrime%(1..128).nthPrime


// player synth ///////////////////////////////////////

(
~player.ar(2);
~player.quant=8;
~player.fadeTime=4;
~player={
    var mod = Duty.kr((1..24).nthPrime*16,0,Dseq([1,2,4,8],inf));
    var mel = Duty.kr((1..24).nthPrime*2,0,Dseq([1,2,4,8,1.5,1.3333,1/2,1/4,1/8],inf));
    var base = Duty.kr([4,8,16],0,Dseq([60,65,67,48],inf)).midicps * 2;
    var sig = SinOsc.ar(base*mod/mel) * (Decay.ar(Impulse.ar(4/(1..24).nthPrime),0.52*((1..24).nthPrime**0.25)) );
    sig = sig + (LFSaw.ar(base*mod/mel/4,mul:0.02)*Pulse.ar(mel));
    //sig = CombL.ar(sig,1,1/4,4);
    sig = LeakDC.ar(sig);
    sig = CompanderD.ar(sig,sig,3/4,0.5,3/4);
    
    Splay.ar(sig,0.95,0.95);
};
~player.play;
);
~player.stop(1);
~player.clear;
~player.pause;
~player.resume;
