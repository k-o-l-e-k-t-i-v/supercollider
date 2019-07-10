
p.push();


p.bpm(121.5)



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(45!2+(LFSaw.ar(~tempo*2/[1,2,3,4]).range(0,15)),Pulse.ar(~tempo*2/[1,2,3,4])*2pi);
    Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=4;
~two={
    var sig = LFSaw.ar([45,46,47,48]) * LFTri.ar(~tempo/[1,2,3,4]);
    sig = Resonz.ar(sig,[460,450]*[1,2,4,8],LFSaw.kr(~tempo/16/[1,1.5,3,4]).range(0.01,0.75) );
    sig = LPF.ar(sig,LFNoise1.kr(~tempo/16/[1,2,3,4]).range(500,15000)) * Pulse.ar(~tempo*2/[1,2,3,4]);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,0.15,0.75);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
    var sig = In.ar([0,1]);
    var orig = sig;
    var fx;
    //fx = Limiter.ar(sig,0.95);
    sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
    fx = LPF.ar(sig,lp);
    fx = HPF.ar(fx,hp);
    fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
    sig = SelectX.ar(wet,[orig,fx]);
    sig = NumChannels.ar(sig,2);
    ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
