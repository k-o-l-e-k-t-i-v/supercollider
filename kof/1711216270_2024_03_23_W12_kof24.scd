

p.push();



// pulse synth ///////////////////////////////////////

~tempo = {110/120};

(
~pulse.ar(2);
~pulse.quant=0;
~pulse.fadeTime=2;
~pulse={
    var sig = Pulse.ar(~tempo*2/[1,2]);
    Splay.ar(sig,0.5,0.05);
};
//~pulse.play;
);
~pulse.mold(2);
~pulse.stop(4);
~pulse.clear;
~pulse.pause;
~pulse.resume;


// looper synth ///////////////////////////////////////

(
b = Buffer.alloc(s, 15 * s.sampleRate,2);

~looper.ar(2);
~looper.quant=4;
~looper.fadeTime=2;
~looper={
    var mel = Duty.kr([1,2]/4/~tempo,0,Dseq([[1,5],[5,8],[1,8],[5,7]],inf));
    var freq = 40 * (2**(mel/12)+1);
    var bufnum = b.bufnum;
    var sig = SoundIn.ar([0,1]);
    var recHead = Perlin3.ar(LFSaw.ar([1.314,1]/16).cos*2pi,LFSaw.ar(1/2000).sin*2pi,LFSaw.ar(1/60).sin*2pi) + 1 * s.sampleRate * 7.5 / 5000 + Phasor.ar(0,BufRateScale.kr(bufnum),0,BufFrames.kr(0));
    var playHead = Phasor.ar(0,BufRateScale.kr(bufnum),0,BufFrames.kr(0));
    var existingSig = LPF.ar(BufRd.ar(2, bufnum, recHead),16000);
    existingSig = existingSig + sig * 0.98;//(GVerb.ar(LeakDC.ar(CombL.ar(sig,2/freq,1/freq,1/4)),90,3)/2);
    BufWr.ar(existingSig , bufnum, playHead);
    Splay.ar(existingSig,0.95,0.45);
};
~looper.play;
);
~looper.stop(30);
~looper.clear(60);
~looper.pause;
~looper.resume;
