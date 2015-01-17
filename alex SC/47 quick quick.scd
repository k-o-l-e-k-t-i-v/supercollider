(
Ndef(\n).fadeTime=2;
Ndef(\n).quant=2;
Ndef(\n, {

	arg freq=400, freq2=3;
	var sig;

	sig=SinOsc.ar([freq,freq+0.25],add:-1)*Pulse.ar(4/freq2)+freq2*Ndef(\n).ar.range(0,1).lag(0.02);
	sig=Limiter.ar(sig, 0.8);
}).play;
)
//freq 241.83	freq2 0.03


Ndef(\n).gui(10);
s.scope(2);



//quick quick
(

Ndef(\r).fadeTime=2;
Ndef(\r).quant=2;

Ndef(\r, {
	arg freq, freq2, amp;
	var sig, sig1,sig2,sig3, ff, tic,lf,bum;

	tic=[4,2];
	bum=1;
	lf=[4,2];

	sig1=LFSaw.ar(lf);
	sig2=WhiteNoise.ar(0.8).lag(0.02)*Decay.kr(Impulse.kr(tic),0.5);
	sig3=LPF.ar(BrownNoise.ar([0.7,0.8])*Decay2.kr(Impulse.kr(bum),0.2,1),200);
	sig3=FreeVerb.ar(sig3,add:sig3);

	sig=sig1+sig2+sig3;



}).play;
)


(Ndef(\3).fadeTime=2;
Ndef(\3).quant=2;
Ndef(\3, {

	arg freq, freq2;
	var sig, b, beat, rate;

	b=4/3;

	beat=[b,2*b,3*b];


	rate=Select.kr(Stepper.kr(Impulse.kr([b,b/4]),max:2), [50,100,20]);
	freq=Sweep.kr(Impulse.kr(5),rate).range(1000,100);

	sig=SinOsc
	.ar([freq, freq-100])*Decay2.kr(Impulse.kr(beat),0.2,1);

}).play;
)


(
Ndef(\4).fadeTime=2;
Ndef(\4).quant=2;

Ndef(\4, {
	arg freq,freq2;
	var sig, sig1, sig2, beat, b;

		b=4/3;

	beat=[b,2*b,3*b];
	freq=Select.kr(Stepper.kr(Impulse.kr([b,4*b]),max:4),[110,110*7,110*6,110*3]);
	freq2=Select.kr(Stepper.kr(Impulse.kr([b,4*b]),max:4),[110,110*3,110*2,110*2]);

	sig1=LFPulse.ar([b,2*b])*SinOsc.ar([65,65.55],add:SinOsc.kr(b).range(0.01,0.3));

	sig2=GrainFM.ar(2,
		trigger:Impulse.kr(beat),
		dur:b*4,
		carfreq:VarSaw.ar([freq,freq*2]).range(freq,freq*2),
		modfreq:freq2,
		add:WhiteNoise.ar(0.2)*Decay2.kr(Impulse.kr(beat*4),decayTime:0.1));
	sig2=Limiter.ar(sig2,0.2);

	sig=Limiter.ar(sig1+sig2,0.1);


}).play;
)


(

Ndef(\6).fadeTime=2;
Ndef(\6).quant=2;

Ndef(\6, {
	arg freq1, freq3, n;
	var sig,x, b,fund;

	b=4/3;
	x=10;
	fund=Select.kr(Stepper.kr(Impulse.kr(b/10),max:5),[22,44,77,55]);

	freq1=Select.kr(Stepper.kr(Impulse.kr([b,4*b]),max:4),[fund,fund*7,fund*6,fund*3]);

	sig=Mix.fill(x,{ arg i; LFSaw.ar(freq1)+LFSaw.ar(freq1+i)+LFSaw.ar(freq1-i)});
	sig=Limiter.ar(sig,0.3);


}).play;
)


(

Ndef(\8).fadeTime=2;
Ndef(\8).quant=2;
Ndef(\8, {

	arg n;
	var sig, freq, freq1, freq2;
	b=4/3;

	freq=Select.kr(Stepper.kr(Impulse.kr(b*2),max:5),[220,55,330,110])*
	Select.kr(Stepper.kr(Impulse.kr(b/6),max:6),[1,0.7,0.6,1.2,1.5]);
	freq1=Select.kr(Stepper.kr(Impulse.kr(b/4),max:5),[1,2,5,7,4]);
	freq2=Select.kr(Stepper.kr(Impulse.kr(b/8),max:5),[3,4,7,9,2]);

	sig=Formant.ar([freq, freq+2],VarSaw.kr([freq1,freq2]),10,10);
	// sig=Formant.ar(1000,VarSaw.kr([202,200]),10,10);




}).play;
)

{Limiter.ar(Mix.new([VarSaw.ar(LFNoise0.kr(4/3).range(100,400).round(100)),LFPulse.ar([4/3,4/3*2]),SinOsc.ar([65,65.5, 65.7, 65.8, 55.2, 55.4, 45.2],mul:Decay2.kr(Impulse.kr(4/3),attackTime:0.4))]),0.8)}.play;

(
{Limiter.ar(
	Mix.new([
		CombN.ar(LFPulse.ar([4/3,4/3*0.5],mul:1.5).lag(0.02),0.5,0.5,2), SinOsc.ar(LFNoise1.kr(4/3*2).range(40,80).round(10)!4,mul:Decay.kr(Impulse.kr(4/3*0.5))),
		LPF.ar(WhiteNoise.ar(0.5)*Decay.kr(Dust.kr(4/3*2),0.01),300)]),
	0.5)
}.play;
)

(
{Limiter.ar(
	Mix.new([
		VarSaw.ar(Duty.kr(Dseq([0.5,0.25,0.5,0.25],inf),0,Dseq([45,55,65,85,25],inf)),mul:Duty.kr(Dseq([1/(4/3)],inf),0,Dseq([0,1],inf))),
		WhiteNoise.ar(0.8)*Decay.kr(Impulse.kr(Duty.kr(Dseq([1,0.5],inf),0,[4/3*4,4/3*2])),0.02)
	]),
	0.5)
}.play;
)




(
Ndef(\2).fadeTime=1;
Ndef(\2).quant=1;
Ndef(\2, {
	arg freq=40;
	var t, a, b,c;

	t=4/3;

	a=Limiter.ar(VarSaw.ar([65,65.2],width:0.2)*LFSaw.kr([t/[2,1,3,4]]),0.2);
	b=SinOsc.ar(Sweep.kr(Impulse.kr(t*3),12).range(freq*10,freq),mul:Decay2.kr(Impulse.kr(t),decayTime:0.2));
	c=LPF.ar(BrownNoise.ar(0.5)*Decay2.kr(Impulse.kr(t*0.2)),200);


	Mix.new([a,b,c]);


}).play;
)












