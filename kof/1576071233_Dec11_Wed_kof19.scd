p.push();



p.bpm(135);

b=Buffer.alloc(s,2,48000);


(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 * 1.5 ); };
);


// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.quant=16;
~saw.fadeTime=4;
~saw={
    var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var detune = SinOsc.kr(~tempo/4/[1,2,3,4],mul:0.1);
  var sig = LFSaw.ar(50!2*mod+detune);
  Splay.ar(sig,0.75,0.05);
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;

// rim synth ///////////////////////////////////////

(
~rim.ar(2);
~rim.quant=[16,0];
~rim.fadeTime=0.02;
~rim={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = LFSaw.ar(15000,mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~rim.play;
);
~rim.stop(4);
~rim.clear;
~rim.pause;
~rim.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 0,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 0,0,0,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 0,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  sig = Mix(sig);
  Splay.ar(sig,1,0.15);
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
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = BufDelayL.ar(b.bufnum,sig,MouseX.kr(0,0.334)+SinOsc.kr(~tempo/[4,3.001],mul:0.01));
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
