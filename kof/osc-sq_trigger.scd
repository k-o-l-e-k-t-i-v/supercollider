
s.boot
p=ProxySpace.push(s)
p.push()
s.latency=0.05;

thisProcess.openUDPPort(10000);
thisProcess.openUDPPort(11000);
(
    //n = NetAddr("127.0.0.1", 10000);

    OSCFunc.newMatching({|msg|
	~tick.quant=0;
	~tick={msg[2]};
    ~t={msg[4]/60.0};
	("incoming message:"+msg[2]).postln;
}, '/osc/timer');
)

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 36;
    ~counter.quant = 36;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// eightyharm synth ///////////////////////////////////////
2**
((1..9)*.x(1..9)*7%12)

(
~eightyharm.ar(2);
~eightyharm.quant=4;
~eightyharm.fadeTime=2;
~eightyharm={
    var duty = Duty.kr([1,2,3]*4/~tempo,0,Dseq( (2**( ((1..9)*.x(1..9)*3 % 12).scramble)/12+1),inf ));
	var env = Decay2.kr(Changed.kr(~tick.kr),0.02,0.35);
    var sig = SinOsc.ar(duty*[1,0.5,4/3]*50)*env;
    Splay.ar(sig,0.05,0.15);
};
~eightyharm.play;
);
~eightyharm.stop(4);
~eightyharm.clear;
~eightyharm.pause;
~eightyharm.resume;

s.scope



~tempo={115.741/120};

(
~simple.quant=4;
~simple.fadeTime=2;
~simple={
    var last  = Duty.kr([1,2,3,4]/4,0,Dseq([5,8,12,-12],inf))*3;
    var mod = Duty.kr([4,16,64,8],0,Dseq([1,2,5/4,4/3,4],inf));
    var harm = 2**(Select.kr(~tick.kr,[7,5,last,9,last,1,5,8,11])/12)+1;
	var env = Decay2.kr(Changed.kr(~tick.kr)*LFPulse.kr(4),0.02,0.35);
    var base = [300,400.001,200] + LFNoise2.kr(1/[1,2,3,4]*4);
	var sig = SinOsc.ar(base*harm*mod,2**0.5*env*2pi,mul:LFNoise1.kr([1,2,3]/4));
    var ramp = LFSaw.ar(base*harm) * 2pi;
	sig = Perlin3.ar(ramp[0].cos,ramp[1].sin,LFSaw.ar(1/[1,2,3]/36)*10pi)/2 + sig/2;
    sig = LeakDC.ar(sig);
	sig = sig * env + (LPF.ar(sig,900)/2);
    //sig = sig + LFCub.ar(440*harm/mod) * Pulse.ar(8);
	sig = LeakDC.ar(sig)/2;
	sig = CombL.ar(sig,1/base/harm,4/base/harm,1/3)/32+sig;
	sig = LPF.ar(sig,13800);
	sig = HPF.ar(sig,30);
	sig = LeakDC.ar(sig);
	sig = GVerb.ar(sig,60,3)/16+sig;

	Splay.ar(sig.flat,0.75,0.3);
};
~simple.play();
)
~simple.clear

(
~mel={
	var env = Decay2.kr(Changed.kr(~tick.kr),0.045,LFNoise1.kr([1,1,1]/10).range(0.01,0.39));
	var freq = Select.kr(~tick.kr,2**([1,5,8,11]/12+1))*220.0;
	var sig = SinOsc.ar(freq,mul:0.3) * env;

	Splay.ar(sig,0.5,0.175);
};
~mel.play;
)
~mel.stop;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=36;
~kick.fadeTime=0.02;
~kick={
    //  |       |       |       |       |  
    var pat = [
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit)};
    var sig = SinOsc.ar(50!2);
    sig = sig * env;
    Splay.ar(sig,0,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

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
