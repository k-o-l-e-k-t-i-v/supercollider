p = ProxySpace.push(s);

~backG.quant_(1);
~backG.play;
~backG.rebuild;
(
~backG[0] = {
	var num = 120;
	var f = \freq.kr(2600);
	var v = \vol.kr(0.8);
	var osc = Mix.fill( num, { |i| VarSaw.ar(Rand(f-200,f+200), i*0.001 , i/num, v/num)} );
	Pan2.ar( osc * \aEnv.kr(0), \pan.kr(0));
};
~backG[1] = \set -> Pbind(\args, [\aEnv], \dur, 1/100,
	\aEnv, Pdfsm([
		Pseq([\s1,\s2]).trace(prefix: "brush "),
		(
			\s1: [0, Penv([0,1,0.2,0], [0.25,2.95,1],\sin)],
			\s2: [0, Penv([0,1,0], [2.95,1.05],\lin)]
		)
	],0,inf);
);
)
