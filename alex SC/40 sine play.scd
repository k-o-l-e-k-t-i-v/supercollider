(
{
var freq = 200;
SinOsc.ar(freq, 0, 0.2)   +
SinOsc.ar(freq*2, 0, 0.2) +
SinOsc.ar(freq*3, 0, 0.2) +
SinOsc.ar(freq*4, 0, 0.2)
!2}.play
)

s.scope(2);

Array.fill(5, {arg i; i.postln;});

Array.fill(5,{arg i; i.postln;}).sum;

sum({arg i; i.postln;}!5);

(
n={
	({arg i;
		var j=i+1;
		SinOsc.ar(300*j,0,0.6/j)
	}!30).sum
	!2};
)

n.plot;
n.play;

(
f = {
       ({arg i;
                var j = i + 1;
                SinOsc.ar(300 * j, pi, 0.6/j) // note pi
        } ! 30).sum;
};
)

f.plot;
f.play;


//monster no 1

(
(
m={
	({arg i;
		var j=i*2+0.5; //change from 0.5 to 5 or so
		SinOsc.ar(LFNoise0.kr(0.5).range(60,100).round(20)*j,
			[pi/Array.fill(5,{arg i; i=SinOsc.kr([1,2])}).sum,pi/Array.fill(5,{arg i; i=SinOsc.kr([4/3,6/8])}).sum],
			0.2/j)  //change amp
	}!10).sum;
};
).plot;
m.play;
)


(
(
x={
	({arg i;
		var j=i*2+1;
		SinOsc.ar(30*j,0,)
	}!10).sum;
};
).plot;
x.play;
)
s.scope(2);
