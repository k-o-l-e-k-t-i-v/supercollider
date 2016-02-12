// History, as it was on Sat Jun 27 01:12:28 2015.

[
[ 0, 'me', "(
~bm.quant=2;
~bm.fadeTime=3;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(1213/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
  Splay.ar(sig,0.25,0.75);
};
e.addMix(~bm,postVol:true);
~bm.play;
);" ],
[ 296.947215809, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(50*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[4,2]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/2,1/2);

	Splay.ar(sig.flat,0.25,0.1);

};
~pls.play;
)" ],
[ 393.741741963, 'me', "(
~bm.quant=2;
~bm.fadeTime=3;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(1213/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
    sig = Limiter.ar(sig,0.9);
    Splay.ar(sig,0.25,0.75);
};
e.addMix(~bm,postVol:true);
~bm.play;
);" ],
[ 419.883658818, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(50*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[4,2]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/2,1/2);

    sig = Limiter.ar(sig,0.5);

	Splay.ar(sig.flat,0.25,0.1);

};
~pls.play;
)" ],
[ 427.060050024, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(50*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[4,2]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.1);

};
~pls.play;
)" ],
[ 435.596071917, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(50*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.1);

};
~pls.play;
)" ],
[ 449.303517186, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.1);

};
~pls.play;
)" ],
[ 474.967668776, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65]-12,inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.1);

};
~pls.play;
)" ],
[ 481.262956565, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65]-24,inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.1);

};
~pls.play;
)" ],
[ 496.147412457, 'me', "(
~bm.quant=2;
~bm.fadeTime=3;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(60.midicps/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
    sig = Limiter.ar(sig,0.9);
    Splay.ar(sig,0.25,0.75);
};
e.addMix(~bm,postVol:true);
~bm.play;
);" ],
[ 499.882095694, 'me', "(
~bm.quant=2;
~bm.fadeTime=3;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(60.midicps*4pi/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
    sig = Limiter.ar(sig,0.9);
    Splay.ar(sig,0.25,0.75);
};
e.addMix(~bm,postVol:true);
~bm.play;
);" ],
[ 507.739680261, 'me', "(
~bm.quant=2;
~bm.fadeTime=3;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(60.midicps*4/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
    sig = Limiter.ar(sig,0.9);
    Splay.ar(sig,0.25,0.75);
};
e.addMix(~bm,postVol:true);
~bm.play;
);" ],
[ 515.307736792, 'me', "(
~bm.quant=2;
~bm.fadeTime=3;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(60.midicps*8/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
    sig = Limiter.ar(sig,0.9);
    Splay.ar(sig,0.25,0.75);
};
e.addMix(~bm,postVol:true);
~bm.play;
);" ],
[ 529.38729803, 'me', "(
~com.quant=2;
~com.fadeTime=5;
~com={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~com.play;
);" ],
[ 540.481754974, 'me', "(
~com.quant=2;
~com.fadeTime=5;
~com={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10)/4+sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~com.play;
);" ],
[ 569.113411464, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65]-24,inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 577.296321087, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65]-24,inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 600.513526705, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65]+12,inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 607.806291266, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65]+7,inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 613.368880808, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65]+1,inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 632.448233264, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.5pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.25pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 643.851769111, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(36.midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.5pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.5pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 660.994739497, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar([36,48].midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.5pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.5pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.25);

};
~pls.play;
)" ],
[ 711.6230404, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 718.910451166, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.0025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 723.364344988, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.0125);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 727.060399592, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.00225);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 732.61827027, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.00225);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 776.092736957, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1/2,(0..3)/4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.00225);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 788.563933124, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1/2,(0..3)/4).lag(0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.00225);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 791.496830501, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1/2,(0..3)/4).lag(0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.0225);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 795.886797606, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1/2,(0..3)/4).lag(0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.225);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 800.275077056, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1/2,(0..3)/4).lag(0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 806.375940784, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1,(0..3)/4).lag(0.1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 809.202869526, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1,(0..3)/4).lag(0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 810.881196075, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * Impulse.ar(1,(0..3)/4).lag(0.02);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 846.360869377, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * LFPulse.ar(1/2,(0..3)/4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 851.284599917, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50!2) * LFPulse.ar(1/2,(0..3)/4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 872.168467859, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50*[1,2,1,4]) * LFPulse.ar(1/2,(0..3)/4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 879.853613666, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50*[1,2,1,4]) * LFPulse.ar(1,(0..3)/4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 882.933282786, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50*[1,2,1,4]) * LFPulse.ar(2,(0..3)/4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 890.367517932, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
    var sig = LFSaw.ar(50*[1,2,1,4]) * LFPulse.ar(2,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 906.802748493, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1,4]) * LFPulse.ar(2,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 910.89147436, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1,4]) * LFPulse.ar(4,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 914.855031969, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1,4]) * LFPulse.ar(8,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 919.763995108, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1,4]) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 923.896303975, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1,4]*1.5) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 929.135877554, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1,4]*1.25) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 933.569753516, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1,4]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 941.514249013, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,2,1.5,4]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 949.350318084, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,3,1.25,4]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 953.306905353, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,3,1.5,2]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 955.669191087, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,6,1.5,2]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 958.250086622, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,6,1.5,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 961.104970531, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,6,1.25,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 963.609223973, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1,6,1.125,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 965.366266258, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1/2,6,1.125,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 967.998719375, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1/2,6,1.15,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 989.674482305, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1/2,6,1.15,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(1/4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1000.420257519, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar(36.midicps*[1/2,6,1.15,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1019.370409856, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[1/2,6,1.15,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1024.501945847, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,6,1.15,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1026.216383411, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.15,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1027.441255217, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,8]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1029.057000572, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(16,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1033.683133593, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(160,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1044.308044491, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(60.midicps,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1047.847859423, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(60.midicps/2,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1049.503866536, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(60.midicps/1.5,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1051.505444265, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(60.midicps/15,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1060.362230451, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(1,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1064.149296137, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
  var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(1/4,(0..3)/4);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1073.540352528, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(1/4,(0..3)/4).lag(0.1);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1077.038185828, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(1/4,(0..3)/4).lag(0.5);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1089.684128402, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.125) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(5);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1099.955623495, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]*1.5) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(5);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1105.672864468, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(5);
  sig = LeakDC.ar(sig,LFSaw.ar(4).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1115.029213714, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(5);
    sig = LeakDC.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1120.428567774, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(5);
    sig = LeakDC.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1122.707640863, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(5);
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1130.745831526, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1143.286131078, 'me', "(
~pls.quant=2;
~pls.fadeTime=4;
    ~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar([36,48].midicps*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.5pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.5pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	//sig = GVerb.ar(sig,[100,10])/[2,1.5]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/4,1/2);

    sig = Limiter.ar(sig.softclip,0.5);

	Splay.ar(sig.flat,0.25,0.00025);

};
~pls.play;
)" ],
[ 1158.99555044, 'me', "(
~bm.quant=2;
~bm.fadeTime=8;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(60.midicps*8/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
    sig = Limiter.ar(sig,0.9);
    Splay.ar(sig,0.25,0.00075);
};
e.addMix(~bm,postVol:true);
~bm.play;
);" ],
[ 1192.845702119, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72!2,mul:0.1)*LFSaw.ar(1/4).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1206.680645382, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.1)*LFSaw.ar(1/4).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1213.059816047, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/4).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1219.356537892, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/4*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1227.406773452, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.5,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1229.443500888, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,2,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1234.451761607, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[2,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1238.888978456, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = LFSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1247.688220706, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.01,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1258.256534745, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,0.95));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1261.966983561, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1264.221665892, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1281.979849953, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/2*[2,1]).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1299.56109832, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/4/fib(8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1306.451606403, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(1/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1315.812497462, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.035);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1320.251578575, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*[4,1,1.25,4]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1325.891329635, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1333.975217835, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1343.38353965, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1353.139322293, 'me', "(
~quad.quant=2;
~quad.fadeTime=2;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1369.390050717, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/1.5) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1378.986959141, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/1.25) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1383.070122033, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/1.5) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1387.390990119, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/1.25) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1393.873084131, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/1.125) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1396.694570111, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/1.5) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1401.603775751, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1407.210646499, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/1) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1410.592378968, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,4]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1413.385958942, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.25,2]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1418.134183233, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[4,1,1.5,2]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1423.126456066, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1,1.5,2]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1428.696744274, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1.5,2]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1433.427765368, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1.5,4]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1437.671182253, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1.5,1/2]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1441.719507098, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1.5,1/2]/1) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1446.87390238, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1/4,1/2]/4) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1451.450818586, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1/2,1/2]/4) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1454.717999115, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1/2,1/4]/4) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1458.190435863, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1/2,1/4+1]/4) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1461.728133862, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1/2,1/4+1]/2) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1466.980335856, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1/2,1/4+1]/8) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1470.711918166, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1/2,1/4+1]/[2,4,8]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1474.892995169, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.5,1,1/4+1]/[2,4,8]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1477.73384454, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1.5,1.25,1,1/4+1]/[2,4,8]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
);" ],
[ 1479.352726315, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1,1.25,1,1/4+1]/[2,4,8]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1483.489502928, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1,1.25,1,1/4]/[2,4,8]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1490.056547836, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1,1.25,1,1/4]/[2,1,8]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1492.186526435, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1,1.25,1,1/4]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1494.406094185, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1,1.5,1,1/4]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1497.416560584, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[1,1.25,1,1/4]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1499.131465278, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[2,1.25,1,1/4]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1501.923649388, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[2,1.25,4,1/4]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1504.602730479, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,58].midicps*pi/[2,1.25,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1508.390684926, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,60,55].midicps*pi/[2,1.25,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1510.871621645, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,63,55].midicps*pi/[2,1.25,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1513.942684741, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48,63,58].midicps*pi/[2,1.25,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1519.048372277, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36,48-7,63,58].midicps*pi/[2,1.25,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1521.957765049, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[2,1.25,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1524.715782099, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1.25,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1526.042419116, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1.5,4,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1527.513521409, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1.5,2,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1528.827256002, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1/2]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1530.811927823, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1]/[2,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1533.835816072, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1]/[1.5,1,1.5]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1535.685060512, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1]/[1.5,1,1.25]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1537.526350573, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1541.196165096, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(44/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1549.919888518, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1563.612789687, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps*pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1576.460631975, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1579.874054695, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.5pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1584.600108636, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(72*[1,2],mul:0.2)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1602.130821642, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(24.midicps*[1,2],mul:0.2)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1605.781195083, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(24.midicps*[2,4],mul:0.2)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1607.765929199, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(24.midicps*[2,4],mul:0.4)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(4/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1614.382119489, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(24.midicps*[2,4],mul:0.4)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(8/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.135);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1617.460514539, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(24.midicps*[2,4],mul:0.4)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(8/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1620.443166414, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(24.midicps*[2,4],mul:0.4)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(16/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.235);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1628.849239401, 'me', "(
~quad.quant=2;
~quad.fadeTime=1;
~quad={
    var sig = VarSaw.ar([36+7,48-7,63,58].midicps/0.25pi/[1,1,2,1]/[1.5,1,1.25,1]) * LFPulse.ar(1/4/(1..8),(0..3)/4).lag(4);
    sig = sig + (SinOsc.ar(24.midicps*[2,4],mul:0.4)*LFSaw.ar(1/4/(1..8)).exprange(0.001,1));
    sig = LeakDC.ar(sig,LFSaw.ar(16/(1..8)).exprange(0.001,0.995));
  Splay.ar(sig.flat,0.25,0.000000000235);
};
e.addMix(~quad,postVol:true);
~quad.play;
);" ],
[ 1634.683236282, 'me', "~quad.stop(7);" ],
];