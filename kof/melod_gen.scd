
// variations by kof 2014

s.boot;

(
Tdef(\seed,{
	loop{

		Ndef(\hard1).fadeTime = 1.1;

		Ndef(\hard2).fadeTime = 1.0;

		Ndef(\hard1,{
			~times = [1,4,4,8].scramble;
			~imp = Impulse.kr(~times);
			~lfos = SinOsc.kr({ExpRand()}!~times.size).range(0,1);
			~freq = Select.kr(Stepper.kr(Impulse.kr(~times)),{[60,60,62,63,65,65,67,69].scramble}!4).lag(0.004).midicps;
			~mod = Select.kr(Stepper.kr(Impulse.kr(~times)),{[1,8,2,1/4,32,1/4,4,1/2].scramble}!4).lag(0.008);
			~line = Pluck.ar(LFCub.ar(~freq * ~mod,{ExpRand()}!~times.size,~lfos),~imp);

			Splay.ar(~line,1,0.5);
		}).play;


		Ndef(\hard2,{
			~times = [8,4,4,1].scramble;
			~imp = Impulse.kr(~times);
			~lfos = SinOsc.kr({ExpRand()}!~times.size).range(0,1);
			~freq = Select.kr(Stepper.kr(Impulse.kr(~times)),{[60,60,62,63,65,65,67,69].scramble}!4).lag(0.002).midicps;
			~mod = Select.kr(Stepper.kr(Impulse.kr(~times)),{(2*[1,1/8,1/2,2,1/16,4,1/4,2]).scramble}!4).lag(0.004);
			~line = Pluck.ar(LFCub.ar(~freq * ~mod,{ExpRand()}!~times.size,mul:~lfos),~imp,decaytime: 3.0);

			Splay.ar(~line,1,0.5);
		}).play;
		8.0.wait;
		"Generating new melody".postln;
	}
}).play;
)