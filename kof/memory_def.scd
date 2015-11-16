(
    a=List.new;
    z=0;
)

~d.fadeTime=0.2;

(
    ~d={SinOsc.ar(432)};
    ~d.play;
    a.add(~d[0].asCompileString);
)
~d.stop(4);



a=a.scramble;

(
    z=z+1;
    z=z%a.size;
    z.postln;
    a[z].postln;
    ~d=a[z].interpret;
)




