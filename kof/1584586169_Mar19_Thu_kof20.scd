p.push();
p.bpm(89.93);

b=Buffer.alloc(s,48000,16);


// flange synth ///////////////////////////////////////

(
    ~flange.ar(2);
    ~flange.quant=2;
    ~flange.fadeTime=0.4;
    ~flange={
        var mod = Duty.ar(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/1000);
        var f = [90,90.01,90.1,89.975]*mod+SinOsc.kr(~tempo/[4,5,6,7],mul:0.02);
        var sig = SinOsc.ar(f,mul:1/(2..8).log2)+BPF.ar(WhiteNoise.ar(1),f*8,LFNoise1.kr(~tempo!8).range(0.05,0.8));
        sig = sig * LFSaw.ar(f/160);
        sig = BufDelayN.ar(b,sig,[0,SinOsc.ar([5,6,7,8]/1000).range(0,1/f)]);
        sig = LPF.ar(sig,f*4);
        // sig = Normalizer.ar(sig)/10;
        //sig = AllpassN.ar(sig,~tempo,1/32/~tempo,8);
        //sig = CompanderD.ar(sig,3/4,1/2,1).softclip;
        Splay.ar(sig,0.95,0.15);
    };
    ~flange.play;
);
~flange.stop(4);
~flange.clear;
~flange.pause;
~flange.resume;


// weird synth ///////////////////////////////////////

(
    ~weird.ar(2);
    ~weird.quant=2;
    ~weird.fadeTime=4;
    ~weird={
        var f = 900;
        var sig = Duty.ar(1/2/f,0,Dseq((1..32).scramble.normalize-0.5,inf)).lag(32/f);
        sig = Perlin3.ar(sig,LFSaw.ar(f/6.4,mul:2pi).cos+1,LFSaw.ar(f/6.401,mul:2pi).sin+1);
        sig = LeakDC.ar(sig);
        sig = LPF.ar(sig,f*2);
        Splay.ar(sig,0.95,0.15);
    };
    ~weird.play;
);
~weird.stop(4);
~weird.clear;
~weird.pause;
~weird.resume;



// perlperlpur synth ///////////////////////////////////////

(
    ~perlperlpur.ar(2);
    ~perlperlpur.quant=2;
    ~perlperlpur.fadeTime=0.4;
    ~perlperlpur={
        var f = 180/[1,1.33334,1.5] /.x [[2,1],[1.5,1.33334],[1,2]] + SinOsc.kr([4.155,3,7],mul:0.1);

        var x = [1,1.001,1.003]*f/24000;
        var y = [1,1.002,1.004]*f/2400;
        var sig = Perlin3.ar(LFSaw.ar(x,mul:2pi).cos+1/2,LFSaw.ar(y,mul:2pi).sin+1/2,LFTri.ar(f)+LFTri.ar(f*10,mul:0.6));
        sig = LeakDC.ar(sig);
        sig = LPF.ar(sig,f*2);
        Splay.ar(sig,0.3335,0.25);
    };
    ~perlperlpur.play;
);
~perlperlpur.stop(4);
~perlperlpur.clear;
~perlperlpur.pause;
~perlperlpur.resume;


// fractalPerlin synth ///////////////////////////////////////

(
    ~fractalPerlin.ar(2);
    ~fractalPerlin.quant=2;
    ~fractalPerlin.fadeTime=0.1;
    ~fractalPerlin={
        var f = [90,90.01,90.002]*[1,3,4];
        var sig = LFTri.ar(f) + LFSaw.ar(~tempo*2/[1,2,3,4],mul:1/4);
        12.do{|i|
            sig = sig + (Perlin3.ar(sig[0]/(i+1),sig[1]/(i+1),sig[2]/(i+1))/(i+1));
            sig = CombL.ar(sig,5+i/90,1+i/90,90/90)/100+sig;
            sig = LeakDC.ar(sig);
        };
        sig = SinOsc.ar(sig.range(90.001,900),mul:0.9)+sig;
        sig = LPF.ar(sig,f*8)/1.5;
        sig = CompanderD.ar(sig,3/4,1/2,1)/2;
        Splay.ar(sig,0.95,0.35);
    };
    ~fractalPerlin.play;
);
~fractalPerlin.stop(4);
~fractalPerlin.clear;
~fractalPerlin.pause;
~fractalPerlin.resume;


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
