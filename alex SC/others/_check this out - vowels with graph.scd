// Vowel space by formants f2 f1
(
SynthDef(\vocali, { arg f1, f2, fund = 70, amp = 0.25 ;
var source = Saw.ar(fund);
var vowel = Normalizer.ar(BPF.ar(source, f1, 0.1))
+
Normalizer.ar(BPF.ar(source, f2, 0.1))
* amp ;
Out.ar(0, vowel.dup)
}).add ;
)
(
~synth = Synth(\vocali) ;
d = 600; e = 400; f;
w = Window("Spazio formantico", Rect(100, 100, d+20, e+20) ).front ;
Array.series(21, 2500, 100.neg).do{|i,j|
	StaticText(w, Rect(j*(d/21)+5, 10, 30,10 ))
	.font_(Font("Helvetica", 8))
	.string_(i.asString)
} ;
Array.series(14, 200, 50).do{|i,j|
	StaticText(w, Rect(d, j*(e/14)+20, 30, 10 ))
	.font_(Font("Helvetica", 8))
	.string_(i.asString)
} ;
u = UserView(w, Rect(0, 20, d, e)).background_(Color.white) ;
f = {|v, f2, f1| StaticText(u,
	Rect(f2.linlin(500, 2500, d, 0),
		f1.linlin(200, 800, 0, e)-18, 40,40))
	.string_(v).font_(Font("Helvetica", 18))
} ;
~vow = (
	// no unicode alas
	\i:[2300, 300], \e: [2150, 440], \E: [1830, 580],
	\a: [1620, 780], \O: [900, 580], \o: [730, 440],
	\u: [780, 290],\y: [1750, 300],\oe: [1600, 440],
	\OE: [1400, 580]
) ;
~vow.keys.asArray.do{|key|
	var f2 = ~vow[key].postln[0] ;
	var f1 = ~vow[key][1] ;
	f.value(key.asString, f2, f1)
} ;
w.acceptsMouseOver = true ;
u.mouseOverAction_({|v,x,y|
	~synth.set(
		\f2, x.linlin(0, d, 2500, 500).postln,
		\f1, y.linlin(0, e, 200, 850).postln,
	)
})
)