
s.boot
p=ProxySpace.push(s)
p.push()
s.latency=0.02;

thisProcess.openUDPPort(10001);
(
    //n = NetAddr("127.0.0.1", 10000);

    OSCFunc.newMatching({|msg|
	~tick.quant=0;
	~tick={msg[2]};
    //~no={msg[2]};
	("incoming message:"+msg).postln;
}, '/osc/timer');
)


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
~simple.fadeTime=2;
~simple={
    var harm = 2**((((~tick.kr+1)%26))*[1,5,7,8]/12+1);
	var env = Decay.kr(Changed.kr(~tick.kr),[0.2,0.6,0.4,0.2]);
	var sig = SinOsc.ar(40*harm,env**20*2pi);
	//sig = sig + (LFSaw.ar(50*harm)/2);
	sig = sig * env;
	sig = LPF.ar(sig,4800);
	sig = HPF.ar(sig,30);
	sig = GVerb.ar(sig,40,6)/16+sig;
	//sig = CombL.ar(sig,1,1/40,4);
	sig = LeakDC.ar(sig);

	Splay.ar(sig,1,0.05);
};
~simple.play();
)
~simple.clear(1)

(
~mel={
	var env = Decay2.kr(Changed.kr(~tick.kr),0.045,LFNoise1.kr(1/10).range(0.1,0.9));
	var freq = Select.kr(~tick.kr,(2**([1,5,8,2]/12))*220,mul:LFNoise1.kr(1/10));
	var sig = SinOsc.ar(freq,mul:0.3) * env * LFNoise1.kr(1/10);

	Splay.ar(sig,1,0.75);
};
~mel.play;
)
~mel.stop;


// trig synth ///////////////////////////////////////

(
~trig.ar(2);
~trig.quant=0;
~trig.fadeTime=0.02;
~trig={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    ].rotate(1);
    var imp = Changed.kr(~tick.kr);
    var hit = Select.kr(~tick.kr%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(50!2,env**20*8pi);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
};
~trig.play;
);
~trig.stop(4);
~trig.clear;
~trig.pause;
~trig.resume;

(
~test.fadeTime=1;
~test={
	var trig = Changed.kr(~tick.kr);
	var env = Decay2.kr(trig,0.02,0.75);
	var sig = Select.ar(~tick.kr %5,[
		SinOsc.ar(40!2 + (env**0.2*20)),
		BrownNoise.ar(0.1!2),
		DC.ar(0!2),
		Pulse.ar(4!2),
		WhiteNoise.ar(0.5!2),
	]);
	//sig = sig * env;
	sig = CombL.ar(sig,2/40,1/40,1)/16+sig;
	 sig = GVerb.ar(sig,LFNoise2.ar(1/24).range(40,90),3)/2+(sig/2);

	Splay.ar(sig,1,0.25);
};
~test.play();
)
~test.clear
~test.stop(16)



(
~test2.fadeTime=2;
~test2={
	var trig = Changed.kr(~tick.kr);
	var sig = Select.ar(~tick.kr %5,[
		BrownNoise.ar(0.2!2),
		SinOsc.ar(160),
		Pulse.ar(16),
		DC.ar(0),
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
