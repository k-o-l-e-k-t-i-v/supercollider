(
{
p.disconnect();
1.wait;
p.push();
1.wait;
p.bpm(120);
1.wait;
TempoClock.default = p.clock;
}.fork
)


start

// perlin_trig synth ///////////////////////////////////////

(
  ~perlin_trig.ar(2);
  ~perlin_trig.clock = p.clock;
  ~perlin_trig.quant=2;
  ~perlin_trig.fadeTime=4;
  ~perlin_trig={
    var t = LFTri.ar([1,1/500,1/4]*~tempo);// + LFSaw.ar(1/50);
    var sig = SendTrig.kr(Impulse.kr(~tempo*LFTri.ar(1/50,mul:8)),{Perlin3.kr(t[0],t[1],t[2]).range(0,1000)});
//Pulse.ar(~tempo) * SinOsc.ar(15000!2,mul:0.05);  
0;
};
  //~perlin_trig.play;
);
~perlin_trig.stop(4);
~perlin_trig.clear;
~perlin_trig.pause;
~perlin_trig.resume;
(
  //m = NetAddr("127.0.0.1", 7000);

  // output triggers
  o = OSCFunc({ arg ...args;
               args.postln;
               File.use("/tmp/mplayercontrol".standardizePath,"wb",{|f| f.write("seek 2 "++args[0][3]++"\n"); });
               //m.sendMsg("/trig",args[0][3]);

              },'/tr', s.addr);
)


(
  o = OSCFunc({ arg ...args;
    var deviation = (p.clock.beats.round(1) - p.clock.beats.round(0.01));
    var beatNo =  p.clock.beats.round(1);
    

  },'/tr',s.addr);
)
