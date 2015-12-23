QuantNode {

	// var <>key;
	// var stage, phase;
	var <>nodeName;
	var <>proxy;
	var group;
	// var <>proxyName, <>slot;
	var <qControls;
	// var >levels, >times, >curves;
	// var <node, <prewNode;
	// var group, bus;
	// var clock;

	*new {|nodeName, stageGroup| ^super.new.init(nodeName, stageGroup);	}
	// *new {|proxy, slot, phase, qObject| ^super.new.init(proxy, slot, phase, qObject);	}
	// *new2 {|key, quant, fadeTime| ^super.new.init(key, quant, fadeTime);	}

	// init{|proxy, slot, phase, qObject|
	init{|argNodeName, stageGroup|

		argNodeName.asSymbol.envirGet.isNil.if({
			"novy nodeProxy".warn;

			proxy = NodeProxy.audio(Server.local, 2);
			proxy.put(0, {SinOsc.ar(\freq.kr(120)!2, mul:Saw.kr(1,0.25,0.4), add:\add.kr(0))}, now:false); //.play(currGroup);
			argNodeName.asSymbol.envirPut(proxy);
		}, {
			"neni novy nodeProxy".warn;
			proxy = argNodeName.asSymbol.envirGet;
		}
		);

		group = stageGroup;
		proxy.fadeTime = 4;
		// proxy[0] = {SinOsc.ar(\freq.kr(120)!2, mul:Saw.kr(1,0.25,0.4), add:\add.kr(0))}; //.play(currGroup);


		nodeName = argNodeName;

		// this.initControlKeys;
		// this.slot = slot;
		/*
		qControls.isNil.if(
		{
		qControls = MultiLevelIdentityDictionary.new();
		// nodeName = proxy.envirKey;
		// group = proxy.group;
		"\nQuantNode init nodeName[%]".format(nodeName).postln;
		},
		{ "QuantNode nodeName % exist".format(nodeName)  }
		);

		// this.addObject(slot, phase, qObject);

		// this.print;
		*/
	}

	initControlKeys {
		// qControls = Dictionary.new;
		proxy.controlKeys.do({|oneKey|
			oneKey.postln;
			QGui.addControl(nodeName, oneKey);
			// qControls.put(oneKey.asSymbol, QuantControl(oneKey, 1, {Env( [0,1,0], [0.15,0.85], [8,-4] )}));
		})
	}

	text {
		var txt = "";
		txt = txt + "\n\t\tsource: %".format(proxy.source.def.sourceCode);
		qControls.do({|oneControl|
			txt = txt + "\n\t\t%".format(oneControl.text);
		});
		^txt;
	}
	/*
	release {
	"\nQuantNode [%] release".format(nodeName).postln;
	}



	addObject{|slot, phase, qObject|
	var key = qObject.key;
	// UPRAVIT MAPU NA -> KEY / SLOT
	//                        / PHASE / CURRENTOBJECT
	//                                / PREVIOUSOBJECT
	//                        / GROUP


	// "QuantNode addObject nodeName:%".format(nodeName);
	// "QuantNode addObject proxy.envirKey:%".format(nodeName);
	// "QuantNode addObject qControls: %".format(qControls).postln;
	"\nQuantNode addObject [nodeName:%, slot:%, phase:%, qObject:%]".format(nodeName, slot, phase, qObject).postln;
	qControls.at(nodeName, slot, phase, \current).notNil.if({
	qControls.put(nodeName, slot, phase, \previous, qControls.at(nodeName, slot, phase, \current));
	});
	qControls.put(nodeName, slot, phase, \current, qObject);
	}

	removeObject {|slot, phase, getCurrent|
	getCurrent.if(
	{ qControls.removeEmptyAt(nodeName, slot, phase, \current); },
	{ qControls.removeEmptyAt(nodeName, slot, phase, \previous); }
	)
	}
	*/


	/*
	init2{|key, quant, fadeTime|
	var instance;
	this.key = key;

	instance = QuantMap.currentNode;
	"instance: %".format(instance).postln;
	instance.isNil.if(
	{
	var defValue = QuantMap.currentProxy.getDefaultVal(key.asSymbol);
	// "% defValue: %".format(QuantMap.currentProxy.envirKey, defValue).postln;

	instance = this;
	node = NodeProxy.control(Server.local, 1);
	node.set(key.asSymbol, defValue); // ?? jak udelat fade z tyhle hodnoty

	clock = TempoClock.new();
	clock.permanent = true;
	},
	{
	node = instance.node;
	}
	);

	node.fadeTime = fadeTime;
	node.quant = quant;

	QuantMap.add(instance);
	^instance;
	}
	*/
	/*
	print{
	"\nQuantNode print".postln;
	// "init QuantNode %".format(QuantMap.findProxy(this)).postln;
	// "\t - key : %".format(key).postln;
	// "\t - quant : %".format(node.quant).postln;
	// "\t - fadeTime : %".format(node.fadeTime).postln;
	// "\t - levels : %".format(levels).postln;
	// "\t - times : %".format(times).postln;
	// "\t - curves : %".format(curves).postln;
	// "\t - bus : %".format(node.bus).postln;

	"proxy : %".format(nodeName).postln;
	// "\t - slot : %".format(slot).postln;

	qControls.sortedTreeDo(
	// {|proxy| proxy.notEmpty.if({"\nproxy ~%".format(proxy).postln;}); },
	{},
	{|path, qObject|
	var proxy = path[0];
	var slot = path[1];
	var phase = path[2];
	var objNewOld = path[3];
	// path.postln;
	// item.postln;
	"\t[%, %, %] QObject[%, levels%, times%, curves%]"
	.format(slot, phase, objNewOld, qObject.key, qObject.envelope.levels, qObject.envelope.times, qObject.envelope.curves).postln;
	// "\t[%] item : % (%)".format(slot, item, item.key).postln;
	},
	{},
	// {|node| node.notEmpty.if({"-----------".postln;})},
	{},
	{}
	);

	^nil;
	}
	*/

	// stop { clock.clear; }
	/*
	env { |env|
	var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);
	var synthDef, synth;

	node.group = proxy.group;

	synthDef = SynthDef(
	"qNode [ %, q%, c% ]".format(key, node.quant, node.index),
	{
	Out.kr(node.index, EnvGen.kr(env, doneAction:2))
	}
	).add;


	this.stop;

	"time2quant [%]".format(this.time2quant(node.quant)).postln;

	// t = TempoClock.default.sched(time2quant, {
	clock.sched(this.time2quant(node.quant), {

	node.source = synthDef;
	// "objects[index].synthDef.func: %".format(node.objects[0].synthDef.func).postln;
	// "\ntick quant [%]".format(node.quant).postln;
	// "\t-cBusIndex [%]".format(node.index).postln;
	// "\t-nodeNameDef [%]".format(synthDef.name).postln;
	// "\t-cBusChannels [%]".format(node.numChannels).postln;
	// "\t-nodeID [%]".format(node.nodeID).postln;
	// "\t-envDuration [%]".format(env.duration).postln;

	proxy.set(key.asSymbol, node);

	node.quant;
	});

	}
	time2quant{|quant|
	if(currentEnvironment === topEnvironment)
	{ ^TempoClock.default.timeToNextBeat(quant); }
	{ ^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant); };
	}
	*/



}
