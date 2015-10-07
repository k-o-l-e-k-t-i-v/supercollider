HistoryPlayer{
	classvar version = 0.01;
	var win;
	var buttons;
	var texts;
	var sliders;

	var currentHistory, pathHistory;
	var lines, currentLine;
	var startTime, endTime, currentTime;
	var isPlaying;

	*new {
		^super.new.initPlayer();
	}
	*close{
		"konec".postln;
	}

	lineTime {|lineMsg|	currentHistory.notNil.if({ ^lineMsg[0];	});	}

	linePlayer {|lineMsg| currentHistory.notNil.if({ ^lineMsg[1]; }); }

	lineCode {|lineMsg| currentHistory.notNil.if({ ^lineMsg[2];	});	}

	currentIndex { |time|
		currentHistory.notNil.if({
			var i = 0;
			var answ = lines.size-1;
			answ = block {|break|
				lines.do {|oneLine, i|
					var tempTime = this.lineTime(oneLine);
					(time <= tempTime).if({ break.value(i); }, { i = i + 1; });
				};
			};
			answ.isInteger.if({^answ}, {^(lines.size-1)});
		});
	}

	initData{
		currentHistory.notNil.if({

			startTime = this.lineTime(lines[0]);
			endTime = this.lineTime(lines[lines.size-1]);

			texts.at(\historyPath).string_("openPath : %".format(pathHistory));
			texts.at(\historyLinesCount).string_("lines : %".format(currentHistory.lines.size-1));
			texts.at(\historyStartTime).string_("StartTime : %".format(startTime));
			texts.at(\historyEndTime).string_("EndTime : %".format(endTime));
		});

	}

	refreshData {|index|
		currentHistory.notNil.if({

			texts.at(\currentTime).string_("CurrentTime : %".format(currentTime));
			sliders.at(\timeSlider).valueAction_(currentTime/endTime);

			texts.at(\currentHistoryLine).string_("HistoryLine : %".format((index)));
			texts.at(\currentHistoryTime).string_("HistoryTime : %".format(this.lineTime(lines[index])));
			texts.at(\currentHistoryPlayer).string_("HistoryPlayer : %".format(this.linePlayer(lines[index])));

			texts.at(\codeLine).string_(this.lineCode(lines[index]));

		});
	}

	play {
		currentHistory.notNil.if({

			var playClock;
			var txtTime;
			currentHistory.play(verbose:false);
			// currentHistory.play(verbose:true);
			// History.play(posledni prehrany line, prvni prehrany line)
			this.initData;
			isPlaying = true;
			currentTime = 0;
			playClock = {
				currentLine = this.currentIndex(currentTime);
				// currentLine.postln;
				this.refreshData(currentLine);

				(currentTime > endTime).if({
					buttons.at(\stop).valueAction_(1);
					isPlaying = false;
					nil; //loopEnd
				},{
					currentTime = currentTime + 0.25;
					0.25; //loopTime
				}
				);
			};
			AppClock.play(playClock);
		});

	}

	stop {
		currentHistory.notNil.if({
			currentHistory.stop;
			currentTime = endTime - 0.1;
			sliders.at(\timeSlider).valueAction_(0);
			Server.local.freeAll;
		});
	}

	initPlayer{
		Server.local.waitForBoot({
			AppClock.sched(0.0, {

				var controlView, historyView, timeView, codeView;
				var colBack = Color.new255(30,30,30);
				var colFront = Color.new255(255,255,255);
				var colActive = Color.new255(200,50,50);
				var colChange = Color.new255(75,65,45);
				var fontBig = Font("Segoe UI", 10,true);
				var fontSmall = Font("Segoe UI", 9);
				var posX = 10;
				var sizeX = 30;
				var sizeY = 30;

				buttons = Dictionary.new;
				texts = Dictionary.new;
				sliders = Dictionary.new;
				currentHistory = nil;
				lines = nil;
				currentLine = 0;
				pathHistory = "";
				isPlaying = false;

				// VIEWS //////////////////////////////////

				win = Window.new("HistoryPlayer v%".format(version), Rect(200,200,400,600), false)
				.alpha_(0.95)
				.alwaysOnTop_(true)
				.background_(colBack)
				.front
				// .userCanClose_(false)
				.onClose_({ super.class.close; });

				codeView = UserView(win, Rect( 10, 10, (win.bounds.width - 20), 250))
				// .background_(colBack)
				;

				timeView = UserView(win, Rect( 10, (win.bounds.height - 250), (win.bounds.width - 20), 60))
				.background_(colBack)
				.drawFunc = {
					Pen.strokeColor = colFront;
					Pen.addRect(Rect(0,0, timeView.bounds.width, timeView.bounds.height));
					Pen.stroke;
				};

				historyView = UserView(win, Rect( 10, (win.bounds.height - 180), (win.bounds.width - 20), 110))
				.background_(colBack)
				.drawFunc = {
					Pen.strokeColor = colFront;
					Pen.addRect(Rect(0,0, historyView.bounds.width, historyView.bounds.height));
					Pen.stroke;
				};

				controlView = UserView(win, Rect( 10, (win.bounds.height - 60), (win.bounds.width - 20), 50))
				.background_(colBack)
				.drawFunc = {
					Pen.strokeColor = colFront;
					Pen.addRect(Rect(0,0, controlView.bounds.width, controlView.bounds.height));
					Pen.stroke;
				};

				// TEXTS //////////////////////////////////

				texts.put(\historyPath, StaticText( historyView, Rect( 10, 10, (historyView.bounds.width - 20), 20))
					.string_("historyPath : %".format(pathHistory))
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\historyLinesCount, StaticText( historyView, Rect( 10, 30, (historyView.bounds.width - 20), 20))
					.string_("lines : nil")
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\historyStartTime, StaticText( historyView, Rect( 10, 50, (historyView.bounds.width - 20), 20))
					.string_("StartTime : nil")
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\historyEndTime, StaticText( historyView, Rect( 10, 70, (historyView.bounds.width - 20), 20))
					.string_("EndTime : nil")
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\currentTime, StaticText( timeView, Rect( 10, 10, (historyView.bounds.width - 20), 20))
					.string_("CurrentTime : nil")
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\currentHistoryLine, StaticText( historyView, Rect( 150, 30, (historyView.bounds.width - 20), 20))
					.string_("HistoryLine : nil")
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\currentHistoryTime, StaticText( historyView, Rect( 150, 50, (historyView.bounds.width - 20), 20))
					.string_("HistoryTime : nil")
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\currentHistoryPlayer, StaticText( historyView, Rect( 150, 70, (historyView.bounds.width - 20), 20))
					.string_("HistoryPlayer : nil")
					.font_(fontBig)
					.stringColor_(colFront)
				);

				texts.put(\codeLine, TextView(codeView, Rect( 0, 0, codeView.bounds.width, codeView.bounds.height))
					.font_(fontSmall)
					// .stringColor_(colFront)
					// .background_(colBack)
					.palette_(QPalette.dark)
					.syntaxColorize
					.editable_(false)
					// .hasVerticalScroller_(true)
				);

				// SLIDER //////////////////////////////////

				sliders.put(\timeSlider, Slider(timeView, Rect( 10, 40, (timeView.bounds.width - 20), 10))
/*
					.action_({|slider|
						isPlaying.not.if({
							currentHistory.notNil.if({
								var selLine = endTime * slider.value;
								// var selLine = ((lines.size) * slider.value).floor;
								// selLine.postln;
								this.refreshData(selLine);
							});
						});
					});
*/
				);

				// BUTTONS //////////////////////////////////

				buttons.put(\play, Button(controlView, Rect(posX, ((controlView.bounds.height/2) - (sizeY/2)), sizeX, sizeY))
					.font_(fontSmall)
					.states_([
						["play",colFront,colBack],
						["play",colFront,colActive]
					])
					.action_({ |butt|
						if(butt.value == 1) {
							buttons.do({|colection| colection.value = 0;});
							butt.value = 1;
							"this.play;".postln;
							this.play;
						};
						if(butt.value == 0) { "this.free;".postln };
					});
				);
				posX = posX + sizeX + 5;

				buttons.put(\stop, Button(controlView, Rect(posX, ((controlView.bounds.height/2) - (sizeY/2)), sizeX, sizeY))
					.font_(fontSmall)
					.states_([
						["stop",colFront,colBack],
						["stop",colFront,colActive]
					])
					.action_({ |butt|
						if(butt.value == 1) {
							buttons.do({|colection| colection.value = 0;});
							butt.value = 1;
							AppClock.sched(0.05, {butt.value = 0};);
							"this.stop;".postln;
							this.stop;
						};
						if(butt.value == 0) { "this.free;".postln };
					});
				);
				posX = posX + sizeX + 5;

				buttons.put(\open, Button(controlView, Rect(posX, ((controlView.bounds.height/2) - (sizeY/2)), sizeX, sizeY))
					.font_(fontSmall)
					.states_([
						["open",colFront,colBack],
						["open",colFront,colActive]
					])
					.action_({ |butt|
						if(butt.value == 1) {
							File.openDialog (nil, { |path|
								butt.value = 1;
								pathHistory = path;
								currentHistory = History.clear.loadCS(path);
								lines = currentHistory.lines.reverse;
								buttons.do({|colection| colection.value = 0;});

								this.initData(0);

								AppClock.sched(0.05, {butt.value = 0};);
							}, {
								butt.value = 0;
							});
						};
						if(butt.value == 0) { "this.free;".postln };
					});
				);
				posX = posX + sizeX + 5;

				buttons.put(\close, Button(controlView, Rect(posX, ((controlView.bounds.height/2) - (sizeY/2)), sizeX, sizeY))
					.font_(fontSmall)
					.states_([
						["close",colFront,colBack],
						["close",colFront,colActive]
					])
					.action_({ |butt|
						if(butt.value == 1) {
							"this.close;".postln ;
							this.stop;
							win.close;
							butt.value = 1;
						};
						if(butt.value == 0) { "this.free;".postln };
					});
				);
				posX = posX + sizeX + 5;

				nil; // time to repeat
			}).play;
		});
	}


}