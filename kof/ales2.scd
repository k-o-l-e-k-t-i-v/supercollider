

(
    p=ProxySpace.push(s.reboot);
);

(
    p.clock.tempo_(60/60);

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
        var sig = AudioIn.ar([1,2]) ;
        var pure = sig;
        sig = PitchShift.ar(sig,0.12,LFNoise2.kr(1/2!8).exprange(0.75,2.15));
              sig = DelayN.ar(sig,[1,2,3,4,5,6]) * LFNoise2.kr(1/4!8);
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
)

(

    Tdef(\a,{
        loop{
            ("echo "+x.choose.choose+" |  uconv -f utf-8 -t iso-8859-2 - | festival --tts").unixCmd;
            4.wait;  
        }
    });
    Tdef(\a).play;
)
("rekniTo").unixCmd;
