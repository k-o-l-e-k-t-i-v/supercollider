


(
    x=Array.new(512);
    c=0;
thisProcess.openUDPPort(57120);
o = OSCFunc({ arg msg, time, addr, recvPort; x[c%512]=msg[1] ; c=c+1 ; c.postln; }, '/accelerometer');
)

