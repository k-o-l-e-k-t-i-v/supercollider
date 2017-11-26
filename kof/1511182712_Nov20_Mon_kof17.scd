p.push();
p.bpm(120);


(
    ~tracker= { |out, vol=1.0, beepvol=1.0, lock=0|

        var in, kbus;
        var trackb, trackh, trackq, tempos, phase, period, groove;
        var bsound, hsound, qsound, beep;
        var fft;
        var feature1, feature2, feature3;

        in = SoundIn.ar([1,2]);

        //Create some features
        fft = FFT(LocalBuf(1, 1024), in); //for sampling rates 44100 and 48000
        //fft = FFT(LocalBuf(1, 2048), in); //for sampling rates 88200 and 96000

        feature1 = RunningSum.rms(in, 64);
        feature2 = MFCC.kr(fft,2); //two coefficients
        feature3 = A2K.kr(LPF.ar(in,1000));

        //kbus = Out.kr(0, [feature1, feature3] ++ feature2);

        //Look at four features
        #trackb, trackh, trackq, tempos, phase, period, groove = BeatTrack2.kr(0, 4, 2.0, 0.02, lock, -2.5);
        tempos.poll;
        //beep= SinOsc.ar(1000, 0.0, Decay.kr(Impulse.kr(tempo), 0.1));
        //beep = Pan2.ar((vol * in) + (beepvol * beep), 0.0);
        //Splay.ar(out);
        0;
    };
    ~tacker.play;
)

(
 m = NetAddr("127.0.0.1", 12000);
 o = OSCFunc({
     arg ...args;
     args.postln;
     m.sendMsg("/trig",args[1],args[0][3]);
 },'\tr', s.addr);
)


u = Pipe("cat /tmp/pipe","r")
u.getLine

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
  var imp = Impulse.ar(~tempo/4);
  var sig = SinOsc.ar(5000!2) * Decay.ar(imp,0.15);
  SendTrig.kr(Impulse.kr(~tempo/4),1,~tempo);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

