

p = ProxySpace.push(s);

(
~s = {Duty.kr(1/4,0,Dseq((0..3),inf))};

~s.quant = 2;
~a.quant = 2;

~a={

	var sigs,sel,fad,mod;

	mod = Duty.kr(Dseq([1,1,1/2,2,1/4,1,4]*8,inf),0,Dseq([1,1.5,2,1.25,4,0.75,1.5],inf));


	sigs=[
		LFPulse.ar(432*mod*(1.002**(1..8))/4),
		LFSaw.ar(432*mod*(1.003**(1..8))/5),
		Blip.ar(432/6*mod*(1.0023**(1..8)),2,2),
		LFSaw.ar(432/1.5*mod*(1.001**(1..8))),
	];


	fad = LFSaw.ar(1/fib(12)).range(0,3);
	sel = Select.ar(~s,sigs) + (SinOsc.ar(44+LFPulse.ar(2).range(250/mod,0)) * Pulse.ar(2));
	sel = Vibrato.ar(sel,[4,5,6,7],0.3);
	sel = BBandPass.ar(sel,LFSaw.ar(1*[1,2,4]++(1/4/[1,8])).exprange(14000.01,22));
	sel = CompanderD.ar(sel,0.5,1,1/10);
	sel = FreeVerb.ar(sel,0.1,0.1);

	Splay.ar(sel,0.1);

};

~a.play;
)