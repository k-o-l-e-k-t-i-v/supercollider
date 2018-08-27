
(
    s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

p.push();



// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var r = LFDNoise1.kr(1/32).exprange(0.01,4);
        var aa = SinOsc.kr([1*r,r/16,r/32]);
        var bb = SinOsc.kr([2*r,2*r/32,2*r/64]);
        var cc = SinOsc.kr([4*r,4*r/64,4*r/128]);
        var f1 =  Perlin3.ar(aa[0],aa[1],aa[2]).range(50,500);
        var f2 =  Perlin3.ar(bb[0],bb[1],bb[2]).range(50,150);
        var f3 =  Perlin3.ar(cc[0],cc[1],cc[2]).range(50,1500);
        var sig = Formant.ar(f1,f2,f3);
        sig = PitchShift.ar(sig,0.02,2/r);
        sig = LPF.ar(sig,5000);
        sig = LeakDC.ar(sig);
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
