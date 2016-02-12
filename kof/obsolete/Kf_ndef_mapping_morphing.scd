

// hello there this is livecoding session

//the server dies when I evaluate the first line after the Ndef

(
Ndef(\ttt).quant = 2.0;
Ndef(\ttt).fadeTime = 2.0;
Ndef(\ttt,{|freq = 200,temp = #[4,2,1,1,1,1,1,1],echo=0.032,room = 2,eff=1,amm = 0.2|
	Splay.ar(
		CombN.ar(
			Vibrato.ar(SinOsc.ar(freq!2),temp,amm)
		,room,echo,room,eff)
)}).play;
)


Ndef(\ttt).lag(\eff,10,\room,10,\freq,0.02,\temp,10,\amm,10,\echo,10);

Ndef(\ttt).set(\freq,[432,432.1,432.1/2]*1.5pi)

Ndef(\ttt).set(\room,2)
Ndef(\ttt).set(\amm,1)
Ndef(\ttt).set(\temp,[1,2,4,8]/8)
Ndef(\ttt).set(\echo,0.133)
Ndef(\ttt).set(\eff,0.5)

(
Ndef(\g).quant = 2.0;
Ndef(\g).fadeTime = 0;
Ndef(\g,{|speed = 1,freq = 432|Select.kr(Stepper.kr(Impulse.kr(8*speed),max:7),[1/1.5,0.5,1/8,0.25,1/4,3,1.5,1.25]*freq)});
)

Ndef(\g).lag(\speed,1,\freq,5);
Ndef(\g).set(\speed,1);
Ndef(\g).set(\freq,120*2pi);

Ndef(\ttt).map(\freq,Ndef(\g));