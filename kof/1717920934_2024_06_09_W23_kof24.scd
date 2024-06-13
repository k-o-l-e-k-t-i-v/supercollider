

p.push();

// 10cm = 1717.1 Hz @ 20C
thisProcess.openUDPPort(10000);
(
    //n = NetAddr("127.0.0.1", 10000);

    OSCFunc.newMatching({|msg|
	~tick.quant=0;
	~tick={msg[2]};
    ~t={msg[4]/60.0};
	//("incoming message:"+msg[2]).postln;
}, '/osc/timer');
)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=2;
~one={
    var harm = 1;//2**([1,5,8]/12)+1;
    var freq = 1717.1*harm;
    var sig = SinOsc.ar(freq!2) * Decay.kr(Changed.kr(~tick.kr),0.2);
    Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
