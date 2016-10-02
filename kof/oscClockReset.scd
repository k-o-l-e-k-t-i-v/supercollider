

(
    n = NetAddr("192.168.0.255", NetAddr.langPort);
    NetAddr.broadcastFlag = true;
    OSCFunc.newMatching({|msg,time,addr|
        ("reseting clock, new tempo:"+msg[1]).postln; 
        p.clock.sched(0,{
            var synths = p.playingProxies;
            p.makeTempoClock(msg[1]/60);

            ~offset = {(0..7)/8};

            ~tick.quant = 0;
            ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

            ~counter = {PulseCount.kr(~tick.kr)};
            
            synths.collect{|n| p.[n.asSymbol].rebuild;};
        })

    }, '/bang');
)

// reset clocks to others
n.sendMsg('/bang',95.8);



(
    //p.clock.tempo_(60/60);

    ~offset = {(0..7)/8};

    ~tick.quant = 0;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = [];

        //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
        //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
        sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
        Splay.ar(sig,0.5,0.25);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=0.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(500!2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
