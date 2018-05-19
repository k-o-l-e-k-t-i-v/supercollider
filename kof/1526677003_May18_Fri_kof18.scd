
p.push();
p.bpm(121.5*4)

~monsterSwitcher.rebuild;
~one.clear;


// monsterSwitcher synth ///////////////////////////////////////

(
~monsterSwitcher.ar(2);
~monsterSwitcher.quant=16;
~monsterSwitcher.fadeTime=0.2;
~monsterSwitcher={
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var cc = LFTri.kr(~tempo!4).range(-4,4);
  var base = Select.kr(MouseX.kr(0,5),432.001/2);
  var kickf= MouseY.kr(base/8,base/2)*(2**(1/(1..8)+1));
  var mod1 = base / Duty.kr([16,32,64]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var mod2 = base * 4 / Duty.kr([16,32,64]*2/~tempo,0,Dseq([1,2,1.5,1.33333],inf));

  var env = [
      {EnvGen.ar(Env([0.001,1,0.0001],[0.002,2]*LFNoise2.kr(~tempo/[1,2,3,4]),[cc,cc * (-1)],curve:'exp'),imp * hit)},
  ];
  
  var sig = [
  SinOsc.ar(kickf + (env ** 40 * kickf*10),BrownNoise.ar(0.001+(env**LFNoise1.kr(~tempo/64!4).range(2,40)))*2pi*LFNoise1.kr(~tempo/32)),
  SinOsc.ar([mod1,mod2]*2,0,env**10.5*2pi),
  SinOsc.ar(kickf + (env ** 10 * kickf * 5),BrownNoise.ar(0.001+(env**LFNoise1.kr(~tempo/64!4).range(2,40)))*2pi*LFNoise1.kr(~tempo/32)),
  HPF.ar(WhiteNoise.ar(0.9!2),LFTri.ar(~tempo/7).range(1200,20000)),
   ];
  
   sig = sig * env;
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  Splay.ar(sig,0.75,0.05);
};
~monsterSwitcher.play;
);
~monsterSwitcher.stop(4);
~monsterSwitcher.clear;
~monsterSwitcher.pause;
~monsterSwitcher.resume;
