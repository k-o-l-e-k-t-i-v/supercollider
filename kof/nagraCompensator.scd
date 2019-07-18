
(
s=Server.local;
s.boot;
b = Buffer.read(s,"/home/kof/Downloads/01-190704_1108.wav");
)
// remember to free the buffer later.

p=ProxySpace.push(s);

(
    ~pilot.ar(1);
    ~pilot={
        var sig = SinOsc.ar( 13500 + ( SinOsc.ar( 50 , mul: 2700 ) ) ) ;
    //    sig = sig * SinOsc.ar(50);
        sig/16;
    };
   // ~pilot.play;
)

(
    ~detect.fadeTime=0.25;
    ~detect.ar(2);
    ~detect={arg ammount=1.0, phase = 0.0;
        var sync = ~pilot.ar;
        var original = PlayBuf.ar(1, b.bufnum, BufRateScale.kr(b.bufnum),loop:1);
        var speed = 1;
        var nagraSync;
        var sig = original;

10.do{
          nagraSync = LPF.ar(sig,60) + HPF.ar(sig,10000);
          speed = sync - nagraSync;
          sig = ((PlayBuf.ar(1, b.bufnum, BufRateScale.kr(b.bufnum) * (speed.lag(1/2)+1), loop:1 )));  
      };
      
        //sig = sig - nagraSync;
        10.do{
          sig = LPF.ar(sig,10000);
          sig = LPF.ar(sig,10000);
          sig = HPF.ar(sig,60);
          sig = sig * 1.1;
        };

        sig = LeakDC.ar(sig) ;
        //sig = Select.ar(LFSaw.ar(1).range(0,2),[original,sig]);
        //Splay.ar(sig);
        //[nagraSync,sync];
        //[sig,original];
        [sig,sig];
    };
    ~detect.play();
)

p.gui;

s.scope
~detect.plot(0.1)
~pilot.plot(0.1);
(
    ~player.ar(2);
    ~player={
        Splay.ar(sig);
    };
    ~player.play();
)



(

    ~test={
        var sync =  (SinOsc.ar(SinOsc.ar(50, phase*2pi ) * SinOsc.ar(13500, phase*2pi ,mul:1)));
        var original = PlayBuf.ar(1, b.bufnum, BufRateScale.kr(b.bufnum),loop:1);
        var nagraSync = (BPF.ar(original,50) + BPF.ar(original,13500));
        var sig =
    }

)
