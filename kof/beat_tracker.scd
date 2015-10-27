
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// detect synth ///////////////////////////////////////
(
(
    z = Buffer.alloc(s,1024,1);
    ~detect.quant=2;
    ~detect={arg vol=1.0, beepvol=1.0, lock=0;
             var in, kbus;
             var trackb,trackh,trackq,tempo, phase, period, groove;
             var bsound,hsound,qsound, beep;
             var fft;
             var feature1, feature2, feature3;
            var env;
             in = SoundIn.ar(0);

             //Create some features
             fft = FFT(z.bufnum, in);

             feature1= RunningSum.rms(in,64);
             feature2= MFCC.kr(fft,2); //two coefficients
             feature3= A2K.kr(LPF.ar(in,1000));

             kbus= Out.kr(0, [feature1, feature3]++feature2);
             //feature1.poll;

             //Look at four features
             #trackb,trackh,trackq,tempo, phase, period, groove=BeatTrack2.kr(0,4,2.0, 0.02, lock, -2.5);
            
             //tempo.poll;
             //env = Decay.kr(PulseDivider.kr(trackq,1),tempo);
             //beep = SinOsc.ar(0,0.0,env);

             SendTrig.ar(K2A.ar(trackq),0,tempo);

             //Splay.ar(Pan2.ar((vol*in)+(beepvol*beep),0.0));
            };
    ~detect.play;
);

//resender
(
    m = NetAddr("127.0.0.1", 12000);

    // output triggers
    o = OSCFunc({ arg ...args;
                 ("tempo set: "+args[0][3]).postln;
                 //~tempo = args[0][3];
                 p.clock.tempo_(args[0][3]);
                 //m.sendMsg("/trig",args[1],args[0][3]);
                },'/tr', s.addr);
);
)

// ss synth ///////////////////////////////////////

(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=1.2;
    ~ss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(0);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = [
            LFNoise2.ar(50+(env**2*10000)),
            SinOsc.ar(10000+(env**20*100)),
            LFNoise2.ar(4500+(env**4*10000)),
            SinOsc.ar(15000+(env**80*100)),
        ];
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;

