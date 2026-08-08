
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
    ~voice1.quant=2;
    ~voice1.play;
    ~voice1.fadeTime=5;
    ~voice1={|input|
        var notes,code,sig,freq,speed,mod;


       //////////////////|/////////|/////////|/////////|/////////|////////| 
        code="kof is ok";

       //////////////////|/////////|/////////|/////////|/////////|////////| 
        
        
        code=code.ascii;
        
        notes = (code).linexp(20,127,55,1500);
        speed = 1/[1,1,50];
        mod = 2**([1,5,8]/12+1);
        freq = Duty.ar(speed,0,Dseq(notes,inf)).lag(speed/2*mod);
        sig = LFSaw.ar(freq*mod,mul:2pi);
        sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].cos);
        sig = sig + Formant.ar(freq*mod,freq*3,freq*2,0.5);
        sig = CombC.ar(sig,1,1/50,1);
        sig = LPF.ar(sig,1500);
        Splay.ar(sig,0.0,0.4);
    };
)

~voice1.stop;
