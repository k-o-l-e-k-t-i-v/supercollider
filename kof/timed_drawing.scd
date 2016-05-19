
(
    ~a.quant=2;
    ~a={var speed = [1,2,3,4]/4;
    SendTrig.ar(Impulse.ar(2*speed),0,{LFNoise2.ar(4)*1000.0});
    Pulse.ar(1*speed)*SinOsc.ar(100,Pulse.ar(speed)*8pi);
};
~a.play;
)


(
    // By James McCartney
    var w, h = 700, v = 700, seed, run = true, phase = 0;
    var fc = 0;
    w = Window("wedge", Rect(40, 40, h, v), false);

    o = OSCFunc({ arg ...args;
        //args.postln;
        seed = args[0][3];
    },'/tr', s.addr);

    w.view.background = Color.rand(0,0.3);
    w.onClose = { run = false }; // stop the thread on close
    w.front;

    // store an initial seed value for the random generator
    seed = Date.seed;
    w.drawFunc = {
        Pen.width = 2;
        Pen.use {
            fc = fc + 1;
            // reset this thread's seed for a moment
            thisThread.randSeed = Date.seed;
            // now a slight chance of a new seed or background color
            //if (0.006.coin) { seed = Date.seed; };
            // either revert to the stored seed or set the new one
            thisThread.randSeed = seed;
            w.view.background = Color.black;
            // the random values below will be the same each time if the seed has not changed
            // only the phase value has advanced
            Pen.translate(h/2, v/2);
            phase = sin(fc/(seed));
            // rotate the whole image
            // negative random values rotate one direction, positive the other
            Pen.rotate(phase * 1.0.rand2);
            // scale the rotated y axis in a sine pattern
            //Pen.scale(1, 0.3 * sin(phase * 1.0.rand2 + 2pi.rand) + 0.5 );
            // create a random number of annular wedges
            rrand(6,24).do {
                Pen.color = Color.gray(0.5.rrand(1),1.0.rrand(1)).alpha_(rrand(0.1,0.7));
                Pen.beginPath;
                Pen.addAnnularWedge(Point(0,0), a = rrand(60,300), a + 50.rand2, 2pi.rand
                + (phase * 2.0.rand2), 2pi.rand);
                if (0.5.coin) {Pen.stroke}{Pen.fill};
            };
        };
    };

    // fork a thread to update 20 times a second, and advance the phase each time
    { while { run } { w.refresh; (1/60).wait; phase = phase + 0.01pi;} }.fork(AppClock)

)

