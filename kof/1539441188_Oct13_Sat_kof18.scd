


var x,y,z;
(
OSCdef.newMatching(\test,{|msg,a,b,c| msg.postln;~one.set(\x,msg[1]);~one.set(\y,msg[2]);~one.set(\z,msg[3])},'/accelerometer');
)

s.latency=0.2;
p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={|x,y,z|
  var sig = Perlin3.ar(SinOsc.ar(50)*x,y*100,z*100);
  sig = Resonz.ar(sig,x.range(50,5000),0.2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
