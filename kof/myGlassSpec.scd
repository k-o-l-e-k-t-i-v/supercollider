
// these are measured frequencies from the glass hit by spoon on baudline, it sounds almost exactly the same )

(
~glass={
	var trig = Dust.ar(1);
	var mod = 1;
	var sig = DynKlank.ar(`[
		[1589.7,3997,1589,6452,7177,6908,12039],
		nil,
		[1,1,0.1,0.1,0.1,0.1,0.1]],
	trig,mod,0,1);

	sig = FreeVerb.ar(sig,0.3,0.5);
	Splay.ar(sig,0.1);
};

~glass.play;
)


// melodies from it

(
~glass={
	var trig = Dust.ar(1/4!4);
	var mod = [1,1.25,1.5,1.75];
	var sig = DynKlank.ar(`[
		[1589.7,3997,1589,6452,7177,6908,12039],
		nil,
		[1,1,0.1,0.1,0.1,0.1,0.1]],
	trig,mod,0,1);

	sig = FreeVerb.ar(sig,0.3,0.5);
	Splay.ar(sig,0.1);
};

~glass.play;
)
