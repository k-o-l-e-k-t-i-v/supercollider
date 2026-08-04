

s.boot;
p = ProxySpace.push(s);
~tempo={0.432*4};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar(~tempo/[1,2,3,4]));
  sig = sig * (LFSaw.ar(~tempo/16)**2);
  sig = CombL.ar(sig,~tempo/4,~tempo/4,~tempo*3);
  Splay.ar(sig,1,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// master filter ///////////////////////////////////////

(
~master.quant=4;
~master.fadeTime=1;
~master={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\master){sig=sig++p.[n.asSymbol];}};

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(GVerb.ar(NumChannels.ar(sig,2),90,3),2000)/8+sig;
  Splay.ar(sig,0.5,0.25);
};
~master.play;
);
~master.stop(7);
~master.clear;
