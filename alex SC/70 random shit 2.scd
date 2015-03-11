(
Ndef(\3).fadeTime=2;
Ndef(\3).quant=2;

Ndef(\3, {

	~b=4/3/2;

	~e=Decay2.kr(Impulse.kr([~b,Duty.kr(8,0,Dseq([~b+0.1,~b+0.5],inf))]),decayTime:~b-0.2);

	~w=LFSaw.ar([55,64,45,46],Array.fill(4,{arg i; pi+i})).clip(0.1,0.5).lag(0.02);
	~w=~w+SinOsc.ar([45,46,48]);
	~w=Limiter.ar(~w*~e,0.5);
	~w=FreeVerb.ar(~w,SinOsc.kr(0.25).range(0.1,0.8),1,add:~w,damp:0.1);


}).play;
)
(

Ndef(\4).fadeTime=2;
Ndef(\4).quant=2;

Ndef(\4, {
	var b, f, e, sig;

	b=4/3/4;
	f=Duty.kr(Dseq([b*4,b*8,b*10,b*2,b*10,b*8,b*10],inf),0,Dseq([220,330,220,440],inf));

	e=Decay2.kr(Impulse.kr(b*6/[1,2,3,5,8,13,21].scramble).lag(0.08),decayTime:b*10);
	sig=VarSaw.ar([f,f+220,VarLag.kr(f+110,0.1,0.4),Lag.kr(f+55,0.1)]).lag(0.02)*e;
	sig=AllpassN.ar(sig,0.8,0.8,4);
	sig=Splay.ar(sig,1);


}).play;
)