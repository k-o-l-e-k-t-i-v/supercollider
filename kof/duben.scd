p.push();
p.bpm(90/1.5);



(
    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        //fx = Limiter.ar(sig,0.95);
        //sig = CombN.ar(sig,1/24.midicps*mod,1/24.midicps*mod,3)*wet +sig;
        sig = Compander.ar(sig,3/4,1/1.05,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
    //    fx = Limiter.ar(fx);
        fx = DWGReverb3Band.ar(NumChannels.ar(fx,2),[5000,5010])/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)

// april synth ///////////////////////////////////////
(
~april.ar(2);
~april.clock = p.clock;
~april.quant=[16,0];
~april.fadeTime=0.02;
~april={
  //  |       |       |       |       |  
  var pat = [
    1,1,1,0, 1,0,0,0, 0,0,0,0, 1,1,1,1
  ].rotate(1);
  var mmod = Duty.kr(~tempo*64,0,Dseq([1,2,0.5,1.5],inf));
  var base = Duty.kr(~tempo*16*(1..6),0,Dseq([36,48,60,24].midicps,inf));
  var note = Duty.kr(~tempo*4*(1..6),0,Dseq( (base+[0,5,7,12,0,12,3,24]).midicps ,inf) ) / mmod;
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*(1..6)],[3,-3]),imp * hit);
  var sig = Formant.ar(note,note*2,LFNoise2.kr(~tempo/32!6).exprange(note,note/4)+(env**0.74/(1..6)*8pi));
  var perl = Perlin3.ar(sig[0]/10000,sig[1]/1000 + LFTri.kr(~tempo/100/(1..6)) ,sig/4);
  sig = sig * SinOsc.ar(note/1000) * perl;
  sig = CombN.ar(sig,~tempo*(1..6),~tempo*(1..6),32*~tempo);
  sig = sig * env;
  sig = LPF.ar(sig,8000);
  sig = CompanderD.ar(sig,3/4,1/2,2);
  Splay.ar(sig,0.65,0.5);
};
~april.play;
);
~april.stop(4);
~april.clear;
~april.pause;
~april.resume;


// kk synth ///////////////////////////////////////

(
~kk.ar(2);
~kk.clock = p.clock;
~kk.quant=[16,0];
~kk.fadeTime=0.02;
~kk={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(3);
  var base = Duty.kr(~tempo*32*(1..6),0,Dseq([36,48,60].midicps,inf));
  var note = Duty.kr(~tempo*16*(1..6),0,Dseq( (base+[0,5,7,3,1,12,24]).midicps ,inf) );
   var imp = PulseDivider.kr(~tick.kr,32);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1.002,8.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(note,0,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~kk.play;
);
~kk.stop(4);
~kk.clear;
~kk.pause;
~kk.resume;

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
