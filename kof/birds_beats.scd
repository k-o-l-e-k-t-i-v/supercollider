

p.push();
p.bpm(90);

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.35,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
    p.moveNodeToTail(\master);
);


// stereo_one synth ///////////////////////////////////////

(
    ~stereo_one.ar(2);
    ~stereo_one.clock = p.clock;
    ~stereo_one.quant=8;
    ~stereo_one.fadeTime=2.5;
    ~stereo_one={
        var nts = [72,60,36,48,96].midicps;
        var note = SelectX.kr(LFTri.kr(~tempo/3200/((1..4)))*(nts.size+1),nts) / 2/[1,2,1.5,1.333333];
        var sig = SinOsc.ar(note,SinOsc.ar(note*0.999)**LFNoise2.kr(~tempo/37!4).range(0.1,1.6)*8pi*LFNoise2.kr(~tempo/2/32)!4,mul:0.5) + VarSaw.ar(note/[2,1/4],mul:0.1);
        sig = sig * ([] ++ Pulse.ar(~tempo*2/[1,2,3,5]).softclip * LFTri.ar(~tempo/[3,1,7,9]) + Pulse.ar(~tempo/[1,3,7,9],mul:0.1).softclip);
        sig = sig * (LFTri.ar(~tempo/32/[1,2,3,4])**LFNoise2.kr(~tempo/4!4).range(0.1,4));
        sig = CombN.ar(sig,1/note,1/note,LFNoise2.kr(~tempo/32!4).range(0.1,2))/4+sig;
        Splay.ar(sig,0.85,0.25,SinOsc.kr(1/[7.1,7.10333])/2);
    };
    ~stereo_one.play;
);
~stereo_one.stop(4);
~stereo_one.clear;
~stereo_one.pause;
~stereo_one.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        ].rotate(1);
        var len = LFNoise1.kr(~tempo/32).range(0.5,1.5);
        var imp = PulseDivider.kr(~tick.kr,1);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5*len],[3,-3]),imp * hit)};
        var sig = SinOsc.ar(50!2+(env**50*500),env**50*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

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
