

p.push();
p.bpm(117.33/4);


135/2/60

~tempo = { SinOsc.kr(1/120).range(0.958333,1.25); };


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);





// polyformat synth ///////////////////////////////////////

(
~polyformat.ar(2);
~polyformat.clock = p.clock;
~polyformat.quant=8;
~polyformat.fadeTime=4;
~polyformat={
    var note = 60.midicps * 4;
  var base = Duty.kr([4,8,16]*4/~tempo,0,Dseq(note/[1,2,1,1.5,1,4,1,1.33333],inf));
  var sig = Blip.ar(base/([1,2,4,8].reciprocal.scramble+1),SinOsc.kr(~tempo/32/[1,2,3]).range(2,100));
  sig = Select.ar(LFSaw.ar(~tempo/4/[1,2,3]).range(0,sig.size()),sig);
  sig = [
      LPF.ar(sig,note),
      HPF.ar(sig,note*2),
      RLPF.ar(sig,note*1.5,0.2),
      BPF.ar(sig,note*2/1.5,0.1),
      Resonz.ar(sig,note*4/1.33333,0.2),
      CombN.ar(sig,~tempo/4,~tempo/4,1)/4,
      sig * Pulse.ar(~tempo*4/[1,2,3,4])
  ] * ToggleFF.ar(Impulse.ar(~tempo*8/[1,2,3,4,5,6,7,8]));

    sig = sig.softclip * ToggleFF.ar(Impulse.ar(~tempo*8/[1,2,3]),sig);
    sig = sig * LFTri.ar(~tempo*8/[1,2,3]);
  Splay.ar(sig,0.25,0.095,SinOsc.kr([7,8]));
};
~polyformat.play;
);
~polyformat.stop(4);
~polyformat.clear;
~polyformat.pause;
~polyformat.resume;



// hasher synth ///////////////////////////////////////

(
~hasher.ar(2);
~hasher.clock = p.clock;
~hasher.quant=8;
~hasher.fadeTime=4;
~hasher={
  var sig = VarSaw.ar(5000/[1,2,4],mul:0.1) * Pulse.ar(~tempo*4/[1,2,3]);
  for(1,6,{|i| sig = sig ++ CombN.ar(sig/4 * Pulse.ar(i),1/16*i,1/16*i,4)});
  sig = SelectX.ar(LFTri.ar(~tempo/4/[1,2,3,4]).range(0,sig.size),sig);
  Splay.ar(sig,0.5,0.25);
};
~hasher.play;
);
~hasher.stop(4);
~hasher.clear;
~hasher.pause;
~hasher.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
