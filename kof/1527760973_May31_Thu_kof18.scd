





p.push();
p.bpm(120);

// triperl synth ///////////////////////////////////////

(
    ~triperl.ar(2);
    ~triperl.clock = p.clock;
    ~triperl.quant=4;
    ~triperl.fadeTime=4;
    ~triperl={
        var sig,sig1,sig2,sig3;
        var f = 432/[1,1.5,1.33334];

        var lfo1 = SinOsc.ar(~tempo);
        var lfo2 = SinOsc.ar(~tempo/4);
        var lfo3 = SinOsc.ar(~tempo/3);

        var aa = SinOsc.ar([~tempo,~tempo/2,f+0.0001],add:1);
        var bb = SinOsc.ar([~tempo,~tempo/4,f],add:1);
        var cc = SinOsc.ar([~tempo,~tempo/8,f*2],add:1);

        sig1 = Perlin3.ar(aa[0],aa[1],aa[2]) * lfo1;
        sig2 = Perlin3.ar(bb[0],bb[1],bb[2]) * lfo2;
        sig3 = Perlin3.ar(cc[0],cc[1],cc[2]) * lfo3;


        sig = CompanderD.ar(sig1 + sig2 + sig3,3/4,1/1.5,1);
        sig = LeakDC.ar(sig); 

        Splay.ar(sig,0.5,0.5);
    };
    ~triperl.play;
);
~triperl.stop(4);
~triperl.clear;
~triperl.pause;
~triperl.resume;

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
