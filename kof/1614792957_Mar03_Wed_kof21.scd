

p.push();


s = ProxySpace.push();
~tempo={120/121.35}

// one synth ///////////////////////////////////////

(
~one.ar(2);
//~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=1;
~one={
    var puls = DelayL.ar(Pulse.ar(~tempo*24/[3,4,27,21]/4),1/4/~tempo,1/4/~tempo,2);
    var sig = SinOsc.ar(40+(puls.abs*[40,400,4000,14000]),puls) * puls.softclip;
  Splay.ar(sig,0.95,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;




(
~two.ar(2);
//~one.clock = p.clock;
~two.quant=24;
~two.fadeTime=125;
~two={
    var puls = Pulse.ar(~tempo*4/[2,3,4,12,27]);
    var sig = SinOsc.ar(4000+(puls.abs*40),puls) * puls.softclip;
  Splay.ar(sig,0.95,0.15);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
