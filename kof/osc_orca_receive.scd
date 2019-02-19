
p.push();
(
    thisProcess.openUDPPort(10000);
    n = NetAddr("127.0.0.1",10000);
    //n = NetAddr("127.0.0.1",34651);
    OSCFunc({|msg| msg.postln; Synth.new(\kick,[t:msg[1]]);},'/a');
)

(
SynthDef(\kick,{|t=1.5|
    var env = EnvGen.ar(Env([0,1,0],[0.02,t/33]),doneAction:2);
    var sig = SinOsc.ar(50!2,env**t*8pi)/4 + LFSaw.ar(49.9,0,env**0.92,mul:0.12) + ClipNoise.ar(env**t/8) * env;
    sig = Resonz.ar(sig,LFSaw.ar(t/4).range(50,5000),0.12)+sig/2;
    Out.ar(0,sig);
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
