


(
    p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);



(
    ~tempo = 120/60;
    ~offset = (0..7)/8;
    // t = TempoClock.new(~tempo);
    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~offset = (0..7)+0.5/8;
    ~tick2.quant = 1;
    ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
    ~counter = {PulseCount.kr(~tick.kr)};
    ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)




////////////////////
///////////////////

(

    // bang synth ///////////////////////////////////////

    (
        ~bang.quant=1;
        ~bang.fadeTime=0.02;
        ~bang={
            //         |       |       |       |       |  
            var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0];
            var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3]),imp * hit);
            var sig = SinOsc.ar(70+(env**20*90*[1,2,1.5,4]));
            sig = sig * env;
            Splay.ar(sig,0.75,0.5);
        };
        ~bang.play;
    );


    // hit synth ///////////////////////////////////////

    (
        ~hh.quant=1;
        ~hh.fadeTime=8.02;
        ~hh={
            //         |       |       |       |       |  
            var pat = [0,0,1,0,0,0,1,0,0,0,1,0,1,1,1,1];
            var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,[0.05,0.25]],[3,-3]),imp * hit);
            var sig = RHPF.ar(WhiteNoise.ar(LFNoise2.kr(1/4!4)*2),[2000,12000,8000,800]);
            sig = sig * env;
            Splay.ar(sig,0.75,0.35);
        };
        ~hh.play;
    );


    // saw synth ///////////////////////////////////////

    (
        ~saw.quant=1;
        ~saw.fadeTime=16.02;
        ~saw={
            //         |       |       |       |       |  
            var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0];
            var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var mod = Select.kr(PulseCount.kr(imp[0])/(8*8)+1%4,[1,2,1.5,1.25]);
            var freq = Select.kr(PulseCount.kr(hit)%8,90*8/mod/[1,4,1,1.5,1,2,1,1.25]);
            var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo/fib(4),0.5],[3,-3]),imp * hit);
            var sig = Formant.ar(freq+SinOsc.ar(1/~tempo/fib(4)),freq/2,[freq/2,freq*8,freq*4,freq]);
            sig = Resonz.ar(sig,freq+(env**10*100),0.2)*2;
            sig = HPF.ar(sig,100);
            sig = sig * env;
            Splay.ar(sig.flat,0.75,0.05);
        };
        ~saw.play;
    );


    // filter filter ///////////////////////////////////////

    (
        ~filter.quant=16;
        ~filter.fadeTime=8;
        ~filter={
            var high,mid,low;
            var sig = ~saw + ~hh + ~bang;

            sig = GVerb.ar(LPF.ar(sig,3000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[20,90])/16 + sig;
            low = CompanderD.ar(LPF.ar(sig,180),3/4,1/2,1/2);
            mid = CompanderD.ar(BPF.ar(sig,900,2),3/4,1/2,1/2);
            high = CompanderD.ar(HPF.ar(sig,3000),3/4,1/2,1/2);
            sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
            Splay.ar(sig,0.75,0.25);
        };
        ~filter.play;
    );

)
