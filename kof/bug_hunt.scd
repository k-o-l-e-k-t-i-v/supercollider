(
    s.reboot();
    NodeProxy.defaultReshaping = nil;
    p=ProxySpace.push(s);
    p.makeTempoClock;
)



(
    p.clock.tempo_(240/60);
    ~offset = (0..7)/8;
    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
);

(
    fork {
        1000.do {



                ~ss.ar(2);
                ~ss.quant=2;
                ~ss.fadeTime=0.2;
                ~ss.play;
                ~ss={
                    //         |       |       |       |       |  
                    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
                    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
                    var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
                    var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[1,-3],curve:'exp'),imp * hit);
                    var sig = LFNoise2.ar(18000/([1,2,4,8]*pi)) ;
                    sig = sig * env;
                    Splay.ar(sig,0.15,0.15);
                };





            wait(rrand(0.4, 0.03).postln);
            if(~a.rate != \audio) { "found one --------------- ".postln; ~a.dump; ~a.throw }
        }

    }
);

