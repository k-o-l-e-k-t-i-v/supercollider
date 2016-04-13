Loop{
	classvar synth=2;
	var boxChoise, pressLib, lib;

	var aaa;



	*new{|boxName|
		this.postln; //posts "Loop"

		^super.new().init(boxName); //initiates an instance method called init
		//^super.newCopyArgs(boxName).emptybox(boxName);
		// this.emptybox().postln;

	}

	*classPrint{
		^synth.postln;
	}

	init{|boxName|
		boxChoise = boxName;

		lib = Dictionary.new();
		switch (boxChoise.asSymbol,  //input box name
			\box1, { lib.put(\box1, (44..55)); },
			\box2, { lib.put(\box2, (71..90)); },
			{"bad box keyName".error; ^nil;} //error in case of bad box name
		);


		lib.postln();

		pressLib = Dictionary.new;
		lib.at(boxChoise).do({
			arg i;
			pressLib.put(i, 0);
		});
		pressLib.postln();
	}

	printBox{ ^lib.at(boxChoise); }

	print{
		^boxChoise;
	}



	setInstance{|text| aaa = text; }

	printInstance { ^synth.postln; }

}

