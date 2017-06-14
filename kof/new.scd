(
    p.push();
    p.bpm(90);
    s.latency = 0.5;
)

(
    //s.latency=0.2;
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


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=2;
~one={
  //var mod = Duty.kr(16*[1,2,4],0,Dseq([1,2,1.5,1.33333],inf));
  var f = 50*[1,2,1.5,8,16];
  var sig = Normalizer.ar(AudioIn.ar(1!4)) * Pulse.ar(8/[1,2,3,4]).softclip;//+ VarSaw.ar(f/[1,2,4,8,16],0,Pulse.ar([1,2,3,4]),mul:0.2);//!2);//Normalizer.ar(AudioIn.ar(1));
  //sig = Normalizer.ar(sig);
  sig = DelayN.ar(sig,2/f,1/f);
  sig = CombN.ar(sig,1/50,1/50,1/4);
  sig = AllpassN.ar(sig,1/4,1/4);
  sig = BPF.ar(sig,f,LFSaw.ar(1/4/[1,2,3,4]).exprange(0.01,0.1));
  //sig = CombN.ar(sig,1/50,1/50,1)/4+sig;
  //sig = PitchShift.ar(sig,1/50,SinOsc.ar(1/4/[1,2,3,4]).range(0.999,1.15));// * Pulse.ar(4/[1,2,3,4]);
  //sig = PitchShift.ar(sig,1/51,SinOsc.ar(1/2.01/[1,2,3,4]).range(0.9,1.51));// * Pulse.ar(4/[1,2,3,4]);
  //sig = PitchShift.ar(sig,1/52,SinOsc.ar(1/4.001/[1,2,3,4]).range(0.29,1.001));// * Pulse.ar(4/[1,2,3,4]);
  //sig = BPF.ar(sig,60.midicps/[1,2,1.5,1.33333],LFSaw.kr(1/4)**2);
  //sig = RLPF.ar(sig,15000 + SinOsc.kr(4).range(-5000,0),0.62);
  Splay.ar(sig,0.005,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[8,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = VarSaw.ar(50/[1,2,3,4],0,env**LFNoise2.kr(~tempo/32/(1..16)).exprange(0.001,20.99));
        sig = sig * env;
        Splay.ar(sig,0.0001,0.95);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={
        var note = Duty.ar(8/~tempo*[1,2,3],0,Dseq([60,65,60,67,65,63,67,69,55,60,58,60,61].midicps,inf));
        //var note = Duty.ar(8/~tempo*[1,2,3],0,Dseq([60,48,60,36,60,72,60,84].midicps,inf));
        var f = note / [1,2,1.5,1.333333].scramble *.x [1,2,1/2,4/3] + SinOsc.kr((4..20),mul:0.5);
        var q = LFNoise2.kr(~tempo/16/(1..16)).exprange(0.0001,0.3);
        var sig = Crackle.ar(LFTri.ar(~tempo/((1..16)*10)).range(0.001,1.9));
        sig = LeakDC.ar(sig);
        sig = RLPF.ar(sig,f,q);
        sig = HPF.ar(sig,55);
        sig = HPF.ar(sig,55);
        sig = Normalizer.ar(sig) * LFTri.ar(~tempo/(1..16)) * LFTri.ar(f/10);
        sig = sig * Pulse.ar(~tempo*2/(1..16) + SinOsc.kr(~tempo/(8..28)).range(-0.001,0.001));
        sig = CombN.ar(sig,1/f,1/f,LFNoise2.kr(~tempo/16!16).exprange(1/2,2)/(1..16));
        //        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        sig = LPF.ar(sig,f*2);
        Splay.ar(sig,0.75,0.003335,SinOsc.kr((~tempo/((1..16)*0.51))));
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.clock = p.clock;
    ~two.quant=2;
    ~two.fadeTime=16;
    ~two={
        var t = SinOsc.ar( ((1..9)/1600) * ~tempo * [50,25,12.5,7.5] * 4) * 1/4 ;
        var sig = [] ++ Perlin3.ar(t[0],t[1],t[2]) ++ Perlin3.ar(t[3],t[4],t[5]) ++ Perlin3.ar(t[6],t[7],t[8]);
        var gen = Formant.ar( sig[0] * 100+50, sig[1] * 1500+5, sig[2] * 550+5 ) * LFTri.ar(~tempo/(1..9));
        gen = AllpassN.ar(gen,1/4,4/(1..16),4);

        Splay.ar(gen,0.005,0.15);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
