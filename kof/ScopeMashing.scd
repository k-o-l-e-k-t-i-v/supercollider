
s.boot();

p=ProxySpace.push();



(
~three.fadeTime=4;
~three={
	var sig = [] ++ SinOsc.ar([932,576]) ++ LFTri.ar([1200]);
	XYScope.ar(sig[0],sig[1],sig[2]);
	Splay.ar(sig,0.5,0.01);
};
~three.play();
)

~three.clean(10);