p.push();
p.bpm(72);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=2;
~one={
    var driver = LFTri.ar(~tempo/4/[1,2.019,4.01],mul:2pi);
    var scale = 2.0pi;
    var mid = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) * 5;
    var phase = Perlin3.ar(cos(driver)*scale,sin(driver)*scale,tanh(driver)*scale);
    var sig = SinOsc.ar(49.95 * 6 * ([1,mid,8]/12**2+1) ,phase*2pi);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(7);
~one.clear;
~one.pause;
~one.resume;
