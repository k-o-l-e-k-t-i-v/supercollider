
p = ProxySpace.push(s);
Ndef.defaultReshaping = \elastic;


(
~a.fadeTime = 5;
~a.play;
~a.quant = 2;


~modulate.quant=2;
~modulate = {Duty.kr(8*(1..4),0,Dseq([0,12,24,-12,-36],inf))};

~a[0]={
	var sig;

	sig = SinOsc.ar(([60,67,64,69,65,60-12+7,60-24+4,60-36+5]-~modulate).midiratio * (pi) * (1..12) * (1.001**(1..12)),SinOsc.ar(8/[11,22,44]).range(-pi,pi),mul:1/(1..12));
	sig = sig * LFSaw.ar(1/(1..12)).range(0,1);
	sig = CompanderD.ar(sig,0.5,1,1/10);
	sig;
};



~a[10]=\filter->{|in| BBandPass.ar(in,SinOsc.ar(1/12/(1..8)).range(44,800))};
~a[12]=\filter->{|in| Resonz.ar(in,SinOsc.ar(1/4/(1..8)).range(44,800))};
~a[14]=\filter->{|in| Vibrato.ar(in,[4,5,6,7],0.2)};
~a[16]=\filter->{|in| FreeVerb.ar(in,SinOsc.ar(1/4/(1..8)).range(0.01,0.4),10)};

)