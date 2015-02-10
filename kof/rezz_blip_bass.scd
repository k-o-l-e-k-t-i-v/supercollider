
(
Ndef(\bass,{


	~mod = Duty.kr(Dseq([1,2]*8,inf),0,Dseq([1,0,1,2,1,4,1,-2]*12,inf));
	~mod2 = Duty.kr(Dseq([1,2]*16,inf),0,Dseq([1,1.5],inf));
	~melod = Duty.kr(Dseq([1,2]/8,inf),0,Dseq([60,67]+~mod,inf));
	~voices = Duty.kr([1,2]*2,0,Dseq(2**(1..6),inf)).lag(0.3);

	~sig = Blip.ar(~melod*~mod2,~voices,mul:0.5+(~voices/1024));

	Splay.ar(

		FreeVerb.ar(
			CompanderD.ar(
				HPF.ar(
					~sig
					,~melod/2)
				,0.5,1,0.25,0.003,0.02) +

			CompanderD.ar(
				LPF.ar(
					~sig
					,~melod*2)
				,0.25,1,0.25,0.012,0.02)
			,0.133
			,20).softclip

		,0.5,1,0.5)}).play;
)