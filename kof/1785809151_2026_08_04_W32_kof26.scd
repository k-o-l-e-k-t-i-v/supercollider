s.boot;
p=ProxySpace.push();

m = ProxyMixer(p, 12);
    m.parent.alwaysOnTop_(true);

~tempo = {1/0.432};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=2;
~one={
  var beat = 0.432*[4,3,2,1]);
  var sig = SinOsc.ar([50,60],Pulse.ar(beat);
  sig = sig * Decay.ar(Impulse.ar(beat),LFNoise1.kr(~tempo/4).range(0.1,1));
  Splay.ar(sig,1,0.5);
};
~one.play;
);


// all filter ///////////////////////////////////////

(
~all.quant=24;
~all.fadeTime=1;
~all={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\all){sig=sig++p.[n.asSymbol];}};

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,0.432*20,0.432*[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(GVerb.ar(NumChannels.ar(sig,2),90,3),2000)/2+sig;
  Splay.ar(sig,0.0,0.25);
};
~all.play;
);
~all.stop(7);
~all.clear;

~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=24;
~two.fadeTime=2;
~two={
  var detune = SinOsc.kr(~tempo/[7,5,3,1],mul:2.0);
  var chrods = Duty.kr(~tempo*4,0,Dseq([[1,5,8],[1,5,7],[1,5,6],[1,5,11]],inf));
  var mel = Duty.kr(~tempo/4,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = VarSaw.ar(300+detune*mel/(2**(chords/12+1))) * LFSaw.ar(0.432/[4,2,1]);
  sig = LPF.ar(sig,900)/4+sig;
  sig = Compander.ar(sig,~one.ar,0.1,1,0.1,0.002,0.3);
  Splay.ar(sig,0,0.75);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

// three synth ///////////////////////////////////////

(
~three.ar(2);
~three.quant=24;
~three.fadeTime=2;
~three={
  var beat = 0.432/4/[1,2,3,4]];
  var sig = LFSaw.ar([300,1200,beat],mul:2pi);
  sig = Perlin3.ar(sig[0].cos,sig[1].cos,sig[2].sin);

  sig = LeakDC.ar(sig);
  sig = sig * Decay.ar(Impulse.ar())
  sig = LPF.ar(sig,900);
  Splay.ar(sig,0.5,0.25);
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;
