

p.push();
p.bpm(90);



// stretch synth ///////////////////////////////////////

(
    ~stretch.ar(2);
    ~stretch.clock = p.clock;
    ~stretch.quant=4;
    ~stretch.fadeTime=0.2;
    ~stretch={
        var note = Duty.kr(32/~tempo,0,Dseq([60,55,58,57,58,57,63,69,84],inf));
        var mod1 = Duty.kr([4,8,16]*4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var mod2 = Duty.kr([4,8,16]*16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var sig =  SinOsc.ar([72,note,60].midicps /.x mod1 *.x mod2,Pulse.ar(~tempo/(1..8))) + WhiteNoise.ar(0.01!4);
        var per;
        var t = sig * Pulse.ar(~tempo*[1/4]/(1..8)) * SinOsc.kr(~tempo*2/500/(1..8)).exprange(1/32,1/4);
        t = PitchShift.ar(t, 0.15*(1..16).reciprocal, t.range(9.5/10,10/9.5));
        sig = Perlin3.ar(t[0],t[1],t[2]);
        sig = LPF.ar(sig,LFNoise1.kr(~tempo/16/(1..8)).range(200,15000));
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig);
        sig = Compander.ar(sig,~kick1.ar+~kick2.ar,0.1,1,0.1);
        Splay.ar(sig,0.5,0.0755);
    };
    ~stretch.play;
);
~stretch.stop(4);
~stretch.clear;
~stretch.pause;
~stretch.resume;


// kick1 synth ///////////////////////////////////////

(
~kick1.ar(2);
~kick1.clock = p.clock;
~kick1.quant=[16,0];
~kick1.fadeTime=0.02;
~kick1={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,5.75],[3,-3]),imp * hit);
    var sig = SinOsc.ar(50!2+(env**100*250),env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick1.play;
);
~kick1.stop(4);
~kick1.clear;
~kick1.pause;
~kick1.resume;


// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.clock = p.clock;
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.75],[3,-3]),imp * hit);
    var sig = SinOsc.ar(50!2+(env**0.2*50),env**200*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,1,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.5,0.005],[7,-7]),imp * hit);
    var sig = LPF.ar(GrayNoise.ar(0.5!4),[1,2,3,4]*1500+(env**1.2*1000));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

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

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
               var sig = In.ar([0,1]);
               var orig = sig;
               var fx;
               //fx = Limiter.ar(sig,0.95);
               sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
               fx = LPF.ar(sig,lp);
               fx = HPF.ar(fx,hp);
               fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
               sig = SelectX.ar(wet,[orig,fx]);
               sig = NumChannels.ar(sig,2);
               ReplaceOut.ar(0,sig);
              };
);
p.moveNodeToTail(\master);
