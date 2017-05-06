
p.bpm(90);


(
    s.latency=0.2;
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

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin.wav");

// player synth ///////////////////////////////////////

(
    ~ss.ar(2);
    ~ss.quant=16;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod2 = Duty.kr(4/~tempo*[4,3,2,1],0,Dseq([1,2,1,2,1,4].reciprocal,inf));
        var mod = ([1,1+2.reciprocal,1+4.reciprocal])+mod2 * 0.5;//[-1,0.25,-0.25,8,1/16];
        var spread = 0.001;
        var pos = [0,0.115,0.5,0.25] + LFTri.kr(~tempo/1000/[1,2,3,4]).exprange(0.001,0.5);
        //         |       |       |       |       |  
        var pat = [1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.5,1*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env * LFTri.kr(~tempo/16/[1,2,3,4]);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig.flat,0.5,0.25);
    };
    ~ss.play;
);
~ss.stop(7);
~ss.clear;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// kick synth ///////////////////////////////////////

(
    ~kick.quant=16;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**20*100),env*40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(7);
~kick.clear;


// hiss synth ///////////////////////////////////////

(
    ~hiss.quant=16;
    ~hiss.fadeTime=0.2;
    ~hiss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.2,0.4,0.7,0.9]+(env**2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
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
        var sig = ~ss + ~sss + ~sss2 + ~hiss + ~kick;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;
