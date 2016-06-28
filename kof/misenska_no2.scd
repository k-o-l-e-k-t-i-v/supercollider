


// lflfl synth ///////////////////////////////////////

(
~lflfl.ar(2);
~lflfl.quant=1;
~lflfl.fadeTime=8;
~lflfl={
  var sig = LFPulse.ar(4/[1,2,3,4,5,6,7]);
  Splay.ar(sig,0.05,0.85);
};
~lflfl.play;
);
~lflfl.stop(4);
~lflfl.clear;
~lflfl.pause;
~lflfl.resume;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/beat2.wav");

// player synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=2.02;
    ~one={
    var mod = 1;//[1,1.3333,1.5,2];
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/400/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    //sig = CombN.ar(sig,MouseX.kr(0.0001,1),MouseX.kr(0.0001,1),4);
    Splay.ar(sig.flat,0.5,0.25);
    };
    ~one.play;
);
~one.stop(10);
~one.clear;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/piano.wav");

// player synth ///////////////////////////////////////

(
    ~hel.ar(2);
    ~hel.quant=2;
    ~hel.fadeTime=2.02;
    ~hel={
        var mod =[1,1.3333,1.5,2];
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/400/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6) * LFSaw.ar(1/4/[1,2,3,4]);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    //sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2) * Pulse.ar(1);
    Splay.ar(sig.flat,0.5,0.05);
    };
    ~hel.play;
);
~hel.stop(17);
~hel.clear;

(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.quant=2;
~one2.fadeTime=0.2;
~one2={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**[8,10,20,40]*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~one2.play;
);
~one2.stop(15);
~one2.clear;
~one.pause;
~one.resume;


// lalala synth ///////////////////////////////////////

(
~lalala.ar(2);
~lalala.quant=2;
~lalala.fadeTime=0.05;
~lalala={
  var sig = Pulse.ar(1/8);// + (Pulse.ar(4/(1..8).nthPrime) * PinkNoise.ar(0.1));
  //sig = sig + (Pulse.ar(8/(1..8).nthPrime) * LFNoise2.ar(16000/(1..8)));
  Splay.ar(sig,0.5,0.95);
};
~lalala.play;
);
~lalala.stop(400);
~lalala.clear;
~lalala.pause;
~lalala.resume;

// puls synth ///////////////////////////////////////

(
~puls.ar(2);
~puls.quant=2;
~puls.fadeTime=0.2;
~puls={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFPulse.ar(8000/[1,2,1.3335,4]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~puls.play;
);
~puls.stop(4);
~puls.clear;
~puls.pause;
~puls.resume;

// simple synth ///////////////////////////////////////

(
~simple.ar(2);
~simple.quant=2;
~simple.fadeTime=5.2;
~simple={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar([1/1600,1/4,500]*[1,1.5,4,1.3333]) ** LFNoise2.ar(1/4!4).range(1,4) * 10;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) ** 2;
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~simple.play;
);
~simple.stop(4);
~simple.clear;
~simple.pause;
~simple.resume;


// duccct synth ///////////////////////////////////////

(
~duccct.ar(2);
~duccct.quant=2;
~duccct.fadeTime=0.2;
~duccct={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Dust.ar(14000) * 8;
  sig = LPF.ar(sig,[80,800,18000]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~duccct.play;
);
~duccct.stop(4);
~duccct.clear;
~duccct.pause;
~duccct.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  var dut = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};
  

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombC.ar(sig,1/150*dut,1/150*dut,4)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(70);
~ff.clear;



// finalize synth ///////////////////////////////////////

(
~finalize.ar(2);
~finalize.quant=2;
~finalize.fadeTime=0.2;
~finalize={
  var duty = Duty.kr(8,0,Dseq([1,2,1.5,1.3333],inf)).lag(1);
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(100/duty) * LFPulse.ar(2/[1,3,4,4]);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~finalize.play;
);
~finalize.stop(4);
~finalize.clear;
~finalize.pause;
~finalize.resume;



// guitar synth ///////////////////////////////////////

(
~guitar.ar(2);
~guitar.quant=2;
~guitar.fadeTime=0.2;
~guitar={
  var duty = Duty.kr(4,0,Dseq([1,2,1.5,1.3333],inf));
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pluck.ar(WhiteNoise.ar(0.4),imp,1/50/[1,2,3,4],1/50/[1,2,3,4]*duty,4);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~guitar.play;
);
~guitar.stop(4);
~guitar.clear;
~guitar.pause;
~guitar.resume;

Pluck.help

p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(30)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};
