
s.reboot;

(
    // synchro odpal
    Ndef(\b).quant = 2.0;
    Ndef(\b).fadeTime = 2.0;

    Ndef(\b,{
	var pat,freqs;
        pat = [1,2,3,5,8,13,21,34,55,89];
        freqs = [34,30,20,56,82,106,126,111].midicps;
        Splay.ar(
            RLPF.ar(
                2 * Blip.ar(freqs  + LFNoise0.ar(12!4).range(-4,4).lag(0.01),2) * Decay.ar(Impulse.ar([8,4]/pat), pat/5)
                ,freqs)
            )
        }).play;

)
