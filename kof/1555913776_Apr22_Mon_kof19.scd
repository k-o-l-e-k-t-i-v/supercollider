


p.push();
(
    var target = 90.25;
    x=(120/target*16);
    p.bpm(target);
)

(
    Tdef(\mel,{loop{ ~oneone.rebuild; (x*4).sleep;  }}).play;
    Tdef(\mel2,{loop{ ~onetwo.rebuild; (x*8).sleep;  }}).play;
    Tdef(\mel3,{loop{ ~onethree.rebuild; (x*16).sleep;  }}).play;
);

(
Tdef.gui;

)

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(30);};});
}.fork;  
)


// oneone synth ///////////////////////////////////////

(
    ~oneone.ar(2);
    ~oneone.quant=4;
    ~oneone.fadeTime=6;
    ~oneone={
        var base = {(337 / [1,1.5,2] *.x [8,2,1,1.25,4/3,16] /.x [1,2,1.5,4/3,15/8,4,8,16]).choose!3} + SinOsc.kr([4,5,6]/16);
        var sig = SinOsc.ar(base/2,SinOsc.kr(LFNoise1.kr(base/500.13).range(0,1)));
        var struct = Perlin3.ar(SinOsc.ar(~tempo/16/(1..sig.size))+1,SinOsc.ar(base/1000)+1,SinOsc.ar(base/32)+1);
        sig = sig + struct * (SinOsc.kr(base/10000/(1..base.size))+1/2);
        sig = MoogVCF.ar(sig,base*2,LFNoise1.kr(~tempo!3).range(0.01,0.99));
        Splay.ar(sig.flatten,0.25,0.5);
    };
    ~oneone.play;
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;



// oneone synth ///////////////////////////////////////

(
    ~onetwo.ar(2);
    ~onetwo.quant=4;
    ~onetwo.fadeTime=6;
    ~onetwo={
        var base = {(337 / [1.5,2,4/3] *.x [8,2,1,1.25,4/3,16] /.x [1,2,1.5,4/3,15/8,4,8,16]).choose!3} +SinOsc.kr([4,5,6]*1.001/16);
        var sig = LFSaw.ar(base/2,SinOsc.kr(LFNoise1.kr(base/500.13).range(0,1)));
        var struct = Perlin3.ar(SinOsc.ar(~tempo/16/(1..sig.size))+1,SinOsc.ar(base/1000)+1,SinOsc.ar(base/16)+1);
        sig = sig + struct * (SinOsc.kr(base/10000/(1..base.size))+1/2);
        sig = MoogVCF.ar(sig,base*2,LFNoise1.kr(~tempo!3).range(0.01,0.99));
        Splay.ar(sig.flatten,0.05,0.5);
    };
    ~onetwo.play;
);
~onetwo.stop(4);
~onetwo.clear;



// oneone synth ///////////////////////////////////////

(
    ~onethree.ar(2);
    ~onethree.quant=4;
    ~onethree.fadeTime=6;
    ~onethree={
        var base = {(337 * 4 *.x [8,2,1,1.25,4/3,16] /.x [1,2,1.5,4/3,15/8,4,8,16]).choose!3} +SinOsc.kr([4,5,6]);
        var sig = SinOsc.ar(base/2,SinOsc.kr(LFNoise1.kr(base/500.13).range(-pi,pi)));
        var struct = Perlin3.ar(SinOsc.ar(~tempo/16/(1..sig.size))+1,SinOsc.ar(base/1000)+1,SinOsc.ar(base/4)+1/4);
        sig = sig + struct * (SinOsc.kr(base/10000/(1..base.size))+1/2);
        sig = sig * Pulse.ar(~tempo*2/[1,2,3,4]);
        sig = MoogVCF.ar(sig,base*2,LFNoise1.kr(~tempo!3).range(0.01,0.99));
        Splay.ar(sig.flatten,0.25,0.05);
    };
    ~onethree.play;
);
~onethree.stop(4);
~onethree.clear;
~oneone.pause;
~oneone.resume;



(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.5,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        //fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        fx = CombN.ar(sig,8/~tempo,4/~tempo,16/~tempo);
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        sig = HPF.ar(sig,22);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
