

p.push();
b = Buffer.alloc(s,s.sampleRate * 2, 1);

// recorder synth ///////////////////////////////////////

(
    ~recorder.ar(2);
    ~recorder.clock = p.clock;
    ~recorder.quant=4;
    ~recorder.fadeTime=4;
    ~recorder={
        var sig = SinOsc.ar([1,1/800]++1/32/((1..14).reciprocal+1))/4 + LFSaw.ar(1/160/[1,2,3],mul:4);
        sig = Perlin3.ar(sig[0],sig[1],sig[2..16]) * (LFNoise1.kr(1/16!16)**1.5);
        RecordBuf.ar(Mix(sig),b.bufnum,0,1,0.1);

        //Splay.ar(Mix(sig),0.5,0.25);
    };
    //~shaper.rebuild;
    //~recorder.play;
);
~recorder.stop(4);
~recorder.clear;
~recorder.pause;
~recorder.resume;

RecordBuf.help

// shaper synth ///////////////////////////////////////

(
    ~shaper.ar(2);
    ~shaper.clock = p.clock;
    ~shaper.quant=4;
    ~shaper.fadeTime=4.1;
    ~shaper={
        var base = [500,250,75] + SinOsc.ar(1/4/[5,6,7],mul:1.15);
        var sig = SinOsc.ar(base /.x [1,2,1.5,1.3333]).range(0.1,0.9);
        sig = Shaper.ar(b,sig);
        sig = BRF.ar(sig,LFNoise2.kr(1/16!8).range(1600.01,50),1);
        sig = LPF.ar(sig,2800);
        sig = HPF.ar(sig,10);
        //sig = AllpassL.ar(sig,1,1/4,4);
        sig = Vibrato.ar(sig,[6,7,8],0.2);
        Splay.ar(sig,0.75,0.5,SinOsc.kr(9)/4);
    };
    ~shaper.play;
);
~shaper.stop(4);
~shaper.clear;
~shaper.pause;
~shaper.resume;

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
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**80*8pi);
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
