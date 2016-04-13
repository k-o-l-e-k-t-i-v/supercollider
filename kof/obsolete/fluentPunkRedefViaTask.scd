
(
~a.play;
~a.fadeTime=1;

t=Task({
	loop{
		~a = {
			var sig = Mix(SinOsc.ar({(44..2200).choose.round(43.2*[1,1.5])}!2,mul:0.02))!2;
			sig.flat;
		};
		1.wait;
	};
});

t.play(quant:2);
)