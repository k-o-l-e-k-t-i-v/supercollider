



s.boot;


p=ProxySpace.push();


~tempo={LFNoise1.kr(4).range(0.95,1.1)};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
	var freq = 48.midicps;
	var sig = LFTri.ar([freq,~tempo/15] ++ LFTri.ar(freq*10.01,mul:2)) * SinOsc.ar(~tempo*4/[1,2,3,4].nthPrime).range(1/10pi,2pi);
	sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin) ** MouseX.kr(0,10);
	sig = LeakDC.ar(sig);
	Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
