p.push();
p.bpm(138.88)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.4;
~one={
    var mod2= Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333,15/8,2],inf));
    var mod = Duty.kr([16,32,1/4,1/2]/~tempo,0,Dseq([1,2,1.5,1.25],inf))/mod2;
    var f = [110,55,220,440]/0.864*mod*2 + SinOsc.kr(~tempo/2/[1,2,3,4],mul:pi);
  var sig = SinOsc.ar(f!2,Pulse.ar(~tempo*2/[1,2,3,4]))*Pulse.ar(~tempo*2/[1,2,3,4]);
  var am = 0.5 + SinOsc.kr(~tempo/16,mul:0.5);
  sig = Splay.ar(sig,0,0.05);
  sig = NumChannels.ar(sig,2);
  sig = BPF.ar(sig,SinOsc.ar(~tempo/4/[1,1.01]).range(f/2,f*4),0.12);
  sig = AllpassL.ar(sig,4/f,4/f);
  sig = LeakDC.ar(sig);
  sig = Perlin3.ar(sig/2+1,Pulse.ar(f/4)/2+2,LFTri.ar(f)*2+1)/16+sig/4;
  sig = LeakDC.ar(sig);
  sig = MoogVCF.ar(sig,f*2,0.59);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  sig = DelayN.ar(sig,[0,am]/.x f,[0,am]/.x f);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
