s.boot;

p = ProxySpace.new.push(s);

p[\test].play.quant_(4).fadeTime_(1.2);
p[\test][0] = {|freq = 220, amp = 0.1| SinOsc.ar([freq/2, ((freq/2) + 1.3)], 0, * amp/2) };
p[\test][1] = {|freq = 220, amp = 0.1| LFSaw.ar(freq!2,0,0.2,0.3) * amp/2; };
p[\test][10] = \xset -> Pbind( \amp, 0.15, \dur, 4, \octave, 5, \degree, Pseq([3,4,3,7], inf));

p[\efx].play.quant_(4).fadeTime_(0.2);
p[\efx][0] = { |freq = 2000| ReplaceOut.ar(0, LPF.ar(p[\test].ar, freq)) };
p[\efx][10] = \set -> Pbind( \dur, 0.25, \freq, Pseq([2000, 18000], inf));
p[\efx][1] = { HPF.ar(p[\test].ar, SinOsc.kr(0.5,0,8000,10000)) };

p.clear(4);
p.pop;



n = NodeProxy.new.play.fadeTime_(1.2).quant_(4);
n[0] = {|freq = 220, amp = 0.1| SinOsc.ar([freq/2, ((freq/2) + 1.3)], 0, * amp/2) };
n[1] = {|freq = 220, amp = 0.1| LFSaw.ar(freq!2,0,0.2,0.3) * amp/2; };
n[10] = \xset -> Pbind( \amp, 0.15, \dur, 4, \octave, 5, \degree, Pseq([3,4,3,7], inf));
n[30] = \filter -> {|in| Out.ar(0,LPF.ar(in, SinOsc.kr(0.5,0,4000,4200))); };
n[30] = nil;

e = NodeProxy.new.play;
e[0] = { |freq = 2000| ReplaceOut.ar(0, LPF.ar(n.ar, freq)) };
e[10] = \set -> Pbind( \dur, 0.5, \freq, Pseq([800, 2000], inf));

n.clear(4);
e.clear;
