s.reboot;
p = ProxySpace.push(s).makeTempoClock;

~test = NodeProxy.audio(s, 2)
~test.play
~test.fadeTime = 0;
~test[0] = {|freq = 80, fplus = 0, amp = 0.5| SinOsc.ar((freq + fplus)!2 , mul:amp) }
~test[1] = \map -> { QuantNode(\amp, 2).env3(Env([0.0,1,0.1],[0.25, 2.25], \sin)) }
~test[2] = \map -> { QuantNode(\fplus, 8).env3(Env([0,20,0],[0.05, 1.95])) }
~test[3] = \map -> { QuantNode(\freq, 1).env3(Env([80,170,80],[0.005, 0.09], \exp)) }

~test[10] = \filter ->

~test.scope
QuantMap.print

~test.unmap(\freq)
~test.stop(8)

