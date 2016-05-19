
(
  p.clock.tempo_(120/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5/(1..4)],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50*[1,2,1.5,1.3333],env**20*8pi);
    SendTrig.ar(K2A.ar(hit*imp),0,LFSaw.ar(1.01)*1000.0);
  sig = sig * env;
  sig = GVerb.ar(sig,80,4)/8+sig;
  sig = CompanderD.ar(sig,3/4,1/3,1/10);
  Splay.ar(sig,0.05,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


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

