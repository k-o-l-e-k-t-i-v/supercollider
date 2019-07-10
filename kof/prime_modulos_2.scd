
97.33/90
~tempo.quant=16;
~tempo={125.43/120/4*3};

// once synth ///////////////////////////////////////

(
~once.ar(2);
~once.quant=16;
~once.fadeTime=0.2;
~once={
    var mod2 =Duty.kr((1..128).nthPrime*4/~tempo,0,Dseq( (2**(([0,5,7,12])/12) ),inf));
  var mod = Duty.kr((1..128).nthPrime*16/~tempo,0,Dseq([1,2,4,8],inf)) * mod2;
  var mel = Duty.kr((1..128).nthPrime*2/~tempo,0,Dseq([1,2,4,8,1.5,1.3333,1/2,1/4,1/8],inf));
  //         |       |       |       |       |
  var f = 432 * mod / ((((2..129).nthPrime)%((1..128).nthPrime))) / mel;//[150,133,200,1000];
  var sig = SinOsc.ar(f,mul:1/((1..128).nthPrime**0.5));
  var env = (Decay.ar(Impulse.ar(4/(1..128).nthPrime*~tempo),0.12*((1..128).nthPrime**0.25)) );
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig,0.75,0.15);
};
~once.play;
);
~once.stop(40);
~once.clear;
~once.pause;
~once.resume;

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
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.05);
};
~ff.play;
);
~ff.stop(40);
~ff.clear;

(2..21).nthPrime%(1..20).nthPrime
(3..22).nthPrime%(1..20).nthPrime
(4..23).nthPrime%(1..20).nthPrime
(5..24).nthPrime%(1..20).nthPrime
(6..25).nthPrime%(1..20).nthPrime
(7..26).nthPrime%(1..20).nthPrime

