
s.boot;

(
  a.recToggle;
  a.play;
  Ndef(\a,{
    ~c = SinOsc.ar(1/20,-0.5pi);
    ~r = LFSaw.ar(1/20,-0.5pi);

    Splay.ar(
      LFSaw.ar(432/2pi*(1..8),mul:1/(1..8)) * ~c.range(0,1)
      ,0.5,1,0.5)
  }).play;
)
