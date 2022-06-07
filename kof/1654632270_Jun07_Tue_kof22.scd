

p.push();

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=24;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

~tempo = {121.35/120/3}

// vibrant synth ///////////////////////////////////////

(
~vibrant.ar(2);
~vibrant.quant=6;
~vibrant.fadeTime=0;
~vibrant={
    var mod = Duty.kr([4,3,2,8]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var scale = LFSaw.kr(~tempo/24*[1,3,5,7]).range(1,10);
    var base = [24,36,72].midicps / (1/(1+(1..12))) * mod;
    var vibrant = Vibrato.ar((~tempo+(~tempo/(1..12).nthPrime*base)),[6,12],0.02,0.1,~tempo/24)/scale +.x base;
    var sc = LFTri.ar(~tempo/4/[1,2,3,4]).exprange(0.001,scale);
    var sig = [] ++ SinOsc.ar(vibrant) ++ SinOsc.ar(vibrant,pi);
    sig = Perlin3.ar(sig[0]+1*sc,sig[1]+1*sc,LFTri.ar(~tempo/24) * Pulse.ar(~tempo*[4,3,2,1])) * Decay.ar(Impulse.ar(~tempo/2*[3,4]),(1..12)/6);
    //10.do{
    sig = AllpassN.ar(sig,base/100,1.5) * LFPulse.ar(~tempo*[2,4,5/4,16]) + sig;
    //}
    sig = [] ++ LPF.ar(sig,[60,5000,16000,50]) ++ Resonz.ar(sig,vibrant,scale+1/10);
    sig = (GVerb.ar(Mix(sig),60,3,0.5) * LFPulse.ar(~tempo/[1,5/4])/1000) + sig;

    Splay.ar(sig,0.995,0.5,SinOsc.kr(~tempo*[1,3,7])/4);
};
~vibrant.play;
);
~vibrant.stop(4);
~vibrant.clear(60);
~vibrant.pause;
~vibrant.resume;
