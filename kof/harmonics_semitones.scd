
s.boot()

p=ProxySpace.push()

~tempo = {110/120}

(
~tone={
	var mod = Duty.kr([4,8]/~tempo,0,Dseq([10,7,11,-4,1,5,7,11],inf));
	var freq = 440/[4,2,1] *.x (2**([1,10,mod]/12)) /.x [1,2,4];
	var env = Decay2.ar(
		Impulse.ar( ~tempo * 4 / [1,2,3],0.02,1.6) ** 0.76;
	);
		var sig = SinOsc.ar(freq,SinOsc.kr([1,2,3])*2pi) + LFSaw.ar(freq*2,mul:env) + LFCub.ar(freq,0.25);

	sig = sig * env;
	Splay.ar(sig,1,0.05);
};
~tone.play();
)