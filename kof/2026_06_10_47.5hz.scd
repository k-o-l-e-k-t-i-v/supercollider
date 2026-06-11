s.boot;

(
  ~sine = {
    var sig = SinOsc.ar(47.5!2,mul:0.1)
    Splay.ar(sig,0,1);
  };
  ~sine.play();
)

~sine.clear(60)
