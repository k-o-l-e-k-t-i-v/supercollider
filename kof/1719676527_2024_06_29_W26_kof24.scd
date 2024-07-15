
p.push();

~tempo = {115.741/120};

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    //~tick.kr(1);
    //~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    //~tick = { Impulse.kr( ~tempo * 4 ); };
);

// switch synth ///////////////////////////////////////

(
~switch.ar(2);
~switch.quant=4;
~switch.fadeTime=2;
~switch={
    var harm = 2**(Duty.kr(4/[1,2,3,4]/~tempo,0,Dseq([1,5,1,8],inf))/12)+1 ;
    var sig = SelectX.ar(~tick.kr,[~one.ar,~two.ar,~three.ar,~four.ar]);
    sig = Resonz.ar(sig,16000/[1,2,4,8,10,200,12000].scramble*harm,0.3)+sig * Pulse.ar(~tempo*4/[1,2,3,4]);
    Splay.ar(sig,0.95,0.25);
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
    var sig = SinOsc.ar(80!2,Pulse.ar(~tempo*4/[1,2,3,4]));
    //sig = GVerb.ar(sig,90,3)/16+sig;
    Splay.ar(sig,0.75,0.25);
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
    var harm = Duty.kr(1/4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var sig = LFSaw.ar(50*harm);
    Splay.ar(sig,0.25,0.15);
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
    var harm = 2**(Duty.kr(4/~tempo,0,Dseq([1,5,1,8],inf))/12)+1 ;
    var sig = SinOsc.ar(1501*harm,mul:0.2);
    Splay.ar(sig,0.45,0.25);
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
    var sig = WhiteNoise.ar(0.4!2);
    Splay.ar(sig,0.35,0.25);
};
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;


// all filter ///////////////////////////////////////

(
~all.quant=4;
~all.fadeTime=1;
~all={
    var synths = p.playingProxies;
    var high,mid,low;
    var sig = [];
    synths.collect{|n| if(n!='all'){sig=sig++p.[n.asSymbol];}};

    //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
    //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
    //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
    low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
    mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
    high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
    sig = LPF.ar(GVerb.ar(sig,90,3)/3+sig,16000);
    Splay.ar(sig,0.25,0.5);
};
~all.play;
);
~all.stop(7);
~all.clear;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(50!2);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
