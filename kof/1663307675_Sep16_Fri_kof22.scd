
p.push();

~tempo = 1;
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=4;
~one={
    var mod = (1..8) / 10.0;
    var mod2 = (2..16) / 100.0;
    var mod3 = (2..16) / 1000.0;
    var mel = 1;//Duty.kr([240/[1,3,5,7],1,3,5,7]/~tempo,0,Dseq(1+(1/[1,2,3,5,7]),inf));
    var harm = [50,50.01,60,59.95] * [1,1.5,5/4,2,4,8,16] /.x [1,2,1.5,0.5] *.x [1,2,1/2] + SinOsc.kr(mod2,mul:0.01) * mel;
    var sig = Pulse.ar(harm, SinOsc.kr(mod).range(0.01,0.99) , 0.2);
    sig = XFade2.ar(SinOsc.ar(harm,mul:0.2),sig,LFSaw.kr(~tempo/4);
    sig = LPF.ar(sig,harm * SinOsc.kr(mod3).range(1,1.5));
    sig = HPF.ar(sig,30);
    Splay.ar(sig,0.95,0.75);
};
~one.play;
);
~one.stop(240);
~one.clear(24);
~one.pause;
~one.resume;
