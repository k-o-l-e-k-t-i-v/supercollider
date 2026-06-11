

s.boot();
p=ProxySpace.push(s)


(
~scope={
        var wet = LFTri.ar(1/36)**0.2;
	var sig = [] ++ SinOsc.ar(500,[1.11,2.3,4.1]*2pi,mul:wet) ++ LFSaw.ar([50.1],mul:1-wet);
        sig = LeakDC.ar(sig) * Pulse.ar(4/[1,2,3]);
        sig = CombL.ar(sig,(1..3),1/47.5,1)*(wet*12*0.1)+sig;
        sig = GVerb.ar(sig,90,3)*1/(1/2*wet*16)+sig * 0.1;
        sig = CompanderD.ar(sig,3/4,1/2,1);
	XYScope.ar(sig[0],sig[1],sig[2]);
        Splay.ar(sig,0.1,0.95);
};
~scope.play();
)
