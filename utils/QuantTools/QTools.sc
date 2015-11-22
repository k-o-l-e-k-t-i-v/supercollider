QTools {

	*version { ^0.12 }

	*gui{
		Server.local.waitForBoot({
			QuantMap.new();
			QGui.new();
		});
	}

	*print { QuantMap.textMap.postln; }

	*addStage {|name| QuantMap.addStage(name) }
	*removeStage {|name| QuantMap.removeStage(name) }
	*currentStage {|name| QuantMap.stageCurrent_(name) }

	*addNodes {|stage, nodes|
		Server.local.waitForBoot({
			QuantMap.new();
			QuantMap.addStage(stage);
			nodes.do({|oneNode|
				QuantMap.addNode(stage, oneNode);
			});
			this.print;
		});
	}

	*removeNode {|stage, nodes|  }
}