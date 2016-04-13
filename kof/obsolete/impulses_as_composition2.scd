
(
~efx.fadeTime=4;
~efx.quant=2;
~efx={
	var sig;

	sig = CompanderD.ar(~tone.ar,0.5,1/1.5,1/10);
	sig = sig + CompanderD.ar(~subtone.ar,0.5,1,1/10);
	sig = PitchShift.ar(sig,0.02,SinOsc.ar(1/[4,8,16,32]).range(0.95,1.05));



	sig = sig + CompanderD.ar(~hiss.ar,0.5,1,1/10);
	sig = sig + CompanderD.ar(~kick.ar,0.5,1,1/10);


	sig = Vibrato.ar(sig,[5,6,7,6,8],0.02).distort;
	sig = FreeVerb.ar(sig,0.13,1.5*(1.001**(1..8)));
	Splay.ar(sig,0.4);
};
~efx.play;
);

//////////////////////////////////////

(

(
// ~a.play;
~kick.quant=4;
~kick = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(4,0,Dseq([1,1.25,1.125,1.5,2,4],inf));

	t = Impulse.ar(1/2,1/4*[0,1,1.25,2,3,3.25,3.75]);
	env = Decay.ar(t,TExpRand.ar(0.5,1.75,t));
	fenv = Decay.ar(t,TExpRand.ar(0.002,0.15,t)).exprange(0.0001,1.01+(sel*1000.0));


	sig = SinOsc.ar(43.2+fenv,mul:0.85) * env;
	sig = LPF.ar(sig,4000);
	// sig = Resonz.ar(sig,43.1,mul:2);
	sig = CompanderD.ar(sig,0.75,1,1/10);

	Splay.ar(sig,0.4);
};
);

(
// ~hiss.play;
~hiss.quant=4;
~hiss = {
	var env,fenv,sig,t,sel,tone;
	sel = Duty.kr(1/4,0,Dseq([1,1.125,2],inf));

	t = Impulse.ar(1/2,1/4*[0.5,1.5,2.5,3.25,3.5,3.75]);
	env = Decay.ar(t,TExpRand.ar(0.15,0.5,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,0.15,t)).exprange(1000.0001,10.01+(sel*10000.0));

	sig = WhiteNoise.ar(0.1!2) * env;
	sig = RHPF.ar(sig,fenv);
	sig = CompanderD.ar(sig,0.75,1,1/10);

	Splay.ar(sig,0.4);
};

);

(
// ~tone.play;
~tone.quant=4;
~tone = {
	var env,fenv,sig,t,sel,tone;
	sel = (60+[5,7,9,-7,4,-12,-24,12,24,12,-24,-48]+36).scramble;
	sel = sel + LFNoise0.ar(1/4/[1,2,4,8,16,32,64,128,256]).range(-48,24).round(12);

	t = Impulse.ar(1/8,1/16*[0,1,2,3]);
	env = Decay2.ar(t,0.25,TExpRand.ar(0.5,0.95,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,0.5,t)).exprange(10.01+(1500.0),10.0001);

	sig = SinOsc.ar(sel.midicps*(1.00001**(1..8))+SinOsc.ar([4,5,6,7],0,4),mul:0.025) * LFSaw.ar(1/4/[1,2,4,8,16,32,64,128,256]).exprange(0.01,1.0);
	sig = Resonz.ar(sig,fenv) * LFSaw.ar(1).exprange(1.001,0.5);
	sig = CompanderD.ar(sig,0.5,1/1.5,1/10);

	Splay.ar(sig,0.4);
};

);

(
// ~subtone.play;
~subtone.quant=4;
~subtone = {
	var env,fenv,sig,t,sel,tone;
	sel = (60+[5,7,9,24,48]-24).scramble;
	sel = sel + LFNoise0.ar(1/4/[1,2,4,8,16,32,64,128,256]).range(-24,48).round(12);

	t = Impulse.ar(1/8,1/4*[0,1,2,3]);
	env = Decay2.ar(t,0.25,TExpRand.ar(0.5,0.95,t));
	fenv = Decay.ar(t,TExpRand.ar(0.02,1.5,t)).exprange(10.01+(150.0),10.0001);

	sig = LFSaw.ar(sel.midicps*(1.0001**(1..8)),SinOsc.ar(1/4/[4,5,6,7],0,8pi),mul:0.75) * LFSaw.ar(1/4/[1,2,4,8,16,32,64,128,256]).exprange(0.01,1.0);
	sig = BBandPass.ar(sig,fenv*SinOsc.ar(1/4/(1..8)).range(1,0.1) )  * LFSaw.ar(1).range(1.001,0.55);
	sig = CompanderD.ar(sig,0.5,1/1.5,1/10);

	Splay.ar(sig,0.4);
};

);
)

