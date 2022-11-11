

s.reboot;
p.push();
~tempo={75/60}
// seventy-five synth ///////////////////////////////////////
// 2022-10-13 09:42

(
~seventy.ar(2);
~seventy.quant=0;
~seventy.fadeTime=5;
~seventy={
    var base = {[75,75.02,75*2,75*3,75*4,75*8].choose}!6;
    var chord = {[1,2,4,8,16,5/4,4/3].choose}!6;
    var mel = Duty.kr([4,8,16,32]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var harm = (1+(1/( {(1..24).choose}!12**2) ));
    var sig = SinOsc.ar(base*[chord]*harm,LFNoise2.kr(~tempo/32!12).range(0.001,0.4)) + LFSaw.ar(base/[chord]/2*mel,mul:0.2);
    sig = sig * ([] ++ [1,1] ++ Pulse.ar(~tempo*4/{(1..24).nthPrime.choose}!6,[4.0,1.0]/.x(1..7))).softclip;
    sig = CombL.ar(sig,2/75,mel/75,16) / 32 + sig;
    sig = CombL.ar(sig,mel/~tempo,1/~tempo,2) / 4 + sig;
    sig = CompanderD.ar(LPF.ar(sig,200),3/4,1/1.5,1)/4 + sig;
    sig = CompanderD.ar(HPF.ar(sig,200),3/4,1/1.5,1)/2 + sig;
    sig = CompanderD.ar(BPF.ar(sig,225,0.1),3/4,1/1.5,1)/16 + sig;
    sig = HPF.ar(sig,25);
    Splay.ar(sig,0.45,0.05);
};
~seventy.play;
);
~seventy.stop(4);
~seventy.clear;
~seventy.pause;
~seventy.resume;



~seventy.rebuild;


(
a = Tdef(\reseter, { loop {30.wait; ~seventy.rebuild;}}).play;
a.play;
)
a.stop
s.scope
