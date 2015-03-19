
s.scope;
(
Ndef(\test).fadeTime = 4;

Ndef(\test, {
	var aSeq, aEnv, osc;
	var octave, degree, freq;
	freq = {|octave, degree| ((octave*12)+degree).midicps;};
	aSeq = Duty.kr(Dseq([8,4,2,8,4], inf),0,Dseq([freq.value(4,3), freq.value(3,7), freq.value(3,3), freq.value(4,4),freq.value(2,6)], inf));
	aEnv = Decay2.kr(Impulse.kr([2.1,2]),0.35, 1.65);
	osc = SinOsc.ar(aSeq!2,[0,0.1],0.3,0.3) * LFPulse.ar([2,4, 40, 45], 0, 0.7, 0.2, 0.8) * BrownNoise.ar(0.5, SinOsc.kr(0.1, 0, 0.25, 0.25));
	osc = CompanderD.ar(osc, 0.8,0.5);
	// osc = FreeVerb.ar(osc, 0.5, 0.925, 0.5 ,1);
	osc = CombC.ar(osc, 0.5, 0.125, 0.75);
	osc = LPF.ar(osc, LFSaw.kr([0.5,0.75],0, 400, 1200));
	osc = osc * aEnv;
	osc = Limiter.ar(osc, 0.95,0.1);
}).play;
)

(
Ndef(\aa).fadeTime = 2;
Ndef(\aa, {
	~sus = [0.25,1];
	~freq = {|octave, degree| ((octave*12)+degree).midicps;};
	~aSeq = Duty.kr(Dseq([8,4,4,8,4], inf),0,Dseq([~freq.value(4,3), ~freq.value(3,7), ~freq.value(3,3), ~freq.value(4,4), ~freq.value(2,6)], inf)).lag(0.05);
	~p = SinOsc.ar([~aSeq,~aSeq+2],0,0.2, 0.8) * SinOsc.ar(0.2,0,0.4,0.6) * BrownNoise.ar(0.05,0.2);
	~n = LFPulse.kr(1/~sus).lag(0.15*~sus);
	~p = ~p * ~n;
	~p = ~p * LFSaw.ar([0.25,0.251]);
	~p = FreeVerb.ar(~p, 0.5, 2.5, 0.4, 0.5,0.5);

}).play(0,2);
)

// 2nd <3