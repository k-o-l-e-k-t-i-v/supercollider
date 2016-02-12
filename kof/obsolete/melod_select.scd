

p = ProxySpace.push(s);

(
~s = {Duty.kr(1/8,0,Dseq((0..3),inf))};
~mod = {Duty.kr(Dseq([2,1,1/2,2,1/4,1,1]*4,inf),0,Dseq([1,1.5,2,1.25,4,0.75,1.5],inf))};


~s.quant = 2;
~mod.quant = 2;

~a.quant = 2;

~a={

	var sigs,sel,fad;


	sigs=[
		LFPulse.ar(432/1.5*~mod*(1.0002**(1..8))/4),
		LFSaw.ar(432/2*~mod*(1.0003**(1..8))/5),
		Blip.ar(432/5*~mod*(1.00023**(1..8)),2,2),
		LFSaw.ar(432/3*~mod*(1.0001**(1..8))),
	];


	fad = LFSaw.ar(1/fib(12)).range(0,3);
	sel = Select.ar(~s,sigs);
	sel = sel + (SinOsc.ar(44+Pulse.ar(4).exprange(250.01,0.01)) * Pulse.ar(4));
	sel = Vibrato.ar(sel,[4,5,6,7],0.3);
	sel = Resonz.ar(sel,LFSaw.ar(4/[1,2,4]++(1/4/[1,8])).exprange(14000.01,22));
	sel = CompanderD.ar(sel,0.5,1,1/10);
	sel = FreeVerb.ar(sel,0.1,0.5);

	Splay.ar(sel,0.1);

};

~a.play;
)