s.boot

p = ProxySpace.push(s)

(
    ~data.kr(1);
    ~data.mold(1);
    ~data={|x|[x].lag(1/60)};
OSCdef('/osc/perlin',{arg ... args;
	 //args.postln;
	 ~data.set(\x,args[0][2]);
},'/osc/perlin',recvPort:10000);


)



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = WhiteNoise.ar(1!2);
  sig = BPF.ar(sig,~data+2*1500,0.1) * ~data;
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
