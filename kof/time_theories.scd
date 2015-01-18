// adding 8
(
    x = { {|i| SinOsc.ar(i)}!8 };
    x.plot(1);
)

// harmonic 8
(
    x = { {|i| SinOsc.ar(2*i)}!8 };
    x.plot(1);
)

// harmonic 8 (pow)
(
    x = { {|i| SinOsc.ar(2**(i))}!8 };
    x.plot(1);
)

// fibonacci 8
(
    x = { {|i| SinOsc.ar(2*fib(8).at(i))}!8 };
    x.plot(1);
)

// fibonacci 8 (pow, floating)
(
    x = { {|i| SinOsc.ar(1.1**fib(8).at(i))}!8 };
    x.plot(1);
)

