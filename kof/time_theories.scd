// mult 8 (1st 0)
(
    x = { {|i| SinOsc.ar(200*i)}!8 };
    x.plot(1e-2);
    {Splay.ar(x,1,0.2)}.play;
)

// harmonic 8 (pow)
(
    x = { {|i| SinOsc.ar(200*(2**(i)))}!8 };
    x.plot(1e-2);
    {Splay.ar(x,1,0.2)}.play;
)

// fibonacci 8
(
    x = { {|i| SinOsc.ar(200*fib(8).at(i))}!8 };
    x.plot(1e-2);
    {Splay.ar(x,1,0.2)}.play;
)

// fibonacci 8 (pow, floating)
(
    x = { {|i| SinOsc.ar(200*(1.1**fib(8).at(i)))}!8 };
    x.plot(1e-2);
    {Splay.ar(x,1,0.2)}.play;
)


//...
