
Kolektiv.history

Kolektiv(\kof)
Kolektiv.tempo_(240)

(
    p.clock.tempo_(240/60/1.65);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);

// saw synth ///////////////////////////////////////

(
    ~saw.ar(2);
    ~saw.quant=2;
    ~saw.fadeTime=2.2;
    ~saw={
        var oct = Duty.kr(~tempo*4,0,Dseq([1,10,2,4],inf));
        var mod = Duty.kr(~tempo*16,0,Dseq([1,2,1.5,1.25],inf));
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.075,0.75*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(1500 / (mod) + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(~tempo/16/[1,2,3,4]).exprange(0.001,1);
        sig = Vibrato.ar(sig,[3,4,5,6],0.02);
        sig=  RLPF.ar(sig,150/mod,LFNoise2.kr(1/4!4).range(0.1,2));
        sig = sig * env;
        Splay.ar(sig,0.25,0.75);
    };
    ~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;

p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(10)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=2.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,1,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50 + (env**20*100));
        sig = sig * env;
        Splay.ar(sig,0.005,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// zet synth ///////////////////////////////////////

(
    ~zet.ar(2);
    ~zet.quant=2;
    ~zet.fadeTime=0.2;
    ~zet={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(1,2,16),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.02,2.95/fib(16)],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(15000/fib(16)) * Pulse.ar(16/fib(16));
        sig = sig * env;
        Splay.ar(sig,0.95,0.025,SinOsc.kr(4.1));
    };
    ~zet.play;
);
~zet.stop(4);
~zet.clear;
~zet.pause;
~zet.resume;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = [-1,1,0.5,8];//0.25,-0.25,0.5,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.125]+LFSaw.kr(1/4000);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.2,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        sig =  CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.025);
    };
    ~two.play;
);
~two.stop(7);
~two.clear;


// threew synth ///////////////////////////////////////

(
    ~threew.ar(2);
    ~threew.quant=2;
    ~threew.fadeTime=0.2;
    ~threew={
        var mod = Duty.kr([4,16,32,64]/4,0,Dseq([1,2,1.5,1.25],inf)) ;
        //        |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            Pulse.ar(50),
            Pulse.ar(50/mod),
            SinOsc.ar(50!2*mod + (env**10*100)),
            LFNoise2.ar(15000!2/mod),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        Splay.ar(sig,0.05,0.125);
    };
    ~threew.play;
);
~threew.stop(4);
~threew.clear;
~threew.pause;
~threew.resume;

// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=16;
    ~ff={
        var high,mid,low;
        var sig = ~threew.ar + ~one.ar + ~saw.ar;

        sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
        //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.2);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;


// rome synth ///////////////////////////////////////

(
    ~rome.ar(2);
    ~rome.quant=2;
    ~rome.fadeTime=0.2;
    ~rome={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = Dust.ar(LFSaw.kr(1/16/[1,2,3,4]).range(50,15000));
        sig = LPF.ar(sig,SinOsc.kr(1/15/[1,2,3,4]).range(50,15000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~rome.play;
);
~rome.stop(4);
~rome.clear;
~rome.pause;
~rome.resume;

Kolektiv.historySave
