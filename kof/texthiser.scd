// kiler synth ///////////////////////////////////////

p.push();
(
z=("lola bezi o zivot".ascii).normalize;
z = Array.fill(512, {|i| z[ i % z.size]-0.5});
z = z.as(Signal).asWavetable;
b.free;
b=Buffer.loadCollection(s,z);
)


(

~one.ar(2);
~one.quant=2;
~one.fadeTime=0;
~one={
    
var sig =  Osc.ar(b.bufnum,(1..100));
sig = BPF.ar(sig,48000/512,LFSaw.ar(1/32).exprange(0.01,0.92));
sig = Normalizer.ar(sig);
  //  var f = LFSaw.ar(1/16/[1,2,3,4]).exprange(1/400,900);
//  var sig = Shaper.ar(b.bufnum,Normalizer.ar(LFSaw.ar(48000/512/10/(1..80))/100+LFSaw.ar(f))) * Shaper.ar(b.bufnum,LFSaw.ar(8));
Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


