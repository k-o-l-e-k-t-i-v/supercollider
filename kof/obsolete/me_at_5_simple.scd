
(
~a={

	var noty,sig;

	noty=[60-24,60-12,60,65,67,72,64,72+12].midicps;

	sig=SinOsc.ar(Select.kr(~n,noty));
	Splay.ar(sig);

}
)

~a.play;