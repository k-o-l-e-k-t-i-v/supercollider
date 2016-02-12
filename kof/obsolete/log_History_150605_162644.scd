// History, as it was on Fri Jun  5 16:26:44 2015.

[
[ 0, 'me', "(
~a.play;
~a.fadeTime=1;

t=Task({
	loop{
		~a = {
			var sig = Mix(SinOsc.ar({(44..2200).choose.round(43.2*[1,1.5])}!2,mul:0.02))!2;
			sig.flat;
		};
		1.wait;
	};
});

t.play(quant:2);
)" ],
[ 19.615463033, 'me', "(
~a.play;
~a.fadeTime=1;

t=Task({
	loop{
		~a = {
			var sig = Mix(SinOsc.ar({(44..22000).choose.round(43.2*[1,1.5])}!2,mul:0.02))!2;
			sig.flat;
		};
		1.wait;
	};
});

t.play(quant:2);
)" ],
[ 30.427468162, 'me', "(
~a.play;
~a.fadeTime=1;

t=Task({
	loop{
		~a = {
			var sig = Mix(SinOsc.ar({(44..22000).choose.round(432*[1,1.5])}!2,mul:0.02))!2;
			sig.flat;
		};
		1.wait;
	};
});

t.play(quant:2);
)" ],
[ 42.774218634, 'me', "(
~a.play;
~a.fadeTime=1;

t=Task({
	loop{
		~a = {
			var sig = Mix(SinOsc.ar({(44..22000).choose.round(432*[1,1.5])}!2,mul:0.02))!2;
			sig.flat;
		};
		1.wait;
	};
});

t.play(quant:2);
)" ],
[ 48.596437369, 'me', "(
~a.play;
~a.fadeTime=1;

t=Task({
	loop{
		~a = {
			var sig = Mix(SinOsc.ar({(44..22000).choose.round(4320)}!2,mul:0.02))!2;
			sig.flat;
		};
		1.wait;
	};
});

t.play(quant:2);
)" ],
[ 53.023615657, 'me', "(
~a.play;
~a.fadeTime=1;

t=Task({
	loop{
		~a = {
			var sig = Mix(SinOsc.ar({(44..22000).choose.round(432.0)}!2,mul:0.02))!2;
			sig.flat;
		};
		1.wait;
	};
});

t.play(quant:2);
)" ],
[ 101.410354095, 'me', "(
{
	var  h, n, m, k, trig;
 		trig = Dust.kr( 7 ** LFNoise1.kr(0.3) );
		h = ToggleFF.kr(CoinGate.kr(0.4,trig)) *
			RLPF.ar(LFPulse.ar(50, 0, 0.5, 1, LFNoise1.kr(2, 0.5, -0.5)), 6000, 0.15);
		n =  Trig.ar(trig, TRand.kr(0, 0.01, CoinGate.kr(0.4,trig))) * WhiteNoise.ar;
		m =  Trig.ar(trig, TRand.kr(0, 0.01, CoinGate.kr(0.4,trig))) * BrownNoise.ar;
		k = Trig.ar(trig, LFNoise1.kr([ 4, 4.2 ], 0.1, 0.11)) *
			LFClipNoise.ar(LFNoise0.kr(7, 30, 40));
		LeakDC.ar(h + n + k + m * 10).distort;
}.play;
)" ],
[ 211.791074154, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.4,trig),0.5);
	sig = sig * WhiteNoise.ar(0.1!2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 223.532506702, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.6,trig),0.5);
	sig = sig * WhiteNoise.ar(0.1!2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 241.843746987, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.6,trig),0.5);
	sig = sig * LFSaw.ar(75,mul:0.1);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 260.79276368, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75/(1..8),trig),0.5);
	sig = sig * LFSaw.ar(75,mul:0.1);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 270.480487144, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75/(1..8),trig),0.5);
	sig = sig * LFSaw.ar(75*(1..8),mul:0.1);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 395.188711246, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75/(1..8),trig),0.5);
	sig = sig * LFSaw.ar(75*(1/(1..8)+1),mul:0.1);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 403.043098378, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75/(1..8),trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.1);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 406.49736197, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75/(1..8),trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 411.937058872, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8/fib(8));
	sig = Decay.ar(CoinGate.ar(0.75/(1..8),trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 434.225733204, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8/fib(8));
	sig = Decay.ar(CoinGate.ar(0.5,trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 444.867912703, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(1);
	sig = Decay.ar(CoinGate.ar(0.95,trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 449.586727069, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.95,trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 458.622482397, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75,trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 467.666313118, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.95!8,trig),0.5);
	sig = sig * LFSaw.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 475.310473052, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.95!8,trig),0.5);
	sig = sig * SinOsc.ar(43.2*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 478.243053953, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.95!8,trig),0.5);
	sig = sig * SinOsc.ar(77*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 484.786673054, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.5!8,trig),0.5);
	sig = sig * SinOsc.ar(77*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 488.12297566, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75!8,trig),0.5);
	sig = sig * SinOsc.ar(77*(1/(1..8)+1),mul:0.2);
	Splay.ar(sig,0.1,0.5);
};
~s.play;
)" ],
[ 505.348061294, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75!8,trig),0.5);
	sig = sig * SinOsc.ar(77*(1/(1..8)+1),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 510.495075628, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.75!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(1/(1..8)+1),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 518.488470277, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.15!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(1/(1..8)+1),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 520.785228497, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.35!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(1/(1..8)+1),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 524.550430507, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(1/(1..8)+1),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 539.691386329, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(1pi/(1..8)+1),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 543.156272087, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)+1),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 546.963570405, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 551.233683048, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(4pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 555.110866101, 'me', "(
~s={var sig,trig;
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 583.980949019, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 590.239868303, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(16);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 594.854865131, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.5);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 601.456209914, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),1.5);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 605.327948749, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.25);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 607.819394999, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(sig.flat,0.1,0.5);
};
~s.play;
)" ],
[ 655.710861845, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat).distort,0.1,0.5);
};
~s.play;
)" ],
[ 667.401540364, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.1).distort,0.1,0.5);
};
~s.play;
)" ],
[ 671.567146722, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 673.720027851, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.99).distort,0.1,0.5);
};
~s.play;
)" ],
[ 674.770449141, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.9).distort,0.1,0.5);
};
~s.play;
)" ],
[ 677.233007913, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 685.779492112, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	sig = Decay.ar(CoinGate.ar(0.65!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 694.621161923, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	sig = Decay.ar(CoinGate.ar(0.5!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 695.882821319, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	sig = Decay.ar(CoinGate.ar(0.15!8,trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 713.347601116, 'me', "(
~s={var sig,trig,mod;
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	sig = Decay.ar(CoinGate.ar(LFSaw.ar(1/4/fib(8)).range(0.1,0.9),trig),0.85);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 752.404955782, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),prob*4);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 754.722172857, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),prob*2);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 764.112255426, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(2pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 777.013773054, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 793.378998719, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/(1..8)),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 809.363117806, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/[1,2,1.5,1.25]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 815.425767771, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/[1,2,1.5,1.25,2,4,8]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 826.817254505, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,2,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 835.051287792, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,2]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 836.793766816, 'me', "(
~s={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~s.play;
)" ],
[ 854.108218865, 'me', "(
~probabilistic={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 861.703909388, 'me', "(
~probabilistic={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(90*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 869.691608816, 'me', "(
~probabilistic={var sig,trig,mod,prob;
	
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(36.midicps*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 908.683993838, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr([1,2,4,8]*4,0,Dseq([73,69,36,60,65].midicps,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 910.979281223, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr([1,2,4,8]*4,0,Dseq([73,69,36,60,65].midicps/2,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 926.94538123, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([73,69].midicps/2,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 930.980653687, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([73,69].midicps/4,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 932.588676557, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([73,69].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 944.050343352, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,69].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 948.049352129, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 952.370771151, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,65].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 958.915388111, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,65,60,36].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 964.071557079, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,65,60,48].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 985.714440493, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,65,60].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1006.541508085, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,65,69].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1011.152622919, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,60,69].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1019.438319421, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,60,61].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1027.301733617, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq([72,67,60,65].midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1065.880983962, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4)).round(7)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1068.724499457, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1072.085452008, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4!8)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1078.908791343, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1082.842356286, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1084.709036114, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4!3)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1088.026581389, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1090.964916297, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,24,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1103.207143706, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4/fib(8));
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1114.035688991, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2);
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1144.905919692, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.4/(1..8));
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1151.050444599, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10)/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1165.355770396, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/100))/3+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1169.779515389, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1177.748552061, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * Blip.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),4,mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1194.011830484, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * Blip.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),LFSaw.ar(1/4/fib(8)).exprange(2.001,100),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1197.519828062, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * Blip.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),LFSaw.ar(1/4/fib(8)).exprange(2.001,10),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1206.17862054, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * Blip.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),LFSaw.ar(1/4/fib(8)).exprange(2.001,8),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1210.009579941, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * Blip.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),3,mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1213.230124555, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * Blip.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),4,mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1230.555408931, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * VarSaw.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..8)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1238.324790194, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * VarSaw.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/10))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1240.155284926, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * VarSaw.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/100))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1243.562822525, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * VarSaw.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/20))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1244.562890173, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * VarSaw.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1249.083924754, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(2);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * VarSaw.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1256.652356053, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.01,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * VarSaw.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1272.62552375, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.01,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1278.38682507, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1286.05704942, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(4,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1289.880386358, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([1,2,4,8]*4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1295.064449953, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1297.753780474, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr([4,1],0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1301.906334099, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1306.294086706, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,8,2,4,8,1,2,4,8],inf)).lag(1);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1320.077196156, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,8],inf)).lag(1);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1323.289898828, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1330.834225727, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(2,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1340.292349196, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1/4,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1344.434162587, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-24,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1356.735024738, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-12,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1366.825253302, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-12,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1376.772771342, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-12,0,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1392.103526835, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-12,24,Impulse.ar(4!2)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1396.648055351, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]+TRand.ar(-12,24,Impulse.ar(4)).round(12)).midicps/8,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1416.968458215, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf)).lag(1/4);
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1427.85380707, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1429.799906202, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1433.517944897, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(LeakDC.ar(sig.flat,0.999).distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1439.804800163, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/40))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1444.430661948, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10*((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1448.188702931, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,100*((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1450.233837634, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,100+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1451.950232839, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod*pi/[1,2,1.5,1.25,2,4,8,1,1,1.5]),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1509.523473295, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps/4,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1514.101953215, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1525.486264299, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1532.447703988, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2pi,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1538.059963266, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*pi,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1545.401331601, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1549.547584338, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*1.5,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1553.202706904, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1558.735739294, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.1,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1573.769487543, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.01,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1584.99727278, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4);
	prob = LFSaw.ar(1/4/fib(8)).range(0.01,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1597.016212613, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(16);
	prob = LFSaw.ar(1/4/fib(8)).range(0.01,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1599.66809589, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).range(0.01,0.3);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1618.642794218, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.01,0.9);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1630.499850254, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.01,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1634.630041863, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.1,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1644.603378803, 'me', "(
~probabilistic={var sig,trig,mod,prob,note;
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1672.036373318, 'me', "(
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*2,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1677.796293772, 'me', "(
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1727.386662982, 'me', "(
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1758.421647691, 'me', "(
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1897.955300561, 'me', "(
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.2!2),8000) * Decay.ar(CoinGate.ar(0.2,Impulse.ar(8)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10));
	Splay.ar(sig,0.25,0.25);
};
)" ],
[ 1907.868663013, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.2!2),8000) * Decay.ar(CoinGate.ar(0.2,Impulse.ar(8)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10));
	Splay.ar(sig,0.25,0.25);
};
)" ],
[ 1909.417554469, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(8);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 1921.738430294, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(8)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10));
	Splay.ar(sig,0.25,0.25);
};
)" ],
[ 1942.002154012, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(8)),0.75);
	sig = GVerb.ar(sig,10+((1..8)/10));
	Splay.ar(sig,0.25,0.25);
};
)" ],
[ 1945.140969964, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(8)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10));
	Splay.ar(sig,0.25,0.25);
};
)" ],
[ 1952.706265269, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(8)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 1981.698696739, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(1/4,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 1988.487104479, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(1,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 2000.5475341, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2009.172254925, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2015.653725518, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2025.151105322, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2040.91004833, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.6);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2046.796160223, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob));
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2097.234061653, 'me', "(
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
[ 2165.359024165, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2170.241346718, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2179.78506318, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*1/4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/4+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2194.572110181, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*1/4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2204.486512928, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*1/4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2210.895271036, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*1/4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2216.210063363, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*1/4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2221.943235422, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2273.910511996, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * LFSaw.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2281.964643455, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(1,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.96);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2291.547517199, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(2,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.26);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2302.313835028, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.5);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2308.907352907, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.02,0.05);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2310.724298218, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.05);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2314.131700905, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.15);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2321.967862621, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.25);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*4);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2331.765290688, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.25);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2376.445642361, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.25);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8)) + LFSaw.ar(note*pi/1.5,mul:1-prob);
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2390.272821272, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.25);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = sig * SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8)) + LFSaw.ar(note*pi/1.5,mul:0.1/(prob+1));
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2409.734568536, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.25);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8)) + LFSaw.ar(note*pi/1.5,mul:0.1/(sig+1)) * sig;
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2415.863559273, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.25);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8)) + LFSaw.ar(note*pi/1.5,mul:0.01/(sig+1)) * sig;
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2424.658523701, 'me', "(
~probabilistic.quant=2;
~probabilistic={var sig,trig,mod,prob,note,notemod;
	notemod = Duty.kr(8,0,Dseq([2,4,1.5,1.25],inf));
	note = Duty.kr(1,0,Dseq(([72,67,60,65]).midicps*notemod,inf));
	mod = Duty.kr(4,0,Dseq([2,4,1,2,4,1.5,1,2,4,2],inf));
	trig = Impulse.ar(4,(0..3)/4);
	prob = LFSaw.ar(1/4/fib(8)).exprange(0.002,0.25);
	sig = Decay.ar(CoinGate.ar(prob,trig),(1-prob)*2);
	sig = SinOsc.ar(note*(mod/(pi*[1,2,1.5,1.25,2,4,8,1,1,1.5])),mul:0.2/(1..8)) + LFSaw.ar(note*pi/1.5,mul:0.01/(sig)) * sig;
	sig = GVerb.ar(sig,10+((1..4)/10))/2+sig;
	Splay.ar(sig.flat.distort,0.1,0.5);
};
~probabilistic.play;
)" ],
[ 2432.925761067, 'me', "(
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
[ 2437.290192912, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.3,Impulse.ar(1,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 2677.56194492, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.75,Impulse.ar(1,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 2688.010607736, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),8000) * Decay.ar(CoinGate.ar(0.75!4,Impulse.ar(1,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 2707.873640402, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),4000*[1,2,4,8]) * Decay.ar(CoinGate.ar(0.75!4,Impulse.ar(1,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 2712.994144766, 'me', "(
~hiss.play;
~hiss.quant=2;
~hiss={
	var sig = HPF.ar(WhiteNoise.ar(0.1!2),1000*[1,2,4,8]) * Decay.ar(CoinGate.ar(0.75!4,Impulse.ar(1,(0..3)/4)),0.25);
	sig = GVerb.ar(sig,10+((1..8)/10))/4+sig;
	Splay.ar(sig.flat,0.25,0.25);
};
)" ],
[ 2718.530961732, 'me', "(
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
];