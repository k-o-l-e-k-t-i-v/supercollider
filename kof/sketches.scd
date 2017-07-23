

p.push();
p.bpm(79);

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var mod = Duty.kr(8/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
        var f = 79 * [1,2,4,8,16,32] /.x [1,1.5,1.33333,2,4,8] *.x mod;
        var in = Delay1.ar(LocalIn.ar(2)/4);
        var t = CombN.ar(in * Pulse.ar(~tempo*4/(1..12)).softclip,1/f/(1..12) * LFTri.ar(~tempo/[1,2,3,4]),1/f/(1..12),1/4);
        var sig = SinOsc.ar(f,mul:0.85) + t / 8;
        sig = BPF.ar(sig,f,LFTri.ar(~tempo/4/(1..12)).range(0.001,0.5)**3 ) * LFTri.ar(~tempo/(1..12));
        sig = CompanderD.ar(sig,3/4,1/2,1);
        LocalOut.ar(NumChannels.ar(sig,2));
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~kash.ar(2);
    ~kash.quant=2;
    ~kash.fadeTime=16.02;
    ~kash={
        var in = Delay1.ar(LocalIn.ar(1)/2*0.99995);
        var mod = 1/[1,1.333,1.5,2,4,8];//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.002;
        var pos = LFNoise1.kr(~tempo/16!3);
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env**0.62*0.001),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig + BPF.ar(in,72.midicps/mod,0.12);// * env;
        LocalOut.ar(NumChannels.ar(sig,1));      
        //sig = sig * env;
        Splay.ar(sig.flat,0.75,0.15);
    };
    ~kash.play;
    ~kash[10] = \filter -> {|in| CombN.ar(NumChannels.ar(in,2),~tempo/[8,16,32],~tempo/8,LFNoise1.kr(~tempo/32).range(0.001,3))/4+in/2;};
    ~kash[11] = \filter -> {|in| Compander.ar(NumChannels.ar(in,2),~kick.ar,0.1,1,0.1); };
);
~kash.stop(7);
~kash.clear;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/douce.wav");

// player synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.quant=16;
    ~two.fadeTime=16.02;
    ~two={
        var mod = 1/[1,1/2,1/1.3333];//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.01;
        var pos = [0,0.5] + LFSaw.ar(~tempo/160/[1,2,3]);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[4,8,16],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        Splay.ar(sig.flat,0.75,0.5,SinOsc.kr(1/[7,8]));
    };
    ~two.play;
    ~two[10] = \filter -> {|in| DWGReverbC1C3.ar(NumChannels.ar(in,2)-~kash.ar,[4000,4010],1/10)/3; };
    ~two[11] = \filter -> {|in| Compander.ar(NumChannels.ar(in,2),~kick.ar,0.1,1,0.1); };
);
~two.stop(7);
~two.clear;

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(45!2+(env**10*10),env**[40,80,20]*8pi);
        sig = sig * env;
        Splay.ar(sig,0.05,0.55);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;




// oneone synth ///////////////////////////////////////

(
    ~oneone.ar(2);
    ~oneone.clock = p.clock;
    ~oneone.quant=4;
    ~oneone.fadeTime=4;
    ~oneone={
        var f = Duty.kr(16/~tempo,0,Dseq(58.midicps/([1,2,1.5,1.33333]) *.x [1,2,4,1/2,4/3],inf));
        var sig = DelayN.ar(LocalIn.ar(2)*LFNoise2.kr(~tempo/4!2).range(0.96,0.99999) , 1/f, 1/f);
        sig = AllpassN.ar(sig,1/f,1/f,1/4);
        sig = PitchShift.ar(sig,1/f/2,1-[1,3].reciprocal);
        sig = SinOsc.ar(f!2,mul:0.25) * Pulse.ar(~tempo/[1,1.501]).softclip + sig;
        LocalOut.ar(NumChannels.ar(sig,2));
        Splay.ar(sig.flat,0.75,0.25,SinOsc.kr([7.01,8.023]));
    };
    ~oneone.play;
    ~oneone[10] = \filter -> {|in| DWGReverbC1C3.ar(in,4000,1/10)/4+in};
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;
