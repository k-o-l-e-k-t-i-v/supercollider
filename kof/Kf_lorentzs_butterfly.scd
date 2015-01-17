
(
Ndef(\butterfly).fadeTime = 8.0;
Ndef(\butterfly,{

	// butterfly effect here ...
	~mmod = LFSaw.ar(1/[11,11.001]).range(0.0001,80);


	~s = FreeVerb.ar(
		BBandPass.ar(
			Mix.fill(32,{|i| LFSaw.ar((i/~mmod)+432/4pi,mul:1/2)})
			,LFDNoise1.ar(1/4.32!32).range(432/4,432*8) + LFSaw.ar(1111),0.012)
		,0.1933,1);

	~lim = Pulse.ar((1..10)*10).range(44,2000);

	~sl = LPF.ar(~s,~lim);
	~sh = HPF.ar(~s,~lim);

	Splay.ar(

		CompanderD.ar(

			RLPF.ar(
				FreeVerb.ar(
					CompanderD.ar(~sl,0.5,1,0.5) +
					CompanderD.ar(~sh,0.25,1,0.25) *
					LFSaw.ar(1/[1,2,4,8,16,32,64]).squared * 32 +
					SinOsc.ar(SinOsc.ar((1/[1,2,4,8])).range(12000*~sh,14000*~sh),mul:0.5)
					,0.33,1)
				,~lim.lag(0.01)*2)

			,0.5,1,0.5,0.02)



,1,0.7).clip(-1,1)}).play;
)

s.scope;