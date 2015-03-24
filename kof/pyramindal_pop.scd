


(
~selector={Duty.kr(Dseq([3/4,1/4],inf),0,Dseq([0,1],inf))};
~selector.quant=2;


~long={Duty.kr(4,0,Dseq([1,1.25,1.5,1.125,2,0.5,0.75].pyramid,inf))};
~long.quant=2;

~sh={Duty.kr(1/8,0,Dseq(~long.kr*[1,2,4,8,16,32].pyramid,inf))};
~sh.quant=2;
)



(
~a.play;
~a.quant=2;
~a={
	var sig,env,env2,env3,pat,pat2,len,pit,kick,hat;

	pat = Select.kr(~selector,[[2,2],[4,2]]) * 2;


	len = [1,2,3,4].normalize*1.25;
	pit = Select.kr(~selector,[1,2]) * ~sh.kr;

	env = Decay.ar(Impulse.ar(pat),len);
	sig = OnePole.ar(LFPulse.ar(43.2+(env+1) * pit),1*(1-env)) * env;


	env2 =  Decay.ar(Impulse.ar(1,1/8*[0,2,4,6,7]),[1,1/2]*2);
	kick = SinOsc.ar(43.7*(env2.linexp(0,1,0.001,1)*3+1)) * env2;

	env3 =  Decay.ar(Impulse.ar(2,1/8*[0,2,4,6,7]),[1,1/2]*0.1);
	hat = HPF.ar(WhiteNoise.ar(0.4!2),TExpRand.ar(4000,8000,Impulse.ar(4!2))) * env3;

	sig =  kick + (sig/4) + hat;
	sig = CompanderD.ar(sig,0.75,1/2,1/10);


	Splay.ar(sig,0.2);
};
)

s.scope;