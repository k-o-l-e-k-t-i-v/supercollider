

p.push();
p.clear;

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=24;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    

~tempo = {121.35/120/2}

// vibrant synth ///////////////////////////////////////

(
~vibrant.ar(2);
~vibrant.quant=12;
~vibrant.fadeTime=0;
~vibrant={
    var sharp = LFTri.kr(~tempo/4*[1,4,16])+1.0001**8;
    var mod = Duty.kr([3,4,24]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var scale = LFSaw.kr(~tempo/24/[1,3,5,7]).range(1,10);
    var base = [24,36,72].midicps / (1/(1+(1..12))) * mod;
    var vibrant = Vibrato.ar((~tempo+(~tempo/(1..12).nthPrime*base)),[6,12,24],0.02,0.1,~tempo/[24,7,3])/scale +.x base;
    var sc = LFTri.ar(~tempo/240/[1,2,4]).exprange(0.0001,scale);
    var sig = [] ++ SinOsc.ar(vibrant) ++ SinOsc.ar(vibrant,pi);
    var lpf;
    sig = Perlin3.ar(sig[0]+1*sc,sig[1]+1*sc,LFTri.ar(~tempo/24/[2,3,4]) * Pulse.ar(~tempo*[4,3,1])) * Decay.ar(Impulse.ar(~tempo/2*[3,4,1/24]),(1..12)/sharp);
    //10.do{
    sig = AllpassN.ar(sig* (LFPulse.ar(~tempo/[2,4,5/4])+0.001),1/10/vibrant,1.5) + sig;
    //}
    sig = LeakDC.ar(sig);
    sig = Normalizer.ar(CompanderD.ar(sig,1/2,3/4,1)) + sig;
    lpf = LPF.ar(sig,[600,12500,15000,500]);
    sig = (RHPF.ar(sig,vibrant*[5/4,2,4],scale+1/1000)) - (lpf/2);
    //sig = GVerb.ar(sig * (LFPulse.ar(~tempo/[4,2,3])+0.0001),90,[6,7.5],0.15)/2 + lpf;
    //sig = LeakDC.ar(sig)/4;

    Splay.ar(sig,0.295,0.0129725,SinOsc.kr(~tempo/[1,3,7]));
};
~vibrant.play;
);
~vibrant.stop(4);
~vibrant.clear(60);
~vibrant.pause;
~vibrant.resume;
