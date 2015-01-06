(
Ndef(\1).fadeTime=2;
Ndef(\1).quant=1;

Ndef(\1, {
	arg freq=400, amp=1, sustain=1, beat=5;
	var sig;

	sig=SinOsc.ar(freq)+VarSaw.ar([freq/2,freq/3]);
	sig=sig*Decay2.kr(Impulse.kr(beat),sustain*0.5,sustain*0.8,amp);

}).play;

)

Ndef(\1).gui(10);


(
Ndef(\2).fadeTime=2;
Ndef(\2).quant=1;

Ndef(\2, {

	arg freq=200, amp=1,sustain=2, beat=20;
	var sig;

	sig=Limiter.ar(Mix.fill(15, {arg i; Pulse.ar(beat+i,beat/i+3)}));
	sig=VarSaw.ar(freq/[2,1,3,4,7],sig);
	sig=Limiter.ar(sig,amp)*Decay2.kr(Impulse.kr(beat/10),sustain*0.8, sustain*0.3);


}).play;
)

Ndef(\2).gui(10);



(
Ndef(\seq, {
	var freq= Duty.ar(0.25, 0, Dseq([400, 800, 555, 700, 200, 200], inf));
	var amp= Duty.ar(0.35, 0, Dseq([1, 0.2, 0.5, 0, 1, 0.5, 0.25, 0], inf));
	Splay.ar(
		SinOsc.ar(freq, 0, amp)
	);
}).play;
)


Ndef(\sel).play
Ndef(\sel).fadeTime= 12

Ndef(\sel, {Splay.ar(Select.ar(Duty.kr(0.1, 0, Dseq([0, 1], inf)), [SinOsc.ar(2000), Saw.ar(300)]))*0.5})

Ndef(\sel, {Splay.ar(Select.ar(Duty.kr(0.05, 0, Dseq([0, 1, 1, 1, 2, 0, 1], inf)), [SinOsc.ar(2000), Saw.ar(3000), WhiteNoise.ar(0.4)]))*0.5})

Ndef(\sel, {Splay.ar(SelectX.ar(Duty.kr(0.05, 0, Dseq([0, 1, 1, 1, 2, 0, 1], inf)).lag(0.1), [SinOsc.ar(2000), Saw.ar(3000), WhiteNoise.ar(0.4)]))*0.5})

Ndef(\sel, {Splay.ar(SelectX.ar(SinOsc.ar(MouseX.kr(0.5, 500, 1))*3, [SinOsc.ar(2000), Saw.ar(3000), WhiteNoise.ar(0.4)]))*0.5})

Ndef(\sel).stop


s.scope(2);


(

Ndef(\3).fadeTime=2;
Ndef(\3).quant=1;

Ndef(\3, {

	var sig, freq, amp, beat, fund;

	fund=110;
	freq=Duty.ar(Dseq([0.01,0.03,0.08],inf),0,Dseq(Array.fill(10, {arg i; fund*i}),inf));
	beat=Select.kr(Duty.kr(Dseq([0.5,0.3,0.7],inf),0, Dseq([0,2,4,4,4,1,3],inf)),
		[SinOsc.kr(fund/2), Pulse.kr(fund/10),LFPulse.kr(fund/10-8),
			Pulse.kr(fund/15), VarSaw.kr(fund/[2,1,3,4,7])]);

	sig=SinOsc.ar(freq)*beat;



}).play;

)

// hmm ^^ Duty object.. very nice

//i know, right ? check these out: \Supercollider\GIT\alex SC\tutorials for ndef