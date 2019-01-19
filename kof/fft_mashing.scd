
s.reboot;
p = ProxySpace.push();
p.push();
b = Buffer.alloc(s,256**2,1);

(
~ifft={

	var t = SinOsc.ar([1,2,500],0.5pi+SinOsc.ar(1/60/(1..16))) + LFSaw.ar(1/3200);
	var sig = Perlin3.ar(t[0],t[1],t[2]) * t;
	RecordBuf.ar(Mix(sig),b.bufnum,loop:1);

};
//~ifft.play;
)


s.scope



(
~playback={
	var sig = Osc.ar(b.bufnum,1/4/[1,1.5,2]);
	sig = IFFT(b) + sig;
	sig = Normalizer.ar(sig)/2;
	sig = PitchShift.ar(sig,0.5,0.5/[1,2,1.5]);
	sig = LPF.ar(sig,1250);
	sig / 2;
};

~playback.play;
)
