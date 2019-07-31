

p.push
~tempo={100/120}

(
Tdef(\restore,{loop{~one.rebuild; 30.wait;}}).play;
Tdef(\restore2,{loop{~two.rebuild; 30.wait;}}).play;
Tdef(\restore3,{loop{~three.rebuild; 30.wait;}}).play;
)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=16;
~one={
    var f = {[48,60,36,55,72,63,65,48].midicps.choose *.x [1,2,1/2].choose}!3/[1,2,1/1.333333,1/1.5,1.5,1.3333333333].choose + SinOsc.kr([4,5,6]);
    var sig = Dust.ar(LFSaw.ar(~tempo/64!2).exprange(0.1,15000));
    var hrot = LFTri.kr(~tempo/64).exprange(0.01,0.9);
    sig = sig * Pulse.ar(~tempo);
    20.do{|i|
        sig = sig * LFTri.ar(~tempo/(i+1));
        sig = Resonz.ar(sig,LFSaw.ar(~tempo*(i+1)).range(f/1.1,f*1.1),hrot);
        sig = CombN.ar(sig,[1,1.02]/f,[1.01,1]/f,i+1/5);
        sig = Vibrato.ar(sig,i+[4,6,7],0.25);
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig);
    };
    Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// one synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=16;
~two={
    var f = {[48,60,36,55,72,63,65,48].midicps.choose *.x [1,2,1/2].choose}!3/[1,2,1/1.333333,1/1.5,1.5,1.3333333333].choose + SinOsc.kr([4,5,6]);
    var sig = Dust.ar(LFSaw.ar(~tempo/64!2).exprange(0.1,15000));
    var hrot = LFTri.kr(~tempo/64).exprange(0.01,0.9);
    sig = sig * Pulse.ar(~tempo);
    20.do{|i|
        sig = sig * LFTri.ar(~tempo/(i+1));
        sig = Resonz.ar(sig,LFSaw.ar(~tempo*(i+2)).range(f/1.1,f*1.1),hrot);
        sig = CombN.ar(sig,[1,1.02]/f,[1.01,1]/f,i+1/5);
        sig = Vibrato.ar(sig,i+[4,6,7],0.25);
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig);
    };
    Splay.ar(sig,0.95,0.25);
};
~two.play;
);

// one synth ///////////////////////////////////////

(
~three.ar(2);
~three.quant=2;
~three.fadeTime=16;
~three={
    var f = {[48,60,36,55,72,63,65,48].midicps.choose *.x [1,2,1/2].choose}!3/[1,2,1/1.333333,1/1.5,1.5,1.3333333333].choose + SinOsc.kr([4,5,6]);
    var sig = Dust.ar(LFSaw.ar(~tempo/64!2).exprange(0.1,15000));
    var hrot = LFTri.kr(~tempo/64).exprange(0.01,0.9);
    sig = sig * Pulse.ar(~tempo);
    20.do{|i|
        sig = sig * LFTri.ar(~tempo/(i+1));
        sig = Resonz.ar(sig,LFSaw.ar(~tempo*(i+3)).range(f/1.1,f*1.1),hrot);
        sig = CombN.ar(sig,[1,1.02]/f,[1.01,1]/f,i+1/5);
        sig = Vibrato.ar(sig,i+[4,6,7],0.25);
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig);
    };
    Splay.ar(sig,0.95,0.15);
};
~three.play;
);



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
