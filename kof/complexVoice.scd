



p.push

Tuning.default(17)


Tdef(\reb,{loop{~stereo.rebuild;26.wait;}}).play();

// stereo synth ///////////////////////////////////////

(
~stereo.ar(2);
~stereo.quant=2;
~stereo.fadeTime=4;
~stereo={|freq=220|
    var sig;
    var chord = {[1,0.667419927,0.5,1.33334].choose}!3;
    var base = {([] ++ (freq * chord) ++ (freq / chord)).choose}!3 ;
    var des = SinOsc.ar(base/37/[11,12,9,7,3,6.7,4,7.6,8.55]);
    8.do{
base = ([] ++ base ++ (base * [1,1.5,2,0.667419927,1/1,1/1.5,1/2,1/0.66742]).choose).choose;
    };
  sig = LFTri.ar([[base-(des*0.9),base+(des*0.91)],[1/1200-(des*0.00301),1/1200+(des*0.003)],[1/600-(des*0.00073),1/600+(des*0.0007)]]) - (SinOsc.ar(base/chord,[des,des*(-1)]*2pi)+1/2) * (1/((1..19)**1.5));
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  sig = Normalizer.ar(sig) * Amplitude.ar(sig).lag(1/5);
  Splay.ar(sig,0.97,0.05,0,false);
};
~stereo.play;
);
~stereo.stop(4);
~stereo.clear;
~stereo.pause;
~stereo.resume;

0.667.reciprocal

48.midicps/55.midicps
48.midicps/60.midicps

