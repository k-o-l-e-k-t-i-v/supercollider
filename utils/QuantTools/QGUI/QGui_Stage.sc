QGui_Stage : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var <>display;
	var <>isCurrent;
	var <positionY;
	var frameAlpha, routine;

	*new { | parent, bounds, stageName |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, stageName);
		^me;
	}

	init { |argParent, argBounds, stageName|

		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, stageName, argParent, argBounds).postln;
		});

		parent = argParent;
		bounds = argBounds;

		objects = Dictionary.new();
		this.name = stageName;
		this.setDisplay = parent.display;

		// QTools.print;
		// QGui.currentStage.asSymbol.postln;
		// this.name.asSymbol.postln;

		( QGui.currentStage.asSymbol == this.name.asSymbol ).if(
			{ isCurrent = true },
			{ isCurrent = false }
		);
		// isCurrent.postln;

		positionY = 0;
		frameAlpha = 0;

		objects.put(\StageName, TextField(this)
			.align_(\left)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
			.background_(Color.clear)
			.string_(this.name)
			.action_{|text|
				var oldName = this.name;
				// this.name = text.string;
				QGui.renameStage(oldName, text.string.asSymbol);
				parent.refresh;
			}
		);

		objects.put(\ButtonRemoveStage, QGui_Button(this)
			.name_("ButtonRemoveStage")
			.iconName("ButtonExitGUI")
			.colorFrameOver_(Color.clear)
			.keepingState_(false)
			.action_{|button|
				QGui.removeStage(this.name);
				parent.refresh;
			}
		);

		this.drawFunc = { this.draw };

		this.onResize_{
			this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionY, 5, 5, 40));
			objects[\StageName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
			objects[\ButtonRemoveStage].bounds_(Rect.offsetCornerRT(this.bounds, 5,5,15,15));
		};

		this.action_{
			objects[\StageName].string = this.name;
		};

		this.refresh;
	}

	setDisplay_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, this.name, bool).postln; });

		display = bool;
		this.visible_(bool);
	}

	moveTo{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, this.name, y).postln; });
		positionY = y;
	}

	recall {
		(QGui.debbuging and: thisClassDebugging).if({ ("!!!RECAL" + thisMethod).warn });

		/*
		(QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, this.name).postln; });

		objects[\StageName].string = this.name;

		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionY, 5, 5, 40));
		objects[\StageName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\ButtonRemoveStage].bounds_(Rect.offsetCornerRT(this.bounds, 5,5,15,15));
		*/
	}

	mouseDown{ arg x, y, modifiers, buttonNumber, clickCount;
		(QGui.debbuging and: thisClassDebugging).if({ "\n>>> % - %".format(thisMethod, this.name).postln; });
		QGui.currentStage_(this.name);
	}

	mouseEnter{
		// (QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, this.name).postln; });

		mouseEnterAction.value(this);
		this.frameEnter;
	}

	mouseLeave{
		// (QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, this.name).postln; });

		mouseLeaveAction.value(this);
		this.frameExit;
	}

	frameEnter {
		var time = 0.45;
		var frames = 30;
		routine.stop;
		routine = Routine({
			frames.do({|i|
				frameAlpha = (i+1)/frames * 255;
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock);
	}

	frameExit {
		var time = 0.15;
		var frames = 15;
		routine.stop;
		routine = Routine({
			frames.do({|i|
				frameAlpha = (frames -(i+1))/frames * 255;
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock)
	}

	draw {
		// (QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, this.name).postln; });

		// ("isCurrent: " + this.name + isCurrent).postln;

		isCurrent.if(
			{ this.background = Color.new255(50,60,70) }, // Color.new255(60,90,100)
			{ this.background = Color.clear }
		);

		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,180,240, frameAlpha);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;

		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}

}