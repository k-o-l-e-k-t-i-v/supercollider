
s.reboot;
p.push()


p.bpm(121)

// per synth ///////////////////////////////////////

(
~per.ar(3);
~per.quant=4;
~per.fadeTime=0.1;
~per={
    var detune = SinOsc.ar(~tempo/32/[1,1.01,1.0001,1.00001])/16;
    var cc = SinOsc.ar(~tempo.kr/[4,16]/16,add:~tempo.kr,mul:detune);
    var f = [64,65].midicps + (cc/10000.0);
    var t = SinOsc.ar([cc[1],cc[0],f/2]);
    var prl = Perlin3.ar(t[0],t[1],t[2]);
    prl;
};
//~per.play;
);
~per.stop(4);
~per.clear;
~per.pause;
~per.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    
  var sig = SinOsc.ar(~tempo/([1,2,4,8,16,32]),~per.ar*2pi);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
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
