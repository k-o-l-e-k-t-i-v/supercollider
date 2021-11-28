p = ProxySpace.push(s);
thisProcess.openPorts(9000)
(
    ~data.kr(2);
    ~data.mold(2);
~data={|x,y|[x,y]};

    OSCdef(\test,{arg ... msg;
	~data.set(\x,msg[0][1]);
	~data.set(\y,msg[0][2]);
        },\test,nil);


)

~tempo=(249.5/120)
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
	var sig = Perlin3.ar(DC.ar(~data.lag(1/30)).cos,DC.ar(~data.lag(1/30)).sin,LFTri.ar([50,50.01],mul:LFSaw.ar(~tempo*2/[1,2,3,4,5,6,7,8])));
	// sig = BPF.ar(sig,~data.abs*500,0.1);
  Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
