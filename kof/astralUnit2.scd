b=Buffer.read(s,"/home/kof/Pictures/android/mono.wav");
m = 499.004/1000;

p.push;
p.bpm(240*m);

s.prepareForRecord("/home/kof/Pictures/android/fm_stereo.wav",2);

 // one synth ///////////////////////////////////////

 (
 ~one.ar(2);
 ~one.quant=4;
 ~one.fadeTime=5;
 ~one={
var puls = Pulse.ar(~tempo*[1,2,4,8,10,1/2,1/4,1/8,1/16,1/32,1/12,1/24]).softclip;
   var sig = PlayBuf.ar(2,b.bufnum,1);
   sig = SinOsc.ar(sig.range(22,16000),mul:0.7);
   sig = LPF.ar(sig,8000);
   sig = sig * puls;
   Splay.ar(sig,1,0.75);
 };
s.record("/home/kof/Pictures/android/fm_stereo.wav",duration:499.004);
 ~one.play;
 );
 ~one.stop(4);
 ~one.clear;
 ~one.pause;
 ~one.resume;



 (
   ~master.quant=2;
   ~master.play;
   ~master.fadeTime = 0.01;
   ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
   var sig = In.ar([0,1]);
   var orig = sig;
   var fx;
   //fx = Limiter.ar(sig,0.95);
   sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
   fx = LPF.ar(sig,lp);
   fx = HPF.ar(fx,hp);
   fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
   sig = SelectX.ar(wet,[orig,fx]);
   sig = NumChannels.ar(sig,2);
   ReplaceOut.ar(0,sig);
   };
 );
 p.moveNodeToTail(\master);
