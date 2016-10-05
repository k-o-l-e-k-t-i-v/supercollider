Quarks.install("https://github.com/supercollider-quarks/OpenObject.git")
OpenObject.start;
OpenObject.openInterpreter;



a="ok";
(
    ~voice1.quant=0;
    ~voice1.play;
    ~voice1.fadeTime=0.02;
    ~voice1={|input|
        var notes,code,sig,freq,speed,mod;
        var env;


        //////////////////|/////////|/////////|/////////|/////////|////////| 
        code=a;
        //////////////////|/////////|/////////|/////////|/////////|////////| 


        code=code.ascii;


        notes = (code).linexp(20,127,300,16500);
        speed = 1/16;///(1..8);
        env = EnvGen.kr(Env([0,1,1,0],[0.02,speed*a.size,0.1],[-3,1]));
        mod = 2/[1,2];
        freq = Duty.ar(speed,0,Dseq(notes,inf)) * LFTri.ar(1/speed);//.lag(speed/2*mod);
        sig = SinOsc.ar(freq!2,mul:0.2) + LFNoise2.ar(freq*2,freq.linlin(50,10000,1,0));
        sig = sig + Formant.ar(freq!2,freq.lag(0.02*speed*mod),freq.lag(0.01*speed*mod)*2,0.09);
        sig = sig * env;

        Splay.ar(sig,0.2,0.39,SinOsc.ar(speed*16)/3);
    };
    ~voice1[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),4500),[4000,4010],1/4)/4+sig};
)
~voice1.clear;
