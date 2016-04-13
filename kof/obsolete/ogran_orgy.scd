

(
~mod = {Duty.kr(4,0,Dseq([1,1.25,1.5,1.125,2,4],inf))};
~one={
	var sig,t,l;
	l = 3;
	t = Impulse.ar(4/fib(8));

	sig = Spring.ar(ToggleFF.ar(t),10,0.1);
	sig = Spring.ar(sig,10.0/1.5,0.01);
	sig = Spring.ar(sig,10.0/2,0.01);
	sig = Spring.ar(sig,0.93/3,0.1);

	sig = CombL.ar(t, 0.21, LinLin.ar(sig, -10, 10, 1/[400,200,100,800,1600,3200]/~mod.kr, 1/200/~mod.kr), l);

	sig = Resonz.ar(sig,43.2)*32;
	sig = LPF.ar(sig,1000)*4;
	sig = FreeVerb.ar(sig,0.2,0.5);

	Splay.ar(sig,0.1);
};

~one.play;
);