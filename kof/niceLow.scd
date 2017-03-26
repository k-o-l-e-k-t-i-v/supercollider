

p.push();
p.bpm(90);



// stretch synth ///////////////////////////////////////

(
    ~stretch.ar(2);
    ~stretch.clock = p.clock;
    ~stretch.quant=4;
    ~stretch.fadeTime=0.2;
    ~stretch={
        var sig =  VarSaw.ar([48,69,60].midicps/[1]*.x[1,1/8],0,Pulse.kr(~tempo/(1..8))) + WhiteNoise.ar(0.01!4);
        var per;
        var t = sig * Pulse.ar(~tempo/[1/2,1.5,1]/(1..8)) * SinOsc.kr(~tempo*2/500/(1..8)).exprange(1/32,1/4);
        t = PitchShift.ar(t, 0.15*(1..16).reciprocal, t.range(9.5/10,10/9.5));
        sig = Perlin3.ar(t[0],t[1],t[2]);
        sig = LPF.ar(sig,LFNoise1.kr(~tempo/16/(1..8)).range(200,15000));
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig);
        Splay.ar(sig,0.5,0.155);
    };
    ~stretch.play;
);
~stretch.stop(4);
~stretch.clear;
~stretch.pause;
~stretch.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
               var sig = In.ar([0,1]);
               var orig = sig;
               var fx;
               //fx = Limiter.ar(sig,0.95);
               sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
               fx = LPF.ar(sig,lp);
               fx = HPF.ar(fx,hp);
               fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
               sig = SelectX.ar(wet,[orig,fx]);
               sig = NumChannels.ar(sig,2);
               ReplaceOut.ar(0,sig);
              };
);
p.moveNodeToTail(\master);
