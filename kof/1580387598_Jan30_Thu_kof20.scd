


p.push();
p.bpm(121.35);
b = Buffer.alloc(s,48000,24);
z = Buffer.alloc(s,48000,24);


// one synth ///////////////////////////////////////


(1/12)*((2..13).log2)

(
    ~one.ar(2);
    ~one.quant=0;
    ~one.fadeTime=4;
    ~one={
        var base = Duty.kr([96,24,48]/~tempo,0,Dseq([60,65,67,58]-.x[48,24]+.x[0,7],inf)).midicps.lag(1/120) + SinOsc.kr(~tempo*4.01/[1,2,3,4]/.x(2..24).log2).range(-1,1);
        var imp = Impulse.ar(~tempo*2/[1,2,3,4]);
        var sig = LFSaw.ar(base/(2**(([2,5,7,9]).log2/12)));
        var env;
        imp = BufDelayN.ar(b.bufnum,imp,
            SinOsc.kr(~tempo/120/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.5) + 
            SinOsc.kr(~tempo/12.0001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.05) + 
            SinOsc.kr(~tempo/1.20001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.005) 
        );
        env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3]),imp);
        sig = sig * env;
        sig = BufDelayN.ar(z.bufnum,sig,
            SinOsc.kr(~tempo/1200/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.5) + 
            SinOsc.kr(~tempo/120.001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.05) + 
            SinOsc.kr(~tempo/12.0001/[1,2,3,4]/.x(2..24).log2).range(0.0001,0.005) 
        );
        sig = LPF.ar(sig,1500+LFSaw.ar(~tempo/4/(1..25)).exprange(0.0001,15000));
        Splay.ar(sig,1,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
