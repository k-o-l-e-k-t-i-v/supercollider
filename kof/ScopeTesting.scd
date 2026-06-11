s.boot();
p=ProxySpace.push(s)


(
  ~scope.quant=4;
  ~scope.fadeTime = 6;
  ~scope={
    var curve = LFTri.kr(1/36,mul:1,add:1)**2;
    var wet = LFSaw.ar(4)**curve+0.05;
    var sig = [] ++ SinOsc.ar([500,1501],[1.11,2.3,4.1]*2pi,mul:wet) ++ LFSaw.ar(50,mul:1-wet);
    sig = LeakDC.ar(sig) * LFPulse.ar(4/[1,2,3]);
    sig = CombL.ar(sig,(1..3),1/47.5,2.1)*(wet*12*0.1)+sig;
    sig = GVerb.ar(sig,90,3)*1/(1/2*wet*16)/32+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    XYScope.ar(sig[0],sig[1],sig[2]);
    Splay.ar(sig,0.1,0.25);
  };
  ~scope.play();
)



