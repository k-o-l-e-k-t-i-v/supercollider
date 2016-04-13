

s.boot;
p=ProxySpace.push(s.boot);

(
    ~schizzo={

        var t = Impulse.kr(2,(0..3)/4);
        var env = Linen.kr(t,0.002,1,0.535);
        var sig = LFSaw.ar(50*(env.pow(4)*0.01+1))*env;
        
        sig=[
            RLPF.ar(sig,400*(env.pow(3)*8+1)),
            RHPF.ar(sig,400*(env.pow(3)*8+1)),
            BPF.ar(sig,400*(env.pow(3)*8+1)),
            Resonz.ar(sig,400*env.pow(3)*8+1),
            CombN.ar(sig+LFSaw.ar(5000,mul:0.2),0.04,0.04,8),
            CombC.ar(sig,0.02,0.04,32),
            CombL.ar(sig+WhiteNoise.ar(0.2),0.4,0.04,32),
        ];

        sig = Select.ar(TRand.kr(0,sig.size()+0.01,Impulse.kr(8)),sig);
        
        sig = CombN.ar(sig,1,1,4);

        Splay.ar(sig,0.1);
    };
    ~schizzo.play;
)
