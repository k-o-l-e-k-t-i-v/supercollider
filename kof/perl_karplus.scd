




(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=16;
~one={
    var mar = TChoose.kr(Dust.kr([1/4,1/4,1/2,1/16]/16),[1,2,4,1/8,1/16]);
  var mod = Duty.kr(32,0,Dseq([1,2,1.5,1.3333],inf));
  var f = [150,500,1501,1500,3002,6001]/[4,2,1]/mod;
  var time = SinOsc.ar([1/2,1/8,4]) * [100,200,800] + LFSaw.ar(1/40/[40,400,4000],mul:8);
  var sig = Perlin3.ar(time[0],time[1],time[2]) * Decay.ar(Impulse.ar([1,2,3,4]/2 * mar),0.04);
  
  sig = LocalIn.ar(6) + sig;
  sig = DelayN.ar(sig,1/f,1/f*1.05);
  sig = LPF.ar(sig,f);
  LocalOut.ar(sig/LFTri.ar(1/24/[1,2,3,4]).exprange(1.00000001,1.1));
  
  sig = CompanderD.ar(sig,3/4,1,1/LFSaw.ar(1/40).range(1,10));
  //sig = AllpassN.ar(sig,1/200,1,1);

  Splay.ar(sig,0.45,0.95);
};
//~one.play;
);
~one.stop(32);
~one.clear;
~one.pause;
~one.resume;

// low synth ///////////////////////////////////////

(
~low.ar(2);
~low.quant=2;
~low.fadeTime=16;
~low={
  var sig = SinOsc.ar(50!2,mul:0.1) * LFTri.ar(1/8);
  Splay.ar(sig,0.5,0.25);
};
~low.play;
);
~low.stop(32);
~low.clear;
~low.pause;
~low.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = ~one.ar;
  //synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/50,1/50,0.2)/8+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/16 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/12!2).range(100,1800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/12!2).range(700,4900),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/12!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,3500]),3000)/4+sig/2;
  Splay.ar(sig,0.95,0.95);
};
~ff.play;
);
~ff.stop(32);
~ff.clear;
