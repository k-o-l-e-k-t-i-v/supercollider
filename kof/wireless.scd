
(
    ~z.kr(1);
    ~z.fadeTime = 0.5;
    (
        {    
            loop{
                ~z = {("wifiSignal".unixCmdGetStdOut++"0").asFloat / 100.0; };
                (0.5).wait;
            };
        }.fork;
    );

);



(
    ~tone.fadeTime=0.02;
    ~tone={
        var val = ~z.kr ** 0.95;
        var sig = SinOsc.ar(400!2 + val.linlin(0,1,0,400),mul:val);
        val.poll;
        sig = sig * LFPulse.ar(val.linexp(0.0,1.0,4,16));
        sig;
    };
    ~tone.play;
);


