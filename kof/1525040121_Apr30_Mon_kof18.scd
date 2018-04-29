

p.push();
p.bpm(89.5);


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=1;
    ~one={
        var f = [3,5,7].octcps *.x [1,2,4,8] *.x (1/[1,1.5,4/3]);
        var temp = ~tempo / (1..8);
        var left = SinOsc.ar(1.5 * ~tempo);
        var right = SinOsc.ar(1.33375 * ~tempo);
        var slope = LFSaw.ar(~tempo/(1..8)) + 1 ** 2 + 0.001;

        var puls = Pulse.ar(LFDNoise1.kr(~tempo/32!8).lag(1/600).clip(0.0001,0.9999).round(1/128)**slope*temp);
        var sig = SinOsc.ar(f,puls) * SinOsc.ar(f+[left,right]);
        sig = sig * puls;
        sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,1/2,1/1.5,1);
        sig = Limiter.ar(sig,0.9,0.001);
        Splay.ar(sig,0.75,0.15,SinOsc.ar([left,right])*(-0.991));
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
