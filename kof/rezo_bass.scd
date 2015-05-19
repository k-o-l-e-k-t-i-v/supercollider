

(
~bass.fadeTime=2;
~bass={
	var mod = Duty.kr(4,0,Dseq(0.5pi/[1,1.5,1.25,1.75,1.125,2],inf));
	var sig = LFSaw.ar((1..10)/(1000.0/(mod**4))+55*mod,mul:0.8);
	sig = Resonz.ar(sig,43.5+SinOsc.ar(8/fib(10)).range(-20,100),LFSaw.ar(8/fib(10)).range(0.01,20));
	sig = sig * Decay.ar(Impulse.ar(1/2,(1..16)/16),LFSaw.ar(1/4/fib(10)).range(0.15,0.75));
	sig = Mix(sig);
	sig = Limiter.ar(sig).softclip;
	sig = GVerb.ar(sig,[2,3,40,80])/2 + (sig/2);
	sig = CompanderD.ar(BPF.ar(sig,1000*(mod**2)/(1..10)),0.9,1/2,1/2);

	Splay.ar(sig.flat,0.5,0.5);

};
~bass.quant=2;
~bass.play;
)