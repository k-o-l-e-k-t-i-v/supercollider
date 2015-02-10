// put it into your SCClassLibrary and recompile the class library (Ctr+Shift+L)

// Ja_Mixer SC object, in progress..

JMix {
	var numCh;

	*new{arg xCh;
		^super.new.init(xCh);
	}

	init{arg xCh;
		numCh = xCh;
	}

	calc{arg x;
		^answ = numCh + x;
	}

	// *initClass Class Methods are called when the library compiles = you can initialize things here
	// that are classvars
	*initClass {
		numCh = 1;
	}
}


}

