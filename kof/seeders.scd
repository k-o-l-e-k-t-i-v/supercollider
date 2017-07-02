

p.push();
p.bpm(90);

// resseds synth ///////////////////////////////////////

(
    ~resseds.ar(2);
    ~resseds.clock = p.clock;
    ~resseds.quant=16;
    ~resseds.fadeTime=4;
    ~resseds={
        var mod = Duty.kr(12*(1..12)/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var sig = [] ++ WhiteNoise.ar(0.4!6) ++ BrownNoise.ar(0.2!6) + Crackle.ar(1.9!6);
        sig = sig + Formant.ar(WhiteNoise.ar(1!4).range(50,5000).round(50)/mod,500/mod,500/mod,mul:0.4);
        RandSeed.kr(Impulse.kr(LFTri.kr(~tempo/16/(1..12)).exprange(1/4000,500/(1..12))),LFSaw.kr(~tempo/1600).range(1,80));
        sig = BPF.ar(sig,15000/[1,2,1.5,8,16,1.5,1.3333,1.66666666667]/mod,LFTri.ar(~tempo/16/(1..12)).range(0.001,0.2));
        sig = CompanderD.ar(sig,3/4,1/2,1);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        sig = LPF.ar(sig,1500) * (LFTri.ar(~tempo/4/(1..12))**1.9);
        sig = AllpassN.ar(sig,~tempo/4/(1..12)*mod,~tempo/4/(1..12)*mod,1.5);
        Splay.ar(sig,0.15,0.92);
    };
    ~resseds.play;
);
~resseds.stop(4);
~resseds.clear;
~resseds.pause;
~resseds.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(40,env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


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
        fx = DWGReverbC1C3.ar(NumChannelsC1C3.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
