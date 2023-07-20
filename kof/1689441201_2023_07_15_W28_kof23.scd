


p.push()


(
~one={
	var freq = [40,50,60]*(2**([1,5,8]/12));
	var saw = LFSaw.ar(freq,LFSaw.kr(~tempo*4));
	var sig = saw;
	sig = BPF.ar(sig,freq,LFSaw.kr(~tempo*2/[1,2,3]).range(0.01,1) );
	sig = sig * Pulse.ar(~tempo*2/[1,2,3]);
	sig = CombL.ar(sig,1/freq,2/freq,1);
	sig = LeakDC.ar(sig);
	sig = LPF.ar(sig,freq*1.5);
	Splay.ar(sig,1,0.6);
};
~one.play;
);
