
(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.45,lp=3500,hp=150,len=10,rev = 2|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx,hi,lo;
        //fx = Limiter.ar(sig,0.95);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        lo = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        fx = HPF.ar(sig,lp);
        hi = DWGReverb.ar(NumChannels.ar(fx,2),[4000,4010],1/len/8)/rev/8;
        sig = SelectX.ar(wet,[orig,NumChannels.ar([]++lo+hi,4)]);
        sig = Compander.ar(sig,3/4,1.1,1/3);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

(
    ~master_wet.quant = 4;
    ~master_wet = {LFDNoise1.kr(~tempo/8).exprange(0.15,0.53);};
    ~master.map(\wet,~master_wet);
)



(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr(~tempo*4); };
);

p.clean;
(
    p.clock.tempo_(135/60);
    p.arProxyNames.do(p[_.asSymbol].rebuild);
)


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant = [4,0];
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,1,1,0,1,0,0,0,1,1,1,0,1,0,0,0,
        ];
        var mod = LFDNoise1.kr(~tempo/4).range(-20,40);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.001,1.5],[mod,-4.3]), imp * hit);
        var sig;
        var hum = LFDNoise1.kr(~tempo*4).range(0.0,0.009);
        env = DelayN.ar(env,hum,hum);
        sig = SinOsc.ar(33.midicps+(env**20*250),env*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

(
{
  p.stop(10);
  ~master.play;
  10.wait;
  p.clean;
}.fork;  
)


// switch synth ///////////////////////////////////////

(
    ~switch.ar(2);
    ~switch.quant=[2];
    ~switch.fadeTime=1.2;
    ~switch={
        var pat = [
            1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
        ];
        //         |       |       |       |       |
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,3,4]/~tempo],[3,30]),imp * hit);
        var sig = WhiteNoise.ar(0.4!4) * SinOsc.ar(1/(1..6)*~tempo);
        sig = Resonz.ar(sig,[1000,2500,12500,15000,500,12500],LFDNoise1.kr(~tempo!6).range(0.01,0.9));
        sig = sig * env * LFPulse.ar(4/(1..6)*~tempo,0,1/2);
        sig = CompanderD.ar(sig,3/4,1,1/3,0.0002);
        Splay.ar(sig,0.5,0.15,SinOsc.kr(~tempo,mul:0.4));
    };
    ~switch.play;
    //~switch[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),5000),[4001,4011]),12000)+sig;};
);
~switch.play;
~switch.stop(4);
~switch.clear;




// menavka synth ///////////////////////////////////////

(
    ~menavka.ar(2);
    ~menavka.clock = p.clock;
    ~menavka.quant=[4];
    ~menavka.fadeTime=1;
    ~menavka={
        var tmod = 1/16;//TWChoose.kr(Impulse.kr(~tempo/[1,2,3,4]!4),[1,2,1/4,1/8],[0.6,0.4,0.2,0.1],1);
        var mal = TWChoose.kr(Impulse.kr(~tempo/8/[1,2,3,4]*tmod),[4,2,8,1],[4,0.5,0.3,0.1],1);
        var basemod = TWChoose.kr(Impulse.kr(~tempo/2/[1,1.3333,1.5,2]*tmod),[1,2,4,8],[4,0.5,0.3,0.1],1);
        var base = [33,35,40,36].midicps * basemod + LFDNoise1.kr(1/4!4,mul:1/2);
        var cmod = LFDNoise1.ar(1/8!4).range(0.25,0.95);
        var mod = LFDNoise1.ar(1/32!4).range(0.1,8);
        var sig = SinOsc.ar(base,Pulse.ar(2/[1,2,3,4]*~tempo*tmod)**mod*2pi);
        sig = CompanderD.ar(sig,cmod,1,1/2);
        sig = CombC.ar(sig,1/base,1/base/1.001/basemod,4 * LFDNoise1.ar(1/16!4).range(0.01,1) / ~tempo);
        sig = Normalizer.ar(sig);
        sig = OnePole.ar(sig,LFDNoise1.ar(1/4!4 * tmod));
        Splay.ar(sig,0.85,0.15,LFPar.kr(~tempo,mul:0.2));
    };
    ~menavka.play;
);
~menavka.stop(4);
~menavka.clear;
~menavka.pause;
~menavka.resume;

// menavka_deep synth ///////////////////////////////////////

(
    ~menavka_deep.ar(2);
    ~menavka_deep.clock = p.clock;
    ~menavka_deep.quant=[4,1/2];
    ~menavka_deep.fadeTime=1;
    ~menavka_deep={
        var mal = TWChoose.kr(Impulse.kr(~tempo/8/[1,2,3,4]),[4,2,8,1],[4,0.5,0.3,0.1],1);
        var basemod = TWChoose.kr(Impulse.kr(~tempo/2/[1,1.3333,1.5,2]),[1,2,4,8],[4,0.5,0.3,0.1],1);
        var base = [33].midicps + LFDNoise1.kr(1/4!4,mul:1/2);
        var tmod = 1;//TWChoose.kr(Impulse.kr(~tempo/[1,2,3,4]!4),[1,2,1/4,1/8],[0.6,0.4,0.2,0.1],1);
        var cmod = LFDNoise1.ar(1/8!4).range(0.25,0.95);
        var mod = LFDNoise1.ar(1/32!4).range(0.1,8);
        var sig = SinOsc.ar(base,Pulse.ar(2/[1,2,3,4]*~tempo*tmod)**mod*2pi);
        sig = CompanderD.ar(sig,cmod,1,1/2);
        sig = CombC.ar(sig,1/base,1/base*4,4 * LFDNoise1.ar(1/16!4).range(0.01,1) / ~tempo);
        sig = Normalizer.ar(sig);
        sig = OnePole.ar(sig,LFDNoise1.ar(1/4!4));
        Splay.ar(sig,0.85,0.25,LFPar.kr(~tempo,mul:0.2));
    };
    ~menavka_deep.play;
);
~menavka_deep.stop(4);
~menavka_deep.clear;
~menavka_deep.pause;
~menavka_deep.resume;

// flute synth ///////////////////////////////////////

(
    ~flute.ar(2);
    ~flute.quant=2;
    ~flute.fadeTime=4;
    ~flute={
        var speed = 1/8/[1,2,4] * ~tempo;
        var oct = TWChoose.kr(Impulse.kr(speed/4),[0,-1,2,1]*12,[1,0.2,0.1,0.5],1);
        var f = TWChoose.kr(Impulse.kr(speed/8),[60,64,67,65,71]+oct,[1,1,1,0.2,0.1],1).midicps/2;
        //var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
        var sig = VarSaw.ar([f,4.41/f,speed/40],0,LFDNoise1.kr(speed!3))*14.41;//*f/30;
        sig = CombN.ar(sig,1/f,8/f,1)/8+sig;
        sig = Perlin3.ar(sig[0],sig[1],sig[2]);
        sig = Resonz.ar(sig,f,SinOsc.kr(1/40/[1,2,3]).range(0.001,0.04)) * VarSaw.ar(f+SinOsc.kr(1/f/[1,2,3],mul:pi),(sig.distort*pi),LFDNoise1.kr(speed/2!3));
        sig = Normalizer.ar(sig) * (LFTri.ar(speed/[1,2,3]/4) ** 4 * [1,0.66,0.33]);
        sig = LeakDC.ar(sig);
        sig = Vibrato.ar(sig,[5,6,7],0.02);
        //sig = LPF.ar(sig,f*4);
        sig = CompanderD.ar(sig,1,1/2);
        Splay.ar(sig,0.35,0.05);
    };
    ~flute.play;
    ~flute[1] = \filter -> {|sig| DWGReverb.ar(HPF.ar(LPF.ar(sig,3500),150),[4020,4000],1/2)};
);
~flute.stop(4);
~flute.clear;
~flute.pause;
~flute.resume;


