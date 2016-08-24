~play.play;
(
~play[0]={
	var sig;
	sig=
};
)


///Gemmatone sort of BPF with a nicer feel
{ GVerb.ar(Splay.ar(Gammatone.ar(GrayNoise.ar,[165,185,200,120,85,120,175]+100,15))*Decay.kr(Impulse.kr([2,5]*fib(5))),40,4)}.play;


//try passing a signal through the hair cell; it won't come out like a pure sine, more like an impulse train stimulated by that input
{ Pan2.ar(HairCell.ar(SinOsc.ar(44),1,20,10),0) }.play;



//defaults
{Limiter.ar(Pan2.ar(Gendy4.ar(1,1,1,1,85,150,0.2,0.05,10),SinOsc.kr(0.25)))}.play;

//wandering bass/ powerline
{Pan2.ar(Gendy4.ar(1,1,1.0,1.0,30,100,0.3,0.05,5))}.play

//play me
{Pan2.ar(RLPF.ar(Gendy4.ar(2,3,minfreq:20, maxfreq:MouseX.kr(100,1000), durscale:0.0, initCPs:40), 500,0.3, 0.2), 0.0)}.play
