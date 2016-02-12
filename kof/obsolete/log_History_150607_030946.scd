// History, as it was on Sun Jun  7 03:09:46 2015.

[
[ 0, 'me', "(
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
[ 52.084915275, 'me', "(
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
				,0.2,0.2)}).play;


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
		,0.2,0.2)}).play;


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
		,0.2,0.2)}).play;


		l.wait;
	}
}).play;
)" ],
[ 69.125048056, 'me', "(
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
				,0.2,0.2)}).play;


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
		,0.2,0.4)}).play;


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
		,0.2,0.4)}).play;


		l.wait;
	}
}).play;
)" ],
[ 88.610061834, 'me', "(
Ndef(\\y).fadeTime = 5.0;
Ndef(\\y).quant = 2.0;

Ndef(\\y,{
	var f1,f2;
	Splay.ar(
	f1 = Decay.ar(Impulse.ar(8/[1,2,3,5,8]),{ExpRand()*1}!5);
	f2 = Decay.ar(Impulse.ar(1/2/[1,2,3,5,8]),{ExpRand()/4.0}!5);
	AllpassC.ar(
	LPF.ar(
	Vibrato.ar(
				LFSaw.ar(f2.range(432/8,43200/2)+SinOsc.ar((1..5)),mul:1.5) * f1;
		,[4,5,6,7],0.2)
		,432/8+f2.range(0,4320/2))
		,(1..10)/10.0,(1..10)/1000.0,1,0.5)

)}).play;
)" ],
[ 101.713545022, 'me', "(
Ndef(\\a).fadeTime = 15.0;
Ndef(\\a,{
	var f;
	Splay.ar(
	f=  Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8,13,21,34,55])),[1,2,1.5,1.25,1,1.125,0.5,0.25,0.125] / 0.5pi);
	Vibrato.ar(

			LFSaw.ar(1/16/[1,2,3,5,8,13,21,34,55]).squared * LFSaw.ar([432,432.01,432/1.5,432/2,432/4,432/8] / f +({ExpRand()/3.0}!16)+LFNoise1.ar((1..16)).range(-5,5).lag(4),SinOsc.ar((1..16)/640).range(-pi,pi),0.133)
		,(1..16),0.2)

	)}).play;
)" ],
[ 107.984329569, 'me', "(
Ndef(\\b).fadeTime = 15.0;
Ndef(\\b,{
	var f;
	Splay.ar(
	f=  Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8,13,21,34,55])),[1,2,1.5,1.25,1,1.125,0.5,0.25,0.125]/1.5pi);
	Vibrato.ar(

			LFSaw.ar(1/16/[1,2,3,5,8,13,21,34,55]).squared * SinOsc.ar([432,432.01,432/1.5,432/2,432/4,432/8] / f +({ExpRand()/3.0}!16)+LFNoise1.ar((1..16)).range(-5,5).lag(4),SinOsc.ar((1..16)/640).range(-pi,pi),0.133)
		,(1..16),0.2)

	)}).play;
)" ],
[ 111.099039678, 'me', "(
Ndef(\\c).fadeTime = 15.0;
Ndef(\\c,{
	var f;
	Splay.ar(
	f=  Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8,13,21,34,55])),[1,2,1.5,1.25,1,1.125,0.5,0.25,0.125]/0.25pi);
	Vibrato.ar(

			LFSaw.ar(1/16/[1,2,3,5,8,13,21,34,55]).squared * SinOsc.ar([432,432.01,432/1.5,432/2,432/4,432/8] / f +({ExpRand()/3.0}!16)+LFNoise1.ar((1..16)).range(-5,5).lag(4),SinOsc.ar((1..16)/640).range(-pi,pi),0.133)
		,(1..16),0.2)

	)}).play;
)" ],
[ 185.510993026, 'me', "(
t = Tuning.harmonic;

Ndef(\\a).fadeTime = 2.0;
Ndef(\\a).quant = 2.0;

Ndef(\\a,{
	var change,n,f;
	Splay.ar(
	change = LFSaw.kr(1/2/[1,2,3,4,8,16,32]).range(1,8).round(2);

	n = t.cents.at([1,2,7,11,7,2,1]) / 3.141528;
	f = n / change + SinOsc.kr((_*0.1!4)).range(-2,2);

	FreeVerb.ar(
		XFade2.ar(
			RHPF.ar(
				SinOsc.ar(f),
				SinOsc.ar(f/(256..260)).range(f/2,f*2)
			),
			RLPF.ar(
				LFSaw.ar(f),
				SinOsc.ar(f/(512..516)).range(f/2,f*2)
			),
			SinOsc.kr([0.01,0.02,0.04,0.05])
		)
		* Decay.ar(Impulse.ar(4/[1,2,3,5,8,13,21,34]),[1,2,2,4,8,8,16]) +

		(WhiteNoise.ar(SinOsc.kr((_*0.01!4)+0.01).range(0.01,0.2)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8,13,21]),Decay.kr(Dust.kr([1,2,4,8])*4)))

		,0.333,2,0.2,0.8)

)}).play;
)" ],
[ 195.879619361, 'me', "(
var sec = 2;
var rate = 48000;
)" ],
[ 203.446033824, 'me', "(
Ndef(\\a).fadeTime = 1.0;
Ndef(\\a).quant = 1;
Ndef(\\a,{|tempo = 1,sel = 4|



	//////// signal ////////////
	var s;
	s =
	SinOsc.ar(44) +
	CombN.ar((LFPulse.ar(tempo*1/[1,4,2,3],[0,0.25,0,0.25]))) *
	Pulse.ar(tempo*4/[1,2,3,4]) +
	Vibrato.ar(LFCub.ar(4320/(pi*sel)*([1.5,16,8,1.5,8,16,32]),mul:0.75) * LFSaw.ar(1/4/[4,8,16,32,64,128]).squared,[4,5,6,7],0.2) +
	(SinOsc.ar([77,99]) + SinOsc.ar([4320,4320*2pi,4320/2pi],mul:0.2) * Decay.ar(Impulse.ar(1/4/[1,2,4]))) +
	0;

	////////// band pass /////////////


	s = BBandPass.ar(s,LFNoise0.ar(4!2).range(44,4320*2),1,mul:0.5,add:s);

	///////// add hisses /////////////

	s = s + RHPF.ar(Decay.ar(Impulse.ar(tempo*4/[1,2,4,8]),LFNoise0.ar(4!4).range(0.01,0.2)) * WhiteNoise.ar(0.5!4),LFNoise0.ar(4!4).range(432,16000));

	////////// compressor ///////////

	s = Compander.ar(s,s,0.75,1,0.25,0.01,0.01);

	Splay.ar(s).clip(-1,1)};

).play;

// Ndef(\\a)[1] = \\filter -> {|in| GVerb.ar(in,5,mul:0.25) + (in/3*2)};
)" ],
[ 208.759270773, 'me', "Ndef(\\a).lag(\\sel,0.02,\\tempo,4);" ],
[ 209.695409107, 'me', "Ndef(\\a).set(\\sel,16);" ],
[ 213.612296203, 'me', "(
    // synchro odpal
    Ndef(\\b).quant = 2.0;
    Ndef(\\b).fadeTime = 2.0;

    Ndef(\\b,{
	var pat,freqs;
        pat = [1,2,3,5,8,13,21,34,55,89];
        freqs = [34,30,20,56,82,106,126,111].midicps;
        Splay.ar(
            RLPF.ar(
                2 * Blip.ar(freqs  + LFNoise0.ar(12!4).range(-4,4).lag(0.01),2) * Decay.ar(Impulse.ar([8,4]/pat), pat/5)
                ,freqs)
            )
        }).play;

)" ],
[ 232.116565954, 'me', "(
Ndef(\\a).quant = 2.0;
Ndef(\\a).fadeTime = 2.0;
Ndef(\\a,{
	var mod,a;
	mod = Select.kr(Stepper.ar(LFSaw.ar(1/2/[2,4,8,16,32,64])),[1,2,1.5,2,3,2,1.25,4,8]);
	a = RLPF.ar(
		BBandStop.ar(
			LFSaw.ar(1/2/[2,4,8,16,32,64]).squared *
			SinOsc.ar([432/4,432/16,432/8]/(mod/2pi),LFTri.ar(1/[2,4,8,16]).range(-1,1)) +
			LFSaw.ar([7777,7777]/(mod/2pi),mul:0.05) * LFPulse.ar(4*[1,2,2,4]).squared
			,LFNoise0.ar(8!8).range(22,18000).lag(1/8),0.21) * 0.5
		,18000) +
	HPF.ar(WhiteNoise.ar(LFSaw.ar(1/4/[1,2,3,8]).squared*0.1),8000+LFNoise0.ar(4!4).range(0,8000));

	Splay.ar(
		// GVerb.ar(
		LPF.ar(
			// CombN.ar(
				Compander.ar(a,a,0.5,1,0.33,0.01,0.01)
				// ,1,0.5,16)
			,18000)
			// ,2,3,drylevel:1,mul:0.2)
).clip(-0.99,0.99)}).play;
)" ],
[ 281.838007511, 'me', "(
Ndef(\\a).quant = 2.0;
Ndef(\\a).fadeTime = 2.0;

Ndef(\\a,{
	var lfo;
	Splay.ar(
	lfo = SinOsc.kr([0.1,0.2,0.22,0.23]/4.0).range(0,220);

	FreeVerb.ar(
		XFade2.ar(
			LFSaw.ar([55,56,57,58],SinOsc.ar([57,58,59,60]).range(lfo*(-1),lfo)),		SinOsc.ar([55,56,57,58]*1.5,SinOsc.ar([57,58,59,60]).range(lfo*(-1),lfo)),
			SinOsc.kr([0.1,0.23])
		) + SinOsc.ar([55,56,57,220,110,4400])

		*
		Decay.ar(Impulse.ar(8/[1,2,3,5,8,13]),SinOsc.kr([0.1,0.11,0.111,0.1111]).range(0.01,1))
		,0.33,1)
)}).play;
)" ],
[ 315.237316753, 'me', "(
Ndef(\\a, {
	var osc1,osc2,osc3,osc4;

	osc1 = VarSaw.kr([0.5]);
	osc2 = SinOsc.kr([100]);
	osc3 = LFSaw.kr([1]);
	osc4 = SinOsc.kr([0.1]);

	SinOsc.ar( osc3.range(220,300),0, osc4.range(0.3,1) )
}).play;
)" ],
[ 316.970108603, 'me', "(
Ndef(\\c, {

	var osc1,osc2,osc3,osc4;

	osc1 = VarSaw.kr([0.5]);
	osc2 = SinOsc.kr([100]);
	osc3 = LFSaw.kr([1]);
	osc4 = SinOsc.kr([0.1]);

	SinOsc.ar( osc3.range(80,300),0, osc4.range(0,0.7))+SinOsc.ar(150,0,0.3);
}).play;
)" ],
[ 321.57055533, 'me', "(
  Ndef(\\a,{
    var sig,sig2;
	sig = Pulse.ar([1,2,4,8]) ;
    sig = CombN.ar(sig,1/80,1/70+(1/80*LFSaw.ar(16/[1,2,4,8]).lag(0.1)),32);
    sig = Limiter.ar(sig,1,0.5);
    sig = sig * LFPulse.ar(8/fib(12));
    sig2 = HPF.ar(sig,SinOsc.ar(1/4/fib(12)).range(44,10000));

    sig = Resonz.ar(sig,43.2*[1,2,4,8,16,32,32*1.5,64,64*1.5],1,6);
    sig = sig * Decay.ar(Impulse.ar([4,3]/fib(12)),[1,2,4,6,8,10,20].normalize.reverse*2);
    sig = FreeVerb.ar(sig+(sig2),0.3,1);

    Splay.ar(
      sig
      ,0.1,1,0.5)
  }).play;
)" ],
[ 382.678284008, 'me', "(
~selector={Duty.kr(Dseq([3/4,1/4],inf),0,Dseq([0,1],inf))};
~selector.quant=2;


~long={Duty.kr(4,0,Dseq([1,1.25,1.5,1.125,2,0.5,0.75].pyramid,inf))};
~long.quant=2;

~sh={Duty.kr(1/8,0,Dseq(~long.kr*[1,2,4,8,16,32].pyramid,inf))};
~sh.quant=2;
)" ],
