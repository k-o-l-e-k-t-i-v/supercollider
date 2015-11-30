
(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);

p.clean;
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.play};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(n.asSymbol!=\ff){snth.stop(15)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(15)}};



(
    p.clock.tempo_(2);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);



// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500!2);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;


// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = Resonz.ar( ~two.ar + ~one.ar,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
        sig = CompanderD.ar(sig,1/3,1/2,1/2);
        //sig = Limiter.ar(sig.tanh,0.51);
        sig = CombN.ar(sig,4,4,32)+sig;
        //sig = CombN.ar(sig,1/4,1/LFNoise0.kr(4!16).range(1,800).round(2pi),8)/16+sig;
        sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.25,0.15);
    };
    ~ff.play;
);
~ff.stop(7);
~ff.clear;

// long synth ///////////////////////////////////////

(
~long.ar(2);
~long.quant=2;
~long.fadeTime=0.2;
~long={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(43.2*pi/[1,1.5,1.25,2]+SinOsc.ar(4/[1,2,3,4]).range(-4,4),SinOsc.ar(43.2/2).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~long.play;
);
~long.stop(4);
~long.clear;
~long.pause;
~long.resume;





b = Buffer.read(s,"/home/kof/marimba.wav");

// player synth ///////////////////////////////////////

(
    ~marimba.ar(2);
    ~marimba.quant=2;
    ~marimba.fadeTime=2.02;
    ~marimba={
        var mod = 1;
        var spread = 0.0;
        var pos = (1..4)/16 + LFSaw.ar(1/1600);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~marimba.play;
);
~marimba.stop(7);
~marimba.clear;


b = Buffer.read(s,"/home/kof/vendula.wav");

// player synth ///////////////////////////////////////

(
    ~smp.ar(2);
    ~smp.quant=2;
    ~smp.fadeTime=2.02;
    ~smp={
        var mod = 1*((1..16).reciprocal);
        var spread = 0.0;
        var pos = (1..4)/80+LFSaw.ar(1/100);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.202,1.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        //sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig[0]!2,0.05,0.15);
    };
    ~smp.play;
);
~smp.stop(7);
~smp.clear;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,5.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**10*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);
~kick.pause;
~kick.resume;
~kick.stop;

// ff filter ///////////////////////////////////////

(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~smp.ar + ~marimba.ar;

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

// ticka synth ///////////////////////////////////////

(
    ~ticka.ar(2);
    ~ticka.quant=2;
    ~ticka.fadeTime=0.2;
    ~ticka={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFNoise2.ar(15000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~ticka.play;
);
~ticka.stop(7);
~ticka.pause;
~ticka.resume;

// voice synth ///////////////////////////////////////

(
    ~voice.ar(2);
    ~voice.quant=2;
    ~voice.fadeTime=4.2;
    ~voice={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = AudioIn.ar([0,1])*1;
        //sig = Normalizer.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        sig = PitchShift.ar(sig,0.025,[1,1,1.25,0.5,4],0.001,0.1);
        sig = Limiter.ar(sig);
        sig = CombN.ar(sig,1,4/[1,2,4,8,16],64)+sig;
        sig = LPF.ar(sig,[5000,2500,1500,10000]);
        // sig = Greyhole.ar(sig)/4+sig;
        //sig = sig * env;
        Splay.ar(sig,0.25,0.295);
    };
    ~voice.play;
);
~voice.stop(4);
~voice.pause;
~voice.resume;


(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
)
