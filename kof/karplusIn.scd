
Coyote.help

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/violin.wav");

// player synth ///////////////////////////////////////

(
    ~sss.ar(2);
    ~sss.quant=2;
    ~sss.fadeTime=2.02;
    ~sss={
        var mod = 1/[1,1.3333,1.5,2];
    var trate, dur, clk, pos, pan,sig;
    trate = 120;
    dur = BufDur.kr(b) / trate;
    clk = Impulse.kr(trate);
    pos = LFSaw.ar(1/40/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.01, clk);
    pan = WhiteNoise.kr(0.6);
    sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
    //sig = sig * (LFTri.ar(1/16/[1,2,3,4])**4);
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.5,0.25);
    };
);
~sss.stop(7);
~sss.clear;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=1/2;
~one={
  var sig = AudioIn.ar([1,2]);
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.3333],inf)).lag(1/4);
  var d = LFSaw.kr(1/16/[1,2,3,4]).range(50,15000);
  sig  = sig * Decay.ar(Impulse.ar(2/[1,2]),1/20);

 sig = sig + LocalIn.ar(4);
  sig = LPF.ar(sig,LFTri.kr(1/13/[1,2,3,4]).range(150,16000)) * (LFTri.ar(1/6/[1,2,3,4])**0.7);  
  sig = DelayN.ar(sig,1/d,5/d*[1/2,2,4,8]);
  
  //sig = PitchShift.ar(sig,1/d,0.999995);
  LocalOut.ar(Limiter.ar(sig));
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
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


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**10*7pi) + PinkNoise.ar(env**10);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);1
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1/[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05*[1,2,4,8]],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(env**0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

 // sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,1800)),2/3,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,5000),0.5),2/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),2/3,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.75,0.05);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;







