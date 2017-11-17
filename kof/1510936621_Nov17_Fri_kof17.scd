
p.push();

(
    ~one = {
        DynKlang.ar(`[
            [800, 1000, 1200] + SinOsc.kr([2, 3, 4.2], 0, [13, 24, 12]),
            [0.3, 0.3, 0.3],
            [pi,pi,pi]
        ]
    ) * 0.2
};
~one.play;
)                                )
