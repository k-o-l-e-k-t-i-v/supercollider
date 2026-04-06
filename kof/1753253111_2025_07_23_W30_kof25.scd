
p.push();
p.bpm(110);

b = Buffer.read(s,"/usr/share/SuperCollider/sounds/250421_0180.wav");
b = Buffer.read(s,"/usr/share/SuperCollider/sounds/250421_0181.wav");
b = Buffer.read(s,"/usr/share/SuperCollider/sounds/250422_0182.wav");
b = Buffer.read(s,"/usr/share/SuperCollider/sounds/250422_0183.wav");
b = Buffer.read(s,"/usr/share/SuperCollider/sounds/250422_0184.wav");

// player synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=4;
    ~one.fadeTime=2.02;
    ~one={
    var mod = [1,-1];//2**([1,5,8]/12+1);//[-1,0.25,-0.25,1/8,1/16];
    var spread = 0.001;
    var pos = LFSaw.kr([1,2,3,4]/36+0.001);
    //         |       |       |       |       |  
    var pat = [1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.2,2.95],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(2,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!4).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = CompanderD.ar(sig,3/4,1/2,1)  ;
    //sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[0].sin)/8 + sig;
    sig = sig * env;
    sig = LeakDC.ar(sig);
    sig = CombL.ar(sig,1/~tempo,1/~tempo,2);
    Splay.ar(sig,0.95,0.5);
    };
    ~one.play;
);
~one.stop(7);
~one.clear;
