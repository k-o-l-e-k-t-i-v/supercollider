
p.push();



(
~one={
	var mel = Duty.kr([1,2,3]*4/~tempo,0,Dseq([1,5,8,12],inf));
	var scale = Duty.kr([1,2,3]*4/~tempo,0,Dseq([12,24,48,96],inf));
	var freq = 110 * ( 2**( mel / scale) ) + Vibrato.kr(0,[2,3,4]);
	var sig = LFSaw.ar(freq,mul:0.75/[1,2,3]) * LFTri.kr(~tempo/4/[1,2,3]);
	Splay.ar(sig,0.75,0.35);
};
~one.play;
)
~one.stop
