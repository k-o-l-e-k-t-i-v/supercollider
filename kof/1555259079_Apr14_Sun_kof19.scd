

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(Dseq([4,2,2,1],inf)/~tempo*[16,1,4],0,Dseq([60,62,67,64,69,71,64,63],inf))+[12,0,-24];
    var f = [mod[0],mod[1],mod[2]].midicps+SinOsc.kr(1/[4,5,6],mul:2);
    var perl = Perlin3.ar(LFSaw.ar(1/4),LFSaw.ar(f),LFSaw.ar([1,2,3]/32)*4);
  var sig = Pluck.ar(perl,Impulse.ar(4),2/f,1/f,LFNoise1.kr(1/[4,8,16])).distort;
  sig = MoogVCF.ar(sig*2+((HPF.ar(perl,1500)*Pulse.ar(4))),f*[2,4,1.5],perl.range(0.1,0.9));
  sig = LPF.ar(sig,10000);
  Splay.ar(sig,0.05,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// perl synth ///////////////////////////////////////

(
~perl.ar(2);
~perl.quant=2;
~perl.fadeTime=4;
~perl={
    var f = [150,600,3000]/.x[1,1.5,2,4,8,16,32,92] +.x SinOsc.kr(1/[4,5,6]);
  var xes = LFSaw.ar(8.01/(1..16))*2pi;
  var yes = LFSaw.ar(8/(1..16))*2pi;
  var rad = SinOsc.ar(1/16/(1..16))*8;
  var perl = Perlin3.ar(xes.cos*rad,yes.sin*rad,(SinOsc.ar(f)+1));
  perl = LeakDC.ar(perl);
  perl = LPF.ar(perl,5000);
  perl = CombN.ar(perl,1,10/f,1)/8+perl;
  perl = SelectX.ar(LFTri.ar(1/360).range(0,perl.size+1),perl);
  perl = BPF.ar(perl,f/[1.5,2],0.21);
  Splay.ar(perl,0.05,0.75);
};
~perl.play;
);
~perl.stop(4);
~perl.clear;
~perl.pause;
~perl.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(45!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

