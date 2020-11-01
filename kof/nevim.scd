s.boot;
p=ProxySpace.push()



(
~a.quant=24;
~a.fadeTime=5;
~a={
	var tem = SinOsc.kr([1,1.001,1.0001,1.00003]/24).range(110,123);
	var puls = Pulse.ar(tem/60/4*[1,2,3,4]);
	var sig = SinOsc.ar([24,32],puls);
	sig = SinOsc.ar(sig.range(1/[7,9],[110,220,110*1.5,1500])) ;
	sig= sig * puls;
	sig = AllpassC.ar(sig,LFTri.kr([1,2,3,4]/32).range(0.01,3.52),LFTri.kr([1,2,3,4]/31).exprange(0.0001,2),4) / [1,2,3,4];
	// sig = CombC.ar(tem/60,tem/61,1);
	Splay.ar(sig,0.95,0.7);
};
~a.play;
)
