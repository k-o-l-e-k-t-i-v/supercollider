AutoIDE.run

p = ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(160/60); // can scale Jenv times

~circle.play(vol: 0.8, fadeTime: 8).quant_(2);
~circle[0] = { Pan2.ar( SinOsc.ar( \freq.kr(60), 0, \amp.kr(0) ) * LFPulse.ar(80,width:\width.kr(0.1),mul:0.2,add:0.8), \pan.kr(0) );}
~circle[1] = \set -> Jenv(\amp, [0.01,1,0.4], [0.05, 0.45], \exp, inf);
(
~circle[2] = \set -> Pswitch([
	Jenv(\freq, [60,143,10,60], [3.43, 0.15, 0.42], \welch, 8),
	Jenv(\freq, [60,223], [8], \sin, 1),
	Jenv(\freq, [60,1000, 123, 60], [0.01, 0.09, 0.4], \sin, 2),
], Pseq([0,1,0,2], inf))
)
~circle[3] = \set -> Jenv(\width, [0.001,2,0.4], [7.85, 0.15], \exp, inf);

~circle[4] = \filter -> {|in| CompanderD.ar(in, 0.75, 0.5, 0.5) };

~circle[5] = \filter -> {|in| Limiter.ar(in, 0.95) };

~circle[6] = \filter -> {|in| LPF.ar(in, \lpf_freq.kr(4800)) };

~circle[7] = \set -> Jenv(\lpf_freq, [4000,18000,4000], [6.85, 1.15], \sin, inf);

~circle[8] = \set -> Jenv(\pan, [-0.7,0.9,0.2,0.7,-0.7], [0.15, 0.15, 0.1,0.9], \sin, inf);

~circle.stop(16);

~circle.scope;


