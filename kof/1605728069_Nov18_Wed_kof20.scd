
s.boot

p=ProxySpace.push();
~tempo={LFNoise1.kr(1/15).range(115/60,125/60);};

(
~threedim={
	var mod = SinOsc.ar(~tempo/[24,26,27],add:1.001) + SinOsc.ar(~tempo*[1,2,4]);
	var base = [48,60].midicps/2;
	var harm = Duty.kr(Dseq((24)/~tempo,inf),0,Dseq(1.25/[1,2,4/3,15/8],inf)).lag(1/3);
	var arr = [~tempo/24/[1,2,3],~tempo/24/[3,2,1],base *.x harm];
	var sig = [] ++ LFSaw.ar(arr,mul:2pi).cos ++ LFSaw.ar(arr,mul:2pi).sin ++ LFSaw.ar(arr,mul:2pi).cos;
	sig = Perlin3.ar(sig[0]*mod+1,sig[1]*mod+1,sig[2]*mod+1);
	sig = LeakDC.ar(sig);
	sig = CombC.ar(sig,1/base*harm,2/base*harm,3);
	sig = CombN.ar(sig,1/~tempo,1/~tempo,2);
	sig = LPF.ar(HPF.ar(sig,50),1800);
	Splay.ar(sig,0.9,0.1);
};
~threedim.play();

)
