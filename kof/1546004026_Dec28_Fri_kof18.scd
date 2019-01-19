(
    SynthDef(\playbuf_1, { |bufnum = 0, outbus = 0, amp = 0.5, loop = 0,
        pan = 0, rate = 1.0|
        var data;
        data = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 0, 0, loop);
        FreeSelfWhenDone.kr(data);
        Out.ar(outbus, Pan2.ar(data, pan, amp));
    }).store;
)

p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var cad = (2..8).log2;
  var sig = Shaper.ar(0,(LFSaw.ar(29.98126)+LFSaw.ar(1)).wrap);
    //var sig = SinOsc.ar(500/(2..8).log2,Shaper.ar(0,LFTri.ar(110/(2..8).log2)/(8..2).log2+LFTri.ar(cad) )*2pi);
  sig = LeakDC.ar(sig);
  sig = PitchShift.ar(sig,1/3,1/4);
  //sig = Normalizer.ar(sig);
  sig = LPF.ar(sig,16500);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=150,len=10,rev = 3|
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
