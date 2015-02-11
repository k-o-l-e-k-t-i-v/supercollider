({VarSaw.ar(50)}.play;)
({VarSaw.ar(50).softclip}.play;)
({VarSaw.ar(50).clip}.play;)
({VarSaw.ar(50).tanh}.play;)
({VarSaw.ar(50).sinh}.play;)
({VarSaw.ar(50).tan}.play;)
({VarSaw.ar(50).scurve}.play;)
({VarSaw.ar(50).distort}.play;)
({VarSaw.ar(50).ramp}.play;)
({a=VarSaw.ar(0.25).linlin(0.1,0.8,1,15); b=Pulse.ar(a);}.play;)


s.scope(2);

m.free;
s.plotTree;

m = JMix(2);
m.gui;
Ndef(\x, { SinOsc.ar }).play(m.chBus(1));



(
Ndef(\j).fadeTime=2;
Ndef(\j).quant=2;
Ndef(\j, {
	var f, f2, sig, length, fl1, fl2, x,y,osc1;

	length=240;

	f=Line.kr(60,200,length,doneAction:2);
	f2=Line.kr(600,120,length,doneAction:2);

	// osc1=Select.kr(Stepper.kr(Impulse.kr(LFNoise0.kr(0.0125).range(1,0.125)),0,max:3), [SinOsc.ar,LFSaw.ar,Pulse.ar]);

	fl1=Line.kr(600,120,length,doneAction:2);
	fl2=Line.kr(20,600,length,doneAction:2);

	x=LFSaw.ar(f+(1..12),mul:(0.1..0.6).scramble).lag(0.02);
	y=SinOsc.ar(f2+(1..12),mul:(0.1..0.6).scramble);

	sig=BMoog.ar(x*y,SinOsc.kr(LFNoise0.kr(0.12).range(0.125,1)).range(85,fl1),
		q:0.8, mode:1 /*low pass filter*/).tanh;
	sig=Limiter.ar(sig,0.2);
	sig=CompanderD.ar(sig,0.1);
	sig=CombL.ar(sig,1,[0.3,0.4],4);
	sig=FreeVerb.ar(s
		ig,1,add:sig);
	sig=CombN.ar(sig,0.2,1,5)*10;
	sig=sig+Resonz.ar(SinOsc.ar(50).lag(0.2),SinOsc.kr(fl2).range(x.range(400,85),40),mul:0.1);

	sig=AllpassN.ar(sig,1,0.25,4);




}).play;
)


(
Ndef(\a).fadeTime=2;
Ndef(\a).quant=2;
Ndef(\a, {
	var f, f2, sig, length, fl1, fl2, x,y,osc1;

	sig=CombL.ar(Impulse.ar(0.5),0.2,0.2,2);
	sig=AllpassN.ar(sig,0.01,0.01,0.5);









}).play;
)
