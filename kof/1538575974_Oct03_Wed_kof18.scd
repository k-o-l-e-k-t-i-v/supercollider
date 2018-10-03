

p.push();
~tempo={1}

(
    //s.latency=0.2;
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


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={
        var mod = Duty.kr(8,0,Dseq([1,2,1.5,1.33333,1,2,4,2],inf));
        var base = 432/mod;
        var f = (((0-4!10)).log2*.x(base))/(mod) + (((0+7!10).log2*.x(base))/mod) + SinOsc.kr([5,6,7]);
        var sig = SinOsc.ar(f,SinOsc.kr(1/[4,5,6])*2pi);
        sig = Perlin3.ar(LFTri.ar(1/16/[1,2,3]),LFTri.ar(f/[4,8,16]),sig+1*LFTri.ar(1/4/[4,5,6],mul:2)+LFTri.ar(1/64,mul:5));
        sig = sig * LFNoise2.kr(1/16!f.size);
        sig = LeakDC.ar(sig);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        sig = LPF.ar(sig,f);
        Splay.ar(sig,0.5,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume

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
