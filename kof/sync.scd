



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
        var imp = Impulse.kr(~tempo) ;
        var n = [55,60,36,72].midicps;
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.0],[3,-3]),imp);
        var sig = SinOsc.ar(n+(env**50*100),env**40*8pi,mul:0.5) + VarSaw.ar(n,0,env**0.2,mul:0.2)* env;
        SendTrig.kr(imp,0 , 255 );
        
        Splay.ar(DC.ar(0),0.005,0.5);
    
    };
    ~send.play();
);


//resender
(
    m = NetAddr("127.0.0.1", 10001);

    //resend triggers to local network
    o = OSCFunc({ arg ...args; m.sendMsg("/bang",args[0][3]);},'/tr', s.addr);
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
