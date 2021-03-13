


p.push()


~tempo={DC.kr(127/120)};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=0;
~one.fadeTime=4;
~one={
    var base = 60.midicps / Duty.kr([4,16,24]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var detune = SinOsc.ar(~tempo.kr/24/[2,3,4]) * 2;
    var sig = SinOsc.ar(base*(([2,4,6,8].nthPrime%[1,3,5,7].nthPrime).log)+detune) +1 * 2pi;
    var shift = LFTri.ar(~tempo/[16,24,32],mul:5);
    var vc  = SinOsc.ar(~tempo/[16,32,24])+1.001*10;
    sig = Perlin3.ar(sig[0].cos/vc+shift[0],sig[1].sin/vc+shift[1],sig[2].tan/vc+shift[2]);
    sig = LPF.ar(sig,5000);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
