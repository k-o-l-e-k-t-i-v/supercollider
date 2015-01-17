s.boot;



(
Ndef(\beat).fadeTime = 3.0;
Ndef(\beat,{Splay.ar(
	~tempo = 100/60; //bpm
	~freq = Select.kr(Stepper.kr(Impulse.kr(1/2),max:4),[60,62,63,67,69].scramble.midicps*4) * [0.5,0.5,0.25,0.75];
	~saw = LFPulse.ar([1,2,4]*~tempo) * 4.0 * BPF.ar(WhiteNoise.ar([0.2,0.2,0.1]),[77,440,8000]);
	~lfo = SinOsc.kr([0.01,0.02]*10).range(0,1);
	~tone = SinOsc.ar( Decay.ar(Impulse.ar([1,2,8,1/4,1/8]*[1,1/2,1/4]*~tempo),~saw).exprange([77,88,99]*[1,2,4],~freq.lag([0.1,0.2])));
	~oo = Decay.ar(Impulse.ar([1,2,4]*[1,1/2,1/4]*~tempo),~lfo).exprange(0.01,3/~tempo) * ~tone + ~saw;
	CombN.ar(~oo,delaytime:(~lfo*4.0)+0.002*[1,2,4,8,10,20],decaytime:[1,2,4]);
)}).play;
)