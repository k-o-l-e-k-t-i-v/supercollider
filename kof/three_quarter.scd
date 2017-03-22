


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.235,lp=3500,hp=250,len=0.333,rev = 15|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  //fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = CompanderD.ar(sig,2/3,1,1/33,1/44100*2,0.1);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

p.push();
p.bpm(240);



// ninety_threequarter synth ///////////////////////////////////////

(
~ninety_threequarter.ar(2);
~ninety_threequarter.clock = p.clock;
~ninety_threequarter.quant=[8,0];
~ninety_threequarter.fadeTime=4;
~ninety_threequarter={
  var sig = SinOsc.ar(50!2,Pulse.ar(~tempo/4/1.5)) * Pulse.ar(~tempo/4/1.5);
  Splay.ar(sig,0.5,0.27);
};
~ninety_threequarter.play;
);
~ninety_threequarter.stop(4);
~ninety_threequarter.clear;
~ninety_threequarter.pause;
~ninety_threequarter.resume;




// sixty_half synth ///////////////////////////////////////

(
~sixty_half.ar(2);
~sixty_half.clock = p.clock;
~sixty_half.quant=[8,3];
~sixty_half.fadeTime=0.02;
~sixty_half={
  var sig = SinOsc.ar(15000!2,Pulse.ar(~tempo/4)) * Pulse.ar(~tempo/4);
  Splay.ar(sig,0.15,0.2);
};
~sixty_half.play;
);
~sixty_half.stop(4);
~sixty_half.clear;
~sixty_half.pause;
~sixty_half.resume;

// bck synth ///////////////////////////////////////

(
~bck.ar(2);
~bck.clock = p.clock;
~bck.quant=8;
~bck.fadeTime=7;
~bck={
  var sig = SinOsc.ar([24,36,74,72,57,65,69].choose.midicps *.x [1,2,1/1.5,8]) *.x LFTri.kr(1/32/[1,5,76,8]);
  sig = Compander.ar(sig,[~ninety_threequarter.ar,~sixty_half] ,0.1,1,0.1,LFNoise2.kr(~tempo/43!12).range(1/10000,1/2.001),LFNoise2.kr(~tempo/32!12).range(1/10000,1.001));
  Splay.ar(sig,0.85,0.05);
};
~bck.play;
);
~bck.stop(4);
~bck.clear;
~bck.pause;
~bck.resume;


(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
