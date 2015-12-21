QuantControl {

	var proxy, buffer;
	var <key, <quant, <fnc;

	*new {|key, quant, function| ^super.new.init(key, quant, function) }

	init{|argKey, argQuant, argFnc|
		key = argKey;
		quant = argQuant;
		fnc = argFnc;
	}

	code {|function|

	}

	text {
		var txt = "";
		txt = txt + "QCnt [key:%, qnt:%, fnc: %]".format(key, quant, fnc.asCompileString);
		^txt;
	}

}