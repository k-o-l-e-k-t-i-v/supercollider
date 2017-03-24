


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.235,lp=3500,hp=250,len=0.333,rev = 15|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        //fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        sig = CompanderD.ar(sig,2/3,1,1/33,1/44100*2,0.1);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

p.push();
p.bpm(119.7);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
  var sig = WhiteNoise.ar(0.2!4);
  sig = HPF.ar(sig,[5000,250,15000,1600]) * Pulse.ar(~tempo*[1,1/1.5,16,1/4]);
  sig = Compander.ar(sig,~one2.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.clock = p.clock;
~one2.quant=[16,0];
~one2.fadeTime=0.02;
~one2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5] * LFNoise2.kr(~tempo/32).range(1/4,2),[3,-3]),imp * hit)};
  var sig = SinOsc.ar(60!2+(env**LFNoise2.kr(~tempo/32).range(10,150)*250),env**LFNoise2.kr(~tempo/32).range(10,150)*8pi);// + VarSaw.ar(60,0,env**(0.2*LFNoise2.kr(~tempo/80))*8pi,mul:0.52);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~one2.play;
);
~one2.stop(4);
~one2.clear;
~one2.pause;
~one2.resume;

// ninety_threequarter synth ///////////////////////////////////////

(
    ~ninety_threequarter.ar(2);
    ~ninety_threequarter.clock = p.clock;
    ~ninety_threequarter.quant=[8,0];
    ~ninety_threequarter.fadeTime=4;
    ~ninety_threequarter={
        var sig = SinOsc.ar(50!2,Pulse.ar(~tempo/4/4)) * Pulse.ar(~tempo/[1,1.5,3,4]/4);
        Splay.ar(sig,0.5,0.127);
    };
    ~ninety_threequarter.play;
);
~ninety_threequarter.stop(4);
~ninety_threequarter.clear;
~ninety_threequarter.pause;
~ninety_threequarter.resume;




// sixty_half synth ///////////////////////////////////////

(
    ~sixty_half.ar(2);
    ~sixty_half.clock = p.clock;
    ~sixty_half.quant=[8,3];
    ~sixty_half.fadeTime=0.02;
    ~sixty_half={
        var sig = SinOsc.ar(15000!2,Pulse.ar(~tempo/4)) * Pulse.ar(~tempo/4/[1,1.5,3,4]);
        Splay.ar(sig,0.15,0.02);
    };
    ~sixty_half.play;
);
~sixty_half.stop(4);
~sixty_half.clear;
~sixty_half.pause;
~sixty_half.resume;

// bck synth ///////////////////////////////////////

(
    ~bck.ar(2);
    ~bck.clock = p.clock;
    ~bck.quant=[16,3];
    ~bck.fadeTime=16;
    ~bck={
        var mod = {[2,1.5].choose}!4;
        var sig = VarSaw.ar({[24,36,74,72,57,65,69].choose.midicps/mod}!4 *.x [1,2,1/1.5,4]) *.x LFTri.kr(1/32/[1,5,76,8]);
        sig = Compander.ar(sig,~one2.ar ,0.1,1,0.1,LFNoise2.kr(~tempo/43!12).range(1/10000,1/2.001),LFNoise2.kr(~tempo/32!12).range(1/10000,1.001));
        Splay.ar(sig,0.85,0.015,SinOsc.kr(~tempo/4)/4);
    };
    ~bck.play;
);
~bck.stop(4);
~bck.clear;
~bck.pause;
~bck.resume;


90/60

199.7/60

{
    (
        p.clock.sched(p.clock.timeToNextBeat(1 * 16),{ 
            Tdef(\mel,{loop{ ~bck.rebuild; (33.3).wait;}});
            Tdef(\mel).play;

        });
    );
}

// saw synth ///////////////////////////////////////

(
    ~saw.quant=[8,3];
    ~saw.fadeTime=4.02;
    ~saw={
        var env = EnvGen.ar(Env([0,1,0],[0.2,1.15],[3,-3]),Impulse.ar(~tempo/[1/3,1/2,1/8,4],(1..4)/4));
        var sig = LFSaw.ar(36.midicps + (env**0.01*33) * [1,1/1.66666666,1/1.33333333,8] * (1.0001**(1..8)));
        sig = sig * env * LFSaw.ar(~tempo/4/fib(8)).exprange(0.001,1);
        sig = GVerb.ar(LPF.ar(sig,1400),100)/2+sig;
        Mix.ar(sig) * 0.00155;
    };
    ~saw.play;
);
~saw.stop(7);
~saw.clear;


// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.3);
        sig = RHPF.ar(sig, [1,2,3,4] * 1000 * LFNoise2.kr(~tempo/32).range(1,1/4));
        sig = sig * env;
        Splay.ar(sig,0.75,0.015);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

p.bpm(120);

(
    s.latency=0.333;
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

// noise synth ///////////////////////////////////////

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)

(
~noise.ar(2);
~noise.clock = p.clock;
~noise.quant=16;
~noise.fadeTime=16;
~noise={
  var sig = BrownNoise.ar(0.1) * SinOsc.ar(~tempo/[4,7,13,23]);
  Splay.ar(sig,0.5,0.125,SinOsc.kr(~tempo/[1,3,5,7]));
};
~noise.play;
);
~noise.stop(4);
~noise.clear;
~noise.pause;
~noise.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(10);};});
}.fork;  
)
