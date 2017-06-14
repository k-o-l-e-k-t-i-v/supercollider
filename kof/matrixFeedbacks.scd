(
    p.push();
    p.bpm(240);
    s.latency = 0.15;
)

(
    s.latency=0.4;
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

// pass synth ///////////////////////////////////////

(
~pass.ar(2);
~pass.clock = p.clock;
~pass.quant=16;
~pass.fadeTime=4;
~pass={
  var mod= Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = Normalizer.ar(AudioIn.ar(1) * 0.999);
  var f = LFSaw.ar(~tempo/32/(1..8)/4).range(22,14400).round(12.midicps)/[1,2,1.5,1.3333] + SinOsc.ar((51..44)).range(-pi,pi);
  var q = SinOsc.kr(~tempo/32/[1,2,3,4]).range(0.1,0.48);//LFTri.ar(~tempo/32/(1..8)).exprange(0.001,0.9) ** 2g;
  //sig = DelayN.ar(sig,1/f,1/f) * (LFSaw.ar(~tempo/[1,2,3,4])**2);
  sig = BPF.ar(sig,f,q);

  [Mix.ar(sig),DC.ar(0)];
};
~pass.play;
);
~pass.stop(4);
~pass.clear;
~pass.pause;
~pass.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[4];
~hiss.fadeTime=4;
~hiss={
  var sig = HPF.ar(WhiteNoise.ar(0.1)+~pass.ar,8000) * Pulse.ar(8*~tempo/(1..8));
  [0,Splay.ar(sig,0.5,0.25)];
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(16);};});
}.fork;  
)

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(5,env**20*8pi) + VarSaw.ar(25,0,env**0.2);
  sig = sig * env;
  [DC.ar(0),Splay.ar(sig,0.75,0.95)];
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// output synth ///////////////////////////////////////

(
~output.ar(2);
~output.clock = p.clock;
~output.quant=16;
~output.fadeTime=4;
~output={
  var sig = ~pass.ar;
  sig = LPF.ar(sig,4400);
  sig = AllpassN.ar(sig,1,1/50);
  Splay.ar(sig,0.5,0.15,SinOsc.ar(4/[1,2,3,4]));
};
~output.play;
);
~output.stop(4);
~output.clear;
~output.pause;
~output.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=2;
~one={
  var mod = 1.33335*[1,2,1.5,1.333];//Duty.kr([1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
  var f = 100/mod;//(84+[0,7,-12,-24]).midicps / mod * [1,1.5,1/1.3333,1];
  var sig = ~pass.ar + LocalIn.ar(2) * Pulse.ar(4/[1,2,3,4]);//Limiter.ar( ~pass.ar.softclip , 0.45) + (Pulse.ar( ~tempo / [1,2,3,4]) * WhiteNoise.ar(0.2!4));
  
  sig = DelayN.ar(sig,1/f,1/f);
  //sig = PitchShift.ar(sig,0.1,SinOsc.ar(1.001/4/[1,2,3,4]).range(0.5,1.5));// * Pulse.ar(4/[1,2,3,4]);
  sig = BPF.ar(sig,f,LFNoise2.kr(1/4!4).exprange(0.01,0.4));//LFSaw.ar(1/4/[1,2,3,4]).exprange(0.01,0.1));
  sig = Compander.ar(sig,3/4,1/3,1/2);
  sig = HPF.ar(sig,25);
  LocalOut.ar(Mix.ar(sig)!2);
  [0,Splay.ar(sig,0.5,0.95)];
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
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,LFNoise2.kr(1/32!16).range(0.1,4)],[3,-30]),imp * hit)};
        var sig = ~pass.ar;//VarSaw.ar(50/[1,2,3,4],0,env**LFNoise2.kr(~tempo/32/(1..16)).exprange(0.001,20.99));
        //sig = PitchShift.ar(sig,0.01,env**40*4) * env;
        //sig = CombN.ar(sig,1/50,1/5*(env**0.52)+0.0001,1);
        sig = AllpassN.ar(sig,1/4,1/4/(1..8),4);
        [0,Splay.ar(sig,0.0001,0.95)];
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
    ~one.quant=[16,3];
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
        [0,Splay.ar(sig,0.75,0.013335,SinOsc.kr((~tempo/((1..16)*0.51))))];
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

        [Splay.ar(gen,0.005,0.15),0];
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
