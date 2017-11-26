

(
~gen={
	var sig;
    var speed1,speed2,speed3,speed4,speed5;
	var speed = [
        ~tempo/4,50,~tempo/600,
        ~tempo/8,50.1,~tempo/6000,
        ~tempo/12,50.01,~tempo/60,
        ~tempo/16,50.001,~tempo/60000,
        ~tempo/32,50.0001,~tempo/60,
    ];
	speed = SinOsc.ar(speed);
    speed1 =  Perlin3.ar(speed[0],speed[1],speed[2]);
    speed2 =  Perlin3.ar(speed[3],speed[4],speed[5]);
    speed3 =  Perlin3.ar(speed[6],speed[7],speed[8]);
    speed4 =  Perlin3.ar(speed[9],speed[9],speed[10]);
    speed5 =  Perlin3.ar(speed[12],speed[13],speed[14]);
    sig = Gendy1.ar(LFNoise2.kr(speed).range(1,6),speed,speed2,speed3,100,800,speed4,speed5,12);
	sig = BPF.ar(sig,1240/8*[1,2,4,8]*SinOsc.ar(1/4/[1,2,4,8]).range(0.1,8));
	sig = GVerb.ar(HPF.ar(sig,800),30)/4+(LPF.ar(sig,800));
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
	Splay.ar(sig.flat,0.15);
};
~gen.play;
)
