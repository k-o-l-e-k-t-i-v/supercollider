



// one synth ///////////////////////////////////////

(
  ~one.ar(2);
  ~one.quant=2;
  ~one.fadeTime=1;
  ~one={
    var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
    var mod2 = Duty.kr(1/[4,3],0,Dseq([1,2,1.5,1.25],inf));
    var perl = Perlin3.ar(LFTri.ar(432/[1,1.5,4,8]/mod),LFTri.ar(1/432/[1,2,4/3,1.5]),LFTri.ar(1/4/[1,2,4/3,1.5]));
    var sig = LFPar.ar(432/[1,1.5,1.25,4/3]/mod) * LFSaw.ar(1/4/[1,2,3,4]) * (perl);
    sig = sig * LFSaw.ar(432.1*[1,2,4,8]/mod2);
    sig = sig + (Formant.ar(432/[1,1.5,1.25,4/3]/mod,432/[1,4/3,1.25,2]/mod2,432*[1,2,4,8]/mod2) * Pulse.ar(4/fib(8)));
    sig = sig.softclip * (LFSaw.ar(1/4/[1,2,3,4])**40);
    sig = Resonz.ar(sig,432/[1,2,4,8,0.25,0.125],0.12)*2.0+sig;
    sig = AllpassN.ar(sig,1/4,1,4) + sig;
    sig = LPF.ar(sig,1800);
    sig = CompanderD.ar(sig,3/4,1/3,1/2);
    Splay.ar(sig,0.95,0.25,SinOsc.kr([4.1,3.01]));
  };
  ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  p.clock.tempo_(60/60);

  ~offset = (0..7)/8;

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
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0,
      1,0,0,0,1,1,1,0,1,0,0,0,1,0,0,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50!2+(env**(50)*500));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// two synth ///////////////////////////////////////

~sel.quant=2;
~sel={LFTri.ar(1/8)};

(

  ~two.ar(2);
  ~two.quant=2;
  ~two.fadeTime=0.2;
  ~two={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      Pulse.ar(4),
      SinOsc.ar(5000,mul:0.1),
      LFNoise2.ar(5000),
      SinOsc.ar(50),
    ];
    sig = SelectX.ar(~sel.ar*sig.size,sig);
    sig = sig * env;
    Splay.ar(sig,0.75,0.25,SinOsc.kr(4));
  };
  ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

// ff filter ///////////////////////////////////////

(
  ~ff.quant=1;
  ~ff.fadeTime=1;
  ~ff={
    var synths = p.playingProxies;
    var high,mid,low;
    var sig = [];
    synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

    //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
    //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
    //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
    low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,1800)),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/4!2).range(400,4000),2),3/4,1/1.5,1/2);
    high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/8!2).range(100,15000)),3/4,1/1.25,1/2);
    //sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
    sig = []++low++mid++high;
    sig = LPF.ar(DWGReverb.ar(sig,4000),4000)/2+sig;
    Splay.ar(sig.flat,0.75,0.25);
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;  
