



p.push()
p.bpm(90);

// buzz synth ///////////////////////////////////////

(
    ~buzz.ar(2);
    ~buzz.quant=8;
    ~buzz.fadeTime=1;
    ~buzz={

        var low = LFTri.ar(~tempo/4/[1,9,3,7]).exprange(50.01,500);
        var high = LFTri.ar(~tempo/4/[1,4,8,4]).exprange(500.01,22000);
        var dev = SinOsc.kr(~tempo/[1/32,1/32.01,1/8,1/4,1,1/4])/1000.0;
        var mod = LFTri.ar(~tempo/[4,1/4,1/8] *.x dev);
        var freq = Perlin3.ar(mod[0],mod[1],mod[2]);
        var amp = Perlin3.ar(mod[2],mod[1],mod[0]);
        var sig = LFSaw.ar(freq.range(low,high),mul:0.4);
        //sig = MoogVCF.ar(sig,freq,0.2);
        var del = LFSaw.ar(~tempo/4/[1,2,3,4]).range(~tempo/128,~tempo/4);
        sig = sig * DelayN.ar(Pulse.ar(~tempo*16/[1,2,3,4]),del,del);
        //sig = AllpassN.ar(sig,1/2/freq,1/2/freq,0.1);
        Splay.ar(sig,0.9,0.15);
    };
    ~buzz.play;
);
~buzz.stop(4);
~buzz.clear;
~buzz.pause;
~buzz.resume;

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
