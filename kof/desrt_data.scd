




// oohne synth ///////////////////////////////////////

(
~oohne.ar(2);
~oohne.quant=2;
~oohne.fadeTime=20;
~oohne={
 // var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf));
  var freq = TChoose.kr(Impulse.kr(32!4),[50,500,50,75,1500,125,75,60]);
  var time = LFTri.ar(1/600) * LFTri.ar(1/400/[1,2,4]) * LFTri.ar(freq) ** 0.7333 * 2;
  var sig = Perlin3.ar(time[0],time[1],time[2]);
  sig = sig + Formant.ar(sig,time.range(5,75),5000);
  sig = sig + (Pulse.ar(4/(1..8).nthPrime)*Resonz.ar(sig,[50,75,150,15000]++freq.lag(1/16),0.2));
  //sig = sig + ((Resonz.ar(sig,50,0.4)-sig) / 20.0);
  sig = CompanderD.ar(sig,1/2,1/2,1/2);
  Splay.ar(sig,0.85,0.005);
};
~oohne.play;
~ff.rebuild;
);
~oohne.stop(40);
~oohne.clear;
~oohne.pause;
~oohne.resume;

// doung synth ///////////////////////////////////////

(
~doung.ar(2);
~doung.quant=2;
~doung.fadeTime=20;
~doung={
  var m = LFTri.ar(1/4/(16..22))**2*[2,4,1.5,3,4/1.5,8/1.5].scramble;
  var sig = Formant.ar(50,50+(m*m),50+(m*m*m));
  sig = sig * m;
  sig = sig.softclip;
  Splay.ar(sig,0.85,0.55);
};
~doung.play;
);
~doung.stop(40);
~doung.clear;
~doung.pause;
~doung.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=15;
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
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(30);
~ff.clear;
