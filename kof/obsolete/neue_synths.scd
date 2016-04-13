
(

    ////////////////////////////////////////////////////////////////////////

    ~base.quant=2;
    ~base={Duty.kr(16,0,Dseq(60+[-12,12,-24,24,0,0],inf))};

    ~mel.quant=2;
    ~mel={Duty.kr(Dseq([4,2],inf),0,Dseq([2,1.5,2,1.25,2,1.125,1,4],inf))};

    ~sel.quant=2;
    ~sel={Duty.kr(1/2,0,Dseq([-12,12,1,-24],inf))};

    ///////////////////////////////////////////////////////////////////////
    
    ~neue.quant=2;
    ~neue={
        var imp = Decay.ar(Impulse.ar(2/[2,4,8,6],(0..7)/8),0.75);
        var imp2 = Decay.ar(Impulse.ar(1/8,(0..7)++[0.5,0.25]+0.5/8),0.25);
        var imp3 = Decay.ar(Impulse.ar(1/2,(0..7)++[0.5,0.25]/8),3.75);

        var sig;
        var notes = (~base.ar+[0,~sel.ar]).midicps*4/(~mel.ar*pi);
        notes = Select.kr(LFSaw.kr(4/[2,4]).range(0,notes.size+0.01),notes);
        sig = LFSaw.ar(notes*(1.00001**(1..8))*(imp3**0.004+1),mul:2);

        //sig = CombN.ar(sig,1,1,4);

        sig = Resonz.ar(sig,150+(imp3*10000)) * imp3;

        sig = HPF.ar(sig,75);

        sig = sig + (SinOsc.ar(50!2+(imp**8*500),mul:0.95) * imp);

        sig = LPF.ar(sig,250);

        sig = sig + (PinkNoise.ar(imp2));

        sig = CompanderD.ar(sig,0.9,1/3,3);

        sig = Mix(sig)/2;

        sig = GVerb.ar(BPF.ar(sig,SinOsc.kr(1/8/[1,2]).range(110,12200)),100,10)/3 + (LPF.ar(sig,SinOsc.kr(1/[4,8]).range(100,1200))/3);

        Splay.ar(sig.flat,1).softclip;

    };

    ///////////////////////////////////////////////////////////////////////
    ~neue.play;
)


//i think you should get sick more often. and give me whatever you got as well. goddammit <3
// lol, I am fine now, thanks))
