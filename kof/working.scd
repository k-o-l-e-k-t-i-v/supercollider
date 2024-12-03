
p.push

(
~simple.quant = 4;
~simple.fadeTime = 2;
~simple = {
	var row = [1,3,5,11/[1,2,3]];
	var sig = LFSaw.ar(100/(2**(row/12+1)) ,mul:0.05) * LFSaw.ar([4,3,2,1.5]) + LFSaw.ar(400*(2**(row/12+1)),mul:0.01) * LFTri.ar(1/4/[1,2,3,4]*1/5);
	sig = sig * Pulse.ar(1/[1,2,3,4]*5);
	sig = CombL.ar(sig,1/4,1/4-LFSaw.ar([1,2,3]/15).exprange(0.0001,1/4)/4,2)/4+sig;
	sig = GVerb.ar(sig,90,3)/16 + sig;
	Splay.ar(sig,1,0.4);
	};
~simple.play;
)


~simple.stop(30);