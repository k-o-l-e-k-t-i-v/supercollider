(
Ndef(\2).fadeTime=2;
Ndef(\2).quant=2;

Ndef(\2, {
	var sig2,sig1,sig3, env, flow, fmid, fhi, b;

	b=4/3;
	flow=50;
	fmid=200;
	fhi=4000;

	sig1=Limiter.ar(
		Mix.fill(10,{ arg i;  SinOsc.ar(GrayNoise.kr.range(flow, flow+5)!4,[0,i/10*pi])})
		,0.7);
	sig1=sig1*Decay2.kr(Impulse.kr([b,b]), 0.2,0.4);
	sig1=CombN.ar(GVerb.ar(sig1,10,2),2,1.2,0.8);

	sig2=Limiter.ar(
		Mix.fill(10,{ arg i;  SinOsc.ar(GrayNoise.kr.range(fmid, fmid+5)!4,[0,i/10*pi])})
		,0.4);
	sig2=sig2*Decay2.kr(Impulse.kr([b,b*2]), 0.02,0.2);
	sig2=CombN.ar(GVerb.ar(sig2,10,0.5),0.4,0.3,0.2);

	sig3=Limiter.ar(
		Mix.fill(10,{ arg i;  SinOsc.ar(GrayNoise.kr.range(fhi, fhi+5)!4,[0,i/10*pi])})
		,0.4);
	sig3=sig3*Decay2.kr(Impulse.kr([b/4,b/2]), 0.02,0.2);
	sig3=CombN.ar(GVerb.ar(sig3,20,3),4,1,1);


	Mix.new([sig1, sig2, sig3]);




}).play;

)

s.scope(2);