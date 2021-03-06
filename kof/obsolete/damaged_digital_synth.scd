
s.boot;

(
  Ndef(\a).fadeTime = 4;
  Ndef(\a).quant = 2.0;
  Ndef(\a,{
	var a,b,speed,imp,env1,env2,melody,voices,freq,mm,c,sig,crusher,comp,strangler;

    a = LFCub.ar(43.2+SinOsc.ar((1.00001**(1..8))),mul:1/(1..8));
    b = WhiteNoise.ar(0.4!2);
    b = HPF.ar(b,LFNoise2.ar(18000!2));

    speed = Duty.kr(Dseq([1/2,1/4,1],inf),0,Dseq([4,8],inf));
    imp = Impulse.ar(speed);
    env1 = Decay.ar(imp,0.75);
    env2 = Decay.ar(imp/16,0.45);

    mm = Duty.kr(4,0,Dseq([60,67,57,60,72]+24,inf)).lag(0.1);

    melody = Duty.kr([1,2,4,8,16],0,Dseq([1,2,1.5,1,2,1.25,1,2,0.5,1,2],inf));
    voices = Duty.kr([1,2,4,8,16]*4,0,Dseq([1,2,1.5,1,2,1.25,1,2,0.5,1,2].reverse*4,inf));
    freq = mm * melody;

    c = Blip.ar(freq*(1.5001**(1..8)),voices,mul:4/(1..8)) + LFSaw.ar(freq*2);
    c = Resonz.ar(c,freq*SinOsc.ar(1/[11,22,44]).range(0.95,1.05));
    c = c * LFSaw.ar(1/4/[1,2,4,8,16]).squared;
    c = CombN.ar(c,0.25,0.25,8);
    c = FreeVerb.ar(c,4);
    c = LPF.ar(c,freq*1.5);

    sig = (a * env1) + (b * env2) + c;

    crusher = CombN.ar(sig,
                        TExpRand.ar(0.02,0.25,Impulse.ar(1)).lag(1/32),
                        TExpRand.ar(0.04,4,Impulse.ar(1/8)).lag(1/8),
                        4);

    comp  = CompanderD.ar(crusher ,0.5,1,1/10,0.002,0.02);
    comp = LPF.ar(comp,SinOsc.ar(0.1*(1.0001**(1..8))).range(400,16000));
    strangler =  OnePole.ar(comp,SinOsc.ar(0.01*(1.0001**(1..8))).range(0,1)).softclip / 1.5;

    Splay.ar(
      (strangler.distort + sig.distort)
    ,0.5,1,0.5)}).play;
)



///nooooaaaiiisss 