(
    ~pp={var sig,freq,env,tempo,harm,disharm;
        RandSeed.ar(1,2016);
        disharm = LFNoise2.ar(40/(1..8))**40;
        tempo = 60/60;
        freq = ((LFNoise2.kr(1/4/(1..8)).range(0,1).pow(2).range(100,18000/8*(1..8))));
        harm =  [2,3,7,4].octcps / [1!4,1.5!2,2,4,8,16,1.3333!2];
        freq = SelectX.kr(0.001+disharm,[harm,freq]);
        //freq = [] ++ [50,100] ++ (freq + SinOsc.kr(1/4/(1..10)) + LFNoise1.ar(1!10,mul:4));
        freq =(freq + SinOsc.kr(1/4/(1..10)) + LFNoise1.ar(1!10,mul:4));
        env = Decay.ar(Impulse.ar(tempo*4/(1..10)),0.5*(1..8)) ** 4.2 ;
        sig = SinOsc.ar(freq,Pulse.ar(tempo*1/4/(1..10)),mul:LFNoise2.kr(1/8!10)) * env;
        sig = sig + SinOsc.ar(freq / [2,1.5,4,1.333] + 0.1,mul:0.1) * SinOsc.ar(freq/1000);
        sig = sig + (LFSaw.ar(freq/4,mul:0.1) * LFSaw.ar(1/4/(1..10)).pow(4) );
        sig = Vibrato.ar(sig,[2,3,4,5],0.2);
        sig = AllpassN.ar(sig,1/50,1/5,4.5);
        sig = LPF.ar(sig,1600);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig, 0.72 , 0.25, SinOsc.kr(7/[1,1.3333]) );
    };
    ~pp.quant=2;
    ~pp.play;
)

//todo language based on perlin noise
(

    var hash={|input|
        var seed = 0;
        input.asString.ascii.collect{|n| seed = (seed + n * n * n)%10000 };
        seed;
    };

)
