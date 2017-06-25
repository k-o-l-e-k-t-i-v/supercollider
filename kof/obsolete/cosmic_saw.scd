/*
                         _      
  ___ ___  ___ _ __ ___ (_) ___ 
 / __/ _ \/ __| '_ ` _ \| |/ __|
| (_| (_) \__ \ | | | | | | (__ 
 \___\___/|___/_| |_| |_|_|\___|
*/

m=ProxySubmix.new(\test);

p.push();
p.bpm(120/2);

(
~saw.quant=8;
~saw.fadeTime=2;
~saw={
  var mod = Duty.kr(2/~tempo*[4,8,16],0,Dseq(1/[1,2,1.5,1,1/2,4,8]+1,inf)).lag(~tempo/16);
  var imp = Decay.ar(Impulse.ar(~tempo/4,(0..15)/16),4)**[2,4,8];
  var f = ([100,200,250]/mod/[1,1,1,1,1.5,1,1.3333,2,8]).poll-(imp*2);
  var sig = Blip.ar(f,LFSaw.ar(~tempo/4/fib(8)).exprange(2.01,8)) * imp;
  sig = CombN.ar(sig*imp,1/f,1/f,4)/16 + sig;
  sig = Resonz.ar(sig,imp*f+f,0.12) * LFNoise1.kr(~tempo*2!6) + sig;
  //sig = GVerb.ar(sig,[2,3,4]*10,mul:0.24)+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = LPF.ar(sig,1500);
  Splay.ar(sig.flat,0.25,0.75);
};
~saw.play;
//m.addMix(~saw,postVol:true);
);
~saw.stop(7);

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

(
~kick.quant=2;
~kick.fadeTime=8;
~kick={
  var imp = Pulse.ar(~tempo*4/fib(8));
  var sig = SinOsc.ar(50*(1.0001**(1..8)) + (imp*4),imp );
  sig = sig * imp;
  Splay.ar(sig.flat,0.25,0.125);
};
~kick.play;
//m.addMix(~kick,postVol:true);
);
~kick.stop(7);

(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig * (Pulse.ar(4/fib(8)) ** 2);
  Splay.ar(sig.flat,0.25,0.0025);
};
~hiss.play;
m.addMix(~hiss,postVol:true);
);
~hiss.stop(7);


(
~filt.quant=2;
~filt.fadeTime=2;
~filt={
  var sig = m.ar;
  sig = GVerb.ar(sig,100);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.04);
};
~filt.play;
);
~filt.stop(7);


