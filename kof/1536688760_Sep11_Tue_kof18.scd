

p.push();
p.bpm(121.5);

// one synth ///////////////////////////////////////

(
~one_b.ar(2);
~one_b.clock = p.clock;
~one_b.quant=2;
~one_b.fadeTime=4;
~one_b={
    var mod = Duty.kr(16/~tempo*[2,4,8],0,Dseq([1,2,1.5,1.33333],inf));
    var f = 1500/[1,2,1.5]/mod;
var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3]),Impulse.ar(1));
  var sig = CombN.ar(Pulse.ar(~tempo)/2,1/f,1/f+(env**4),1);
  sig = MoogVCF.ar(sig,LFNoise2.kr(~tempo/16/[1,2,3]).exprange(50.01,5000),LFNoise2.kr(~tempo/16/[1,2,3]).exprange(0.01,1));
    Splay.ar(sig,0.5,0.15);
};
~one_b.play;
);
~one_b.stop(4);
~one_b.clear;
~one_b.pause;
~one_b.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=4;
~kick.fadeTime=4;
~kick={
    var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = Pulse.ar(~tempo/2)*SinOsc.ar(50,Pulse.ar(~tempo/2));
  var env = Perlin3.ar(LFSaw.ar(~tempo/4),LFSaw.ar(~tempo/16),LFSaw.ar(~tempo/400));
  sig = MoogVCF.ar(sig,15000/mod,env);
  sig = CombN.ar(sig,mod/50,mod/50,1);
  Splay.ar(sig,0.5,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
    var base = 432*[2,4,8];
    var mod2 = Duty.kr(24/~tempo*[2,4,8],0,Dseq([1,2,1.5,1.33333],inf));
    var mod = Duty.kr(12/~tempo*[2,4,8],0,Dseq([1,2,1.5,1.33333],inf));
    var f = base/mod2/[1,2,1.5]/mod + SinOsc.kr([4,5,7],mul:0.5);
  var sig = LFSaw.ar(f,SinOsc.kr(~tempo/15/[1,2,3])) * LFSaw.ar(f+0.1) *LFTri.ar(~tempo/2/[1,2,3])* Pulse.ar(~tempo/[1,2,3]) + BrownNoise.ar(0.01);
  //sig = Normalizer.ar(sig)/2;
  sig = LeakDC.ar(sig).softclip;
  sig = MoogVCF.ar(sig,LFNoise2.kr(~tempo/32/[1,2,3]).exprange(50.01,5000),LFNoise2.kr(~tempo/32/[1,2,3]).exprange(0.01,1));
  sig = CombC.ar(sig,4/f,2/f+BrownNoise.kr(0.00001),LFNoise2.kr(~tempo/32/[1,2,3]).exprange(0.1,3/4))+sig;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  sig = LPF.ar(sig,f).softclip;
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*2pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.clock = p.clock;
~saw.quant=2;
~saw.fadeTime=4;
~saw={
    var mod2 = Duty.kr(24/~tempo*[2,4,8],0,Dseq([1,2,1.5,1.33333],inf));
    var mod = Duty.kr(12/~tempo*[2,4,8],0,Dseq([1,2,1.5,1.33333],inf))*mod2;
     var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3]),Impulse.ar(~tempo*2));
    var f = 43.2*2/mod;
  var sig = LFSaw.ar(f) * env;
  sig = MoogVCF.ar(sig,11000,env.range(0.001,0.9));
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.25);
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;

// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.clock = p.clock;
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(55!2,env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;





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



(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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





// one synth ///////////////////////////////////////

(
~sub_saw.ar(2);
~sub_saw.clock = p.clock;
~sub_saw.quant=2;
~sub_saw.fadeTime=4;
~sub_saw={
  var sig = LFSaw.ar([43.2,~tempo/2,~tempo/4]);
  sig = Perlin3.ar(sig[0]+1,sig[1]+1,sig[2]+1);
  sig = LeakDC.ar(sig);
  sig = MoogVCF.ar(sig,LFNoise2.kr(~tempo*2!3).range(50,5000),sig*0.99+0.001);
  sig = LeakDC.ar(sig);
  sig = CombN.ar(sig,~tempo/4,~tempo/4,1);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.25);
};
~sub_saw.play;
);
~sub_saw.stop(4);
~sub_saw.clear;
~sub_saw.pause;
~sub_saw.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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
