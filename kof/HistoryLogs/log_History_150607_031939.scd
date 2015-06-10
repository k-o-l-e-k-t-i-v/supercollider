// History, as it was on Sun Jun  7 03:19:39 2015.

[
[ 0, 'me', "(
~b.play;
~s = {Duty.kr(1/8,0,Dseq([1,2,0,0,0,0,3,3,3,4,0,0,0,0],inf))};

~s.quant=2;
~b.quant =2;
)" ],
[ 1.4500076180002, 'me', "(
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
[ 11.432540429, 'me', "(
~a.play;
~s = {Duty.kr(1/4,0,Dseq([0,1,2,3,0,0,0,0],inf))};

~oct = {Duty.kr(8,0,Dseq([0,12,24,36],inf))};

~m = {Duty.kr(1,0,Dseq([60,65,64,65,67,63,72]-~oct,inf))};

~m.quant=2;

~s.quant=2;
~a.quant=2;
~a.fadeTime = 0.01;
)" ],
[ 12.826109819, 'me', "(
~a={
	var sigs,sel,env,f,l;

	l = [0.25,0.5,0.5,0.25];

	f = ~m.midicps;

	env = Decay.ar(Impulse.ar(8),Select.kr(~s,l));

	sigs = [
		SinOsc.ar(43.2*(env.exprange(10.0001,1.01))),
		Blip.ar(f*1.5,TExpRand.ar(10,100,Impulse.ar(1!4))),
		Pluck.ar(Saw.ar(f*(1-env)),Impulse.ar(4),0.5,0.5),
		HPF.ar(WhiteNoise.ar(0.7!2),TExpRand.ar(1000,16000,Impulse.ar(1!4)))
	];

	sel = Select.ar(~s,sigs) + LFSaw.ar(f*(1..8),mul:0.5);
	sel = BBandPass.ar(sel,LFSaw.ar(4/[1,2,4,8]).exprange(16000.01/(1..8),44)) + (sel*env);
	sel = CompanderD.ar(sel,0.75,1,1/10);
	sel = FreeVerb.ar(sel,0.2,0.5);

	Splay.ar(sel);

};
)" ],
[ 21.788248629, 'me', "(
  ~a.play;
  ~a.quant=2;
  ~a={
    var sig,m;
    m = {LFTri.ar(222/(1..8))*25};

    sig = SinOsc.ar(16000/(1..16),mul:0.05);
    sig = sig * LFPulse.ar(TExpRand.ar(1/4!16,16,Impulse.ar(4)));
    sig = CompanderD.ar(sig,0.5,1,1/10);
    sig = CombN.ar(sig,1,8,8);
    sig = FreeVerb.ar(sig,0.31,2);

    Splay.ar(sig);

  };

)" ],
[ 29.353558406, 'me', "(
~a.fadeTime = 5;
~a.play;
~a.quant = 2;


~modulate.quant=2;
~modulate = {Duty.kr(4*(1..8),0,Dseq([0,-12,-24,-12,12],inf))};

~a[0]={
	var sig;

	sig = SinOsc.ar(([60,67,64,69,65,60-12+7,60-24+4]+~modulate).midiratio * (pi) * (1..12) * (1.0001**(1..12)),SinOsc.ar(8/[11,22,44]).range(-pi,pi),mul:1/(1..12));
	sig = sig * LFSaw.ar(1/(1..8)).range(0,1) * 2;
	sig = sig + (LFSaw.ar([44,88] * Decay2.ar(Impulse.ar(4/[1,2]),0.002,0.18,5,1),0.1) * Decay2.ar(Impulse.ar(4/[1,2]),0.2,1));
	sig = sig + (HPF.ar(WhiteNoise.ar(0.005!4),TExpRand.ar(440,16000,Impulse.ar(1/2!4))) * Pulse.ar([1/4,1/8,1],[1,2,6,8].normalize));
	sig = CompanderD.ar(sig,0.5,1,1/10);

	Splay.ar(sig,0.2,1);
};



~a[10]=\\filter->{|in| BBandPass.ar(in,SinOsc.ar(1/12/(1..8)).range(44,8000)) };
~a[12]=\\filter->{|in| Resonz.ar(in,SinOsc.ar(1/4/(1..8)).range(44,8000)) * 1.5};
~a[14]=\\filter->{|in| Vibrato.ar(in,[4,5,6,7],0.2)};
~a[16]=\\filter->{|in| FreeVerb.ar(in,SinOsc.ar(1/5/(1..8)).range(0.01,0.3),1)};

)" ],
[ 46.735921214, 'me', "(
~rythm.quant = 2;
~rythm.fadeTime = 0.1;
~rythm = {Duty.ar(Dseq([1/2,2+1/2],inf),0,Dseq([32,4]*2,inf))};
~saw.quant = 2;
  ~saw = {LFSaw.ar(2).exprange(2200.01,22)};
)" ],
[ 48.187421097, 'me', "(
  Ndef(\\a).fadeTime = 2;
  Ndef(\\a).quant =2;
  Ndef(\\a,{
    var sig = SinOsc.ar(~saw+(~saw*Pulse.ar(~rythm)));
    sig = sig + Resonz.ar(WhiteNoise.ar(1!2),~saw*10,0.1,4);
    sig = sig * Decay.ar(Impulse.ar(~rythm),0.15+SinOsc.ar(1/16).range(0.001,0.15));
    sig = RLPF.ar(sig,~saw*10);
    sig = FreeVerb.ar(sig,0.13,2);

    Splay.ar(
       sig
    )
  }).play;
)" ],
[ 57.736994871, 'me', "Ndef(\\ttt).lag(\\eff,10,\\room,10,\\freq,0.02,\\temp,10,\\amm,10,\\echo,10);" ],
[ 58.733874706, 'me', "Ndef(\\ttt).set(\\freq,[432,432.1,432.1/2]*1.5pi)" ],
[ 60.359053725, 'me', "Ndef(\\ttt).set(\\room,2)" ],
[ 61.186729775, 'me', "Ndef(\\ttt).set(\\amm,1)" ],
[ 61.750457209, 'me', "Ndef(\\ttt).set(\\temp,[1,2,4,8]/8)" ],
[ 62.417309813, 'me', "Ndef(\\ttt).set(\\echo,0.133)" ],
[ 63.016422183, 'me', "Ndef(\\ttt).set(\\eff,0.5)" ],
[ 65.510799773, 'me', "(
Ndef(\\a).fadeTime = 2.0;
Ndef(\\a).quant = 2.0;
Ndef(\\a,{
	SinOsc.ar(4320/([1,2,4,8]*pi)) * LFPulse.ar(4/[1,2,4