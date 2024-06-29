
p.push();

~tempo = {110/120};

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

// switch synth ///////////////////////////////////////

(
~switch.ar(2);
~switch.quant=4;
~switch.fadeTime=2;
~switch={
    var sig = Select.ar(LFSaw.ar(~tempo/4).range(0,3),[~one.ar,~two.ar,~three.ar,~four.ar]);
    Splay.ar(sig,0.5,0.25);
};
~switch.play;
);
~switch.stop(4);
~switch.clear;
~switch.pause;
~switch.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(50!2,Pulse.ar(~tempo*2));
    Splay.ar(sig,0.5,0.25);
};
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=4;
~two.fadeTime=2;
~two={
    var harm = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = LFSaw.ar(50*harm);
    Splay.ar(sig,0.5,0.25);
};
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// three synth ///////////////////////////////////////

(
~three.ar(2);
~three.quant=4;
~three.fadeTime=2;
~three={
    var sig = SinOsc.ar(5001!2,mul:0.2) * Pulse.ar(8);
    Splay.ar(sig,0.5,0.25);
};
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;


// four synth ///////////////////////////////////////

(
~four.ar(2);
~four.quant=4;
~four.fadeTime=2;
~four={
    var sig = WhiteNoise.ar(0.2!2);
    Splay.ar(sig,0.5,0.25);
};
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;
