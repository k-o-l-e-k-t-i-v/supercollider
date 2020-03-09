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

// one synth ///////////////////////////////////////
s.scope
{ Amplitude.kr(SoundIn.ar(0)); }.scope;
(
    ~one.ar(6);
    ~one.mold(6);
    ~one.quant=0;
    ~one.fadeTime=0.5;
    ~one={
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
        Splay.ar(sig,0.95,0.91);
    };

    ~one.play;
);
~one.stop(15);
~one.clear;


// two synth ///////////////////////////////////////

(
~two.ar(6);
~two.mold(6);
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = SoundIn.ar(0);
  var note = [60,65,67,55,57,59].midicps/2;
  sig = Perlin3.ar(LFSaw.ar(note,mul:2pi).cos+1/100,LFSaw.ar(note,mul:2pi).sin+1/100,sig+1) * Amplitude.ar(sig,0.02,1/15);
  Splay.ar(sig,0.95,0.5);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
