

p.push();
p.bpm(120);

(
    8.do({ arg i;
            var n, a;
            // allocate table
            s.sendMsg(\b_alloc, i, 1024);
            // generate array of harmonic amplitudes
            n = (i+1)**2;
            a = Array.fill(n, { arg j; ((n-j)/n).squared.round(0.001) });
            // fill table
            s.performList(\sendMsg, \b_gen, i, \sine1, 7, a);
            // the argument '7' here is a flag for the \sine1 wave fill method -
            // see the "Wave Fill Commands" section in the Server Command Reference 
    });
)

// recorder synth ///////////////////////////////////////

(
    ~recorder.ar(2);
    ~recorder.clock = p.clock;
    ~recorder.quant=2;
    ~recorder.fadeTime=4;
    ~recorder={
        var aa = SinOsc.ar(110/[1,2,3,4,5,6,7,8].log2)+1;
        var bb = LFTri.ar(1/5000/[1,2,3,4,5,6,7,8]);
        var cc = LFTri.ar(1/500/[1,2,3,4,5,6,7,8])*4;
        var sig = Perlin3.ar(aa,bb,cc);
        8.do{|n|
            RecordBuf.ar(sig[n],n,loop:1);
        };
        sig;
    };
    //~recorder.play;
);
~recorder.stop(4);
~recorder.clear;
~recorder.pause;
~recorder.resume;

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var f = [60,65,67].midicps/4;//Duty.kr([1,2,4]*16,0,Dseq([60,65,69,71,64].midicps*.x[1,2,1.5,4],inf));
        var sig = VOsc.ar(MouseX.kr(0,7),[f,f+1],0,0.3) * LFTri.kr(16/[1,2,4]);
        var am = LFNoise1.kr(1/16!3).range(0.2,0.8);
        /*
        8.do{
            sig = AllpassL.ar(sig,16/f,4/f,16/f);
            sig = BPF.ar(sig,f*4,am);
        };
        */
        Splay.ar(sig,0.5,0.15);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


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
