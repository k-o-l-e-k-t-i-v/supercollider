
(
Ndef(\high).quant = 2.0;
Ndef(\high).fadeTime = 4.0;

Ndef(\high,{
	~f = [432,432.1] * [1,2,4,0.5,0.25,0.125].scramble * 1pi;
	Splay.ar(
		RLPF.ar(
			Resonz.ar(
				LFSaw.ar(~f/1.005,{ExpRand()}!8) * LFSaw.ar(1/16/[1,2,3,5,8,13]).squared;
				,SinOsc.ar(~f/8).range(~f/2,~f*2))
			,SinOsc.ar(~f/4.1).range(~f/2,~f*2))
)}).play;


Ndef(\high)[1] = \filter -> {|in| AllpassN.ar(CombN.ar(Vibrato.ar(in,[4,5,6,7,9,10],0.5),2,{ExpRand()}!8,4,mul:0.4,add:in),2,{ExpRand()}!8,2,mul:0.5,add:in)};

)



(
Ndef(\low).quant = 2.0;
Ndef(\low).fadeTime = 4.0;

Ndef(\low,{
	~f = [432,432.1] * [1,2,4,0.5,0.25,0.125].scramble / 4;
	Splay.ar(
		RLPF.ar(
			Resonz.ar(
				 SinOsc.ar(~f,{ExpRand()}!8) * LFSaw.ar(1/8/[1,2,3,5,8,13]).squared;
				,SinOsc.ar(~f/8).range(~f/2,~f*2))
			,SinOsc.ar(~f/4.1).range(~f/2,~f*2))
)}).play;


Ndef(\low)[1] = \filter -> {|in| AllpassN.ar(CombN.ar(Vibrato.ar(in,[4,5,6,7,9,10],0.5),2,{ExpRand()}!8,4,mul:0.4,add:in),2,{ExpRand()}!8,2,mul:0.5,add:in)};

)



(
Ndef(\beeps).quant = 2.0;
Ndef(\beeps).fadeTime = 4.0;

Ndef(\beeps,{
	~f = [432,432.1] * 4 * [1,2,4].scramble;
	Splay.ar(
		RLPF.ar(
			Resonz.ar(
				LFSaw.ar(~f/1.005,{ExpRand()}!8) * Decay.ar(Impulse.ar(1/[1,2,3,5,8,13]),0.13)
				,SinOsc.ar(~f/2048).range(~f/2,~f*2))
			,SinOsc.ar(~f/1024.1).range(~f/2,~f*2))
)}).play;


Ndef(\beeps)[1] = \filter -> {|in| AllpassN.ar(CombN.ar(Vibrato.ar(in,[4,5,6,7,9,10],0.5),2,{ExpRand()*10}!8,4,mul:0.4,add:in),2,{ExpRand()*10}!8,2,mul:0.5,add:in)};

)