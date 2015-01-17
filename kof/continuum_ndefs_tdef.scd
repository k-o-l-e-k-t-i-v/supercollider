
s.boot;

(

var tempo = 80.0;

Ndef(\low,{|amp = 0.1|Splay.ar(CombN.ar(VarSaw.ar([77/2,77,144,144*2]/2.0,{ExpRand()}!4) * SinOsc.ar([0.01,0.1,0.1/2,0.2]/10.0,0,0.4),0.2,0.5,10.0),1,amp.lag(5))}).play;

Ndef(\tone,{|freq = 2200,amp = 0.1|Splay.ar(SinOsc.ar([1,2,3,4]*freq) * Pulse.ar([1/8,1/4,1/2,1]*(tempo*2)/60),1,amp.lag(5))}).play;


Ndef(\tone2,{|freq = 2200,amp = 0.1|Splay.ar(SinOsc.ar([1,2,3,4]*freq) * Pulse.ar([1/8,1/4,1/2]*(tempo*2)/60),1,amp.lag(5))}).play;

Ndef(\hiss2,{|amp = 0.1|Splay.ar(PinkNoise.ar([1,2,3,4]/20.0) * Pulse.ar([1/8,1/4,1/2,1,2,4]*(tempo*4)/60),1,amp.lag(5))}).play;


Ndef(\hiss,{|amp = 0.1|Splay.ar(WhiteNoise.ar([1,2,3,4]/10.0) * Pulse.ar([1/8,1/4,1/2,1,2,4]*(tempo*4)/60),1,amp.lag(5))}).play;

Ndef(\beat,{|amp = 0.1|Splay.ar(SinOsc.ar([55,99]) * Pulse.ar([1/8,1/4,1/2,1,2,4]*(tempo/4)/60),1,amp.lag(5))}).play;

Ndef(\a,{|freq = 1.0,amp = 0.1|Splay.ar(CombN.ar(SinOsc.ar([440,220,110,55]/freq.lag(1/10.0)+440,{ExpRand()}!4,SinOsc.kr({ExpRand()*10.0}!4) * Decay.kr(Impulse.kr([1,2,4,8]*(tempo/4)/60),[1.0,0.5,0.25,0.0125]/(tempo/60))),0.2,SinOsc.kr({ExpRand()/16.0}!2).range(0.02,0.2),1.0),1,amp.lag(5))}).play;

Ndef(\a).fadeTime = 1.0;


Ndef(\b,{|freq = 1.0,amp = 0.1|Splay.ar(CombN.ar(VarSaw.ar([440,220,110,55]/freq.lag(1/100.0)+220,{ExpRand()}!4,{ExpRand()}!4,SinOsc.kr({ExpRand()*10.0}!4)*Decay.kr(Impulse.kr([1,2,4,8]*(tempo/2)/60),[1.0,0.5,0.25,0.0125]/(tempo/60))),0.2,SinOsc.kr({ExpRand()/8.0}!2).range(0.02,0.2),1.0),1,amp.lag(5))}).play;

Ndef(\b).fadeTime = 1.0;


Ndef(\c,{|freq = 1.0,amp = 0.1|Splay.ar(CombN.ar(SinOsc.ar([440,220,110,55]/freq.lag(1/200.0)+110,{ExpRand()}!4,SinOsc.kr({ExpRand()*10.0}!4)*Decay.kr(Impulse.kr([1,2,4,8]*(tempo/8)/60),[1.0,0.5,0.25,0.0125]/(tempo/60))),0.2,SinOsc.kr({ExpRand()/4.0}!2).range(0.02,0.2),1.0),1,amp.lag(5))}).play;

Ndef(\c).fadeTime = 1.0;

Ndef(\d,{|freq = 1.0,amp = 0.1|Splay.ar(CombN.ar(VarSaw.ar([440,220,110,55]/freq.lag(1/2.0)+55,{ExpRand()}!4,{ExpRand()}!4,SinOsc.kr({ExpRand()*10.0}!4)*Decay.kr(Impulse.kr([1,2,4,8]*(tempo*2)/60),[1.0,0.5,0.25,0.0125]/(tempo/60))),0.2,SinOsc.kr({ExpRand()/2.0}!2).range(0.02,0.2),1.0),1,amp.lag(5))}).play;

Ndef(\d).fadeTime = 1.0;

)

(
Tdef(\tt,{
	var i = 0;
	loop{
		Ndef(\a).set(\freq,[0.5,1,2,0.75,0.25,4,1/16,1/32].wrapAt(i*i+i)/([1,2].wrapAt(i)));
		Ndef(\b).set(\freq,[0.5,1,2,0.75,0.25,4,1/16,1/32].wrapAt(i+i)/([0.5,16,8,1.5,0.25].wrapAt(i)));
		Ndef(\c).set(\freq,[0.5,1,2,0.75,0.25,4,1/16,1/32].wrapAt(i*i)/([1,2,8,4,8].wrapAt(i)));
		Ndef(\d).set(\freq,[0.5,1,2,0.75,0.25,4,1/16,1/32].wrapAt(i)/([0.5,32,2,1.5].wrapAt(i)));

		Ndef(\tone).set(\freq,[0.5,1,2,0.75,0.25,4,1/16,1/32].wrapAt(i)/([0.5,16,12,1.5].wrapAt(i*i+i))*220);
		Ndef(\tone2).set(\freq,[0.5,1,2,0.75,0.25,4,1/16,1/32,1/64].wrapAt(i)/([0.5,16,12,1.5,8].wrapAt(i*i+i))*4400);

		Ndef(\a).set(\amp,0.01.rrand(0.125));
		Ndef(\b).set(\amp,0.01.rrand(0.125));
		Ndef(\c).set(\amp,0.01.rrand(0.125));
		Ndef(\d).set(\amp,0.01.rrand(0.125));

		Ndef(\hiss).set(\amp,0.01.rrand(0.127));
		Ndef(\hiss2).set(\amp,0.01.rrand(0.127));
		Ndef(\tone).set(\amp,0.01.rrand(0.123));
		Ndef(\tone2).set(\amp,0.01.rrand(0.123));

		Ndef(\beat).set(\amp,0.01.rrand(0.275));
		Ndef(\low).set(\amp,0.15.rrand(1.0));


		i = i + 1;

		3.wait;
	}
}).play;
)

NdefMixer(s);