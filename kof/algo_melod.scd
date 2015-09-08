



(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
)

(
    p.clock.tempo_(60/60);
)

~pos={LFTri.kr(1/150).range(20,10000)};
~spread={1000};



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
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var mod = Select.kr(PulseCount.kr(hit)%4,fib(4,1,2));
        var mod2 = Select.kr(PulseCount.kr(hit)/16%4,[1,2,3,4]);
        var len = (1.7)*2/~tempo;
        var env = EnvGen.ar(Env([0.00001,1,0.00001],[0.15,len],[1,-3],curve:'exp'),imp * hit);
        var freq = (mod)*~spread.kr+~pos.kr;
        var sig = AudioIn.ar([0,1])*10;
        //sig = RLPF.ar(sig,LFNoise2.kr(1).range(800,19000));
        sig = Resonz.ar(sig,LFNoise2.kr(1/4!8).range(100,800));
        // sig = sig ** LFNoise2.kr(~tempo!4).range(1,8);
        SendTrig.ar(K2A.ar(hit*imp),0,freq);
        //sig = sig * LFNoise2.kr(~tempo!4).range(0.1,1);
        sig = sig * env;
        Splay.ar(sig.flat,0.75,0.025);
    };
    ~snth.play;



    ~fil.quant=1;
    ~fil.fadeTime=1;
    ~fil={
        var high,mid,low;
        var sig = ~snth.ar;
        //sig = Greyhole.ar(sig,~tempo/4); 
        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
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
    o = OSCFunc({ arg ...args;
             args.postln;
             m.sendMsg("/trig",args[1],args[0][3]);
            },'/tr', s.addr);
)
