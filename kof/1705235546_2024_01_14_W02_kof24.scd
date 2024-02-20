p.push();


~tempo={110/120};


// keep synth ///////////////////////////////////////

(
~keep.ar(2);
~keep.quant=4;
~keep.fadeTime=2;
~keep={
    var last = Duty.kr(16/~tempo,0,Dseq([8,5,8,11],inf));
    var mid = Duty.kr(4/~tempo,0,Dseq([5,6,4,3],inf));
    var freq = [92,24].midicps*(2**([1,mid,last]/12))+1 + LFNoise1.kr(~tempo/4/[1,2,3]);
    var sig = LFSaw.ar([~tempo/4/[1,4,8],~tempo/16,freq],mul:2pi) + LFNoise1.ar(48000,mul:0.1);
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin) * Pulse.ar(~tempo*LFNoise1.kr(~tempo/4/[1,2,3]).range(1,8).round(4).lag(1)/[1,2,3]);
    sig = LeakDC.ar(sig);
    sig = CombL.ar(sig,1/freq*4,1/freq.lag(0.5)*2,1)/4+sig;
    sig = LPF.ar(sig,2500);
    sig= CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(sig,60,3)/8+sig;
    sig = (sig/4).softclip + (sig/8);
    Splay.ar(sig,0.95,0.125);
};
~keep.play;
);
~keep.stop(40);
~keep.clear;
~keep.pause;
~keep.resume;


s.scope;

// another synth ///////////////////////////////////////

(
~another.ar(2);
~another.quant=4;
~another.fadeTime=2;
~another={
    var base = 110;
    var rat = 2**([1,5,7]/12)+1;
    var sig = LFSaw.ar([base,base+0.000123,base+0.007065]*rat,mul:2pi);
    var saw = sig;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].tan);
    sig = LeakDC.ar(sig);
    sig = SinOsc.ar(sig.exprange(22.01,1200),mul:1/(sig.abs+1.001))/2+sig;
    sig = LPF.ar(sig,400) + ((HPF.ar(sig,12000) * Pulse.ar(~tempo*4/[1,2,3])));
    sig = CombL.ar(sig,0.1/saw.abs,0.033/saw.abs,~tempo/2)/4+sig;
    sig = Compander.ar(sig,~keep.ar,3/4,1/2,1) / 16 + sig;
    sig = GVerb.ar(sig,90,3)/6 + sig / 1.5;
    sig = LeakDC.ar(sig).softclip;
    Splay.ar(sig,0.75,0.105);
};
~another.play;
);
~another.stop(40);
~another.clear;
~another.pause;
~another.resume;

s.latency=0.3;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
