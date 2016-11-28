p.pop;

/////////////////////////////////////////////////////////////////////////////////
// Draw your waveform!
(
b = Buffer.alloc(s, 1024); // buffer, server side
a = Array.fill(1024, { 256 }); // array, language side
w = Window("Draw your waveform!", Rect(100, 100, 1024, 512)).front;
u = UserView(w, w.view.bounds);

// function that changes the array and the buffer, and makes some clipping
f = { |x, y|
	x = x.clip(0, 1023);
	y = y.clip(0, 511);
	a[x] = y;
	b.set(x, (y / 512) * 2 - 1);
};
// animate, to cope with the mouse changes
u.background_(Color.black);
u.animate_(true);
u.drawFunc = { |u|
	Pen.strokeColor = Color.white;
	Pen.moveTo( Point(0, a[0]) );
	a[1..].do{ |value, index| Pen.lineTo( Point(index+1, value) ) };
	Pen.stroke;
};

// call our function when the mouse is pressed or moved
u.mouseDownAction = { |u, x, y, mod| f.(x, y) };
u.mouseMoveAction = { |u, x, y, mod| f.(x, y) };

// call some presets (1..6), spacebar clears.
u.keyDownAction = { |u, char, mod|
	char.switch(
		//\$, { a.size.do{ |i| f.(i, 256) } },
		\$1, { a.size.do{ |i| f.(i, 512.rand) } },
		\$2, { Array.interpolation(1024, 0, 512).do{ |val, i| f.(i, val) } },
		\$3, { Array.fill(1024, { |i| sin(i/1024*2pi) * 256 + 256 }).do{ |val, i| f.(i, val) } },
		\$4, { Array.fill(1024, { |i| (i/512).floor * 512 }).do{ |val, i| f.(i, val) } },
		\$5, { Pbrown(0,512,16).asStream.nextN(1024).do{ |val, i| f.(i, val) } },
		\$6, { (Array.fill(1024, { |i| sin(i/1024*2pi) * 200 + 256 }) + Pbrown(0,32,8).asStream.nextN(1024)).do{ |val, i| f.(i, val) } },
	);
};

);

(
// make a pattern player with a simple synth with COsc
x = Pbind(
	\type, \set,
	\id, { |freq| LeakDC.ar(COsc.ar(b, freq, 1))!2 * 0.5 }.play,
	\octave, 3,
	\scale, Scale.minorPentatonic,
	\degree, Pn(Plazy{Pseq(Pxrand((0..4),inf).asStream.nextN(4),4)}),
	\dur, 1/4
).play;
);

// clean up
w.onClose_({
	b.free;
	x.stop;
});
