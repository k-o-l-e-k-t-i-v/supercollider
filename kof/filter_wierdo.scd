

(
    p=ProxySpace.push(s.reboot);
);

(
    p.clock.tempo_(120/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=0.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = AudioIn.ar([1,2]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// zeman synth ///////////////////////////////////////

(
    ~weirdo.quant=1;
    ~weirdo.fadeTime=4.02;
    ~weirdo={
        var sig = AudioIn.ar([1,2]) + ~glitch2.ar + ~b.ar;
        var pure = sig;
        sig = PitchShift.ar(sig,0.12,LFNoise2.kr(1/2!8).exprange(0.75,2.15));
              sig = DelayN.ar(sig,[1,2,3,4,5,6],[1,2,3,4,5,6]) * LFNoise2.kr(1/4!8)+sig;
        //sig = GVerb.ar(HPF.ar(sig,100) + LPF.ar(sig,8000),[16,16],[5,6],spread:[50,90])/32 + sig;
        Splay.ar(sig.flat,0.005,1);
    };
    ~weirdo.play;
);
~weirdo.stop(7);
~weirdo.clear;


(
    var tmp = '';

    x = FileReader.read("/tmp/text.txt");

    x.collect{|n| tmp = tmp ++ n };
    tmp.postln;

    x.choose.choose;

    Tdef(\a,{
        loop{
            ("echo "+x.choose.choose+" |  uconv -f utf-8 -t iso-8859-2 - | festival --tts").unixCmd;
            4.wait;  
        }
    });
    Tdef(\a).play;
)
("rekniTo").unixCmd;

// lin synth ///////////////////////////////////////

b = Buffer.alloc(s, 44100 * 8, 2); 
(
~lin.ar(2);
~lin.clock = p.clock;
~lin.quant=2;
~lin.fadeTime=4;
~lin={
  var sig = AudioIn.ar([1,2]);
  Splay.ar(sig,0.5,0.95);
};
//~lin.play;
);
~lin.stop(4);
~lin.clear;
~lin.pause;
~lin.resume;

RecordBuf.help
(
    ~rec.quant=4;
    ~rec.ar(2);
    ~rec = { arg rate=1; 
        var sig = ~lin.ar;

        sig = Limiter.ar(sig);
        //sig = CompanderD.ar(sig,3/4,1/1.1,1/2);
        sig = NumChannels.ar(sig,2);
        //sig = CombN.ar(sig,1/50,1/50,1/4);
        RecordBuf.ar(sig,b.bufnum,0,1,0.434,loop:1);
        //BufWr.ar(sig, b.bufnum, Phasor.ar(0, BufRateScale.kr(b) * rate, 0, BufFrames.kr(b)));
        0.0 //quiet
    };

)

// use SinOsc to modulate the playrate

(
    ~b.ar(2);
    ~b.mold(2);
    ~b.quant=2;
    ~b.fadeTime=4;
    ~b = { 
        //var mod = LFNoise2.kr(1/4/(1..16)).range(-0.998,TChoose.kr(Impulse.kr((1/4/(1..16))),[1,2,4,8,16,1/16,1/4,1/8]))  ;
        var mod = LFNoise2.kr(1/4/(1..16)).range(0.5,TChoose.kr(Impulse.kr((1/4/(1..16))),[1,2,3,4,6,8,16].reciprocal+1))  ;
        //var sig = BufRd.ar(2, b.bufnum, LFSaw.ar([1/4,1/1.5,1/1.33333,1/2]/mod,mul:[1,1,0.52,0.71]).range(0, BufFrames.kr(b)));
        var sig = PlayBuf.ar(2,b.bufnum,mod,loop:1);
        //sig = sig * (LFTri.ar(1/16/[1,2,4,3])**4)/4;

        //sig = sig * LFTri.ar(1/4/[1,2,3,4]);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        //sig = LPF.ar(sig,15900);
        Splay.ar(sig,0.95,0.15);
    };
    ~b.play;
    ~b[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5000),[5000,5021],1/30)/1.1+sig};
)

~b.stop;
~b.clear;


