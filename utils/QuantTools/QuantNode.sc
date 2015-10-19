QuantNode{
	var <>key, <>quant;

	*new {|proxy, key = \amp, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2]|
		var node;
		node = NodeProxy.control(Server.local, 1).play;
		node.quant = quant;
		node.fadeTime = 20;
		node[0] = {
			EnvGen.ar(
				Env.new(
					[0,0.85,0.0],
					[1.05,8.95],
					[8,-8]
				),
				\trig.tr(0),
				timeScale: 1/currentEnvironment[\tempo].clock.tempo,
				doneAction:0)
		};
		node[1] = \set -> Pbind(\args, [\trig], \trig, 1, \dur, Pseq([Pn(4,4),1,3], inf));
		"proxy : %".format(proxy).postln;
		"getStructure : %".format(proxy.getStructure).postln;
		// proxy.xmap(key.asSymbol, node);
		^node;
		}

		// phase{ | index = 0, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2], offset = 0, repeats = 1 |

		// }

	}