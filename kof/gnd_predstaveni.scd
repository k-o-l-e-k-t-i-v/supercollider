
s.scope;

////////////////////////////////////////////////////////////////


(
~one.stop;
~one.fadeTime = 4;
~one.play;
~one={
	var sig = LFSaw.ar(1500*1.5+SinOsc.ar(1/11/fib(12)).range(-10,10),mul:0.00005);
	Splay.ar(sig);

};
~one[50]=\filter->{|in|FreeVerb.ar(in,0.22,0.5)};
)

~one.stop(10)


/////////////////////////////////////////////////////////////////



(
~a.fadeTime = 2;
~a.play;
~a.quant = 4;


~modulate.quant=2;
~modulate = {Duty.kr(4*(1..8),0,Dseq([0,-48,-24,-12,-36]+12,inf))};

~a[0]={
	var sig;

	sig = SinOsc.ar(([60,67,64,69,65,60-12+7,60-24+4]+~modulate).midiratio * (pi) * (1..12) * (1.0001**(1..12)),SinOsc.ar(8/[11,22,44]).range(-pi,pi),mul:1/(1..12));
	sig = sig * LFSaw.ar(1/(1..8)).range(0,1);
	sig = sig + (SinOsc.ar([44,45] * Decay2.ar(Impulse.ar(4/[1,2]),0.002,0.18,5,1),0.1) * Decay2.ar(Impulse.ar(4/[1,2]),0.2,1));
	sig = sig + (HPF.ar(WhiteNoise.ar(0.005!4),TExpRand.ar(440,16000,Impulse.ar(1/2!4))) * Pulse.ar([1/4,1/8,1],[1,2,6,8].normalize));
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.01,0.471);
};



~a[10]=\filter->{|in| Splay.ar(BBandPass.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5)};
~a[12]=\filter->{|in| Splay.ar(Resonz.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5)};
~a[14]=\filter->{|in| Splay.ar(Vibrato.ar(in,[4,5,6,7],0.2))};
~a[16]=\filter->{|in| Splay.ar(FreeVerb.ar(in,SinOsc.ar(1/10/(1..8)).range(0.01,0.18),1))};

)

/////////////////////////////////////////////////////////////////////////

(
~two.quant=2;
~two.fadeTime=1;
~two.play;
~two={Splay.ar(SinOsc.ar(43.2*1.5pi/2*[1,1.5,3,2],mul:0.4) * LFSaw.ar([1,2,3,4]/2)).exprange(1.001,0.01) };
// ~two[50]=\filter->{|in| Splay.ar(CombN.ar(in,1/2,1/2,2))};
)

/////////////////////////////////////////////////////////////////////////


(
~b.stop(10);
~b = {

	var sig;
	sig = Pluck.ar(
		LFSaw.ar(43.2*(1.00001**(1..8))*(Pulse.ar(4)*0.5+1)),Impulse.ar(6/[1,2]),0.01+TExpRand.ar(0.0001,0.1,Impulse.ar(1/2)).lag(1),0.01+TExpRand.ar(0.0001,0.05,Impulse.ar(1/4)).round(0.0025),0.55);

	sig = LPF.ar(sig,4000) + Resonz.ar(WhiteNoise.ar(0.75),LFSaw.ar(1/4/[1,2]).exprange([440.01,880],1.01));
	sig = sig + (SinOsc.ar(4320*[2,8,0.25,1.5,0.5],mul:0.5) * Decay.ar(Impulse.ar(1/16,[1,2,4,8].normalize),2));
	sig = sig + (SinOsc.ar(43.2 * 3,mul:0.5)* Decay.ar(Impulse.ar(1),1));
	sig = CompanderD.ar(sig,0.9,1,0.1);
	sig = FreeVerb.ar(sig,0.133,200);
	sig = Limiter.ar(sig,1);
	Splay.ar(sig,0.01,0.25);
};
~b.play;
)

//////////////////////////////////////////////////////////////////////////////



(
Ndef(\pila).fadeTime = 2.0;
Ndef(\pila).quant = 2.0;

Ndef(\pila,{Splay.ar(
	RLPF.ar(
		SinOsc.ar(LFSaw.ar(11.33).exprange(22.0,17777),mul:0.75) * SinOsc.ar(11.32).squared * SinOsc.ar(8/[8,5,3,1]).lag(0.001+SinOsc.kr(0.01).range(0,0.01))
		,LFNoise0.ar(1/[4,4]).range(22,17777).lag(1))
,0.1,0.1)}).play;

Ndef(\pila)[1] = \filter -> {|in| Resonz.ar(in,LFNoise0.ar(1/[4,4]).range(22,17777).lag(1),mul:0.33,add:in)};
Ndef(\pila)[2] = \filter -> {|in| GVerb.ar(in,100,mul:0.33,add:in)};

)


///////////////////////////////////////////////////////////////////////////////