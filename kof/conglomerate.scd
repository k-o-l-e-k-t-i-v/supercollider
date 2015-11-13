(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// hh synth ///////////////////////////////////////

(
    ~hh.ar(2);
    ~hh.quant=2;
    ~hh.fadeTime=0.2;
    ~hh={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[2,2,1,1],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,0.25],[6,-3],curve:'exp'),imp * hit);
        var sig = LFNoise1.ar(16000/[1,4,8,16]) * Crackle.ar([0.1,0.7,0.4,0.6]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;



// bytebeat synth ///////////////////////////////////////

(
    ~bytebeat.quant=4;
    ~bytebeat.fadeTime=4.2;
    ~bytebeat={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var mod = Select.kr(PulseCount.kr(hit)/4%4,[1,4,2,8]);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);


        var t = PulseCount.ar(Impulse.ar(44100/~tempo));

        var sig = LPF.ar(
            (  
                ((t<<1)**((t<<1)+(t>>7)&t>>12))|t>>(4-(1**7&(t>>19)))|t>>7
                - 3 % 256
            ) / 127-1 * 3
            , 18000
        ).distort * 0.4; 

        //sig = CombN.ar(sig,1/40,1/41,4)+sig;
        sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = Normalizer.ar(sig);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~bytebeat.play;
);
~bytebeat.stop(7);
~bytebeat.clear;


// ss synth ///////////////////////////////////////

(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=0.2;
    ~ss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.00001,1,1,0.00001],[0.25,0.25*1.628,0.25]*LFNoise2.ar(4!16),[3,1,-3],curve:'exp'),imp * hit);
        var base = 60.midicps*2pi;
        var sig = 
        SinOsc.ar(base/(2*[1,2,3,4].reciprocal**2),mul:0.2) ++
        LFSaw.ar(base/(4*[1,2,3,4].reciprocal**1.5),mul:0.2) ++
        VarSaw.ar(base/(8*[1,2,3,4].reciprocal**1.25),mul:0.2) ++
        LFNoise2.ar(base*(1..16),mul:0.2);

        env = env * LFNoise2.kr(1/4!16) * LFNoise2.ar(200!16);
        sig = Resonz.ar(sig,LFNoise2.kr(4!16).range(base/4,base*4));
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.pyramid.size,sig.pyramid.scramble);
        sig = sig * env;
        Splay.ar(sig.flat,0.15,0.75);
    };
    ~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;



// crackle synth ///////////////////////////////////////

(
    ~crackle.quant=2;
    ~crackle.fadeTime=0.2;
    ~crackle={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.2,0.3,0.4,0.5]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~crackle.play;
);

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[4,4,2,1],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.00001,0.99,0.00001],[0.002,1.75],[10,-4],curve:'exp'),imp * hit);
        var sig = SinOsc.ar([44,45,46,47]+(env**20*1000),-pi,mul:env**0.95) + PinkNoise.ar((env**4)!2);
        sig = LPF.ar(sig,LFNoise2.kr(1/4!4).range(1,10000)*(env**2)+200);
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/2,1/2,0.01,0.1);
        Splay.ar(sig,0.15,0.25);
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
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var f = 432.0/([1,2,4,1.5,4/3,1.25].scramble*[0.5,0.25]*pi)/([1,2,1.5,4/3,4].choose);
        var sig = SinOsc.ar(f,[0,pi]) + LFSaw.ar(f,[0,1]) + Pulse.ar(f) + BrownNoise.ar(0.6);
        sig = sig * LFTri.ar(1/fib(16)).exprange(0.001,1);
        sig = Resonz.ar(sig,f+SinOsc.kr(f/10.001/fib(16).scramble).range(f/1.025,f*1.025),0.005+LFNoise2.kr(1/4!16).exprange(0.001,0.5))*4;
        sig = CombN.ar(sig,1,1.001,4)/4+sig;
        sig = AllpassN.ar(sig,1.1,[2,2.01],4)/4 + sig;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.5,0.15);
    };
    ~one.play;
    ~reb={loop{~one.rebuild;16.wait;}}.fork;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;





