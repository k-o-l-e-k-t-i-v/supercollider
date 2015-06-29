w=Window.new("gui", Rect(0,0,400,500));
w.front;
w.alwaysOnTop_(true);
Window.closeAll;

w.bounds;

~slider=Slider.new(w.view,Rect(20,20,150,30));
~slider.visible_(false);
~slider.bounds_(Rect(40,40,200,20));

w.view.children;

(
Window.closeAll;
w=Window("gui", Rect(750,50,500,200));
w.front;
w.alwaysOnTop_(true);

//slider
a = s=Slider(w, Rect(20,20,150,30));
a.value;
a.action_({arg obj; obj.value.postln});
a.background_(Color(0.33,0.22,0.11));
a.thumbSize_(20);
a.action_({
	arg obj;
	var cf;
	cf=obj.value.linexp(0,1,400,1000).postln;
	if(x.isPlaying,

		{x.set(\freq, cf)});

});

///knob

k=Knob(w, Rect(180,20,50,50));
k.action_({
	arg obj;
	var qual;
	qual=obj.value.linexp(0,1,1,100).reciprocal;
	if(
		x.isPlaying;
		{x.set(\rq, qual)}
	);
});

///button
b=Button(w, Rect(430,20,50,30));
b.states_([["off", Color.black, Color.gray],
	["on", Color.white, Color(0.33,0.22,0.11)]]);

b.action_({
	arg obj;
	if(obj.value==1,
		{
			x=Synth.new(\simple,
				[
					\freq, a.value.linexp(0,1,100,4000),
				    \rq, k.value.linexp(0,1,1,1000).reciprocal

				]
			).register;
		},
		{x.free};
)});

///knob

k=Knob(w, Rect(180,20,50,50));
k.action_({
	arg obj;
	var qual;
	qual=obj.value.linexp(0,1,1,100).reciprocal;
	if(
		x.isPlaying,
		{x.set(\rq, qual)}
	);
});

)

(
SynthDef(\simple, {
	arg freq=440, rq=0.2;
	var sig;
	sig=PinkNoise.ar(1!2);
	sig=BPF.ar(sig,
		freq.lag(0.02),
		rq.lag(0.02),
		1/rq.sqrt.lag(0.02));
	Out.ar(0, sig);}
).add;)

x=Synth.new(\simple);
x.free;
