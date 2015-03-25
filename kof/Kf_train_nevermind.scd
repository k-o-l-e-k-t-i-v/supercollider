
s.reboot;

(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{
	var h1,h2,l,h,t1,t2,t3,sig,pre1,pre2,tempoh;
	h2 = 432;
	h1 = 4320;

	l = 110;
	h = 33;

	tempo = 4/[1,2,3,5,8];
	tempoh = 8/[1,2,4,1];

	t1 = Decay.ar(Impulse.ar(tempo), 0.0125 + (LFNoise1.ar(2!2).round(0.25).range(0.001,0.03))).squared;
	t2 = Decay.ar(Impulse.ar(tempo), 0.0122 + (LFNoise1.ar(2!2).round(0.25).range(0.001,0.03))).squared;

	t3 = Decay.ar(Impulse.ar(tempo),1.2);

	sig = SinOsc.ar(LFPulse.ar(tempo) * LFPulse.ar(((h1+h2)/2) - ((t1 * h1) + (t2 * h2) / 2.0),LFPulse.ar(tempo/2)*t1 ).squared.range(l,h));


	pre2 = Vibrato.ar(sig * t3,h1/16.1,0.2) * SinOsc.ar(sig) + (HPF.ar(WhiteNoise.ar(1!2)*Decay.ar(Impulse.ar(tempoh),0.1),LFNoise1.kr(2!4).range(10000,22000)));
	pre1 = CombN.ar(pre2,0.15,0.125,0.15,mul:0.33,add:pre2);
	Splay.ar(
		GVerb.ar(pre1,2,mul:0.0125,add:pre1)
)}).play;
)


Ndef(\a).play;
