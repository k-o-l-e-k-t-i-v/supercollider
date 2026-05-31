p.push();

p.bpm(72);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=10;
~one={
    var harm = 2**((1..24)/24+1);
    var base = 2**([60,120,605]/605+1)*[60,8*60];
    var pulse = LFPulse.ar(~tempo *.x [1,2,3,4] /.x [1,1.5,4/3,5/4]);
    var drift = LFNoise1.kr([1,3,7]/4/24+pulse).lag(1/4) * pulse;
    var sig = SinOsc.ar(base *.x harm + drift,mul:0.2) ++ LFSaw.ar(base *.x harm + drift,mul:0.1);
    sig = sig * pulse;
    Splay.ar(sig,0.95,0.27,LFTri.kr([6,7]/72*4));
};
~one.play;
);
~one.stop(90);
~one.clear;
~one.pause;
~one.resume;
