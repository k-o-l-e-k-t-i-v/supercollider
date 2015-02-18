JMix_efx
{
	classvar version = 0.12;
	classvar server;
	var parentCh;


	*new{ |parent|
		^super.new.init(parent);
	}
	init{ |parent|
		server = Server.default;
		parentCh = parent;
	}

}