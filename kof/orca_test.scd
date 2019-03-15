
p.push();
(
    thisProcess.openUDPPort(10000);
    n = NetAddr("127.0.0.1",10000);
    //n = NetAddr("127.0.0.1",34651);
    OSCFunc({|msg| msg.postln; Synth.new(\bold,[aa:msg[1],ab:msg[2],ac:msg[3]]);},'/a');
    OSCFunc({|msg| msg.postln; Synth.new(\kick,[t:msg[1]]);},'/k');
    OSCFunc({|msg| msg.postln; Synth.new(\snare,[t:msg[1]]);},'/s');
    OSCFunc({|msg| msg.postln; Synth.new(\tone,[freq:msg[1],amp:msg[2]/35]);},'/f');
)


b = Buffer.alloc(s,1024,1);


(
~rec={
    var sig = PinkNoise.ar(1);
    RecordBuf.ar(sig,b.bufnum,loop:0);
};
)



(
SynthDef(\tone,{|freq=32,amp=1|
    var f = (freq+36).midicps + SinOsc.ar(freq/4,mul:2pi);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,0.753],[3,-3]),doneAction:2);
    var sig = Shaper.ar(b.bufnum,Formant.ar(f,f/8,f*2,mul:1/4)*env+LFSaw.ar(freq/35)) * env;
    //sig = CombN.ar(sig,1/50,aa/50,1);
    sig = LeakDC.ar(sig);
    Out.ar(0,Splay.ar(sig,1,amp));
}).add;
)

35.asHexString.asFloat



(
SynthDef(\bold,{|aa=0,ab=0,ac=0|
    var f = (([aa,ab,ac])*4).midicps/32 + SinOsc.ar([aa,ab,ac],mul:pi);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,aa/16],[3,-3]),doneAction:2);
    var sig = Osc.ar(b,f,env**20*2pi) * env;
    //sig = CombN.ar(sig,1/50,aa/50,1);
    sig = LeakDC.ar(sig);
    Out.ar(0,Splay.ar(sig,1,0.22));
}).add;
)

(
SynthDef(\snare,{|t=1.5|
    var env = EnvGen.ar(Env([0,1,0],[0.02,0.15]),doneAction:2);
    var sig = BrownNoise.ar(t/35) + ClipNoise.ar(env**t/8) * env;
    //sig = Resonz.ar(sig,SinOsc.ar(t*50).range(50,5000),0.12)/2+sig;
    Out.ar(0,Splay.ar(sig,1,0.4));
}).add;
)

(
SynthDef(\kick,{|t=1.5|
    var env = EnvGen.ar(Env([0,1,0],[0.02,t/18]),doneAction:2);
    var sig = SinOsc.ar(50!2,env**(t*2)*8pi)/2 + LFSaw.ar(49,0,env**(t/35),mul:0.22) * env;
    //sig = Resonz.ar(sig,SinOsc.ar(t*50).range(50,5000),0.12)/2+sig;
    Out.ar(0,Splay.ar(sig,1,0.4));
}).add;
)

p.push();

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
