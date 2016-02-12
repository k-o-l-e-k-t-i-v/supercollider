// History, as it was on Sun Jun  7 03:16:26 2015.

[
[ 0, 'me', "(
~selector={Duty.kr(Dseq([3/4,1/4],inf),0,Dseq([0,1],inf))};
~selector.quant=2;


~long={Duty.kr(4,0,Dseq([1,1.25,1.5,1.125,2,0.5,0.75].pyramid,inf))};
~long.quant=2;

~sh={Duty.kr(1/8,0,Dseq(~long.kr*[1,2,4,8,16,32].pyramid,inf))};
~sh.quant=2;
)" ],
[ 2.6075409959999, 'me', "(
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

	sig = FreeVerb.ar(sig,0.15,1.5);


	Splay.ar(sig,0.2);
};
)" ],
[ 17.820684819, 'me', "(
Ndef(\\a).fadeTime = 2.0;
Ndef(\\a).quant = 2.0;
Ndef(\\a,{

	var base,saws;


	base = [60,60.13];
	saws = LFSaw.ar(1/8/[1,2,3,5,8,13,21,34,55,89]).squared;
	Splay.ar(

		FreeVerb.ar(
			FreeVerb.ar(
				SinOsc.ar(SinOsc.kr([1,1/2,1/4,1/8]*pi).range(base,base+2),mul:2)
				,0.1375,1).softclip * Decay.ar(Impulse.ar(8/[1,2,3,5,8])).squared + (VarSaw.ar(SinOsc.kr([1,1/2,1/4,1/8],(8pi*saws)).range(base*2,base*2+2)) * saws) +
			(HPF.ar(WhiteNoise.ar(0.75!4),10080) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),0.6).squared)

			,0.1,2).softclip
)}).play;
)" ],
[ 22.410178336, 'me', "(
~sel={Duty.kr(4,0,Dseq([1.5,1.25,1.125,2],inf)).lag(1/16)};
~sel.quant =2;

~sel2={Duty.kr(4,0,Dseq([1.5,1.25,1.125/2,2],inf))};
~sel2.quant =2;
)" ],
[ 23.710465775, 'me', "(
~a.play;
~a.quant=2;
~a={
	var in,m,hat,kick,pat1,pat2;

	pat1=[2,1]*2;
	pat2=[4,8]/2;

	kick = SinOsc.ar(55*(4*Decay.ar(Impulse.ar(pat1),0.1225)+1),mul:0.7)* Decay.ar(Impulse.ar(pat1),1.5);
	hat = RHPF.ar(WhiteNoise.ar(0.2!2),2200*[1,2,4,8]) * Decay.ar(Impulse.ar(pat2),0.45);
	m = VarSaw.ar(43.2*[1,2,4,8]*~sel2.kr,mul:0.2);
	in = Ringz.ar(Impulse.ar(4), 43.2*(_*~sel.kr!12) ,2.5,mul:1/(1..12)) + m + hat + kick / 2.0;
	in = CompanderD.ar(in,0.75,1/1.15,1/10).softclip;
	in = BBandPass.ar(in,LFTri.ar(1/32*fib(8)).range(44,12000),1,1,in/2);
	Splay.ar(in,0.1);
}
)" ],
[ 32.154677866, 'me', "(
~sel={Duty.kr(4,0,Dseq([1.5,1.25,1.125,2],inf)).lag(1/16)};
~sel.quant =2;

~sel2={Duty.kr(4,0,Dseq([1.5,1.25,1.125/2,2],inf))};
~sel2.quant =2;
)" ],
[ 34.563010091, 'me', "(
~a.play;
~a.quant=2;
~a={
	var in,m,hat,kick,pat1,pat2;

	pat1=[2,1]*2;
	pat2=[4,8]/2;

	kick = SinOsc.ar(55*(4*Decay.ar(Impulse.ar(pat1),0.1225)+1),mul:0.7)* Decay.ar(Impulse.ar(pat1),1.5);
	hat = RHPF.ar(WhiteNoise.ar(0.2!2),2200*[1,2,4,8]) * Decay.ar(Impulse.ar(pat2),0.45);
	m = VarSaw.ar(43.2*[1,2,4,8]*~sel2.kr,mul:0.2);
	in = Ringz.ar(Impulse.ar(4), 43.2*(_*~sel.kr!12) ,2.5,mul:1/(1..12)) + m + hat + kick / 2.0;
	in = CompanderD.ar(in,0.75,1/1.15,1/10).softclip;
	in = BBandPass.ar(in,LFTri.ar(1/32*fib(8)).range(44,12000),1,1,in/2);
	Splay.ar(in,0.1);
}
)" ],
[ 46.099539973, 'me', "(
~z.play;
~sq.quant=2;
~mel.quant=2;
~mel={Duty.kr(4,0,Dseq([12,24,12-7,24-7,-12],inf))};
~sq={Duty.kr(Dseq([1/4,1/8].normalize,inf)/[2,1,1/2]/2,0,Dseq(([60,24,72,36,63,24,67,72,60,24,72,36,63,24,65,60-7]+~mel.kr).midicps,inf))};
)" ],
[ 47.250170244, 'me', "(
~z.quant=2;
~z.fadeTime=2;
~z={
	var sig,freq,amp,gens;

	sig = SinOsc.ar(~sq.kr/[1/1.5,2,1],mul:0.4/[5,2,1]);
	sig = sig * SinOsc.ar(1/4/[1,2,4]).range(0,1);
	sig = BBandPass.ar(sig,SinOsc.ar(1/4/[1,2,3,4]).range(4440,22)) + (sig/2);
	sig = Limiter.ar(sig,0.9);
	sig = CompanderD.ar(sig,0.75,1,1/10) * 2;
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = CombN.ar(sig,1/2,1/2,2);
	sig = FreeVerb.ar(sig,0.09,1);
	Splay.ar(sig,0);
};
)" ],
[ 59.995444725, 'me', "(
~a.play;
~melod.quant=2;
~a.quant=2;
~melod={Duty.kr(8,0,Dseq([1,1.5,2,1.5,1,2],inf)).lag(1)};
)" ],
[ 61.032910666, 'me', "(
~a={
  var sig;

  sig = SinOsc.ar(43.2*~melod*(1.0001*(1..8)),mul:0.5);
  sig = sig * Decay.ar(Impulse.ar(4/fib(8)),4);
  sig = sig + ( HPF.ar(WhiteNoise.ar(0.06!4),TRand.ar(1200,12000,Impulse.ar(8!4))) * Pulse.ar(8/fib(4)));
  sig = sig + PitchShift.ar((LFSaw.ar(4320*(~melod.lag(2)*1.5)*(1.0001**(1..8)),mul:LFTri.ar(1/fib(8)).exprange(0.2,0.001))),SinOsc.ar(1/8).range(0.001,0.2));
  sig = CompanderD.ar(sig,0.5,1/1.5,1/6,0.01,0.01);
  sig = DelayL.ar(sig,0.1,SinOsc.ar(4/(1..8)).range(0.00001,0.01));
  sig = AllpassL.ar(sig,0.1,SinOsc.ar(1/8/(1..8)).range(0.00001,0.01));
  sig = FreeVerb.ar(sig,0.1,10);

  
  Splay.ar(sig);
};
)" ],
[ 76.186005201, 'me', "(
  ~mod.quant=1;
  ~b.quant=1;
  ~c.quant=1;
)" ],
[ 77.663664751, 'me', "~a.play;" ],
[ 78.760551195, 'me', "(
  ~b={Duty.kr(1/4,0,Dseq([0,2,0,2,0,2,1,2],inf))};
  ~c={Duty.kr(1/8,0,Dseq([2,3,2,3,0],inf))};
  ~mod={Duty.kr(4,0,Dseq([1,2,1.5,1,1.75],inf))};
)" ],
[ 79.958223739, 'me', "(
  ~a.fadeTime =0;
  ~a.quant= 2;
  ~a={
    var sig = [
      SinOsc.ar(43.2*(1.06**(1..12))),
      VarSaw.ar(4320*~mod*(1.02**(1..8)),mul:0.12),
      HPF.ar(WhiteNoise.ar(0.1!2),TRand.ar(8000,16000,Impulse.ar(1/4))),
      SinOsc.ar(43.2*(1.25**(1..8))) * LFTri.ar(1/4/fib(8)).exprange(0.0001,1.0),
    ];

    sig = Select.ar(~b,sig*0.5) + Select.ar(~c,sig*0.5);
    Splay.ar(sig,0.1);
  };

  ~a[50]=\\filter->{|in|BBandPass.ar(in,LFTri.ar(1/16*([1,1.01]),{Rand(0,2pi)}!4).exprange(1600.01,22))*0.25+(in*0.75)};
  ~a[52]=\\filter->{|in|CompanderD.ar(in,0.9,1,1/10)};
  ~a[54]=\\filter->{|in|FreeVerb.ar(in,0.1,100)};
)" ],
[ 90.618521647, 'me', "(
(
~m.quant=2;
~m={LFTri.ar(1/64).range(0,7)};


~freqMod.quant=2;
~freqMod={LFNoise0.kr(1/8!3,1.5,6).round(2).lag(1/8)};
);

(
~a.quant=2;
~a.fadeTime=2;
~a.play;
~a={
	var sig,notes,base;

	notes=(37+7+(_*7!11)-[0,12,24]).midicps.scramble;

	base = notes/~freqMod*(1.00001**(1..11));

	sig = Blip.ar(base,LFSaw.ar(1).range(80,1),mul:0.3);
	sig = (SinOsc.ar(base/~freqMod*4,mul:0.5)*LFSaw.ar(1).exprange(0.0001,1)) +sig;

	sig=  SelectX.ar(~m,sig);

	Splay.ar(sig);


};
);

(
~a[10]=\\filter->{|in|Vibrato.ar(in,[4,5,6],0.2)};
~a[12]=nil;//\\filter->{|in|BBandPass.ar(in,LFTri.ar(1).range(432.01,44),0.25,16)};
~a[14]=\\filter->{|in|CompanderD.ar(in,0.5,1,1/25,0.02,0.2,1.5)};
~a[16]=\\filter->{|in|Limiter.ar(in,1)};
~a[16]=\\filter->{|in|AllpassN.ar(in,0.25,0.25,1)};
~a[18]=\\filter->{|in|FreeVerb2.ar(in.distort,in.distort,0.13,100)};


);
)" ],
[ 95.764742214, 'me', "(
~a = {

	var sig;
	sig = Pluck.ar(
		LFSaw.ar(43.2*(1.00001**(1..8))*(Pulse.ar(4)*0.5+1)),Impulse.ar(6/[1,2]),0.01+TExpRand.ar(0.0001,0.1,Impulse.ar(1/2)).lag(1),0.01+TExpRand.ar(0.0001,0.05,Impulse.ar(1/4)).round(0.0025),0.55);

	sig = LPF.ar(sig,4000) + Resonz.ar(WhiteNoise.ar(0.75),LFSaw.ar(1/4/[1,2]).exprange([440.01,880],1.01));
	sig = sig + (SinOsc.ar(4320*[2,8,0.25,1.5,0.5],mul:0.5) * Decay.ar(Impulse.ar(1/16,[1,2,4,8].normalize),2));
	sig = sig + (SinOsc.ar(43.2 * 3,mul:0.5)* Decay.ar(Impulse.ar(1),1));
	sig = CompanderD.ar(sig,0.9,1,0.1);
	sig = FreeVerb.ar(sig,0.133,200);
	sig = Limiter.ar(sig,1);
	Splay.ar(sig,0.1);
};
~a.play;
)" ],
[ 115.347201412, 'me', "(
~m.quant=4;
~m={LFSaw.ar(1/4).range(0,7)};
~a.map(\\sel,~m);

~m2.quant=4;
~m2={LFNoise0.kr(1).range(0,2).round(1/2)};
~a.map(\\freq,~m2);

~a.fadeTime=4;
~a.quant=2;
~a.play;


)" ],
[ 116.746308629, 'me', "(
~a[0]={|len=1,freq=1,sel=0|
	var sigs = [
		LFSaw.ar(432/8*freq*(1.001*(1..8))),
		WhiteNoise.ar(1!2),
		LFSaw.ar(432/4*freq*(1.0001*(1..8))),
		BrownNoise.ar(1!2),
		LFSaw.ar(432*freq*(1.00001*(1..8))),
		GrayNoise.ar(1!2),
		LFSaw.ar(43.2*freq*(1.00001*(1..8)))
	];

	sigs = Select.ar(sel,sigs) * Decay.ar(Impulse.ar(4,0.5));

	Splay.ar(sigs)
};
~a.mold(2);

)" ],
[ 118.531863314, 'me', "(

~a[10]=\\filter->{|in| BBandPass.ar(in,LFSaw.ar(4).exprange(888,22.22))};
~a[12]=nil;//\\filter->{|in| Resonz.ar(in,LFTri.ar(1/4/[1,2,4,8]).exprange(888,33),2,1.5)};
~a[14]=nil;//\\filter->{|in| LPF.ar(in,LFTri.ar(1/16).exprange(250.01,12500))};
~a[16]=\\filter->{|in| CompanderD.ar(in,0.95,1,1/10)};
~a[18]=\\filter->{|in| Limiter.ar(in,1)};
~a[20]=\\filter->{|in| FreeVerb.ar(in,0.1,1)};

)" ],
[ 124.062146379, 'me', "(

~a.play;
~a={
	var sigs,mod,mod2;

	mod=m.kr(0,2)*10;
	mod2=m.kr(0,3).range(1.0000001,1.05);

	sigs=[
		LFSaw.ar(43.2*mod*(mod2**(1..8)) ),
		LFPulse.ar(43.2*2*mod*(mod2**(1..8))),
		LFCub.ar(43.2*4*mod*(mod2**(1..8))),
		SinOsc.ar(43.2*8*mod*(mod2**(1..8))),
		VarSaw.ar(43.2*1.5*mod*(mod2**(1..8))),
		LFSaw.ar(43.2*3*mod*(mod2**(1..8))),
		LFSaw.ar(43.2*6*mod*(mod2**(1..8))),
		LFSaw.ar(43.2*9*mod*(mod2**(1..8)))
	];


	sigs=Select.ar(~n,sigs);
	sigs=BBandPass.ar(sigs,LFSaw.ar(m.kr(0,4)*16+1/4).range(22000*m.kr(0,5),22));
	sigs=FreeVerb.ar(sigs,m.kr(0,3),100);


	Splay.ar(sigs,0.1,m.kr(0,1));

}
)" ],
[ 131.019480596, 'me', "~s = {SinOsc.ar(1/16).range(0.01,9.01)};" ],
[ 131.627573491, 'me', "~s.quant =2;" ],
[ 133.015363554, 'me', "(
~a.fadeTime = 2;
~a={
	var sig,f,s;

	sig=SinOsc.ar(((60+[0,5,7,11,-12,-24,-48,-36,4,-7,-14]).scramble.midicps)*(1.00001**(1..9)));
	sig = sig * LFTri.ar(1/fib(12)).range(1,0);
	sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(1000.01,44.01));
	sig = sig + HPF.ar(BrownNoise.ar({Rand(0.001,0.5)}!8),{Rand(440,12000)}!8);

	sig = SelectX.ar(~s,sig);

	sig = CompanderD.ar(sig,0.9,1,0.01);
	sig= Limiter.ar(sig,0.5,0.01);

	Splay.ar(sig,0.1);
};

~a[50]=\\filter->{|in| FreeVerb.ar(in,0.2,100)};

~a.play;
~a.quant=2;

)" ],
[ 136.057244309, 'me', "(
~s = {Duty.kr(1/8,0,Dseq((0..3),inf))};
~mod = {Duty.kr(Dseq([2,1,1/2,2,1/4,1,1]*4,inf),0,Dseq([1,1.5,2,1.25,4,0.75,1.5],inf))};


~s.quant = 2;
~mod.quant = 2;

~a.quant = 2;

~a={

	var sigs,sel,fad;


	sigs=[
		LFPulse.ar(432/1.5*~mod*(1.0002**(1..8))/4),
		LFSaw.ar(432/2*~mod*(1.0003**(1..8))/5),
		Blip.ar(432/5*~mod*(1.00023**(1..8)),2,2),
		LFSaw.ar(432/3*~mod*(1.0001**(1..8))),
	];


	fad = LFSaw.ar(1/fib(12)).range(0,3);
	sel = Select.ar(~s,sigs);
	sel = sel + (SinOsc.ar(44+Pulse.ar(4).exprange(250.01,0.01)) * Pulse.ar(4));
	sel = Vibrato.ar(sel,[4,5,6,7],0.3);
	sel = Resonz.ar(sel,LFSaw.ar(4/[1,2,4]++(1/4/[1,8])).exprange(14000.01,22));
	sel = CompanderD.ar(sel,0.5,1,1/10);
	sel = FreeVerb.ar(sel,0.1,0.5);

	Splay.ar(sel,0.1);

};

~a.play;
)" ],
[ 151.360891218, 'me', "(
~a.fadeTime = 5;
~a.play;
~a.quant = 2;


~modulate.quant=2;
~modulate = {Duty.kr(4*(1..8),0,Dseq([0,-48,-24,-12,-36],inf))};

~a[0]={
	var sig;

	sig = SinOsc.ar(([60,67,64,69,65,60-12+7,60-24+4]+~modulate).midiratio * (pi) * (1..12) * (1.0001**(1..12)),SinOsc.ar(8/[11,22,44]).range(-pi,pi),mul:1/(1..12));
	sig = sig * LFSaw.ar(1/(1..8)).range(0,1);
	sig = sig + (SinOsc.ar([44,45] * Decay2.ar(Impulse.ar(4/[1,2]),0.002,0.18,5,1),0.1) * Decay2.ar(Impulse.ar(4/[1,2]),0.2,1));
	sig = sig + (HPF.ar(WhiteNoise.ar(0.005!4),TExpRand.ar(440,16000,Impulse.ar(1/2!4))) * Pulse.ar([1/4,1/8,1],[1,2,6,8].normalize));
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.2,1);
};



~a[10]=\\filter->{|in| BBandPass.ar(in,SinOsc.ar(1/12/(1..8)).range(44,8000)) * 1.5};
~a[12]=\\filter->{|in| Resonz.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5};
~a[14]=\\filter->{|in| Vibrato.ar(in,[4,5,6,7],0.2)};
~a[16]=\\filter->{|in| FreeVerb.ar(in,SinOsc.ar(1/5/(1..8)).range(0.01,0.8),1)};

)" ],
[ 165.034647194, 'me', "(
~b.play;
~s = {Duty.kr(1/8,0,Dseq([1,2,0,0,0,0,3,3,3,4,0,0,0,0],inf))};

~s.quant=2;
~b.quant =2;
)" ],
[ 166.27940763, 'me', "(
~b={
	var sigs,sel,env,f,l;

	sigs = [
		SinOsc.ar(43.2),
		HPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Blip.ar(1986,{TExpRand.ar(10,100,Impulse.ar(4!4))} ),
		RLPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Pluck.ar(Pulse.ar(4000),Impulse.ar(4),0.5,0.5)
	];

	sel = Select.ar(~s,sigs);
	sel = CompanderD.ar(sel,0.9,1,1/10);
	sel = FreeVerb.ar(sel,0.12,2.5);

	Splay.ar(sel);

};
)" ],
[ 176.588815661, 'me', "(
~b.play;
~s = {Duty.kr(1/8,0,Dseq([1,2,0,0,0,0,3,3,3,4,0,0,0,0],inf))};

~s.quant=2;
~b.quant =2;
)" ],
[ 177.791991089, 'me', "(
~b={
	var sigs,sel,env,f,l;

	sigs = [
		SinOsc.ar(43.2),
		HPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Blip.ar(1986,{TExpRand.ar(10,100,Impulse.ar(4!4))} ),
		RLPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4))),
		Pluck.ar(Pulse.ar(4000),Impulse.ar(4),0.5,0.5)
	];

	sel = Select.ar(~s,sigs);
	sel = CompanderD.ar(sel,0.9,1,1/10);
	sel = FreeVerb.ar(sel,0.12,2.5);

	Splay.ar(sel);

};
)" ],
