
s.reboot;
p=ProxySpace.push(s);

~c.play;

(
~c = {
	var sig = AudioIn.ar([0,1],2);
	Splay.ar(sig,0.1,1);
};


~c[30] = \filter->{|in| Splay.ar(PitchShift.ar(in,0.15,0.5+(Amplitude.ar(in,0.15,0.15)*16))) };
~c[32] = \filter->{|in| FreeVerb.ar(in,0.15,2)};

)