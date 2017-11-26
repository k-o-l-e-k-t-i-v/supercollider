p.push();
p.bpm(127);


(
    ~tracker= { 
        var trackb, trackh, trackq, tempos;
        var source;
        var bsound, hsound, qsound;

        source = Mix(SoundIn.ar([1,2]));
        #trackb, trackh, trackq, tempos = BeatTrack.kr(FFT(LocalBuf(1, 1024, source,0)));

        tempos.poll;
        //Out.ar(out, bsound + hsound + qsound);
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

