p.push();
p.bpm(88.631);

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=4;
    ~one.fadeTime=0.02;
    ~one={
        var oct = Duty.kr([4,8,32]/~tempo,0,Dseq([4,8,4,2],inf)).lag(1/2);
        var mod = Duty.kr([4,8,16]/~tempo,0,Dseq([1,2,1.5,1.33333,2,15/8],inf)).lag(1/10);
        var f = 68.0583*oct/mod+SinOsc.kr(~tempo*4/[1,2,3,4],mul:1pi);
        var speed = ~tempo/16/[1,2,3,4];
        var in = LFNoise1.kr(speed!16).exprange(1/200/f,10/f);
        var out = LFNoise1.kr(speed!16).exprange(1/100/f,1/f);
        var shape = LFNoise1.kr(speed!16).exprange(0.91,8);
        var offsets = LFNoise1.kr(speed!16).range(0,2pi);
        var sig = Impulse.ar(f,offsets);
        sig = Decay2.ar(sig,in,out).sin**shape;
        sig = LeakDC.ar(sig);
        sig = sig.softclip(-0.75,0.75) * LFTri.kr(~tempo/4/[1,2,3,4]);
        sig = SinOsc.ar(f,Perlin3.ar(sig/2,sig/4,sig*8)+1*2pi);
        //sig = Resonz.ar(sig,f,2.2);
        sig = AllpassN.ar(sig,1/f,1/f,1);
        sig = LPF.ar(sig,f*2);
        Splay.ar(sig,1,0.05);
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
