
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
        
        notes = (code).linexp(0,127,12.midicps,60.midicps);
        speed = 1/[1,1,110];
        mod = 2**(Duty.kr(4,0,Dseq([1,5,1,8,1,11,1,8],inf))/12+1);
        freq = Duty.ar(speed,0,Dseq(notes,inf)).lag(speed/2*mod);
        sig = LFSaw.ar(freq*mod,mul:2pi);
        sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].cos);
        sig = LeakDC.ar(sig);
        sig = SinOsc.ar(sig.range(freq/2,freq*2),mul:0.1) + Formant.ar(freq*mod,freq*mod*3,freq*mod*2,0.5);
        sig = CombC.ar(sig,1,1/4,2);
        sig = LPF.ar(sig,3500);
        Splay.ar(sig,0.0,0.7);
    };
)

~voice1.stop;
