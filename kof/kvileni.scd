(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
);

(
    p.clock.tempo_(120/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


// saw synth ///////////////////////////////////////

(
    ~saw.ar(2);
    ~saw.quant=2;
    ~saw.fadeTime=0.2;
    ~saw={
        //         |       |       |       |       |  
        var mod = Duty.kr(4,0,Dseq([1,2,1.33333,1.333333*2],inf));
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(440/mod+SinOsc.kr(37.5).range(-0.5pi,0.5pi),SinOsc.ar(3.755/mod)*pi,mul:0.2);
        sig = CombN.ar(sig,1/10,1/10,4);
        sig = sig * env;
        sig = Mix(sig)!2/2;
        #x,y = Rotate2.ar(sig,sig+Dust.ar(4),SinOsc.kr(1/4));
        sig = []++x++y;
        sig = GVerb.ar(sig,100,10)**2;
        sig = LeakDC.ar(sig);
        sig = Splay.ar(sig,0.95,0.15);
    };
    ~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50!2+(env**10*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// trangles synth ///////////////////////////////////////

(
    ~trangles.ar(2);
    ~trangles.quant=2;
    ~trangles.fadeTime=0.2;
    ~trangles={
        //         |       |       |       |       |  
        var x,y;
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[1.002,0.005],[3,-3],curve:'exp'),imp * hit);
        var sig = Dust.ar(80);
        sig = sig * env;
        sig = Mix(sig)!2/2;
        #x,y = Rotate2.ar(sig,sig+Dust.ar(4),SinOsc.kr(2.1));
        sig = []++x++y;
         Splay.ar(sig,0.75,0.15);
    };
    ~trangles.play;
);
~trangles.stop(4);
~trangles.clear;
~trangles.pause;
~trangles.resume;

// swsw synth ///////////////////////////////////////

(
    ~swsw.ar(2);
    ~swsw.quant=2;
    ~swsw.fadeTime=0.2;
    ~swsw={
        //         |       |       |       |       |  
        var x,y;
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            SinOsc.ar(4400/2!2),
            SinOsc.ar(4400/4!2),
            SinOsc.ar(4400/1.333333!2),
            SinOsc.ar(4400/(1.333333*2)!2),
            SinOsc.ar(4400!2),
            LFNoise2.ar(4400!2),
            SinOsc.ar(4400!2),
            SinOsc.ar(4400!2),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        sig = sig * Pulse.ar(10);
        sig = GVerb.ar(sig.tanh,100,10)**2;
        sig = LeakDC.ar(sig);
               sig = Mix(sig)!2/2;
        #x,y = Rotate2.ar(sig,sig+Dust.ar(4),SinOsc.kr(1/4.1));
        sig = []++x++y;
  Splay.ar(sig,0.75,0.025);
    };
    ~swsw.play;
);
~swsw.stop(4);
~swsw.clear;
~swsw.pause;
~swsw.resume;



// lotone synth ///////////////////////////////////////

(
~lotone.ar(2);
~lotone.quant=2;
~lotone.fadeTime=0.2;
~lotone={
  //         |       |       |       |       |  
  var mod = Duty.kr(4,0,Dseq([1,2,1.33333,1.333333*2],inf));
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(440/4/mod) * SinOsc.ar(4);
    sig = LPF.ar(sig,88);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~lotone.play;
);
~lotone.stop(4);
~lotone.clear;
~lotone.pause;
~lotone.resume;
