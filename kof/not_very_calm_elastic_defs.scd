
p = ProxySpace.push(s);
Ndef.defaultReshaping = \elastic;


(
~a.fadeTime = 5;
~a.play;
~a.quant = 2;


~modulate.quant=2;
~modulate = {Duty.kr(4*(1..8),0,Dseq([0,-12,-24,-12,12],inf))};

~a[0]={
	var sig;

	sig = SinOsc.ar(([60,67,64,69,65,60-12+7,60-24+4]+~modulate).midiratio * (pi) * (1..12) * (1.0001**(1..12)),SinOsc.ar(8/[11,22,44]).range(-pi,pi),mul:1/(1..12));
	sig = sig * LFSaw.ar(1/(1..8)).range(0,1) * 2;
	sig = sig + (LFSaw.ar([44,88] * Decay2.ar(Impulse.ar(4/[1,2]),0.002,0.18,5,1),0.1) * Decay2.ar(Impulse.ar(4/[1,2]),0.2,1));
	sig = sig + (HPF.ar(WhiteNoise.ar(0.005!4),TExpRand.ar(440,16000,Impulse.ar(1/2!4))) * Pulse.ar([1/4,1/8,1],[1,2,6,8].normalize));
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.2,1);
};



~a[10]=\filter->{|in| BBandPass.ar(in,SinOsc.ar(1/12/(1..8)).range(44,8000)) };
~a[12]=\filter->{|in| Resonz.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5};
~a[14]=\filter->{|in| Vibrato.ar(in,[4,5,6,7],0.2)};
~a[16]=\filter->{|in| FreeVerb.ar(in,SinOsc.ar(1/5/(1..8)).range(0.01,0.3),1)};

)