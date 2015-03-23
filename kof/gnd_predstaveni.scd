
s.scope;

///////  1  hf sounds /////////////////////////////////////////////////////////


(
~one.fadeTime = 4;
~one.play;
~one={
	var sig = LFSaw.ar(8000*[1,1.5]+SinOsc.ar([1,1.00001]).range(-1,1) ,mul:0.5) * LFSaw.ar(1/[1,2]).exprange(0.0001,1);
	Splay.ar(sig);

};
// ~one[50]=\filter->{|in|FreeVerb.ar(in,0.22,0.5)};
)

~one.stop(20)


///////// 2 calm little melodies whan loud  ////////////////////////////////////////////////////////
~one.stop

(
~a.fadeTime = 20;
~a.play;
~a.quant = 4;


~modulate.quant=2;
~modulate = {Duty.kr(4*(1..8),0,Dseq([0,-48,-24,-12,-36]+12,inf))};

~a[0]={
	var sig;

	sig = SinOsc.ar(([60,67,64,69,65,60-12+7,60-24+4]+~modulate).midiratio * (pi) * (1..12) * (1.0001**(1..12)),SinOsc.ar(8/[11,22,44]).range(-pi,pi),mul:1/(1..12));
	sig = sig * LFSaw.ar(1/(1..8)).range(0,1);
	sig = sig + (SinOsc.ar([44,45] * Decay2.ar(Impulse.ar(4/[1,2]),0.002,0.18,5,1),0.1) * Decay2.ar(Impulse.ar(4/[1,2]),0.2,1));
	sig = sig + (HPF.ar(WhiteNoise.ar(0.005!4),TExpRand.ar(440,16000,Impulse.ar(1/2!4))) * Pulse.ar([1/4,1/8,1],[1,2,6,8].normalize));
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.01,0.471);
};



~a[10]=\filter->{|in| Splay.ar(BBandPass.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5)};
~a[12]=\filter->{|in| Splay.ar(Resonz.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5)};
~a[14]=\filter->{|in| Splay.ar(Vibrato.ar(in,[4,5,6,7],0.2))};
~a[16]=\filter->{|in| Splay.ar(FreeVerb.ar(in,SinOsc.ar(1/10/(1..8)).range(0.01,0.18),1))};

)
~a.stop

///////// 3  impro set 1.5 1.25 1.75 ////////////////////////////////////////////////////////////////




(
~two.quant=0;
~two.fadeTime=1;
~two.play;                 ///  VVV - 1.75 1.5  ////////////////
~two={Splay.ar(SinOsc.ar( 43.2*1.5pi/1.5 *[1,1.5,3,2],mul:1) * LFSaw.ar([1,2,3,4]/2)).exprange(1.001,0.01) };
// ~two[50]=\filter->{|in| Splay.ar(CombN.ar(in,1/2,1/2,2))};
)
~two.stop(2)



/////////// 4 toned hihats ////////////////////////////////////////////////////////


(
~hh.quant=1;
~hh.play;
~hh={
	var hat,pat1;

	pat1=[1,2,3,4]*2;


	hat = HPF.ar(WhiteNoise.ar(0.4!2),2200*[1,2,4,8]*(Decay.ar(Impulse.ar(pat1),0.15)+1) ) * Decay.ar(Impulse.ar(pat1),0.25);
	Splay.ar(hat,0.1,0.8);
}
)

/////////// 4b melod kicks //////////////////////////////////////////////////////



(
~sel={Duty.kr(4,0,Dseq([1.5,1.25,1.125,2],inf)).lag(1/16)};
~sel.quant =2;

~sel2={Duty.kr(4,0,Dseq([1.5,1.25,1.125/2,2],inf))};
~sel2.quant =2;
)

(
~ryt.fadeTime=2;
~ryt.play;
~ryt.quant=2;
~ryt={
	var in,m,hat,kick,pat1,pat2;

	pat1=[1,3,4]/2;
	pat2=[2,8,1.5];

	kick = SinOsc.ar(44*~sel2.kr*(8*Decay.ar(Impulse.ar(pat1),0.1225)+1),mul:1)* Decay.ar(Impulse.ar(pat1),1.5);
	hat = RHPF.ar(WhiteNoise.ar(0.2!2),2200*[1,2,4,8]) * Decay.ar(Impulse.ar(pat2),0.25);
	m = VarSaw.ar(43.2*[1,2,4,8]*~sel2.kr,mul:0.4);
	in = Ringz.ar(Impulse.ar(4), 43.2*(_*~sel.kr!12) ,2.5,mul:1/(1..12)) + m;
	in = hat + kick / 1.25;
	in = CompanderD.ar(in,0.75,1/1.15,1/10).softclip;
	in = BBandPass.ar(in,LFTri.ar(1/32*fib(8)).range(44,12000),1,1,in/2);
	Splay.ar(in,0.1,0.5);
}
)
~ryt.stop(10)



//////////// 5 alex astral /////////////////////////////////////////////////////////////




//////////// 6 inpropriate guitar basses /////////////////////////////////////////////////////////////


(
~b.stop(10);
~b = {

	var sig;
	sig = Pluck.ar(
		LFSaw.ar(43.2*(1.00001**(1..8))*(Pulse.ar(4)*0.5+1)),Impulse.ar(6/[1,2]),0.01+TExpRand.ar(0.0001,0.1,Impulse.ar(1/2)).lag(1),0.01+TExpRand.ar(0.0001,0.05,Impulse.ar(1/4)).round(0.0025),0.55);

	sig = LPF.ar(sig,4000) + Resonz.ar(WhiteNoise.ar(0.75),LFSaw.ar(1/4/[1,2]).exprange([440.01,880],1.01));
	sig = sig + (SinOsc.ar(4320*[2,8,0.25,1.5,0.5],mul:0.5) * Decay.ar(Impulse.ar(1/16,[1,2,4,8].normalize),2));
	sig = sig + (SinOsc.ar(43.2 * 3,mul:0.5)* Decay.ar(Impulse.ar(1),1));
	sig = CompanderD.ar(sig,0.9,1,0.1);
	sig = FreeVerb.ar(sig,0.133,200);
	sig = Limiter.ar(sig,1);
	Splay.ar(sig,0.01,0.25);
};
~b.play;
)

~b.stop(10);


///////////// 7 disturbing high freq sounds //////////////////////////////////////////////////////////////////



(
Ndef(\pila).fadeTime = 2.0;
Ndef(\pila).quant = 2.0;

Ndef(\pila,{Splay.ar(
	RLPF.ar(
		SinOsc.ar(LFSaw.ar(11.31).exprange(22.0,17777),mul:0.75) * SinOsc.ar(11.32).squared * SinOsc.ar(8/[8,5,3,1]).lag(0.001+SinOsc.kr(0.01).range(0,0.01))
		,LFNoise0.ar(1/[4,4]).range(22,17777).lag(1))
	,0.1,0.2)}).play;

Ndef(\pila)[1] = \filter -> {|in| Resonz.ar(in,LFNoise0.ar(1/[4,4]).range(22,17777).lag(1),mul:0.33,add:in)};
Ndef(\pila)[2] = \filter -> {|in| GVerb.ar(in,100,mul:0.33,add:in)};

)

Ndef(\pila).stop(10);


////////////// 7 crashed melodies /////////////////////////////////////////////////////////////////////


(
~two.quant=2;
~two.fadeTime=1;
~two.play;
~ssq={Duty.kr(4,0,Dseq([1.5,1.25],inf))};
~ssq.quant=2;
~two={Splay.ar(LFSaw.ar( 43.2 * (~ssq.kr*pi)/1.5 * [1,1.5,3,2] * (1.0001**(1..8)),mul:1) * LFSaw.ar([1,2,3,4]/2)).exprange(1.001,0.01) };
// ~two[50]=\filter->{|in| Splay.ar(CombN.ar(in,1/2,1/2,2))};
)

///////////// 8 pop happy shit ///////////////////////////////////////////////////////////////////////


(
Ndef(\crackles).quant = 2.0;
Ndef(\crackles).fadeTime = 2.0;

Ndef(\crackles,{

	var mod1a,mod1b,mod2;

	mod1a = Select.kr(Stepper.kr(Impulse.kr(1/[4,2 ])),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
	mod1b = Select.kr(Stepper.kr(Impulse.kr(4)),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
	mod2 = Select.kr(Stepper.kr(Impulse.kr(1/16)),11/2*[1,1,1.5,1.5,2,4,0.5,0.5,1,1,1]);

	Splay.ar(
		FreeVerb.ar(
			LPF.ar(
				0
				+ Pulse.ar([4,2]/fib(21),mul:1/fib(21)) * Pulse.ar((1.0001**(1..8))*mod2*[mod1a,mod1b]*(2.0005**(1..8)))
				+ (Pulse.ar([4,2]/2/fib(21),mul:1/fib(21)) * WhiteNoise.ar(0.15!2))
				+ (LFPulse.ar(8/fib(12),mul:1/fib(21)) * SinOsc.ar((~mod2*2)*Pulse.ar(1/fib(12)).range(8*[mod1b,mod1b],WhiteNoise.ar(1!4)),mul:0.4))
				,[22,23]+(16000*LFSaw.ar(1/4/fib(21)).range(0,1)))
			,0.1)
		,0.5,1,0.5)
}).play;
)



///////////// 10 serioux tones //////////////////////////////////////////////////////////////////


(
Ndef(\aaa).fadeTime = 2.0;
Ndef(\aaa).quant = 2.0;
Ndef(\aaa,{
	var base,saws;
	Splay.ar(

		base = [60,60.13]*1.25;
		saws = LFSaw.ar(1/8/[1,2,3,5,8,13,21,34,55,89]).squared;

		FreeVerb.ar(
			FreeVerb.ar(
				SinOsc.ar(SinOsc.kr([1,1/2,1/4,1/8]*pi).range(base,base+2),mul:2)
				,0.1375,1).softclip * Decay.ar(Impulse.ar(8/[1,2,3,5,8])).squared + (VarSaw.ar(SinOsc.kr([1,1/2,1/4,1/8],(8pi*saws)).range(base*2,base*2+2)) * saws)
			// +(HPF.ar(WhiteNoise.ar(0.75!4),10080) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),0.6).squared)

			,0.1,2).softclip
)}).play;
)



///////// 11 ////////////////////////////////////////////////////////////////////



(
~x.play;
~s = {Duty.kr(1/8,0,Dseq([1,2,0,0,0,0,3,3,3,4,0,0,0,0],inf))};

~s.quant=2;
~x.quant =2;
)

(
~x={
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

	Splay.ar(sel,0.1,0.1);

};
)


