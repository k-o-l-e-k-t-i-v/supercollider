s.reboot;
(

SynthDef(\playbuf_1, { |bufnum = 0, outbus = 0, amp = 0.5, loop = 0,
    pan = 0, rate = 1|
    var data;
    data = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 0, 0, loop);
    FreeSelfWhenDone.kr(data);
 //   data = CombN.ar(data,48000/51.2,48000/512,1/4);
    Out.ar(outbus, Pan2.ar(data, pan, amp));
}).add;
)

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
  )


  p.push();
