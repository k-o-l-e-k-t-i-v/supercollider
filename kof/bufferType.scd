// kiler synth ///////////////////////////////////////

p.push();
(
    z=("910293021938437576".ascii).normalize;
    z = Array.fill(512, {|i| z[ i % z.size]-0.5});
    z = z.as(Signal).asWavetable;
    b.free;
    b=Buffer.loadCollection(s,z);
)

(

    ~one.ar(2);
    ~one.quant=8;
    ~one.fadeTime=2;
    ~one={
        var f = [60,64,69].midicps/2*[1,1.0001];
        var sig = Shaper.ar(b.bufnum,SinOsc.ar(f)/100+Shaper.ar(b.bufnum,LFSaw.ar(f/4)));
        sig = BPF.ar(sig,f/(2..33).log2,LFSaw.ar(~tempo/32/(1..32)).exprange(0.1,0.42));
        sig = LPF.ar(sig,f)+sig;
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig).softclip ;
        //  var f = LFSaw.ar(1/16/[1,2,3,4]).exprange(1/400,900);
        //  var sig = Shaper.ar(b.bufnum,Normalizer.ar(LFSaw.ar(48000/512/10/(1..80))/100+LFSaw.ar(f))) * Shaper.ar(b.bufnum,LFSaw.ar(8));
        Splay.ar(sig,0.15,0.15);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


