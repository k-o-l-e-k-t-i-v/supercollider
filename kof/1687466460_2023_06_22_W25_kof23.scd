


s.boot();


p=ProxySpace.push();



// mel synth ///////////////////////////////////////

(
~mel.ar(2);
~mel.quant=4;
~mel.fadeTime=1;
~mel={
    var base = LFSaw.ar(1/24).range(1,1+(2**([1,5,8]/12))) * 43.2;
    var overtones = 2**(1+(1/[1,3,[7,9,11]]));
    var x = LFSaw.kr(base/8*overtones).range(0,overtones*base);
    var y = overtones - x;
    var sig = LFSaw.ar([x,y,overtones+0.01]).range(0,2pi);
    sig = Perlin3.ar(sig[0].sin,sig[1].cos,sig[2].sin) + SinOsc.ar(base*overtones);
    sig = LeakDC.ar(sig);
    Splay.ar(sig,0.5,0.15);
};
~mel.play;
);
~mel.stop(4);
~mel.clear;
~mel.pause;
~mel.resume;
