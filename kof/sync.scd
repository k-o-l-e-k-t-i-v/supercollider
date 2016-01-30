



(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
    p.clock.tempo_(60/60);
)




// sending to localhost
(
    ~send = {SendTrig.kr(Impulse.kr(1) ,0 , 2000 )};
);


//resender
(
    m = NetAddr("224.0.0.1", 10001);

    //resend triggers to local network
    o = OSCFunc({ arg ...args; m.sendMsg("/tempo",args[0][3]);},'/tr', s.addr);
)


//receiver
(
    var port = 10000;
    thisProcess.openUDPPort(port); // attempt to open 10001
    thisProcess.openPorts;
    r = OSCFunc({arg ...args; 
        // do something on recieve here
        args[0][1].postln;

    },"/tempo",recvPort:port);
)
