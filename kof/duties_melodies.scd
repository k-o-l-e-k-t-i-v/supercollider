(

/////////////////////////////////////////////

Ndef(\melod).quant = 2.0;
Ndef(\melod,{

	~trig = Impulse.ar(8/[1,2,4,8]);

	~freq = Duty.kr(1/8,0,Dseq([1,1.5,2,1.5,1,1.5,0.5,0.75],inf)) * 43.2 * pi ;
	~mod = Duty.kr(4,0,Dseq([1,1.5,1.25,0.5],inf));
	~vibrato = SinOsc.ar(1/2/(1.01**(1..8))).range(-40,40);

	Splay.ar(
		RLPF.ar(
		CompanderD.ar(
		LFSaw.ar(~freq*~mod,mul:0.25) * Decay.ar(~trig);
		,0.25,1,0.25,0.003,0.02) * 2
		,~freq*2 + ~vibrato)
	,0.5,0.25,0.5)
}).play;
)
/////////////////////////////////////////////
(
Ndef(\submelod).fadeTime = 2.0;
Ndef(\submelod).quant = 2.0;
Ndef(\submelod,{

	~trig = Impulse.ar(4/[1,2,4,8]);

	~freq = Duty.kr(2*[1,2,4,8],0,Dseq([1,1.5,2,1.5,1,1.5,0.5,0.75],inf)) * 43.2 * 4pi ;
	~mod = Duty.kr(8,0,Dseq([1,1.5,1.25,0.5],inf));
	~vibrato = SinOsc.ar(1/2/(1.01**(1..8))).range(-40,40);

	Splay.ar(
		RLPF.ar(
		CompanderD.ar(
		LFSaw.ar(~freq*~mod,mul:0.25) * LFSaw.ar(1/2/[1,2,4,8]);
		,0.25,1,0.25,0.003,0.02) * 2
		,~freq*2 + ~vibrato)
	,0.5,0.15,0.5)
}).play;

)
/////////////////////////////////////////////
(
Ndef(\kick).quant =2.0;
  Ndef(\kick,{
	~duty = Duty.ar(Dseq([1,1,2],inf),0,Dseq(8/[1,1,2,1],inf));
	~imp = Impulse.ar(~duty);

    ~speed = 2;

    ~sig = LPF.ar(
      Ringz.ar(
        ~imp,
        TExpRand.ar(44.0,55.0,Impulse.ar(4)),
        TExpRand.ar(0.15001,1.5,Impulse.ar(4)))
      , 500 );
    ~cmp = CompanderD.ar(~sig,0.15,1,0.26, clampTime: 0.004, relaxTime: 0.08);

    Splay.ar(
      ~cmp * 3
      ,0.5,0.5,0.5)
  }).play;
); 
