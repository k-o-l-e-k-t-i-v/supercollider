
s.boot
p=ProxySpace.push(s)
p.push()

thisProcess.openUDPPort(10000);
(
    //n = NetAddr("127.0.0.1", 10000);

    OSCFunc.newMatching({|msg|
	~tick.quant=0;
	~tick={msg[1]};
	("incoming message:"+msg[1]).postln;
}, '/osc/timer');
)


(
~simple.fadeTime=2;
~simple={
	var env = Decay.kr(Changed.kr(~tick.kr),1);
	var sig = SinOsc.ar(40!2+(env**20*220));
	//sig = sig + LFSaw.ar(40);
	sig = sig * env;
	sig = LPF.ar(sig,1800);
	sig = HPF.ar(sig,30);
	//sig = GVerb.ar(sig,LFNoise1.kr(4).range(40,90),6);
	// sig = CombL.ar(sig,1,1,4);
	sig = LeakDC.ar(sig);

	Splay.ar(sig,1,0.4);
};
~simple.play();
)
~simple.clear

(
~mel={
	var env = Decay.kr(Changed.kr(~tick.kr),2.75);
	var freq = Select.kr(~tick.kr,[50,60,50,300,40]);
	var sig = LFSaw.ar(freq,mul:0.3) * env;

	Splay.ar(sig,1,0.5);
};
~mel.play;
)
~mel.stop;

(
~test.fadeTime=1;
~test={
	var trig = Changed.kr(~tick.kr);
	var env = Decay2.kr(trig,0.02,0.75);
	var sig = Select.ar(~tick.kr,[
		SinOsc.ar(40!2 + (env**0.2*20)),
		BrownNoise.ar(0.1!2),
		DC.ar(0!2),
		Pulse.ar(4!2),
		WhiteNoise.ar(0.5!2),
	]);
	//sig = sig * env;
	sig = CombL.ar(sig,2/40,1/40,1)/16+sig;
	 sig = GVerb.ar(sig,LFNoise2.ar(1/24).range(40,90),6)/2+(sig/2);

	Splay.ar(sig,1,0.25);
};
~test.play();
)
~test.clear
~test.stop(16)



(
~test2.fadeTime=6;
~test2={
	var trig = Changed.kr(~tick.kr);
	var sig = Select.ar(~tick.kr,[
		SinOsc.ar(80),
		BrownNoise.ar(0.2!2),
		DC.ar(0),
		Pulse.ar(4),
		LFSaw.ar(40,mul:0.2),

	]);
	var env = Decay2.kr(trig,0.02,0.62);
	//sig = sig * env;
	sig = CombL.ar(sig,1/50,1/50,1)/16+sig;
	sig = GVerb.ar(sig,90,3)/16+sig;
	Splay.ar(sig,0.1,0.2);
};
~test2.play();
)
~test2.stop

~test2.stop
