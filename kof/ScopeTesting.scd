

s.boot();
p=ProxySpace.push(s)


(
~scope={
	var sig = [] ++ SinOsc.ar(2/[1,2,4],mul:0.5) + LFSaw.ar([47]/[1,2,11],LFSaw.ar([4.1,4.2,4.3]),mul:0.5);
        sig = LeakDC.ar(sig);
        //sig = CombL.ar(sig,1,1,1);
	XYScope.ar(sig[0],sig[1],sig[2]);
};
)
