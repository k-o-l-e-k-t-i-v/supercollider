// History, as it was on Sun Jun  7 02:30:44 2015.

[
[ 0, 'me', "LADSPA.listPlugins" ],
[ 320.716523067, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 433.945676893, 'me', "(
~qwe.quant=2;
~qwe={
	var imp = Impulse.ar(1/2,(0..7)++[0.5,7.5,7.75]/8);
	var sig = DynKlank.ar(`[(1..20),nil,{ExpRand(0.001,2)}!20],imp,1,Decay.ar(imp,1).exprange(5.01,65));
	sig = HPF.ar(sig,20);
	sig = sig + (RHPF.ar(WhiteNoise.ar(0.74!2),LFDNoise1.ar(1/4!8,10000,12000),SinOsc.ar(11/fib(12),0.5).exprange(0.2,0.6)) * Decay2.ar(imp,0.25,0.0035));
	Splay.ar(sig,0.25);
};
~qwe.play;
)" ],
[ 547.062591586, 'me', "(
~wer.quant=2;
~wer={
	var imp = Impulse.ar(1/2,(1..8)++0.5/8);
	var sig = DynKlank.ar(`[{1.rrand(20)/20}!10,nil,{1.rrand(20)/20}!10],imp,1/10,Decay.ar(imp,1/LFDNoise1.ar(1/4!2).exprange(1.01,10)).exprange(43.01,12000));
	sig = HPF.ar(sig,40)/2;
	Splay.ar(sig,0.5,0.08);
};
~wer.play;
)" ],
[ 652.838056299, 'me', "(
~qwe.quant=2;
~qwe={
	var imp = Impulse.ar(1/2,(0..7)++[0.5,7.5,7.75]/8);
	var sig = DynKlank.ar(`[(1..20),nil,{ExpRand(0.001,2)}!20],imp,1,Decay.ar(imp,1).exprange(5.01,65));
	sig = HPF.ar(sig,20);
	sig = sig + (RHPF.ar(WhiteNoise.ar(0.74!2),LFDNoise1.ar(1/4!8,10000,12000),SinOsc.ar(11/fib(12),0.5).exprange(0.2,0.6)) * Decay2.ar(imp,0.25,0.0035));
	Splay.ar(sig,0.25);
};
~qwe.play;
)" ],
[ 700.171521699, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 702.097901706, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	// sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 718.755041583, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var mod = Duty.kr(4,0,Dseq(1/[1,2,4,8]+1,inf)).lag(1/4);
  var imp = Decay.ar(Impulse.ar(1/4,(0..15)/16),3)**2;
  var sig = Blip.ar([100,150]*mod/[1,1,1,1,1.5,1,1.25,2,8]-(imp*2),LFSaw.ar(1/4/fib(8)).exprange(2.01,8)) * imp;
  sig = Resonz.ar(sig,imp*2000+100) + sig;
  sig = GVerb.ar(sig,[2,3,4]*10,mul:0.24)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
m.addMix(~saw,postVol:true);
)" ],
[ 723.898927821, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var mod = Duty.kr(4,0,Dseq(1/[1,2,4,8]+1,inf)).lag(1/4);
  var imp = Decay.ar(Impulse.ar(1/4,(0..15)/16),3)**2;
  var sig = Blip.ar([100,150]*mod/[1,1,1,1,1.5,1,1.25,2,8]-(imp*2),LFSaw.ar(1/4/fib(8)).exprange(2.01,8)) * imp;
  sig = Resonz.ar(sig,imp*2000+100) + sig;
	// sig = GVerb.ar(sig,[2,3,4]*10,mul:0.24)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saw.play;
m.addMix(~saw,postVol:true);
)" ],
[ 802.665984796, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var mod = Duty.kr(4,0,Dseq(1/[1,2,4,8]+1,inf)).lag(1/4);
  var imp = Decay.ar(Impulse.ar(1/4,(0..15)/16),3)**2;
  var sig = Blip.ar([100,150]*mod/[1,1,1,1,1.5,1,1.25,2,8]-(imp*2),LFSaw.ar(1/4/fib(8)).exprange(2.01,8)) * imp;
  sig = Resonz.ar(sig,imp*2000+100) + sig;
	// sig = GVerb.ar(sig,[2,3,4]*10,mul:0.24)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~saw.play;
m.addMix(~saw,postVol:true);
)" ],
[ 835.306106576, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	// sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.15);
};
~probabilistic.play;
)" ],
[ 841.443425603, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	// sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.25);
};
~probabilistic.play;
)" ],
[ 847.460603896, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	// sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 935.92328682, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var mod = Duty.kr(4,0,Dseq(1/[1,2,4,8]+1,inf)).lag(1/4);
  var imp = Decay.ar(Impulse.ar(1/4,(0..15)/16),3)**2;
  var sig = Blip.ar([100,150]*mod/[1,1,1,1,1.5,1,1.25,2,8]-(imp*2),LFSaw.ar(1/4/fib(8)).exprange(2.01,8)) * imp;
  sig = Resonz.ar(sig,imp*2000+100) + sig;
	// sig = GVerb.ar(sig,[2,3,4]*10,mul:0.24)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~saw.play;
m.addMix(~saw,postVol:true);
)" ],
[ 1004.484947742, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var mod = Duty.kr(4,0,Dseq(1/[1,2,4,8]+1,inf)).lag(1/4);
  var imp = Decay.ar(Impulse.ar(1/4,(0..15)/16),3)**2;
  var sig = Blip.ar([100,150]*mod/[1,1,1,1,1.5,1,1.25,2,8]-(imp*2),LFSaw.ar(1/4/fib(8)).exprange(2.01,8)) * imp;
  sig = Resonz.ar(sig,imp*2000+100) + sig;
	// sig = GVerb.ar(sig,[2,3,4]*10,mul:0.24)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~saw.play;
m.addMix(~saw,postVol:true);
)" ],
[ 1031.361899499, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	// sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.25);
};
~probabilistic.play;
)" ],
[ 1107.486667318, 'me', "(
~qwe.quant=2;
~qwe={
	var imp = Impulse.ar(1/2,(0..7)++[0.5,7.5,7.75]/8);
	var sig = DynKlank.ar(`[(1..20),nil,{ExpRand(0.001,2)}!20],imp,1,Decay.ar(imp,1).exprange(5.01,65));
	sig = HPF.ar(sig,20);
	sig = sig + (RHPF.ar(WhiteNoise.ar(0.74!2),LFDNoise1.ar(1/4!8,10000,12000),SinOsc.ar(11/fib(12),0.5).exprange(0.2,0.6)) * Decay2.ar(imp,0.25,0.0035));
	Splay.ar(sig,0.25,0.2);
};
~qwe.play;
)" ],
[ 1110.797994965, 'me', "(
~qwe.quant=2;
~qwe={
	var imp = Impulse.ar(1/2,(0..7)++[0.5,7.5,7.75]/8);
	var sig = DynKlank.ar(`[(1..20),nil,{ExpRand(0.001,2)}!20],imp,1,Decay.ar(imp,1).exprange(5.01,65));
	sig = HPF.ar(sig,20);
	sig = sig + (RHPF.ar(WhiteNoise.ar(0.74!2),LFDNoise1.ar(1/4!8,10000,12000),SinOsc.ar(11/fib(12),0.5).exprange(0.2,0.6)) * Decay2.ar(imp,0.25,0.0035));
	Splay.ar(sig,0.25,0.1);
};
~qwe.play;
)" ],
[ 1113.257124416, 'me', "(
~wer.quant=2;
~wer={
	var imp = Impulse.ar(1/2,(1..8)++0.5/8);
	var sig = DynKlank.ar(`[{1.rrand(20)/20}!10,nil,{1.rrand(20)/20}!10],imp,1/10,Decay.ar(imp,1/LFDNoise1.ar(1/4!2).exprange(1.01,10)).exprange(43.01,12000));
	sig = HPF.ar(sig,40)/2;
	Splay.ar(sig,0.5,0.008);
};
~wer.play;
)" ],
[ 1186.4849366, 'me', "(
ProxySynthDef(\\bum2, {
	arg sustain, amp, voln, f2;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([\\freq.kr*4,\\freq.kr],[sustain*0.04]),\\gate.kr(1),timeScale:sustain);
	sig=SinOsc.ar(fenv!2,
		add:HPF.ar(WhiteNoise.ar(voln).clip(0.05,0.1),Saw.kr(2).range(11000,f2))

	)*env*amp;
}).add;

ProxySynthDef(\\zzz, {
	arg sustain, amp,speed,vol,lag, freq;
	var sig, env,fenv, lagenv;

	env=EnvGen.kr(Env.new([0,1,0],[0.25,0.75],\\welch),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new([freq*2,freq],[sustain*0.08]),timeScale:sustain);
	lagenv=EnvGen.kr(Env.new([lag*0.1,lag],[sustain*0.7]),timeScale:sustain);
	sig=Lag.ar(LFSaw.ar(fenv),lagenv)*env*amp;
	sig=Pan2.ar(sig,SinOsc.kr(sustain/speed),vol);
}).add;

ProxySynthDef(\\sin, {
	arg gate=1, sustain=1, freq=440, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.2,0.7,sustain*0.5),gate,doneAction:2);
	sig=SinOsc.ar(freq*(1..8))*env*amp;

}).add;


ProxySynthDef(\\pulse, {
	arg sustain, amp;
	var sig, env, fenv, lag, noise;

	noise=SelectX.ar(\\n.kr,[WhiteNoise.ar(0.35!2),PinkNoise.ar(0.7).softclip(0.5,1), BrownNoise.ar(0.3)]);

	env=EnvGen.kr(Env([0,1,0],[0.25,0.75],\\welch),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([\\freq.kr,\\f2.kr],[sustain*0.1],\\welch),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(fenv,iphase:0.7)*BPF.ar(noise,fenv,add:noise*0.5)*env*amp;
}).add;


ProxySynthDef(\\ping, {
	arg sustain, amp,leng;
	var sig, env, fenv;

	env=EnvGen.kr(Env.new(), \\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env.new(curve:\\welch),\\gate.kr(1),timeScale:sustain);

	sig=SinOsc.ar([\\freq.kr,\\freq.kr+2])*amp;
	sig=sig*env;
}).add;


)" ],
[ 1219.155562818, 'me', "(
SynthDef(\\r1, {
	arg gate=1, freq=85,sustain=1,amp=1,wide,rqq=0.001, room, tail;
	var sig, env,rq;
	rq=EnvGen.kr(Env.new([0.001,0.02,tail],[sustain*0.1,sustain*0.9]),gate);

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.2,0.7,sustain*0.7),gate);
	sig=BPF.ar(GrayNoise.ar(amp!2),[freq,freq+2],rq);
	sig=sig*env;
	sig=FreeVerb.ar(sig,room:room,damp:1);
	DetectSilence.ar(sig,doneAction:2);
	Out.ar(0,sig);
}).add;
)" ],
[ 1220.898775349, 'me', "(
Pdef(\\r1,
	Pbind(
		\\instrument, \\r1,
		\\dur, Pseq([Pn(0.15,10),1, Rest(1)],inf),
		\\room, Pseq([Pn(0,10),1.5, Rest(1)],inf),
		\\amp, Pseq([Pn(2,10),0.7, Rest(1)],inf),
		\\legato, Pseq([Pn(0.9,10),1, Rest(1)],inf),
		\\tail, Pseq([Pn(1,10),1, Rest(1)],inf),
		\\freq, Pseq([Pn(85,6),Pn(65,4),84,Rest(1)],inf),
)).play;
)" ],
[ 1353.060683724, 'me', "(
Ndef(\\gen).fadeTime = 4.0;
Ndef(\\gen,{|f=#[16]|
	Splay.ar(
	(PinkNoise.ar(0.3!8) * Decay.ar(Impulse.ar(4/[1,2,4,8]),{ExpRand()}!10)) +
		LFPulse.ar(4320/[1,2,4,8,16,64]/ (f * pi)+SinOsc.ar({ExpRand()/100}!10).range(4)).softclip
)});
)" ],
[ 1355.73431906, 'me', "Ndef(\\gen).lag(\\f,10);" ],
[ 1356.934241719, 'me', "Ndef(\\gen).set(\\f,16)" ],
[ 1358.003194448, 'me', "Ndef(\\gen).set(\\f,8)" ],
[ 1359.278880132, 'me', "Ndef(\\gen).set(\\f,4)" ],
[ 1360.794407786, 'me', "Ndef(\\gen).set(\\f,[8,4,1.5])" ],
[ 1361.864806207, 'me', "Ndef(\\gen).set(\\f,[16,8,4,1.5,1.25])" ],
[ 1710.264113979, 'me', "(
(
Tdef(\\at,{
	loop{


		Ndef(\\a).fadeTime = 1.0;
		Ndef(\\a,{
			var fa;
			fa = [1,2,4,8].at(0.rrand(3)) * pi;

			Splay.ar(
				Vibrato.ar(
					SinOsc.ar([432,432.1] / (fa) + SinOsc.kr({ExpRand()*2}!4).range(-2,2)  ,mul:0.233) * LFSaw.ar(1/2/[1,2,4,8],{ExpRand()*pi}!4).squared
					,[5,6,7,8],0.2)

		)}).play;

		Ndef(\\a)[1] = \\filter -> {|in| GVerb.ar(in,{ExpRand()*100}.round(1)+3,mul:0.8,add:in)};

		4.wait;
	}
}).play(quant:2);
);

(
Tdef(\\bt,{
	loop{

		Ndef(\\b).fadeTime = 3.0;
		Ndef(\\b,{

			var fb;
			fb = [1.5,1.25,1.125,3].at(0.rrand(3)) * pi;

			Splay.ar(
				Vibrato.ar(
					SinOsc.ar([432,432.1] / (fb) + SinOsc.kr({ExpRand()*2}!4).range(-2,2) ,mul:0.233) * LFSaw.ar(1/2/[1,2,4,8],{ExpRand()*pi}!4).squared
					,[4,5,6,7],0.1)

		)}).play;

		Ndef(\\b)[1] = \\filter -> {|in| GVerb.ar(in,{ExpRand()*100}.round(1)+3,mul:0.8,add:in)};

		8.wait;
	}
}).play(quant:2);
);
)" ],
[ 1716.145260801, 'me', "(
Tdef(\\hisst,{

	loop{
		var tempo;
		tempo = ({ExpRand()*16}.round(2))+1;

		Ndef(\\hissa).fadeTime = 0.5;
		Ndef(\\hissa,{Splay.ar(

			HPF.ar(
				WhiteNoise.ar(1!4) * Decay.ar(Impulse.ar(tempo/[1,2,3,5,8]),1/tempo)
				,LFNoise0.ar(tempo!4).range(44,10000),0.5)
		)}).play;
		Ndef(\\hissa)[1] = \\filter -> {|in| GVerb.ar(in,{ExpRand()*100}.round(1)+3,mul:0.8,add:in)};

		0.5.wait;
	}

}).play;

)" ],
[ 1742.915240956, 'me', "(
Ndef(\\bass)[1] = \\set -> Pbind(
	\\dur, Pseq(  [1,1,1,1,2],inf),
	\\amp, Pxrand([1,1/2,1,1/4*3]*0.9,inf),
	\\f, Pseq(    [4,2,1,4,1,2,8,1.5,3,6],inf),
	\\v, Pseq(    [1,1,4,8,16,32,1,1,1,2]*32,inf),
	\\d, Pseq(    [1,1,1,2],inf),
	\\dd, Pseq(   [1,1,1,1/2,1,2,1],inf),
	\\room, Pseq( [1,1,1,2,4,1,1],inf),
	\\fd, Pxrand([-1,1,0,0.5,-0.5],inf)
);
)" ],
[ 1774.069740487, 'me', "(
Ndef(\\rythm).fadeTime = 4;
Ndef(\\rythm).quant = 2;

Ndef(\\rythm).mold(16);
Ndef(\\rythm,{
	LFSaw.ar(1/4/(1..4),0.01*(1.9**(1..16))).abs.softclip
});
)" ],
[ 1776.893124772, 'me', "(
Tdef(\\tt1,{

	var pos1 = {( SinOsc.ar(432e-3/fib(23) ).range(1,2).round(1/2) ** (1..23))};
	loop{
		(
			Ndef(\\magick1).quant = 2.0;
			Ndef(\\magick1).fadeTime = 8.0;
			Ndef(\\magick1,{
				Splay.ar(
					CompanderD.ar(
						AllpassN.ar(
							LFTri.ar(1/[4,5,6,7],mul:0.5) + LFTri.ar(0.432 * {[1,1.5,2,4,1/4,1/8].choose}!4 * pos1,mul:2/fib(12)) +
							WhiteNoise.ar(0.015!32) * Ndef(\\rythm).ar
							,1,432e-5*(1.001**(1..32)),1/(1.0012**(1..16)),mul:2/fib(12))
						,0.5,1,0.5).softclip
					,0.33,1)}).play;
		);
		8.wait;
	}

}).play;
)" ],
[ 1791.86901907, 'me', "(
Ndef(\\rythm).fadeTime = 4;
Ndef(\\rythm).quant = 2;

Ndef(\\rythm).mold(16);
Ndef(\\rythm,{
	LFSaw.ar(1/4/(1..4),0.01*(1.9**(1..16))).squared * Decay.ar(Impulse.ar(4/[1,2,4,8]),(8/fib(16))) + LPF.ar(WhiteNoise.ar(0.025!16),440)
});
)" ],
[ 1793.112380399, 'me', "(
Tdef(\\tt,{

	var pos1 = {( SinOsc.ar(432e-3/fib(23) ).range(1,2).round(1/2) ** (1..23))};
	loop{
		(
			Ndef(\\magick).quant = 2.0;
			Ndef(\\magick).fadeTime = 8.0;
			Ndef(\\magick,{
				Splay.ar(
					CompanderD.ar(
						AllpassN.ar(
							LFTri.ar(1/4/[4,5,6,7],mul:0.5) + SinOsc.ar(0.432 / [1,2,0.5].choose * {[1,8,1.5,2,4,1/4,1/8].choose}!4 * ~pos1,mul:2/fib(12)) +
							WhiteNoise.ar(0.015!32) * Ndef(\\rythm).ar
							,1,1/(1.01**(1..16)),32/(1.0012**(1..16)),mul:2/fib(12))
						,0.5,1,0.5).softclip
					,0.33,1)}).play;
		);
		8.wait;
	}

}).play;
)" ],
[ 1797.617882999, 'me', "(
Ndef(\\rythm).fadeTime = 4;
Ndef(\\rythm).quant = 2;

Ndef(\\rythm).mold(16);
Ndef(\\rythm,{
	LFSaw.ar(1/4/(1..4),0.01*(1.9**(1..16))).squared * Pulse.ar(4/[1,2,4,8])
});
)" ],
[ 1798.839253354, 'me', "(
var pos1;
pos1 = {( SinOsc.ar(432e-3/fib(23) ).range(1,2).round(1/2) ** (1..23))};

Tdef(\\tt,{

	loop{
		(
			Ndef(\\magick).quant = 2.0;
			Ndef(\\magick).fadeTime = 8.0;
			Ndef(\\magick,{
				Splay.ar(
					CompanderD.ar(
						AllpassN.ar(
							LFTri.ar(4/[4,5,6,7],mul:0.5) + LFTri.ar(0.432 / 2 * {[1,8,1.5,2,4,1/4,1/8].choose}!4 * pos1,mul:2/fib(12)) +
							WhiteNoise.ar(0.015!32) * Ndef(\\rythm).ar
							,1,1/(1.2**(1..32)),32/(1.0012**(1..16)),mul:2/fib(12))
						,0.5,1,0.5).softclip
					,0.33,1)}).play;
		);
		8.wait;
	}

}).play;
)" ],
[ 1837.306061589, 'me', "(
Ndef(\\rythm).fadeTime = 4;
Ndef(\\rythm).quant = 2;

Ndef(\\rythm).mold(16);
Ndef(\\rythm,{
	Pulse.ar(4/(1..4),0.01*(1.9**(1..16))).softclip
});
)" ],
[ 1845.958788511, 'me', "(
Tdef(\\aa,{

	Ndef(\\a).fadeTime = 4.0;
	Ndef(\\a).quant = 2.0;

	loop{
		Ndef(\\a,{
			var base1,base2,r,s,len,mod;
			base1 = 432/8pi * (1.0 + {(1/1.rrand(8).round(2))}!3);
			base2 = 432/4pi * (1.0 + {(1/1.rrand(8).round(2))}!3);

			r = [1,9/8,6/5,4/3,3/2,8/5,7/4];
			s = []++r[0]++r[1]++r[6];

			len = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8])),[1,2,1,0.5,1.5,2,4,0.5,1.5].scramble/2).lag(1/2);

			mod = 2;


			Splay.ar(
				Limiter.ar(
					SinOsc.ar(base1 + {base1.rrand(base1*10).round(base1*mod)}!3 * s.at({0.rrand(2)}!3) ,mul:0.133).tanh +
					SinOsc.ar(base2 + {base2.rrand(base2*10).round(base2*mod)}!3 * s.at({0.rrand(2)}!3) ,mul:0.133) * LFSaw.ar(1/4/[1,2,4,8].scramble).squared
					,1)
				,0.5,1,SinOsc.ar([1,2,4,8]))}).play;

		16.wait;
	}
}).play;

)" ],
[ 1856.056549814, 'me', "(
Ndef(\\rythm).fadeTime = 4;
Ndef(\\rythm).quant = 2;

Ndef(\\rythm).mold(16);
Ndef(\\rythm,{
	Pulse.ar(4/(1..4),0.01*(1.9**(1..16))).softclip
});
)" ],
[ 1869.31809314, 'me', "(
Ndef(\\rythm).fadeTime = 4;
Ndef(\\rythm).quant = 2;

Ndef(\\rythm).mold(16);
Ndef(\\rythm,{
	LFSaw.ar(1/4/(1..4),0.01*(1.9**(1..16))).squared
});
)" ],
[ 1890.698489429, 'me', "(
Tdef(\\tt,{
	loop{
		var mod;
		mod = [1,2,1.5,1.25,1,1.125].at(0.rrand(5));

		Ndef(\\brass).quant = 2.0;
		Ndef(\\brass).fadeTime = 0.25;
		Ndef(\\brass,{
			var f;
			f = [77,78] * [1,2,1.5,1.25,1,1.125].at(0.rrand(5));


			Splay.ar(
				Pluck.ar(SinOsc.ar([f,f*mod]+({ExpRand()*3}!12)),Impulse.ar(4/[1,2]),0.02,0.0002*f,4,mul:0.15)
		)}).play;


		Ndef(\\hat).quant = 2.0;
		Ndef(\\hat).fadeTime = 2.0;

		Ndef(\\hat,{
			var r;
			r = 2.rrand(8).round(2)/[1,2,4,8];
			Splay.ar(
				CombN.ar(
					Vibrato.ar(BPF.ar(WhiteNoise.ar(1!2),LFNoise1.ar(1!4).range(2000,12000).round(1000).lag(0.1)),[5,6,7,8],0.1) * Decay.ar(Impulse.ar(r),1/r)
					,1,0.25+LFNoise1.ar(1!4).range(0.25,1).round(0.125),1)
				,1,0.5)}).play;


		l = 4;
		Ndef(\\a).quant = 0.5;
		Ndef(\\a).fadeTime = l;
		Ndef(\\a,{
			var a,b,mod;

			a = [1,2,4,8,1.5,1.25,0.5].at(0.rrand(6));
			b = [1,2,4,8,1.5,1.25,0.5].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([a,b]*mod*pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([a,b]*mod*pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;



		4.wait;
	}
}).play;

)" ],
[ 1941.039209504, 'me', "(
Ndef(\\nois).quant = 2.0;
Ndef(\\nois).fadeTime = 8;
Ndef(\\nois,{Splay.ar(
	CompanderD.ar(
	GVerb.ar(
		CombC.ar(
			BPF.ar(WhiteNoise.ar({ExpRand(0.01,0.95)}!8),{ExpRand(44,18000)}!8)
			,1,0.025/(1.01**(1..16)),2/fib(8))
		,100)
	,0.5,0.5,1)
)})
)" ],
[ 1944.285911912, 'me', "(
Ndef(\\beat).quant = 2.0;
Ndef(\\beat).fadeTime = 4.0;
Ndef(\\beat,{Splay.ar(
	Decay.ar(Impulse.ar(8/fib(12)),{ExpRand(0.1,2)}!8);
)})
)" ],
[ 1950.716811851, 'me', "(
Ndef(\\tone).fadeTime = 8;
Ndef(\\tone,{
	var tune1,tune2;
	tune1 = {1.5pi + LFSaw.ar(1/4/[1,2,4,8]).range(-pi,pi).round(pi/4)};
	tune2 = {1.5pi + LFSaw.ar(1/2/[1,2,4,8]).range(-pi,pi).round(pi/8)};

	Splay.ar(
		HPF.ar(
			Vibrato.ar(
				SinOsc.ar(([60,72,62]+48).midicps / tune1 / (2**(1..16)),mul:1/fib(12)) + LFSaw.ar(22000/tune2/(2**(1..16)),mul:0.02)
				,(1..8)/8,0.2)
			,10)
)});
)" ],
[ 1952.420079615, 'me', "(
Ndef(\\rythm).quant = 2.0;
Ndef(\\ryhtm).fadeTime = 8;
Ndef(\\rythm,{

	Splay.ar(
		Pulse.ar(2/[1,2,3,4,5])
)});
)" ],
[ 2010.611074283, 'me', "(
Tdef(\\automata,{
	loop{
		(
			Ndef(\\2).quant = 2.0;
			Ndef(\\2).fadeTime = 16.0;

			Ndef(\\2,{
				var mod,mod2,n,f,signal;

				mod2 = Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,4,8]),max:6),[1,2,1,4,1,4,8].scramble * 4).lag(0.4);
				mod = Select.kr(Stepper.kr(Impulse.kr(1/8/[1,2,4,8]),max:6),[1,2,1,1.5,0.5,4,8].scramble);
				n = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8]),max:4),[1,12,1,2,4].scramble).lag(0.008);
				f = (n).midicps * (32pi * [1,1.5] / 256 * 16 / mod2 * mod) ;


				signal = CombN.ar(
					LFSaw.ar([22000,22000.1]/([1,2,4,8]*(f*2)) + {ExpRand()}!8,{ExpRand()*8pi},mul:0.5) +
					SinOsc.ar([2200,2200.1]/([1,2,4,8]*f),mul:0.5)
					,0.5*16pi/(f),16pi/(f),8).clip(-1,1) ;

				signal = RLPF.ar(CompanderD.ar(signal,0.5,1,0.5,[0.001,0.01,0.1],[0.001,0.01,0.1]),[55,110,220,440,880,8800]);

				Splay.ar(
					FreeVerb.ar(
						RLPF.ar(
							signal * Decay.ar(Impulse.ar(8/[1,2,3,5,8]),{ExpRand()*1.5}!8)
							,55*(1..12),SinOsc.ar((1..12)/1000.0,{ExpRand()*2pi}!8).range(0.001,0.5))
						,0.133,20).softclip
					,0.5,0.5)

			}).play;

		);
		16.wait;
	}
}).play;
)" ],
[ 2135.120015894, 'me', "(

Tdef(\\t1,{

	loop{


		Ndef(\\1).fadeTime = 8.0;
		Ndef(\\1,{
			var basenote,s,base,tone;

			basenote = 60-12;

			s = Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,1.5,2,1.25,1,4,2,1,4].scramble / 8);

			base = Select.kr(Stepper.kr(Impulse.kr(8)),[1,2,4,1/2,1/4,1,1.5,2,1].scramble * basenote.midicps / s);


			tone =
			SinOsc.ar(base + 0.1 * 1pi / {(1..12).normalize.windex.round(2).squared}!8,mul:1/8).tanh +
			SinOsc.ar(base + 0.2 * 2pi / {(1..16).normalize.windex.round(2).squared}!8,mul:1/12).tanh +
			LFCub.ar(base + 0.3 * 4pi / {(1..24).normalize.windex.round(2).squared}!8,mul:1/24).tanh * 8.0;

			Splay.ar(
				FreeVerb.ar(
					AllpassC.ar(
						Vibrato.ar(
							CompanderD.ar(LPF.ar(tone * TExpRand.ar(1e-7,1,Impulse.ar(1/[1,2,4,8])).lag(1) ,440),0.5,1,0.5,0.2,0.2)  +
							CompanderD.ar(BPF.ar(tone * TExpRand.ar(1e-7,1,Impulse.ar(1/2/[1,2,4,8])).lag(1) ,880),0.5,1,0.5,0.15,0.15) +
							CompanderD.ar(HPF.ar(tone * TExpRand.ar(1e-7,1,Impulse.ar(1/4/[1,2,4,8])).lag(1) ,1660),0.5,1,0.5,0.01,0.01)
							,[4,5,6,7],0.2)
						,1,{ExpRand(0.001,0.2)}!32,2).softclip
					,0.33,2)
				,0.55,1)}).play;

		16.wait;
	}
}).play;
)" ],
[ 2246.98155864, 'me', "(
Ndef(\\pila).fadeTime = 2.0;
Ndef(\\pila).quant = 2.0;

Ndef(\\pila,{
	(
		CombN.ar(
			LFSaw.ar([0.5,2]*1/2) * LFSaw.ar([0.5,2]*22) * LFPulse.ar(1/[1,2]).lag(0.1)
			,0.1,LFNoise1.ar(88!2).range(1,16)/48000,32)
	).softclip * SinOsc.ar([44,44.1]*[2,2.01],mul:0.75)
});
)" ],
[ 2259.717532435, 'me', "(
Tdef(\\worker,{
	loop{
		var l;
		l = 2.rrand(4);
		Ndef(\\a).fadeTime = l;
		Ndef(\\a,{
			var a,b;
			a = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));
			b = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([a,b]*0.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([a,b]*2pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;

		////////////////////

		l = 1.rrand(4);

		Ndef(\\b).fadeTime = l;
		Ndef(\\b,{
			var c,d;
			c = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));
			d = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 4321 / 1 / ([c,d]*1.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 4322 / 2 / ([c,d]*1.0pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;


		l = 1.rrand(4);

		Ndef(\\c).fadeTime = l;
		Ndef(\\c,{
			var e,f;
			e = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));
			f = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 43.21 * 1.5 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 43.22 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;
	}
}).play;
)" ],
[ 2279.308302895, 'me', "(
		var l;
Tdef(\\worker,{
	loop{
		l = 2.rrand(4);
		Ndef(\\a).fadeTime = l;
		Ndef(\\a,{
			var a,b;
			a = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));
			b = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([a,b]*0.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([a,b]*2pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;

		////////////////////

		l = 1.rrand(4);

		Ndef(\\b).fadeTime = l;
		Ndef(\\b,{
			var c,d;
			c = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));
			d = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 4321 / 1 / ([c,d]*1.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 4322 / 2 / ([c,d]*1.0pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;


		l = 1.rrand(4);

		Ndef(\\c).fadeTime = l;
		Ndef(\\c,{
			var e,f;
			e = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));
			f = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 43.21 * 1.5 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 43.22 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;
	}
}).play;
)" ],
[ 2314.177116316, 'me', "(
		var l;
Tdef(\\worker,{
	loop{
		l = 2.rrand(4);
		Ndef(\\a).fadeTime = l;
		Ndef(\\a,{
			var a,b;
			a = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));
			b = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([a,b]*0.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([a,b]*2pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;

		////////////////////

		l = 1.rrand(4);

		Ndef(\\b).fadeTime = l;
		Ndef(\\b,{
			var c,d;
			c = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));
			d = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 4321 / 1 / ([c,d]*1.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 4322 / 2 / ([c,d]*1.0pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;


		l = 1.rrand(4);

		Ndef(\\c).fadeTime = l;
		Ndef(\\c,{
			var e,f;
			e = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));
			f = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 43.21 * 1.5 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 43.22 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;
	}
}).play;
)" ],
[ 2321.815888534, 'me', "(
		var l;
Tdef(\\worker,{
	loop{
		l = 2.rrand(4);
		Ndef(\\a).fadeTime = l;
		Ndef(\\a,{
			var a,b;
			a = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));
			b = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([a,b]*0.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([a,b]*2pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;

		////////////////////

		l = 1.rrand(4);

		Ndef(\\b).fadeTime = l;
		Ndef(\\b,{
			var c,d;
			c = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));
			d = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 4321 / 1 / ([c,d]*1.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 4322 / 2 / ([c,d]*1.0pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;


		l = 1.rrand(4);

		Ndef(\\c).fadeTime = l;
		Ndef(\\c,{
			var e,f;
			e = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));
			f = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 43.21 * 1.5 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 43.22 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;
	}
}).play;
)" ],
[ 2326.529339112, 'me', "(
		var l;
Tdef(\\worker,{
	loop{
		l = 2.rrand(4);
		Ndef(\\a).fadeTime = l;
		Ndef(\\a,{
			var a,b;
			a = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));
			b = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([a,b]*0.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([a,b]*2pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;

		////////////////////

		l = 1.rrand(4);

		Ndef(\\b).fadeTime = l;
		Ndef(\\b,{
			var c,d;
			c = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));
			d = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 4321 / 1 / ([c,d]*1.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 4322 / 2 / ([c,d]*1.0pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;


		l = 1.rrand(4);

		Ndef(\\c).fadeTime = l;
		Ndef(\\c,{
			var e,f;
			e = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));
			f = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 43.21 * 1.5 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 43.22 * ([e,f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/l/l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		l.wait;
	}
}).play;
)" ],
