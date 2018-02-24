

p.push();
p.bpm(88)

// running_sheep synth ///////////////////////////////////////

(
~running.ar(2);
~running.clock = p.clock;
~running.quant=4;
~running.fadeTime=4;
~running={
    var cent = Duty.kr(16*[1,2,3]/~tempo,0,Dseq([102,306,600,804,1008]/1200,inf));
    var mod = Duty.kr(1/4*[1,2,3]/~tempo,0,Dseq([1,2,1.5,1.33333]/.x[1,2,4,8],inf));
  var sig = [] ++ Mix(VarSaw.ar(~tempo/[48000,4800,480]/.x(1+((1..8)/100000)))*10000) ++ SinOsc.ar(~tempo/16)/8 ++ SinOsc.ar(880/mod*cent).range(0,1/4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.75);
};
~running.play;
);
~running.stop(4);
~running.clear;
~running.pause;
~running.resume;
