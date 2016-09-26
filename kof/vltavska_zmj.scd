



// perlin synth ///////////////////////////////////////

(
~perlin.ar(2);
~perlin.quant=[2,1/2];
~perlin.fadeTime=8;
~perlin={
  var t = LFSaw.ar([1/40,2,[50,150,75]]) * 200;
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = sig * Pulse.ar(4/[1,2,3,4]);
  Splay.ar(sig,0.95,0.75);
};
~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar([50,60]) * SinOsc.ar(2/[1,2,3,4]);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
~one2.ar(2);
~one2.quant=[2,1/2];
~one2.fadeTime=0.2;
~one2={
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60+(env**40*80),env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.95,0.95);
};
~one2.play;
);
~one2.stop(4);
~one2.clear;
~one2.pause;
~one2.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=8;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};


  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
 // sig = CombN.ar(sig,1/50*mod,1/500*mod,16)*LFSaw.ar(1/4/[1,2,3,4])+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.5,0.65);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~beat.ar(2);
    ~beat.quant=[2,1/2];
    ~beat.fadeTime=2.02;
    ~beat={
        var mod = [-1,0.25,-0.25,1/8,1/16] * 4;
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.35);
    };
    ~beat.play;
);
~beat.stop(7);
~beat.clear;



p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(30)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/violin.wav");

// player synth ///////////////////////////////////////

(
    ~viol.ar(2);
    ~viol.quant=[2,1/2];
    ~viol.fadeTime=16.02;
    ~viol={
        var mod = [1,1.3333,1.5,2]/1.333333335;
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/4000/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4) * SinOsc.ubar(1/4/[1,2,3,4]);
    sig = CompanderD.ar(sig,3/4,1,1/2);
    Splay.ar(sig.flat,0.5,0.15);
    };
    ~viol.play;
    ~ff.rebuild;
);
~viol.stop(7);
~viol.clear;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(500!2),
  LFSaw.ar(150!2),
  WhiteNoise.ar(0.2!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
