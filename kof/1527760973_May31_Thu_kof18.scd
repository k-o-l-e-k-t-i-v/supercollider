

/*

Coded by Kof @ 
Thu May 31 12:31:28 CEST 2018

   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            Y8P
*/

p.push();
p.bpm(120/2);

~triperl.rebuild;

// triperl synth ///////////////////////////////////////

(
    ~triperl.ar(2);
    ~triperl.clock = p.clock;
    ~triperl.quant=0;
    ~triperl.fadeTime=1.5;
    ~triperl={
        var sig,sig1,sig2,sig3;
        var mod = {(2**([0,1,3,5,7,9,11]/12))}!3;
        var f = 432.337/mod + SinOsc.ar(432/16+[0,0.00001,0.000876],mul:1/mod);

        var lfo1 = SinOsc.ar(f/10000) + 1 / 4;
        var lfo2 = LFTri.ar(f/1000) + 1 / 8;
        var lfo3 = LFCub.ar(~tempo/4) + 1 / 16;

        var aa = SinOsc.ar([~tempo+0.00016,~tempo/15, f[0]+0.0001],add:1);
        var bb = VarSaw.ar([~tempo+0.01567,~tempo/30, f[1]],add:1);
        var cc = SinOsc.ar([~tempo+0.000213,~tempo/45, f[2]],add:1);

        aa = aa * lfo1;
        bb = bb * lfo2;
        cc = cc * lfo3;
        
        sig1 = Perlin3.ar(aa[0],aa[1],aa[2]);
        sig2 = Perlin3.ar(bb[0],bb[1],bb[2]);
        sig3 = Perlin3.ar(cc[0],cc[1],cc[2]);


        sig = CompanderD.ar([sig1, sig2, sig3],3/4,1/LFNoise1.kr(~tempo/[3,4,5]).range(1,1.7),1);
        sig = LeakDC.ar(sig); 
        sig = Mix.ar(LPF.ar(sig,1000)) + HPF.ar(sig,1000);

        Splay.ar(sig,0.5,0.05);
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
