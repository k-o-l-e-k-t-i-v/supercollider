

(
~tone.quant=2;
~tone={
	var s,tm,e,oct,octmod,mod;

	mod = Duty.kr([1,8],0,Dseq(1/[1,2,3,4]+1,inf));
	octmod = Duty.kr(16,0,Dseq(([4,6,5,3]),inf));
	oct = Duty.kr(4,0,Dseq(octmod+(1/[1,2,3,4]),inf));

	tm = Impulse.ar(1,1/4*(0..3));
	e = Decay.ar(tm,1,0.9,0.0001);
	s = SinOsc.ar(oct.octcps /4 * ([1.025,1.001]**(1..8))*(e**4*10),mul:1/oct) * e;


	tm = Impulse.ar(2,1/4*(0..3));
	e = Decay.ar(tm,2);
	s = LFSaw.ar(oct.octcps/mod * ([1.00025,1.001]**(1..8)),mul:0.1) * e + s;
	s = MoogFF.ar(s,e**[4,8]*(LFTri.ar(1/[1,2,4,8]).range(8000,180))+44);


	tm = Impulse.ar(1/4,[0,1,2,3,4,5,6,7,7.25,7.5,7.75]/8);
	e = Decay.ar(tm,1);
	s = SinOsc.ar(33*(e**4.01*[10,30/mod]+1)) * e + s;

	tm = Impulse.ar(1/4,([0,0.5,1,1.5,2,3,3.25,3.5]+0.5)/4);
	e = Decay.ar(tm,0.25,0.95,0.00001);
	s = HPF.ar(WhiteNoise.ar(0.04!2),e**4.0*14000.0+[10,10000]) * e + s ;

	s = Limiter.ar(s,1,0.001);
	s = CompanderD.ar(s,0.85,1/1.5,1/4);
	s = FreeVerb.ar(s);

	Splay.ar(s,0.31,0.9);

};

~tone.play;

)


s.scope;