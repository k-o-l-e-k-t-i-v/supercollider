p.push();
p.bpm(90);

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

// doublePerlin synth ///////////////////////////////////////

(
    ~doublePerlin.ar(2);
    ~doublePerlin.clock = p.clock;
    ~doublePerlin.quant=16;
    ~doublePerlin.fadeTime=16;
    ~doublePerlin={
        var f = LFSaw.ar(10*[1,2,1.5,1.3333]*((_*2!12).midicps));
        var s = LFTri.ar(~tempo*(1/60/(1..12))).exprange(0.01,50);
        var a = LFTri.ar(1/16000/(1..3)) * 10.0;
        
        var x1 = SinOsc.ar(f[0]) * s[0];
        var y1 = SinOsc.ar(f[1]) * s[1];
        var z1 = SinOsc.ar(f[2]) * s[2];

        var x2 = SinOsc.ar(f[3]) * s[3];
        var y2 = SinOsc.ar(f[4]) * s[4];
        var z2 = SinOsc.ar(f[5]) * s[5];

        var x3 = SinOsc.ar(f[6]) * s[6];
        var y3 = SinOsc.ar(f[7]) * s[7];
        var z3 = SinOsc.ar(f[8]) * s[8];

        var t1 = Perlin3.ar(x1,y1,z1) * s[9] + a[0];
        var t2 = Perlin3.ar(x2,y2,z2) * s[10] + a[1];
        var t3 = Perlin3.ar(x3,y3,z3) * s[11] + a[2];



        var sig = Perlin3.ar(t1,t2,t3);
        //sig = sig + (LocalIn.ar(2)*Pulse.ar(~tempo*4/[1,2,3]));
        //sig = DelayN.ar(sig,1/1000,1/1000);
       // sig = RLPF.ar(sig,60.midicps*[1,2,1.5],0.1);
       sig = CompanderD.ar(sig,3/4,1/1.5,1); 
       sig = LeakDC.ar(sig);
       sig = Normalizer.ar(sig);

        //LocalOut.ar(NumChannels.ar(sig,2));

        


        Splay.ar(sig,0.5,0.5);
    };
    ~doublePerlin.play;
);
~doublePerlin.stop(16);
~doublePerlin.clear;
~doublePerlin.pause;
~doublePerlin.resume;
