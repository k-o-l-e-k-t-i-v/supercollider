


p.push();
p.bpm(87.4);

// one synth ///////////////////////////////////////

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

~tempo = {LFNoise1.kr(1/16).range(75/60,95/60)/2};

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var mod = Duty.kr(16*[1,2,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var base = Duty.kr(4*[1,2]/~tempo,0,Dseq([60,48,60,50,60,48+7],inf)).midicps.lag(1/4)/mod;
        var f = base + SinOsc.ar(~tempo*16/[1,2,3],mul:1pi);
        var sp = ~tempo*4+SinOsc.kr(~tempo/2).range(-0.075,0.075);
        var sig = LFPar.ar(f+(Pulse.ar(sp).abs*(f/4)),Pulse.ar(sp)*8pi);
        sig = sig * Pulse.ar(sp).clip(-0.95,0.95);
        sig = CombL.ar(sig,~tempo,1/2/f,~tempo/LFNoise2.kr(~tempo/16!2).range(1/4,4));
        sig = CompanderD.ar(BBandPass.ar(sig,f/mod*((2..9).log*4),0.2),3/4,1/LFNoise1.kr(~tempo!8).range(1/2,2),1);
        sig = Normalizer.ar(sig);
        sig = Compander.ar(sig,Pulse.ar(~tempo/[1,2,3]),0.1,1,0.1);
        sig = MoogFF.ar(sig,f*[1,2,4,8,64]+LFNoise2.kr(~tempo/32!5,mul:0.2),LFNoise2.kr(~tempo/4!3).range(1.5,3.5));
        Splay.ar(sig,0.5,0.75);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.95],[3,-3]),imp * hit);
  var sig = SinOsc.ar(33.midicps!2+(env**90*250),env*80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

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

