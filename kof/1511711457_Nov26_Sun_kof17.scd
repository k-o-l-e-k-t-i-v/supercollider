


p.push();
p.bpm(129.23);

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

// aaa synth ///////////////////////////////////////

(
~aaa.ar(2);
~aaa.clock = p.clock;
~aaa.quant=4;
~aaa.fadeTime=4;
~aaa={
    var mel = Duty.kr([4,16,32]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = LFDNoise1.ar(~tempo/16!3) * VarSaw.ar(51,0,SinOsc.ar(~tempo/16/[1,2,3]));
  sig = RLPF.ar(sig,500/mel,0.2)+1 * LFSaw.ar(~tempo/16/[1,2,3],mul:8);
  sig = sig * LFTri.ar(~tempo/4);
  sig = sig * Pulse.ar(~tempo*2);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = sig * Pulse.ar(~tempo*4/[1,2,3]);
  sig = CombN.ar(sig,2/500*mel + (sig/100),[1,2,3]/500.1*mel + (sig/1000),4);
  sig = LeakDC.ar(sig)/2;
  sig = LPF.ar(sig,1500);
  Splay.ar(sig,0.5,0.05);
};
~aaa.play;
);
~aaa.stop(4);
~aaa.clear;
~aaa.pause;
~aaa.resume;


// bbb synth ///////////////////////////////////////

(
~bbb.ar(2);
~bbb.clock = p.clock;
~bbb.quant=4;
~bbb.fadeTime=4;
~bbb={
    var mel = Duty.kr([4,16,32]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var pre = Pulse.ar(4/(1..12)*~tempo);
    var phases = CombN.ar(pre,(1..12)/5000/~tempo,(1..12)/5000/~tempo,1);
  var sig = SinOsc.ar([250,50,75,99]*mel,phases*1pi);
  sig = SinOsc.ar(~tempo/8/[1,2,3],SinOsc.ar(50)/4) * sig;
  Splay.ar(sig,0.5,0.25);
};
~bbb.play;
);
~bbb.stop(4);
~bbb.clear;
~bbb.pause;
~bbb.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*4pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var hh,mm,ll;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  hh = HPF.ar(sig,500);
  mm = BPF.ar(sig,500);
  ll = LPF.ar(sig,500);
  hh =  CompanderD.ar(hh,3/4,1/1.1,1/3);
  mm =  CompanderD.ar(mm,3/4,1/1.1,1/3);
  ll =  CompanderD.ar(ll,3/4,1/1.1,1/3);
  sig = Splay.ar([]++hh++mm++ll,0,1);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
