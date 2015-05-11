


(
~noise={
	var mel;
	var freq = LFSaw.ar(1/9/fib(12)).range(50,1500);
	var abc = PinkNoise.ar(1!12) + SinOsc.ar(44*[1,1,1.5,1.24],mul:SinOsc.kr(1/24/[1,3,6,9]).exprange(0.1,0.4))/2;
	abc = abc * LFTri.kr(1/8/fib(12)).exprange(0.0001,1);
	abc = CombN.ar(abc,0.1,1,8);
	abc = DFM1.ar(abc,freq,LFTri.ar(1/12/fib(12)).range(0.0001,1),1,[0,1])/[1,2];
	mel = BPF.ar(PitchShift.ar(abc,0.2,LFDNoise0.ar(4/fib(8)).range(1.5001,2)),LFDNoise0.ar(2/fib(8)).range(200,900),2);
	abc = Mix(abc)/8 + (Mix(mel)/20);

	abc = Pan2.ar(abc,SinOsc.ar(1/7,fib(12)));
	abc = LPF.ar(GVerb.ar(abc,100,12,0.2,0.2,32),SinOsc.ar(1/24/fib(8)).range(90,550))+(abc/1.2);
	abc = HPF.ar(abc,20);

	Splay.ar(abc.flat,0.25);
};
~noise.play;
)

//beautiful! 90% use of server on mine