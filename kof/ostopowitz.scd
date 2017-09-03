

p.push();
p.bpm(120);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)

// varkick synth ///////////////////////////////////////

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


(
~varkick.ar(2);
~varkick.clock = p.clock;
~varkick.quant=[8,0];
~varkick.fadeTime=0.02;
~varkick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,8],[3,-3]*LFNoise2.kr(1/64,mul:2)),imp * hit)};
  var sig = VarSaw.ar(30+(env**100*20),LFSaw.kr(~tempo/16/[1.011,2.011,3.011,4.01])/20,env**50*pi+(env**0.32*1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95,SinOsc.ar(~tempo*4));
};
~varkick.play;
);
~varkick.stop(60);
~varkick.clear;
~varkick.pause;
~varkick.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[8,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(30!2+(env**20*80)+BrownNoise.ar(env**10!2),env**50*8pi);
  sig=  SinOsc.ar(30.1,env**0.92*8pi) * sig + PinkNoise.ar(0.95*(env**80));
  sig = LPF.ar(sig,900);
  sig = CombN.ar(sig,~tempo/4,~tempo/4,2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// neutorn synth ///////////////////////////////////////

(
~neutorn.ar(2);
~neutorn.clock = p.clock;
~neutorn.quant=2;
~neutorn.fadeTime=4;
~neutorn={
  var seek = VarSaw.ar([48000/1024,[50.002,100.0003,150.023,75.0345]+LFNoise2.kr(1/320!4,mul:pi),1/1000],mul:[1/5000,LFTri.ar(1/(1..4)/16).range(0,[0.71,0.71,0.2,0.1]),4]) + 1;
  var sig = Perlin3.ar(seek[0],seek[1],seek[2]);
  sig = SinOsc.ar([4,5,6],sig*2pi);// * SinOsc.ar(sig.range(5,1/500),sig**0.2*1pi);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.15,0.05);
};
~neutorn.play;
);
~neutorn.stop(4);
~neutorn.clear;
~neutorn.pause;
~neutorn.resume;

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
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig.softclip;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = BBandPass.ar(sig,16000/8*(1..8),0.2,mul:LFNoise2.kr(1/16!8));
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
// roatate synth ///////////////////////////////////////
// hasher synth ///////////////////////////////////////

(
~hasher.ar(2);
~hasher.clock = p.clock;
~hasher.quant=8;
~hasher.fadeTime=4;
~hasher={
  var sig = VarSaw.ar(5000/[1,2,4],mul:0.1) * Pulse.ar(~tempo*4/[1,2,3]);
  for(1,6,{|i| sig = sig ++ CombN.ar(sig/4 * Pulse.ar(i),1/16*i,1/16*i,4)});
  sig = SelectX.ar(LFTri.ar(~tempo/4/[1,2,3,4]).range(0,sig.size),sig);
  Splay.ar(sig,0.5,0.015,SinOsc.kr(7));
};
~hasher.play;
);
~hasher.stop(4);
~hasher.clear;
~hasher.pause;
~hasher.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// simple synth ///////////////////////////////////////

(
~simple.ar(2);
~simple.clock = p.clock;
~simple.quant=[4,1];
~simple.fadeTime=4;
~simple={
    var mod = Duty.kr(8/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var pos = LFSaw.ar(~tempo/(1..16)).exprange(15000.00,50);
  var sig = BPF.ar(Dust.ar(pos),pos,LFNoise2.ar(~tempo!16).range(0.01,0.4));
  RandSeed.kr(Impulse.ar(pos/100),123);
  sig = Normalizer.ar(sig) * Pulse.ar(~tempo/[1,2,3]*.x[1,1.5,2,3]).softclip;
  sig = SinOsc.ar(sig.range(5,5000).round(250/mod) ,sig*(1/8)*pi,mul:0.3) * Pulse.ar(~tempo/[1,2,3]*.x[1,1.5,2,3]).softclip;
  sig = CompanderD.ar(LPF.ar(sig,15000) + (sig/10),3/4,1/2,1);
  sig = CombN.ar(sig,~tempo/2,~tempo/2,4);
  Splay.ar(sig,0.665,0.015,SinOsc.kr(7.1));
};
~simple.play;
);
~simple.stop(4);
~simple.clear;
~simple.pause;
~simple.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
    var mod1 = LFNoise2.kr(~tempo/32!3).range(0.5,1.5);
    var mod2 = LFNoise2.kr(~tempo/32!3).range(0.5,1.5);
    var f = TChoose.kr(Impulse.kr(~tempo/16/[1,2,3]),[1000,500,250,125,2000,3000,1500,150,100]) + SinOsc.kr([4,5,50]).range(-1pi,1pi);
    var l = LFNoise2.kr(~tempo/[1,2,3]/16) * 4;
  var sig = Pulse.ar(~tempo*4/[1,2,3]).softclip;
  var env = Decay.ar(sig,l);
  sig= CombN.ar(sig,mod1/f,mod2/f,l)/4+sig;
  sig = RLPF.ar(HPF.ar(sig,50),f,SinOsc.kr(1/16).range(0.1,0.5)) * LFTri.kr(~tempo/16/[1,2,3]);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(40);
~one.clear;
~one.pause;
~one.resume;



(
~roatate.ar(2);
~roatate.clock = p.clock;
~roatate.quant=2;
~roatate.fadeTime=4;
~roatate={
    var t = SinOsc.ar(75/[1,2,1.5,1.333334]).range(0,2pi) * LFTri.ar(1/500).range(1/4,4);
    var x = t.cos;
    var y = t.sin;
    var z = 0;
    var angle = LFSaw.ar(1/32).range(0,8pi);
    var nx = (angle.cos * x) - (angle.sin * y);
    var ny = (angle.sin * x) - (angle.cos * y);
    var nz = (angle.sin * x) - (angle.sin * y);
    var sig = Perlin3.ar(nx,ny,nz);
  Splay.ar(sig,0.5,0.25);
};
~roatate.play;
);
roatate.stop(4);
~roatate.clear;
~roatate.pause;
~roatate.resume;
// xxx synth ///////////////////////////////////////

(
    ~xxx.ar(2);
    ~xxx.clock = p.clock;
    ~xxx.quant=8;
    ~xxx.fadeTime=4;
    ~xxx={
        var te = ~tempo/[1.5,3,4,8];
        var f = SinOsc.ar([1/100,50,1/250]).range(0,1/2);
        var sig = SinOsc.ar((Perlin3.ar(f[0],f[1],f[2])*500*[1,2,3,4]),Pulse.ar(te)) * Pulse.ar(te);
        sig = CombL.ar(sig,1/5,1/50,2);
        sig = RLPF.ar(sig,500,0.2);
        Splay.ar(sig,0.5,0.05);
    };
    ~xxx.play;
);
~xxx.stop(4);
~xxx.clear;
~xxx.pause;
~xxx.resume;

// lombardia synth ///////////////////////////////////////

(
~lombardia.ar(2);
~lombardia.clock = p.clock;
~lombardia.quant=16;
~lombardia.fadeTime=4;
~lombardia={
    var tonic =  Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var f = [60,48,84].midicps / Duty.kr([4,8,16]/~tempo,0,Dseq([1,2,1.5,1.33333,1,2,1.5,1.666666,1,2,4,1/2],inf)).lag(1) * 2 + SinOsc.ar([10,11,12],mul:pi);
    var mod = 1.5;
  var sig = LFSaw.ar([48000/256,f/tonic,48000/4]/mod).range(0,2pi).sin + 1 / 2 + LFSaw.ar(1/60,mul:4);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) ** LFNoise1.ar(1!3).range(0.6,2.5);
  sig = SinOsc.ar(f/16.013/mod,sig*2pi) * CombN.ar(LFTri.ar(~tempo / 4 / [1,2,3]),~tempo,~tempo,4);
  sig = BMoog.ar(sig,f*4.001/mod,LFNoise2.kr(1/15!4).range(0.1,0.9));
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.05);
};
~lombardia.play;
);
~lombardia.stop(4);
~lombardia.clear;
~lombardia.pause;
~lombardia.resume;



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/stetson.wav");

// player synth ///////////////////////////////////////

(
    ~hob.ar(2);
    ~hob.quant=2;
    ~hob.fadeTime=2.02;
    ~hob={
        var mod = 1;//[4,2,1.5];
        var spread = 0.01;
        var pos = TRand.kr(Impulse.kr(~tempo/[1,2,3]),0.01,10) + LFSaw.ar(1/160/[1,2,3]);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[3.5,1.005],[-3,-2],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.0001),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        //sig = BPF.ar(sig,[500,250,125],LFTri.ar(~tempo/[1,2,3]).exprange(0.01,0.5)) + (sig/2);
        sig = CompanderD.ar(sig,3/4,1/[1.1,1.5,2],1);
        sig = Compander.ar(sig,~puls.ar,0.1,1,0.1);
        sig = LPF.ar(sig,1500);
        Splay.ar(sig.flat,0.5,0.25);
    };
    ~hob.play;
    ~hob[10] = \filter -> {|sig| DWGReverbC1C3.ar(NumChannels.ar(sig,2),[4000,4010],1/10)/4};

);
~hob.stop(7);
~hob.clear;


b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~beat.ar(2);
    ~beat.quant=2;
    ~beat.fadeTime=2.02;
    ~beat={
        var mod = 2/[1,2,4,8];//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5] + LFNoise2.kr(1/640!4);
        //         |       |       |       |       |  
        var pat = [1,1,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
  sig = CombN.ar(sig,~tempo/3,~tempo/30,1/4);
        Splay.ar(sig.flat,0.5,0.95);
    };
    ~beat.play;
);
~beat.stop(7);
~beat.clear;

// puls synth ///////////////////////////////////////

(
    ~puls.ar(2);
    ~puls.clock = p.clock;
    ~puls.quant=4;
    ~puls.fadeTime=4;
    ~puls={
        var cad = LFNoise0.kr(~tempo/[1,2,3].nthPrime).exprange(4.0001,64).round(4) / 4;
        var sig = LFPulse.ar(15000/[1,1.5,1.333333],mul:0.15) + WhiteNoise.ar(0.015!3) + SinOsc.ar(50*[1,2,3],Pulse.ar(~tempo/[1,2,3].nthPrime*cad),mul:0.02) / 8 * Pulse.ar(~tempo*cad/[1,2,3].nthPrime).softclip;
        sig = HPF.ar(sig,50);
        sig = CombC.ar(sig,~tempo/2,~tempo/2,~tempo);
        sig = Vibrato.ar(sig,[6,7,8],0.2);
        Splay.ar(sig,0.15,0.15,SinOsc.kr(~tempo/[5,6,7]));
    };
    ~puls.play;
);
~puls.stop(4);
~puls.clear;
~puls.pause;
~puls.resume;

// form synth ///////////////////////////////////////

(
    ~form.ar(2);
    ~form.clock = p.clock;
    ~form.quant=2;
    ~form.fadeTime=4;
    ~form={
        var n = 50;
        var env = LFTri.ar(~tempo/[1,2,3]/4) ** 2;
        var sig = VarSaw.ar(n,0,env**0.8) * Formant.ar(n,n*2,n*4) * env;
        Splay.ar(sig,0.5,0.25);
    };
    ~form.play;
);
~form.stop(4);
~form.clear;
~form.pause;
~form.resume;

// olaola synth ///////////////////////////////////////

(
~olaola.ar(2);
~olaola.clock = p.clock;
~olaola.quant=4;
~olaola.fadeTime=4;
~olaola={
    var mod2 = Duty.kr(3*16,0,Dseq([1,2,1.5,1.33333],inf));
    var mod = SinOsc.ar(10/[1.1,1.2,1.3]).range(0.99,1.01);
  var sig = SinOsc.ar([48000/1.001,50/mod*mod2,250/mod/mod2],SinOsc.ar(59.95/[4,5,6]/8000),mul:(LFTri.ar(1/32/[1,2,3]))**16+0.01).range(1/4,8);// + LFPulse.ar(1.5*[1,2,4]/16);
  //sig = RLPF.ar(sig,250/[1,2,4],0.2);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  //sig = Compander.ar(sig,Pulse.ar(4/[1,2,4]),0.1,1,0.1,relaxTime:LFNoise2.kr(1/4).range(0.01,0.5));

  //sig = Resonz.ar(sig,[50,150,250],0.11)*sig;
  sig = Normalizer.ar(sig)/2;
  sig = CompanderD.ar(sig,3/4,1,1/5)*4/3;
  Splay.ar(sig,0.5,0.75);
};
~olaola.play;
);
~olaola.stop(4);
~olaola.clear;
~olaola.pause;
~olaola.resume;


