p.push();



~tempo = {LFTri.kr(1/48)**0.98*4}

// test synth ///////////////////////////////////////

(
~test.ar(2);
~test.quant=0;
~test.fadeTime=0.2;
~test={
    var mel = Duty.kr([4,3,12,48],0,Dseq([1,2,1.5,1.33333],inf));
    var pow = [[1,4/3],[4/3,4],[24,48]].scramble/mel;
    var disharm = SinOsc.kr(0.01*[1,2.001,0.98]).range(1.0001,0.998);
    var sig = SinOsc.ar([49.91,75.009,60] * disharm * pow);
    sig = CompanderD.ar(sig,sig+Pulse.ar(1/[1,2,3,4]),0.1,1,0.1) * Pulse.ar([]++4/[1,2,3,4]++(~tempo*2/[1,2,3,4]));
    sig = sig.softclip();
    sig = GVerb.ar(LPF.ar(sig,2900),10,3,0.5,0.5,33)/8+(sig/4);
    Splay.ar(sig,0.995,0.25);
};
//~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 0;
    ~counter.quant = 0;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
