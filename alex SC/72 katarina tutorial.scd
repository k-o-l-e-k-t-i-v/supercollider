{SinOsc.ar(freq:440)*SinOsc.ar(1)}.play;

s.scope;

(

Ndef(\test1, {
	var signal, freq, freq2,freq3, amp, decay;

	freq=[150,852];
	freq2=500;
	freq3=4;

	decay=Decay2.kr(Impulse.kr([1]),decayTime:SinOsc.kr(0.25).range(0.2,0.5));
	signal=SinOsc.ar(freq);
	signal=signal*LFSaw.kr(freq2);
	signal=signal*SinOsc.kr(freq3)*decay;
	signal=CombN.ar(signal, maxdelaytime:0.3,delaytime:0.3,decaytime:10);
	signal=FreeVerb.ar(signal,room:0.7);


}).play;

)

(

Ndef(\test2, {
	var signal, freq, freq2,freq3, amp;

	freq=[170,352];
	freq2=5;
	freq3=0.25;
	amp=SinOsc.ar(freq3);

	signal=VarSaw.ar(freq).lag(0.02);
	signal=signal*LFSaw.ar(freq2).lag(0.002);
	signal=signal*amp;



}).play;

)

s.scope(4);


{VarSaw.ar(44)}.play;
{Pulse.ar(44)}.play;
{LFPulse.ar(44)}.play;

{Saw.ar(44)}.play;
{SinOsc.ar([0,44])}.play;