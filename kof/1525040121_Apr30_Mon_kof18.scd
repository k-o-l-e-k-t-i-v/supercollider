

p.push();
p.bpm(105);


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var f = [3,5,7].octcps *.x (2**(1/[1,2,3,4]));
        var left = SinOsc.ar(1.5 * ~tempo);
        var right = SinOsc.ar(1.33375 * ~tempo);
        var slope = LFSaw.ar(~tempo) ** 2;

        var puls = Pulse.ar(LFDNoise1.kr(~tempo/32!8).lag(~tempo)**slope*16);
        var sig = SinOsc.ar(f,puls) * SinOsc.ar(f+[left,right]);
        sig = sig * puls;
        Splay.ar(sig,0.15,0.15,SinOsc.ar([left,right])*(-0.1));
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
