s.boot;

p=ProxySpace.push()


(
~one={
    var base = 110 + SinOsc.kr([4,5,6]);
    var semit = [1,12,7];
    Splay.ar(SinOsc.ar(base*(2**(semit/12)),mul:1/12),1,0.5);
};
~one.play();
)
