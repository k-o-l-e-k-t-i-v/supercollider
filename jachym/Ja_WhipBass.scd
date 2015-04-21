p = ProxySpace.push(s);

(
~freq.fadeTime = 16;
~freq = 60;

p[\drum].play.quant_(4).fadeTime_(1);
p[\drum][0] = {
	var dur = 4;
	var aEnv = DemandEnvGen.ar(Dseq([0,1,0,0],inf),Dseq([1/4*dur*0.02,1/4*dur*0.98,3/4*dur,0],inf),3,2);
	var fEnv = DemandEnvGen.ar(Dseq([~freq,18000,~freq*0.95],inf),Dseq([1/4*dur*0.005,1/4*dur*0.015,3/4*dur*0.98], inf),5,2);
	LFSaw.ar(fEnv!2,0,0.45,0.35) * BrownNoise.ar(0.15,0.75) * aEnv;
};
p[\drum][1] = {
	var dur = 8;
	var aEnv = DemandEnvGen.ar(Dseq([0,0,1,0],inf),Dseq([2/4*dur,1/4*dur*0.82,1/4*dur*0.18,1/4*dur],inf),3,2);
	var fEnv = DemandEnvGen.ar(Dseq([~freq,8000,~freq],inf),Dseq([1/4*dur*0.005,1/4*dur*0.015,3/4*dur*0.98], inf),5,2);
	SinOsc.ar(fEnv!2,0,0.45,0.35) * BrownNoise.ar(0.15,0.75) * aEnv;
};
p[\drum][30] = \filter -> {|in| LPF.ar(in, SinOsc.kr([15,16],0.05,2400,3800)); };
p[\drum][31] = \filter -> {|in| GVerb.ar(in, 30, 4.75); };
p[\drum][32] = \filter -> {|in| Vibrato.ar(in,[8,9],SinOsc.kr(1/8,0,0.04,0.08),0.001); };
)

(
p[\noise].play.quant_(4).fadeTime_(1);
p[\noise][0] = {
	var dur = 2;
	var aEnv = DemandEnvGen.ar(Dseq([0,0.25,0.5,1],inf),Dseq([1,0.82,0.18,4],inf),3,2,timeScale:dur);
	WhiteNoise.ar(0.05)!2 * aEnv;
};
p[\noise][30] = \filter -> {|in| FreeVerb.ar(in, 0.8, 0.9, mul:SinOsc.kr([35,40],0.05,0.8,0.2)); };
)

(
p[\tone].play.quant_(4).fadeTime_(0.5);
p[\tone][0] = {
	var freq = Duty.ar(Dseq([7.5,0.5], inf), 0, Dseq([8000,6000],inf));
	var amp = SinOsc.kr(1/16, 0, 0.06, 0.09);
	var oscL = SinOsc.ar(freq,[0,0.5],amp);
	var oscR = VarSaw.ar(freq+20,[0,0.5],0.1, amp);
	Balance2.ar(oscL, oscR, Saw.kr(0.5));
};
p[\tone][30] = \filter -> {|in| AllpassC.ar(in, 0.25, SinOsc.kr(1/[18,30], 0, 0.0625, 0.125), 0.75) };
)

p.;
s.plotTree;
s.scope(2);

p[\drum].scope;
p[\drum].removeAt(32);
p[\drum].free(20);

p[\noise].free(5);

p[\tone].scope;
p[\tone].removeAt(30);
p[\tone].free(10);

