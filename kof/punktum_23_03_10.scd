p.push();


~tempo = {110/60}


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=12;
~one.fadeTime=4;
~one={
    var puls = ~tempo/[1,2,3,4];
    var sig = SinOsc.ar(40!2,Pulse.ar(puls)) * Pulse.ar(puls);
    sig = GVerb.ar(sig)/8+sig;
    sig = LPF.ar(sig,500);
    Splay.ar(sig,0.05,0.025);
};
~one.play;
);
~one.stop(60);
~one.clear;
~one.pause;
~one.resume;



// outing synth ///////////////////////////////////////

(
~outing.ar(2);
~outing.quant=12;
~outing.fadeTime=1;
~outing={
    var mel = Duty.kr(12 /~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = SinOsc.ar([~tempo/[24,23],~tempo/[64,65],[40,40/mel]]) * Pulse.ar(~tempo*4) + 1 * pi;
    sig = Perlin3.ar(sig[0],sig[1],sig[2]) * (LFSaw.ar(~tempo*4/[3,4])**2);
    sig = GVerb.ar(sig)/16+sig;
    Splay.ar(sig,0.05,0.125);
};
~outing.play;
);
~outing.stop(4);
~outing.clear;
~outing.pause;
~outing.resume;



// perl synth ///////////////////////////////////////

(
~perl.ar(2);
~perl.quant=2;
~perl.fadeTime=0.1;
~perl={
    var mod = Duty.kr(48/~tempo,0,Dseq([1,2,1.5,1.33333],inf))/1.5;
    var mel = Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf))*mod;
    var sig = LFSaw.ar(Pulse.ar(~tempo/4*[1,2,3,4]),~tempo/24/(1..4),[40,60,110]) * 2pi;
    sig = Perlin3.ar(sig,sig,sig);
    sig = LeakDC.ar(sig) * (LFSaw.ar(~tempo*4/[1,2,3,4]) ** 2);
    sig = GVerb.ar(sig)/16+sig;
    Splay.ar(sig,0.95,0.125);
};
~perl.play;
);
~perl.stop(40);
~perl.clear;
~perl.pause;
~perl.resume;


// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.quant=12;
~high.fadeTime=0.02;
~high={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
    var sig = WhiteNoise.ar(1!2);
    sig = sig * env;
    sig = HPF.ar(sig,15000);
    sig = GVerb.ar(sig)/16+sig;
    Splay.ar(sig,0.75,0.015);
};
~high.play;
);
~high.stop(40);
~high.clear;
~high.pause;
~high.resume;



// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.quant=12;
~high.fadeTime=0;
~high={
    var mod = Duty.kr(48/~tempo,0,Dseq([1,2,1.5,1.33333],inf))/1.5;
    var mel = Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf))*mod;
    var sig = SinOsc.ar([400,8000/mel,16000/mel]) * LFPulse.ar(~tempo*4/[1,1/4,3,4]);
    Splay.ar(sig,0.5,0.015);
};
~high.play;
);
~high.stop(40);
~high.clear;
~high.pause;
~high.resume;


(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 12;
    ~counter.quant = 12;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(40);};});
}.fork;  
)
