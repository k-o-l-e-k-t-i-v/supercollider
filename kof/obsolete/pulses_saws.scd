

s.boot;

(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 2.0;

Ndef(\a,{
	var tempo,m,sig;
	/////////////
	tempo = 4;
	/////////////
	m = Duty.kr(tempo*fib(4),0,Dseq([1,2,1.5,2,0.5,1.25,4,8]*pi,inf));

	sig = SinOsc.ar(43.2/[1,2,3,8]*m*(1.00001**(1..8))) * LFSaw.ar(tempo/2/fib(12)).exprange(0.0001,1) * Pulse.ar(tempo/fib(4)).softclip;

	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = RLPF.ar(sig,LFSaw.ar(tempo/fib(4)).range(2000.01,44.01));
	sig = CombN.ar(sig,1,1,4) + SinOsc.ar(m*43.2 * Pulse.ar(tempo/fib(4)),mul:0.05);
	sig = Splay.ar(sig);
	sig = Resonz.ar(sig,LFTri.ar(tempo/fib(4)).range(22,20000));
	sig = CompanderD.ar(Normalizer.ar(sig,0.1),0.5,1,1/6);
	sig = Limiter.ar(sig,0.1);
	sig = FreeVerb2.ar(sig[0],sig[1],0.13,100);


	sig

}).play;
)
