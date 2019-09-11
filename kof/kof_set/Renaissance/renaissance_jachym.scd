
/////////////// CONNECT //////////////////////

p.disconnect;
p = NetProxy.connect(\kof);
TempoClock.default = p.clock;

p.push();
p.bpm(120);

p.bpm;
p.metro(4,1800);
p.players;


// soft reset
(
    //for now
    s.latency = 0.5;
    ~mod ={ LFNoise0.kr(4).range(1,16).round(2)  };

    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~tick = { var imp = Impulse.kr(~tempo.kr * ~mod); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
    ~counter = {PulseCount.kr(~tick.kr);};
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){ p[synth.asSymbol].quant = [16,0]; p[synth.asSymbol].rebuild;};});

    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.85,lp=4500,hp=250,len=8,rev = 8,duckLo = 150|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx,low,high,mid;
        var duck;

        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4!2*~tempo).range(100,800)),9/10,1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/8!2*~tempo).range(500,4500),1/2),9/10,1,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/16!2*~tempo).range(3000,10000)),9/10,1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,9/10,1,1/1.2);
        orig = sig;
        fx = LPF.ar(sig,lp).distort;
        fx = LPF.ar(fx,lp);
        fx = HPF.ar(fx,hp);
        fx = HPF.ar(fx,hp);
        //        fx = {AllpassN.ar(fx,1/1600*~tempo/~mod,1/8*~tempo/~mod,len)};

        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5100],1/len)/rev + fx;

        sig = SelectX.ar(wet,[orig,fx]);
        //  sig = Compander.ar(sig,~duck.ar,8/10,1/2,1);
        sig = NumChannels.ar(sig,2) ;
        sig = Limiter.ar(sig.softclip);
        ReplaceOut.ar(0,sig);
    };

    ~master_wet.quant = 4;
    ~master_wet = {LFDNoise1.kr(~tempo/1600!2).exprange(0.15,0.65);};
    // ~master_wet = {|sig| sig-(1-LFSaw.ar(~tempo*1)).range(0,1)**4};
    ~master.map(\wet,~master_wet);
    p.moveNodeToTail(\master);
);


//codeBelow

// primal ritual dance * /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym.ar(2);
    ~primal_ritual_dance_jachym.clock = p.clock;
    ~primal_ritual_dance_jachym.quant=[16,0];
    ~primal_ritual_dance_jachym.fadeTime=16.2;
    ~primal_ritual_dance_jachym={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(1..10).nthPrime%10) + Impulse.kr(~tempo*4);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]],[80,-5]),imp * hit);
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.1,0.7,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.05);
    };
    ~primal_ritual_dance_jachym.play;
);
~primal_ritual_dance_jachym.stop(4);
~primal_ritual_dance_jachym.clear(40);
~primal_ritual_dance_jachym.pause;
~primal_ritual_dance_jachym.resume;


// primal ritual dance FAST ..tady se neco deje fuck/////////////////////////////////////// jachym
(
    ~primal_ritual_dance_jachym.ar(2);
    ~primal_ritual_dance_jachym.clock = p.clock;
    ~primal_ritual_dance_jachym.quant=[4,0];
    ~primal_ritual_dance_jachym.fadeTime=1.2;
    ~primal_ritual_dance_jachym={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(4..32)); //+ Impulse.kr(~tempo*[2,1,3,2]/2);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = {EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]*LFNoise2.kr(4!4)],[80,-5]),imp * hit)}!2;
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.8,0.7,0.4]+env);
        sig = sig * env;
        sig = RHPF.ar(sig,LFNoise2.kr(1/16!2).range(1500,16000),LFNoise2.kr(4!4).range(0.01,0.2));
        Splay.ar(sig,0.75,0.95*[0.1,0.5],SinOsc.ar(16.01)*0.25);
    };
    ~primal_ritual_dance_jachym.play;
);
~primal_ritual_dance_jachym.stop(4);
~primal_ritual_dance_jachym.clear(16);
~primal_ritual_dance_jachym.pause;
~primal_ritual_dance_jachym.resume;





// primal ritual dance * /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym.ar(2);
    ~primal_ritual_dance_jachym.clock = p.clock;
    ~primal_ritual_dance_jachym.quant=[16,0];
    ~primal_ritual_dance_jachym.fadeTime=16.2;
    ~primal_ritual_dance_jachym={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(1..10).nthPrime%10) + Impulse.kr(~tempo*4);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]],[80,-5]),imp * hit);
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.1,0.7,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.05,SinOsc.kr(1));
    };
    ~primal_ritual_dance_jachym.play;
);
~primal_ritual_dance_jachym.stop(4);
~primal_ritual_dance_jachym.clear(40);
~primal_ritual_dance_jachym.pause;
~primal_ritual_dance_jachym.resume;


// primal ritual dance * /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym.ar(2);
    ~primal_ritual_dance_jachym.clock = p.clock;
    ~primal_ritual_dance_jachym.quant=[16,0];
    ~primal_ritual_dance_jachym.fadeTime=1.2;
    ~primal_ritual_dance_jachym={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1,
            0,0,0,0,
            0,0,0,0,
            0,0,0,0,

        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(1..10).nthPrime%4) + Impulse.kr(~tempo*4);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]],[80,-5]),imp * hit);
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.1,0.7,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25,SinOsc.kr(4.001));
    };
    ~primal_ritual_dance_jachym.play;
);
~primal_ritual_dance_jachym.stop(4);
~primal_ritual_dance_jachym.clear(40);
~primal_ritual_dance_jachym.pause;
~primal_ritual_dance_jachym.resume;







// primal ritual dance FAST /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym.ar(2);
    ~primal_ritual_dance_jachym.clock = p.clock;
    ~primal_ritual_dance_jachym.quant=[4,0];
    ~primal_ritual_dance_jachym.fadeTime=16.2;
    ~primal_ritual_dance_jachym={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(1..10).nthPrime%[1,2,3,4]) + Impulse.kr(~tempo*[2,1,3,2]*4);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = {EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]*LFNoise2.kr(4!4)],[80,-5]),imp * hit)}!2;
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.8,0.7,0.4]+env);
        sig = sig * env;
        sig = RHPF.ar(sig,LFNoise2.kr(1/16!2).range(1500,16000),LFNoise2.kr(4!4).range(0.01,0.2));
        Splay.ar(sig,0.75,0.5,SinOsc.ar(1/16.01)*0.75);
    };
    ~primal_ritual_dance_jachym.play;
);
~primal_ritual_dance_jachym.stop(4);
~primal_ritual_dance_jachym.clear(16);
~primal_ritual_dance_jachym.pause;
~primal_ritual_dance_jachym.resume;


// primal ritual dance FAST /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym.ar(2);
    ~primal_ritual_dance_jachym.clock = p.clock;
    ~primal_ritual_dance_jachym.quant=[16,0];
    ~primal_ritual_dance_jachym.fadeTime=1.2;
    ~primal_ritual_dance_jachym={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(4..32)); //+ Impulse.kr(~tempo*[2,1,3,2]/2);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = {EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]*LFNoise2.kr(4!4)],[80,-5]),imp * hit)}!2;
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.8,0.7,0.4]+env);
        sig = sig * env;
        sig = RHPF.ar(sig,LFNoise2.kr(1/16!2).range(1500,16000),LFNoise2.kr(4!4).range(0.01,0.2));
        Splay.ar(sig,0.75,0.95*[0.1,0.5],SinOsc.ar(16.01)*0.25);
    };
    ~primal_ritual_dance_jachym.play;
);
~primal_ritual_dance_jachym.stop(4);
~primal_ritual_dance_jachym.clear(16);
~primal_ritual_dance_jachym.pause;
~primal_ritual_dance_jachym.resume;


// primal ritual dance *** /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym_2.ar(2);
    ~primal_ritual_dance_jachym_2.clock = p.clock;
    ~primal_ritual_dance_jachym_2.quant=[16,0];
    ~primal_ritual_dance_jachym_2.fadeTime=1.2;
    ~primal_ritual_dance_jachym_2={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1, 0,0,1,0
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(1..10).nthPrime%10);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]],[80,-5]),imp * hit);
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.9,0.7,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~primal_ritual_dance_jachym_2.play;
);
~primal_ritual_dance_jachym_2.stop(4);
~primal_ritual_dance_jachym_2.clear(40);
~primal_ritual_dance_jachym_2.pause;
~primal_ritual_dance_jachym_2.resume;



// primal ritual dance *** /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym_2.ar(2);
    ~primal_ritual_dance_jachym_2.clock = p.clock;
    ~primal_ritual_dance_jachym_2.quant=[16,0];
    ~primal_ritual_dance_jachym_2.fadeTime=16.2;
    ~primal_ritual_dance_jachym_2={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1, 0,0,0,0
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(1..10).nthPrime%10);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]],[80,-5]),imp * hit);
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.15,1)) * Crackle.ar([0.1,0.7,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~primal_ritual_dance_jachym_2.play;
);
~primal_ritual_dance_jachym_2.stop(4);
~primal_ritual_dance_jachym_2.clear(40);
~primal_ritual_dance_jachym_2.pause;
~primal_ritual_dance_jachym_2.resume;


// primal ritual dance *** /////////////////////////////////////// jachym

(
    ~primal_ritual_dance_jachym_2.ar(2);
    ~primal_ritual_dance_jachym_2.clock = p.clock;
    ~primal_ritual_dance_jachym_2.quant=[16,0];
    ~primal_ritual_dance_jachym_2.fadeTime=16.2;
    ~primal_ritual_dance_jachym_2={
        //         |       |       |       |       |
        var pat = [
            1,1,1,1, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,(1..10).nthPrime%10);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]],[80,-5]),imp * hit);
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.15,1)) * Crackle.ar([0.1,0.7,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~primal_ritual_dance_jachym_2.play;
);
~primal_ritual_dance_jachym_2.stop(4);
~primal_ritual_dance_jachym_2.clear(40);
~primal_ritual_dance_jachym_2.pause;
~primal_ritual_dance_jachym_2.resume;

(
  //s.latency=0.2;
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


p.push();
// puls synth ///////////////////////////////////////

(
    ~puls.ar(2);
    ~puls.clock = p.clock;
    ~puls.quant=2;
    ~puls.fadeTime=16;
    ~puls={
        var sig = Pulse.ar((1..8)/4) * SinOsc.ar(50,Pulse.ar((1..8)/4));
        Splay.ar(sig,0.5,0.25);
    };
    ~puls.play;
);
~puls.stop(4);
~puls.clear;
~puls.pause;
~puls.resume;


(
  //s.latency=0.2;
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


// pulsKick synth ///////////////////////////////////////

(
~pulsKick.ar(2);
~pulsKick.clock = p.clock;
~pulsKick.quant=16;
~pulsKick.fadeTime=4;
~pulsKick={
  var sig = SinOsc.ar(50!2,Pulse.ar([2,1])) * Pulse.ar([2,1]);
  sig = VarSaw.ar([50.01,50.02],SinOsc.ar(1/4),Pulse.ar([2,1]),mul:LFNoise2.kr(1/16!2)) ** LFNoise0.kr([2,1]).range(0.2,2) * 0.75 + sig;
  sig = BPF.ar(sig,LFNoise2.kr(1/16!2).range(50,1900),LFNoise2.kr(1/4).range(0.01,0.4)) + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.05,0.25);
};
~pulsKick.play;
);
~pulsKick.stop(4);
~pulsKick.clear;
~pulsKick.pause;
~pulsKick.resume;

