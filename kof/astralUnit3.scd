b=Buffer.read(s,"/home/kof/Pictures/android/stereo.wav");
m = 499.004/1000;

p.push;
p.bpm(240*m);

//s.prepareForRecord("/home/kof/Pictures/android/fm_stereo.wav",2);
(
    ~master.ar(6);
    ~master.quant=0;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.075,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1,2,3,4,5]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        sig = SelectX.ar(wet,[orig,fx]);
        // sig = sig;
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

// merkur synth ///////////////////////////////////////
s.scope
{ Amplitude.kr(SoundIn.ar(0)); }.scope;
(
    ~merkur.ar(6);
    ~merkur.mold(6);
    ~merkur.quant=0;
    ~merkur.fadeTime=0.5;
    ~merkur={
        var puls = LFTri.ar(~tempo/24*[1,2,4,8,10,1/2,1/4,1/8,1/16,1/32,1/12,1/24])**2;
        var sig = Amplitude.ar(SoundIn.ar(0),0.01,0.05);
        var orig = sig;
        var fx;
        //sig = SinOsc.ar(sig.exprange(7.5*3*[1,1.5,2,4],22000)+(sig/4),puls*2pi);
        sig = Gendy1.ar(sig/100,sig/100,sig/100,sig/100,22,2220);
        sig = (CombL.ar(orig,orig/150+1/100,orig/1500+1/100,1))/2+sig;
        sig = sig + (SinOsc.ar(sig.exprange(22*[1,1.5],2200),puls*2pi)*orig.lag(1));
        sig = LPF.ar(sig,110)*1.25 + LPF.ar(sig,16000,mul:0.2);
        sig = Resonz.ar(sig,1440*[2,4,12]/.x[1,2,4,8,1.5,1.33334],orig.lag(~tempo/24)+0.121).softclip/2+sig;
        sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/1.1,1);
        sig = sig * orig;
        fx = DWGReverbC1C3.ar(sig,2500,1/10);
        sig = sig + (fx/10);
        //      Splay.ar(sig,0.95,0.91);
        SplayZ.ar(6,sig,0.665,0.96);
    };

    ~merkur.play;
);
~merkur.stop(15);
~merkur.clear;


// venus synth ///////////////////////////////////////

(
    ~venus.ar(6);
    ~venus.mold(6);
    ~venus.quant=0;
    ~venus.fadeTime=5.4;
    ~venus={
        var sig = SoundIn.ar([0,1,2,3,4,5]);
        var mod = [1,2,4/3,1/1.5,2,4];
        var note = [60,65,67,60,60,36].midicps;
        var env = Amplitude.kr(sig,0.05,0.1);
        var fx;
        sig = Perlin3.ar(LFSaw.ar(note,mul:2pi).cos+1/100+SinOsc.ar(~tempo/[1,2,4,8,16],add:1),LFSaw.ar(note,mul:2pi).sin+1/4,sig+1);
        sig = LeakDC.ar(sig);
        //sig = SinOsc.ar(note+(env*note),sig*2pi);
        sig = LPF.ar(sig,100+(500*env)) + HPF.ar(sig * env,100+(15000*env));
        sig = sig * env;
        //sig = MoogFF.ar(sig,note*2,2.5);
        //sig = CombL.ar(sig,1/12,1/12,1);
        sig = CompanderD.ar(sig,1/2,1/2,2);
        fx = DWGReverbC1C3.ar(LPF.ar(HPF.ar(sig,250),5000),2500,1/10);
        //Splay.ar(sig,0.95,0.5);
        //      sig;
        sig =  sig + (fx/5);
        SplayZ.ar(6,sig,0.75,0.96);
    };
    ~venus.play;
);
~venus.stop(4);
~venus.clear;
~venus.pause;
~venus.resume;


// sun synth ///////////////////////////////////////

(
    ~sun.ar(6);
    ~sun.quant=0;
    ~sun.fadeTime=4;
    ~sun={
        var sig = SoundIn.ar([0,1,2,3,4,5]);
        var env = Amplitude.ar(sig,0.02,0.15); 
        sig = BrownNoise.ar(1!6) + PinkNoise.ar(0.5!6) + WhiteNoise.ar(0.25!6);
        sig = LPF.ar(sig,env*16000+30);
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/2,1);
sig = LeakDC.ar(sig);
        SplayZ.ar(6,sig,0.665,0.96);

    };
    ~sun.play;
);
~sun.stop(4);
~sun.clear;
~sun.pause;
~sun.resume;


// three synth ///////////////////////////////////////

(
    ~three.ar(2);
    ~three.quant=2;
    ~three.fadeTime=4;
    ~three={
        var sig = SinOsc.ar(50!2);
        Splay.ar(sig,0.5,0.25);
    };
    ~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;
