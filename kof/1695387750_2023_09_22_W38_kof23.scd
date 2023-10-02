p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var hrm = Duty.kr(4/~tempo,0,Dseq([[1,5,8],[1,5,7],[12,5,5],[1,3,11]],inf));
    var rythm = Duty.kr([4,3,2]*~tempo,0,Dseq([1,2,1.5,1.33333]*[1,2,3],inf));
    var harm = (2**((hrm/12)+1) );
    var sig = LFSaw.ar(50*harm);
    sig = BPF.ar(sig,LFSaw.ar(~tempo/4*(2**(((1..24)/12)+1))).range(50,50*8*harm),0.15);
    sig = sig * Pulse.ar(~tempo*4/rythm);
    sig = CombN.ar(sig,1/~tempo,1/~tempo,2);
    sig = GVerb.ar(sig,90)/16+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
