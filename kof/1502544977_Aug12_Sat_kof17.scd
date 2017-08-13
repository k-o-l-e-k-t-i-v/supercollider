
p.push();

// roatate synth ///////////////////////////////////////

(
~roatate.ar(2);
~roatate.clock = p.clock;
~roatate.quant=2;
~roatate.fadeTime=4;
~roatate={
    var mod = Duty.kr(16/1.5,0,Dseq([1,2,1.5,1.33333],inf));
    var f = 60.midicps+[0,0.001]/mod;
    var r = SinOsc.ar([1,1.001]/32).exprange(1/4,10);
    var t = LFSaw.ar(f/[2,2.001]++f).range(0,2pi) + LFSaw.ar(1/600,mul:10);
    var x = t.cos;
    var y = t.sin;
    var z = 0;
    var angle = SinOsc.ar(f/1600.1/((1..16)/100000.0+1) ).range(0,4pi);
    var nx = (angle.cos * x) - (angle.sin * y);
    var ny = (angle.sin * x) - (angle.cos * y);
    var nz = (angle.sin * x) + (angle.cos * y);
    var sig = Perlin3.ar(nx+1.0*r,ny+1.0*r,nz+1.0*r);
    sig = LPF.ar(sig,1800);
    sig = SinOsc.ar(f,sig * 2pi);
    //sig = MoogFF.ar(sig,f*2,3.5) * 4;
    sig = Normalizer.ar(sig)/2;
    sig = LPF.ar(sig,400) + CombL.ar((LPF.ar(sig*4,1200)*Pulse.ar(4*1.49/[1,2,3,4])/4),8/f,[16,8,4,2]/f,1/4)/2;
    sig = LeakDC.ar(sig);
  Splay.ar(sig,0.95,0.25);
};
~roatate.play;
);
~roatate.stop(4);
~roatate.clear;
~roatate.pause;
~roatate.resume;
