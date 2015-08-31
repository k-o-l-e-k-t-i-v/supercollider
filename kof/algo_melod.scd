



(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
)
(
    p.clock.tempo_(120/60);
)

~kick.clear

(

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
    ~time = {LFSaw.kr(~tempo/4).range(0,1)};

    // snth synth ///////////////////////////////////////

    ~snth.quant=4;
    ~snth.fadeTime=0.2;
    ~snth={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = DelayN.kr(PulseDivider.kr(~tick.kr,[1,2,4,8]*2,~counter.kr),TExpRand.kr(0.001,0.015,~tick.kr));
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var mod = Select.kr(PulseCount.kr(hit)/8%4,[1,2,1.5,1.25]*pi);
        var mod2 = Select.kr(PulseCount.kr(hit)/32%4,[1,2,4,8]);
        var len = 0.5*(1..4);
        var env = EnvGen.ar(Env([0.00001,1,0.00001],[0.002,len],[3,-3],curve:'exp'),imp * hit);
        var freq = 8000/(mod*mod2)/([1,1.5,2,1]) + SinOsc.ar(1/[1,2,3,4]).range(-4,4);
        var sig = SinOsc.ar(freq);
        // sig = sig ** LFNoise2.kr(~tempo!4).range(1,8);
        SendTrig.ar(K2A.ar(hit*imp),0,freq);
        sig = sig * LFNoise2.kr(~tempo!4).range(0.1,1);
        sig = sig * env;
        Splay.ar(sig.flat,0.75,0.55);
    };
    ~snth.play;



    ~fil.quant=1;
    ~fil.fadeTime=1;
    ~fil={
        var high,mid,low;
        var sig = ~snth + ~kick;
        //sig = Greyhole.ar(sig,~tempo/4); 
        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/16 + sig;
        low = CompanderD.ar(LPF.ar(sig,600),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~fil.play;
);

// kick synth ///////////////////////////////////////

(
    ~kick = {DC.ar(0!2)};
    ~kick.quant=4;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50 + (env**4*40) + ~snth.ar.range(-10,10));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.clear


//resender
(
    m = NetAddr("127.0.0.1", 12000);

    // output triggers
    OSCFunc({ arg ...args;
             args.postln;
             m.sendMsg("/trig",args[1],args[0][3]);
            },'/tr', s.addr);
)
