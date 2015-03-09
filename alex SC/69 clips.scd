////synths only

///SinOsc
{Clip.ar(SinOsc.ar([15,15+0.35]),0.1,0.4)-0.4}.play;

{Pan2.ar(Clip.ar(SinOsc.ar([15,20,10,15].sum),SinOsc.kr(0.25).range(0.1,0.3),0.9),SinOsc.kr(0.5))}.play;

{Clip.ar(SinOsc.ar(LFNoise0.kr(1/[3,5]).range(110,220).round(40)*(1..8)),SinOsc.kr(1/[3,5,8,13]).range(0.1,0.3),0.5).lag(0.002)}.play;






///Pulse

{Pulse.ar(LFNoise0.kr(1/[1,3,5,8]).range(250.550).round(50),SinOsc.kr(0.25).range(0.4,0.8)).clip(0.1,0.2).lag(0.002)-0.3}.play;





//LFSaw

{LFSaw.ar([45,45+2,45],[0,pi,2*pi],SinOsc.kr(0.25).range(2,5)).clip(0.1,0.4).lag(0.002)-SinOsc.kr(0.25).range(0.2,0.3)}.play;


//noise

{Clip.ar(WhiteNoise.ar(0.5),0.25,0.285)}.play;
{Clip.ar(GrayNoise.ar,LFSaw.kr(1),0.5).lag(0.002)-0.5}.play;
{Clip.ar(GrayNoise.ar(0.5),0.25,0.55)-0.5}.play;
{LFDClipNoise.ar(LFNoise0.kr(5).range(100,1000).round(55),mul:0.2)}.play;
{Clip.ar(GrayNoise.ar([0.8,0.8]),0.5,0.85)-0.3}.play;