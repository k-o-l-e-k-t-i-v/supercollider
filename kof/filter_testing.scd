(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
);


(
    ~filter.fadeTime=4;
    ~filter.quant=2;
    ~filter={
        p.arProxyNames.collect{|n|
                               var snth = (p[n.asSymbol]);
                               snth[10] = \filterIn -> {|in|
                                                        var sig = in * Pulse.ar(4);
                                                        sig = GVerb.ar(sig,100,3);
                                                        sig
                                                       };
                              }
    };
)


