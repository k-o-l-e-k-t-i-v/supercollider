


p.push();
p.bpm(121.5/2)

b = Buffer.allocConsecutive(8,s,4096,1);



// eightTrack synth ///////////////////////////////////////

(
    ~eightTrack.ar(8);
    ~eightTrack.clock = p.clock;
    ~eightTrack.quant=4;
    ~eightTrack.fadeTime=4;
    ~eightTrack={
        var f = 48000/4096 * 4 + SinOsc.ar(~tempo/4);
        var t = LFSaw.ar([~tempo/4,~tempo/16.1]).range(0,2pi);
        var sig = [
            LFSaw.ar(f),
            SinOsc.ar(f),
            VarSaw.ar(f),
            SinOsc.ar(f*4),
            Pulse.ar(f),
            LFCub.ar(f*8),
            LFSaw.ar(f*2),
            LFPulse.ar(f*16)
        ];
        8.do{|i|
            sig[i] = LeakDC.ar(sig[i]);
  //          sig[i] = Perlin3.ar(sig[i],t[0].sin,t[1].cos);
            RecordBuf.ar(Mix(sig[i])/4,b[i],loop:1);
        };
        sig;
    };
    ~resonator.rebuild;
);

// resonator synth ///////////////////////////////////////

(
    ~resonator.ar(2);
    ~resonator.clock = p.clock;
    ~resonator.quant=4;
    ~resonator.fadeTime=4;
    ~resonator={
        var mod = Duty.kr(32/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333,1/2,1/1.5],inf));
        var mid = Duty.kr(16/~tempo,0,Dseq([[65,62],[65,64],[65,57],[69,72]],inf));
        var midmod = Duty.kr(32/~tempo,0,Dseq([0,0,0,-12],inf));
        var f = [60,mid+midmod,69].midicps/mod/2;
        var sig = VOsc3.ar(LFTri.ar(~tempo/8/[1,2,3]).(b.first,b.last),f[0],f[1],f[2]);
        //sig = Normalizer.ar(sig) * LFTri.ar(1/16/[1,2,3]);
        sig = MoogVCF.ar(sig,f*8,0.2)*4 + LPF.ar(sig,f/2) / 2;
        sig = CompanderD.ar(sig,3/4,1/2,1)/5;
        //sig = Normalizer.ar(sig);
        Splay.ar(sig,0.25,0.25,SinOsc.kr(~tempo/[2,4,7]));
    };
    ~resonator.play;
);
~resonator.stop(4);
~resonator.clear;
~resonator.pause;
~resonator.resume;

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
