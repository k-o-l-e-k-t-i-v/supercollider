

p.push();
p.bpm(120);
// one synth ///////////////////////////////////////


// sync synth ///////////////////////////////////////

(
    ~sync.ar(2);
    ~sync.clock = p.clock;
    ~sync.quant=4;
    ~sync.fadeTime=4;
    ~sync={
        var base = Duty.kr(16*[1,4,8,16]/~tempo,0,Dseq([60,56,60,68,64,65].midicps,inf));
        var mod = Duty.kr(64/~tempo,0,Dseq([1,2,1,4,1,1.5],inf));
        var x = LFTri.ar([1,2,3,4]/1024) ** 1.5 * 10;
        var y = LFTri.ar([1,2,3,4]/2048) ** 1.5 * 10;
        var f = base*4*mod/[1,2,1,1.5]*Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var env = Env.circle([0,-1,0,1]*((1..16).reciprocal),1/f,[3,-3]*LFSaw.kr(1/16/[1,2,3,4]).exprange(0.001,10.2)) ;
        var sig = EnvGen.ar(env);
        sig = Perlin3.ar(sig,SinOsc.ar(f/4)+1+x,SinOsc.ar(f/2)+1+y) * LFTri.ar(1/4/[1,2,3,4]);
        sig = DFM1.ar(sig,f,LFTri.ar(1/8/[1,2,3,4])**2);
        Splay.ar(sig,0.5,0.25);
    
    };
    ~sync.play;
);
~sync.stop(4);
~sync.clear;
~sync.pause;
~sync.resume;

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=1;
    ~one={
        var mod = Duty.kr(5/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var mod2 = Duty.kr(1/5/~tempo,0,Dseq([1,2,1.5,1.33333,1/2],inf));
        var maxfreq = 432*5/(mod*5) /.x [1,2,1.5,1.333334,4] / mod2;
        var puls = 1/5; 
        var phase = Pulse.ar(puls).range(0,2pi);
        var x = SinOsc.ar(puls).exprange(20.00001,maxfreq);
        var y = LFTri.ar(puls).range(0.000001,1);
        var sig = (SinOsc.ar(maxfreq/((1..12).reciprocal+1),phase)*SinOsc.ar(maxfreq/2/((1..12).reciprocal+1),phase));
        sig = BPF.ar(sig,x.lag(0.001),y.lag(0.001));
        sig = BPF.ar(sig,x.lag(0.0001),y.lag(0.0001));
        sig = BPF.ar(sig,x,y);
        sig = Normalizer.ar(sig);
        sig = LPF.ar(sig,maxfreq);
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
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var imp = LFSaw.ar(4/(1..12)).exprange(50.0001,1500);
    var sync = SinOsc.ar(1/16/(1..12)) * 2pi;
  var sig = SinOsc.ar(50,sync) + SinOsc.ar(50.001,sync) - SinOsc.ar(49.997,sync);
  sig = Normalizer.ar(sig)/4;
  //sig = CombN.ar(sig,1,1/4,inf);
  sig = HPF.ar(sig,20);
  sig = DFM1.ar(sig,imp,0.04);
  sig = Normalizer.ar(sig) * Pulse.ar(2);
  Splay.ar(sig,0.5,0.25);
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
    ~master = {|wet=0.15,lp=13500,hp=50,len=10,rev = 3|
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
