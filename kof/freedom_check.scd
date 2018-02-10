
p.push()
p.bpm(mouse)

~tempo = {MouseX.kr(0.5,2)};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2) * Pulse.ar(~tempo*2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// lala synth ///////////////////////////////////////

(
~lala.ar(2);
~lala.clock = p.clock;
~lala.quant=2;
~lala.fadeTime=4;
~lala={
  var sig = LFSaw.ar([500,250,750],mul:0.1) * Pulse.ar(~tempo/[5,9,7,2]/(1..9));
  Splay.ar(sig,0.5,0.005);
};
~lala.play;
);
~lala.stop(4);
~lala.clear;
~lala.pause;
~lala.resume;


