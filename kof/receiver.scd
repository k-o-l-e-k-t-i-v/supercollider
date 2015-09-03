
(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
    
)

(
    thisProcess.openUDPPort(10000);
    n = NetAddr.new("127.0.0.1", 10000);    // create the NetAddr
    o = OSCFunc({ arg ...args; args.postln; }, '/test', n);
)

~val = {0}.poll;
~synth={LPF.ar(LFSaw.ar(50) * 0.01 * ~val.kr)};
~synth.play;

o.free


