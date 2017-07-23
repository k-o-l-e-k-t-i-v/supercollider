



(
    p.push();
    //=ProxySpace.push(s.reboot);
    p.bpm(90);
    //p.makeTempoClock;
   // p.clock.tempo_(60/60);
)




// sending to localhost
(
    ~send.quant=4;
    ~send.ar(2);
    ~send = {
        var imp = Impulse.kr(~tempo*8/[1,2,3,4]) ;
        var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
        var n = [36,60,36,72].midicps/mod;
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.0],[3,-3]),imp);
        var sig = Blip.ar(n,env**40*20,mul:0.25) * env;
        SendTrig.kr(imp, 0 , n );
        
        Splay.ar(sig,0.005,0.25);
    
    };
    ~send.play();
);


//resender
(
    m = NetAddr("127.0.0.1", 10001);

    //resend triggers to local network
    o = OSCFunc({ arg ...args; args[0].postln; m.sendMsg("/bang",args[0][3]);},'/tr', s.addr);
)

// -------------------------------
//receiver
(
    var port = 10001;
    thisProcess.openUDPPort(port); // attempt to open 10001
    thisProcess.openPorts;
    r = OSCFunc({arg ...args; 
        // do something on recieve here
        args[0][1].postln;

    },"/tempo",recvPort:port);
)
