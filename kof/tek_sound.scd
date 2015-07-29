


(
    p=ProxySpace.push(s.reboot);
);



// system_sound synth ///////////////////////////////////////

(
    ~system_sound.quant=1;
    ~system_sound.fadeTime=0.02;
    ~system_sound={
        var temp = 3/4/4;

        var sig;
        var kick,hat,sirena;

        // kick
        var imp = Impulse.ar(temp,((1..16)++[0.5,0.25])/16);
        var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[5,-7]),imp);
        var env1 = EnvGen.ar(Env([0,1,0],[0.002,0.25],[9,-10]),imp);
        var env2 = EnvGen.ar(Env([0,1,0],[0.25,0.15],[5,-7]),imp);

        kick = Mix.fill(8,{|i| BPF.ar(SinOsc.ar(100 + (env1*200),mul:0.75),1200/8*(i+1),0.2 )*8;});
        kick = kick * env + LFSaw.ar(44*(1.00001**(1..8)),mul:env2);
        kick = CompanderD.ar(kick,3/4,1/2,1/2);
 
        // hat
        imp = Impulse.ar(temp,((1..16)++[0.5,0.25]+0.5)/16);
        env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[5,-7]),imp);

        hat = RHPF.ar(WhiteNoise.ar(0.8!4),12800);
        hat = hat * env;
        hat = CompanderD.ar(hat,3/4,1/2,1/2);
        

        // sirena
        imp = Impulse.ar(temp,((1..16)++[0.5,0.25]+0.125)/16);
        env = EnvGen.ar(Env([0,1,0],[0.15,0.5],[5,-7]),imp);

        sirena = Mix.fill(8,{|i| VarSaw.ar(432+i+(env*10),mul:0.2);});
        //sirena = Resonz.ar(sirena,LFSaw.kr(4/fib(4))*800+100,0.2);
        sirena = sirena * env;
        sirena = CompanderD.ar(sirena,3/4,1/2,1/2);
        
        sig = kick ;
        sig = hat + sig;
        sig = sirena * LFNoise2.kr(1/4!4) + sig;

        
        Splay.ar(Mix(sig),0.25,0.5);
    };
    ~system_sound.play;
);
~system_sound.stop(7);
~system_sound.clear;
