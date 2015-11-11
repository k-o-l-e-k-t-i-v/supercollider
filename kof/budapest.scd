

Kolektiv(\kof);

(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);


(
    p.clock.tempo_(120/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);

// bb synth ///////////////////////////////////////

(
    ~bb.ar(2);
    ~bb.quant=2;
    ~bb.fadeTime=0.2;
    ~bb={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(~heart)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(5000!2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~bb.play;
);
~bb.stop(7);
~bb.clear;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");

// player synth ///////////////////////////////////////

(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16]/8;
        var spread = 0.001;
        var pos = [0,0.5,0.25] + MouseX.kr(0,1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.855);
    };
    ~ssmp.play;
);
~ssmp.stop(7);
~ssmp.clear;


// chaotic synth ///////////////////////////////////////

(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise0.ar(15000);
  sig = LPF.ar(sig,800 + LFSaw.ar(80).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~chaotic.play;
);
~chaotic.stop(7);
~chaotic.clear;

// first synth ///////////////////////////////////////

(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50/1.25).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.05);
    };
    ~first.play;
);
~first.stop(7);
~first.clear;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~kick.play;
);
~kick.stop(7);
~kick.clear;

// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.quant=2;
    ~hiss.fadeTime=0.2;
    ~hiss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(1);
        sig = HPF.ar(sig,8000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~hiss.play;
);
~hiss.stop(7);
~hiss.clear;


// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~kick;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/4,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;



