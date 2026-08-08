p=ProxySpace.push(s);

//////////////////////////////////////////////////////
// feedback synth                                   //
// moog like synth                                  //
// OnePole ladder on feedback                       //
//////////////////////////////////////////////////////

(
~feedback.ar(2);
~feedback.quant=4;
~feedback.fadeTime=2;
~feedback={
    var freq = \freq.kr(55);
    var cutoff = \cutoff.kr(1200).lag(0.01);
    var res = \res.kr(3.0).lag(0.01); // Resonance amount (0 to 4)
    
    var sig = LFSaw.ar(freq) * 0.4;
    
    var fdbk = LocalIn.ar(1);
    
    var filterIn = tanh(sig - (res * fdbk));
    
    var a = LFSaw.kr([1,1,1/360]).range(0,2pi);
    var perl = Perlin3.kr(a[0].cos,a[1].sin,a[2].sin) / 10.0;
    var coef = exp(-2 * pi * (cutoff / SampleRate.ir())) + perl;
    
    var s1 = OnePole.ar(filterIn, coef);
    var s2 = OnePole.ar(s1, coef);
    var s3 = OnePole.ar(s2, coef);
    var s4 = OnePole.ar(s3, coef);
    
    LocalOut.ar(s4);
    
    (s4 * 0.6).dup;

    //Splay.ar(s4,0,0.25);
};
//~feedback.play;
);
~feedback.stop(4);
~feedback.clear;
~feedback.pause;
~feedback.resume;

(
Pbindef(\feedback,
    \freq, Pseq([36, 48, 36, 48, 60, 55, 48, 41].midicps, inf),
    \cutoff, Pseq([800, 2400, 4500, 1200, 3800, 220], inf),
    \res, Pwrand([3.0, 3.5, 3.8], [0.6, 0.3, 0.1], inf),
    \dur, Pseq([0.25, 0.25, 0.5, 0.25, 0.75, 0.25], inf)
).play;
)

Pbindef(\feedback, \freq, Pseq([36, 63, 55, 48, 72].midicps, inf));


~feedback.set(\res, 1.0, \cutoff, 1200);
~feedback.set(\freq, 110);
~feedback.set(\cutoff, 1500, \res, 3.5);
~feedback.stop();
