
p.pop;

(
  ScoreClock.beginScore;
  ScoreClock.tempo = 100/60;
  Pbind(
    \freq, 100*Pwhite(1,10,8),
    \dur, 0.5,
    \legato, 0.5
  ).play(ScoreClock);
  ~score = ScoreClock.makeScore;
)


// print it
~score.score.do(_.postln);""

// render to file
~score.recordNRT("~/score.osc".standardizePath,"~/score.aiff".standardizePath);

You can create individual ScoreClocks with different tempo:
(
  ScoreClock.beginScore;

  Routine {
    thisThread.clock.tempo = 0.5;
    4.do {
      x = Synth(\default,[\freq,100*rrand(1,10),\pan,1]);
      1.wait;
      x.release;
    };
    thisThread.clock.tempo = 2;
    8.do {
      x = Synth(\default,[\freq,200*rrand(1,10),\pan,1]);
      1.wait;
      x.release;
    };
    thisThread.clock.tempo = 1;
    4.do {
      x = Synth(\default,[\freq,150*rrand(1,10),\pan,1]);
      1.wait;
      x.release;
    };
    x = Synth(\default,[\freq,150,\pan,1]);
    z = Synth(\default,[\freq,200,\pan,-1]);
    4.wait;
    x.release;
    z.release;
    1.wait;
  }.play(ScoreClock.new);

  Routine {
    64.do {
      y = Synth(\default,[\freq,50*rrand(1,10),\pan,-1]);
      0.25.wait;
      y.release;
    }
  }.play(ScoreClock.new);

  ~score = ScoreClock.makeScore;
)

// print the score
~score.score.do(_.postln);""

// play it
~score.play

// render to file
~score.recordNRT("~/score.osc".standardizePath,"~/score.aiff".standardizePath);
