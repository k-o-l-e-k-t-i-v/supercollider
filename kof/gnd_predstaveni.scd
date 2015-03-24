
s.scope;

///////  1  hf sounds /////////////////////////////////////////////////////////

(


~one={
	var sig;
	sig = LFSaw.ar(8000*[1,1.5]+SinOsc.ar([1,1.00001]).range(-1,1) ,mul:0.5) * LFSaw.ar(1/[1,2]).exprange(0.0001,1);
	Splay.ar(sig,0.1,m.kr(0,1));
};
// ~one[50]=\filter->{|in|FreeVerb.ar(in,0.22,0.5)};

~one.play;
~one.fadeTime = 4;


///////// 2 calm little melodies whan loud  ////////////////////////////////////////////////////////



~modulate.quant=2;
~modulate = {Duty.kr(4*(1..8),0,Dseq([0,-48,-24,-12,-36]+12,inf))};

~a[0]={
	var sig;

	sig = SinOsc.ar(([60,67,64,69,65,60-12+7,60-24+4]+~modulate).midiratio * (pi) * (1..12) * (1.0001**(1..12)),SinOsc.ar(8/[11,22,44]).range(-pi,pi),mul:1/(1..12));
	sig = sig * LFSaw.ar(1/(1..8)).range(0,1);
	sig = sig + (SinOsc.ar([44,45] * Decay2.ar(Impulse.ar(4/[1,2]),0.002,0.18,5,1),0.1) * Decay2.ar(Impulse.ar(4/[1,2]),0.2,1));
	sig = sig + (HPF.ar(WhiteNoise.ar(0.005!4),TExpRand.ar(440,16000,Impulse.ar(1/2!4))) * Pulse.ar([1/4,1/8,1],[1,2,6,8].normalize));
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.01,m.kr(0,2));
};


~a.fadeTime = 20;
~a.play;
~a.quant = 4;


~a[10]=\filter->{|in| Splay.ar(BBandPass.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5)};
~a[12]=\filter->{|in| Splay.ar(Resonz.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5)};
~a[14]=\filter->{|in| Splay.ar(Vibrato.ar(in,[4,5,6,7],0.2))};
~a[16]=\filter->{|in| Splay.ar(FreeVerb.ar(in,SinOsc.ar(1/10/(1..8)).range(0.01,0.18),1))};



///////// 3  impro set 1.5 1.25 1.75 ////////////////////////////////////////////////////////////////




~two={Splay.ar(SinOsc.ar( 43.2*1.5pi/1.5 *[1,1.5,3,2],mul:1) * LFSaw.ar([1,2,3,4]/2).exprange(1.001,0.01),0.1,m.kr(0,3)) };
// ~two[50]=\filter->{|in| Splay.ar(CombN.ar(in,1/2,1/2,2))};

~two.quant=0;
~two.fadeTime=1;
~two.play;                 ///  VVV - 1.75 1.5  ////////////////



/////////// 4 toned hihats ////////////////////////////////////////////////////////



~hh={
	var hat,pat1;

	pat1=[1,2,3,4]*2;


	hat = HPF.ar(WhiteNoise.ar(0.5!2),2200*(Decay.ar(Impulse.ar(pat1),0.15)+1)) * Decay.ar(Impulse.ar(pat1),0.25);
	Splay.ar(hat,0.1,m.kr(0,4));
};
~hh.quant=1;
~hh.play;


/////////// 4b melod kicks //////////////////////////////////////////////////////


~rrr={
	var in,mel,hat,kick,pat1,pat2,sl,sl2;

	sl =Duty.ar(4,0,Dseq([1.5,1.25,1.125,2],inf)).lag(1/16);
	sl2=Duty.ar(4,0,Dseq([1.5,1.25,1.125/2,2],inf));

	pat1=[1,4,1/4];
	pat2=[2,8,1.5];

	kick = SinOsc.ar(44*sl2*(4*Decay.ar(Impulse.ar(pat1),0.1225)+1),mul:1)* Decay.ar(Impulse.ar(pat1),1.5);
	hat = RHPF.ar(WhiteNoise.ar(0.2!2),2200*[1,2,4,8]) * Decay.ar(Impulse.ar(pat2),0.25);
	mel = VarSaw.ar(43.2*[1,2,4,8]*sl2,mul:0.37);
	in = Ringz.ar(Impulse.ar(4), 43.2*(_*sl!8) ,2.5,mul:1/(1..12)) + mel;
	in = kick / 1.25 + mel;
	in = CompanderD.ar(in,0.75,1/1.15,1/10).softclip;
	in = BBandPass.ar(in,LFTri.ar(1/32*fib(8)).range(44,12000),1,1,in/2);
	Splay.ar(in,0.1,m.kr(0,5));
};

~rrr.fadeTime=2;
~rrr.quant=2;
~rrr.play;





//////////// 5 alex astral /////////////////////////////////////////////////////////////


);

//////////// 6 inpropriate guitar basses /////////////////////////////////////////////////////////////

(


~six={
	var sig,mld;
	mld = LFTri.ar(222/(1..8))*25;

	sig = SinOsc.ar(16000/(1..16),mul:0.05);
	sig = sig * LFPulse.ar(TExpRand.ar(1/4!16,16,Impulse.ar(4)));
	sig = CompanderD.ar(sig,0.5,1,1/10);
	sig = CombN.ar(sig,1,8,8);
	sig = FreeVerb.ar(sig,0.31,2);

	Splay.ar(sig,0.1,m.kr(0,6));

};
~six.quant=2;
~six.play;




///////////// 7 disturbing high freq sounds //////////////////////////////////////////////////////////////////


(

~pila.fadeTime = 2.0;
~pila.quant = 2.0;
~pila={Splay.ar(
	RLPF.ar(
		SinOsc.ar(LFSaw.ar(11.31).exprange(22.0,17777),mul:0.75) * SinOsc.ar(11.32).squared * SinOsc.ar(8/[8,5,3,1]).lag(0.001+SinOsc.kr(0.01).range(0,0.01))
		,LFNoise0.ar(1/[4,4]).range(22,17777).lag(1))
	,0.1,m.kr(0,7))};




~pila[52] = \filter -> {|in| Resonz.ar(in,LFNoise0.ar(1/[4,4]).range(22,17777).lag(1),mul:0.33,add:in)};
~pila[54] = \filter -> {|in| GVerb.ar(in,100,mul:0.33,add:in)};

~pila.play;

);


);

(



///////////// 10 serioux tones //////////////////////////////////////////////////////////////////

(
~aaa.fadeTime = 2.0;
~aaa.quant = 2.0;
~aaa={
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
		,0.1,m.kr(0,8))};

);



///////// 11 ////////////////////////////////////////////////////////////////////



~ss = {Duty.kr(1/8,0,Dseq([1,2,0,0,0,0,3,3,3,4,0,0,0,0],inf))};

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

	Splay.ar(sel,0.1,m.kr(1,2));

};
~x.play;

~ss.quant=2;
~x.quant =2;

);


