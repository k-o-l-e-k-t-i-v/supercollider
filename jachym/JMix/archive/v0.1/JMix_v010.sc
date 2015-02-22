

// Ja_Mixer SC object, in progress.. non complated version


JMix_v010 {
	classvar version = 0.10;
	classvar server;
	classvar dirGlobal, dirMix, dirEfx;
	classvar <global;
	var <efxPath, <dict;

	var numCh;
	var <synG, mixG, ch_group;
	var master_ab, ch_ab;
	var ch_cb_amp, ch_cb_mute;
	var master_Synth, ch_Synth;



	classvar coll_FreqViews;




	*new { |efxPath|
		server = Server.default;
		// ("aaa").postln;
		^super.newCopyArgs(efxPath).init;
	}

	init {

		// ("JMix (ver. " ++ version ++ ")").postln;


		numCh = 2;

		synG = Group.new;
		mixG = Group.new(addAction:\addToTail);

		ch_Synth = List.new(numCh);
		ch_ab = List.new(numCh);
		ch_cb_amp = List.new(numCh);
		ch_cb_mute = List.new(numCh);
		ch_group = List.new(numCh);

		master_ab = Bus.audio(server, 2);
		master_Synth = Synth(\JMix_Limiter,[\bus, master_ab],mixG);

		numCh.do { |i|
			ch_group.add(Group.new(synG, \addAfter));
			ch_ab.add(Bus.audio(server, 2));
			ch_cb_amp.add(Bus.control(server, 1));
			ch_cb_mute.add(Bus.control(server, 1));

			ch_Synth.add(
				Synth(\JMix_Fader, [
					\in, ch_ab[i],
					\out, master_ab,
					\amp, ch_cb_amp[i].asMap,
					\mute, ch_cb_mute[i].asMap,
				], ch_group[i],\addToTail)
			);
		};



		dict = IdentityDictionary.new;
		efxPath = Platform.systemExtensionDir ++ "\/JMix\/Efx\/";
		// ("Efx path: " ++ efxPath).postln;
		// ("Efx path2: " ++ efxPath.dirname).postln;

		(efxPath ++ "*.scd").pathMatch.do{ |apath|
			// Lazy loading - ignore the file contents for now
			dict.put(apath.basename.splitext[0].asSymbol, 0); // we put "0" because can't actually put nil into a dictionary...
			// apath.postln;
		};

		this.memStore;
		// "after this.memStore".postln;

	}

	*initClass {


		// adresa slozky
		StartUp.add{
			//global = this.new(this.filenameSymbol.asString.dirname ++ "\/Efx");
			//("global: " ++ this.filenameSymbol.asString.dirname +/+ "Efx").postln;

			dirGlobal = this.new(this.filenameSymbol.asString.dirname);
			// ("JMix dirGlobal: " ++ this.filenameSymbol.asString.dirname).postln;

		}

	}

	*at { |key|
		^global.at(key)
	}

	at { |key|

		// Lazy loading
		if(dict[key]==0){
			dict[key] = thisProcess.interpreter.compileFile("%\/%.scd".format(efxPath, key)).value;
			// ("thisProcess.interpreter.compileFile: %\/%.scd".format(efxPath, key) ++ " - key: " ++ key).postln;
		};
		^dict[key]
	}

	scanAll { // Unlazy
		dict.keysDo{|key|
			this[key];
			// ("scanAll: " ++ key).postln;
		}
	}

	*memStore { |libname=\global, completionMsg, keepDef = true|
		^global.add(libname, completionMsg, keepDef)
	}
	memStore { |libname=\global, completionMsg, keepDef = true|
		// "memStore...".postln;
		this.scanAll;
		dict.do{|def|
			def.add(libname, completionMsg, keepDef);
			// ("def.add: " ++ def).postln;
		};
	}

	ch{ arg num; ^ch_ab[num]; }

	free{
		master_Synth.free;
		master_ab.free;

		numCh.do { |i|
			ch_Synth[i].free;
			ch_ab[i].free;
			ch_cb_amp[i].free;
			ch_cb_mute[i].free;
			ch_group[i].free;
		};
		synG.free;
		mixG.free;
	}

	*gui {
		^global.gui
	}

	gui {
		var win, list, listview, wrect, startButton, aSynth;
		var sizeXChnl, sizeYChnl;
		var colBack, colFront, colActive;
		var fontBig, fontSmall;

		Server.default.waitForBoot{
			// this.memStore;
			// "after this.memStore".postln;

			sizeXChnl = 65;
			sizeYChnl = 400;
			colBack = Color.new255(30,30,30);
			colFront = Color.new255(255,255,255);
			colActive = Color.new255(200,50,50);
			fontBig = Font("Segoe UI", 7,true, isPointSize:true);
			fontSmall = Font("Segoe UI", 6, isPointSize:true);

			win = Window.new("ja_Mixer", Rect(900,600,5+((sizeXChnl+5)*numCh),410));
			win.alpha_(0.95);
			win.alwaysOnTop_(true);
			win.background_(colBack);
			win.front;

			coll_FreqViews = List.new(numCh);


			numCh.do { |i|
				var originX, originY, uv;
				var name, txtAmp, fqv;
				var valAmp, sliderAmp, buttMute;
				var fxButt_Pan, val_Pan_freq;
				var fxButt_FVerb, val_FVerb_room;
				var fxButt_LPF, val_LPF_freq;
				var fxButt_HPF, val_HPF_freq;
				var fxButt_Comb, val_Comb_time, val_Comb_gap;
				var fxButt_DBass, val_DBass_freq;

				originX = 5+((sizeXChnl+5)*i);
				originY = 5;

				uv = UserView(win, Rect(originX, originY, sizeXChnl, sizeYChnl));
				uv.background_(colBack);
				uv.drawFunc = {
					Pen.strokeColor = colFront;
					Pen.addRect(Rect(0,0, uv.bounds.width,uv.bounds.height));

					Pen.addRect(Rect(5,45, uv.bounds.width-22,80)); // fqv frame

					Pen.moveTo(5@133);
					Pen.lineTo(uv.bounds.width-5@133);
					Pen.moveTo(5@160);
					Pen.lineTo(uv.bounds.width-5@160);
					Pen.stroke;
				};

				name = StaticText.new(uv,Rect(5, 5, uv.bounds.width-5, 12));
				name.string_("ch["++i++"]");
				name.stringColor_(colFront);
				name.font_(fontBig);

				txtAmp = StaticText.new(uv,Rect(5, 22, 20, 15));
				txtAmp.string_("amp:");
				txtAmp.stringColor_(colFront);
				txtAmp.font_(fontSmall);

				fqv = FreqScopeView(uv, Rect(5,45, uv.bounds.width-22,80));
				fqv.active_(true);
				fqv.inBus = ch_ab[i];
				fqv.freqMode_(1);
				fqv.background_(Color.black);
				coll_FreqViews.add(fqv);

				valAmp = NumberBox(uv, Rect(27, 23, 20, 15));
				valAmp.normalColor_(colFront);
				valAmp.background_(colBack);
				valAmp.align_(\center);
				valAmp.font_(fontSmall);

				sliderAmp = Slider(uv, Rect(uv.bounds.width-13, 5, 8, 120));
				sliderAmp.background_(colBack);
				sliderAmp.knobColor_(colActive);
				sliderAmp.action_({
					valAmp.value = sliderAmp.value;
					ch_cb_amp[i].value = sliderAmp.value;
				});

				buttMute = Button(uv, Rect(27, 5, 20, 15));
				buttMute.font_(fontSmall);
				buttMute.states_([
					["||",colFront,colBack],
					[">",colFront,colActive]
				]);
				buttMute.action_({ arg butt;
					if(butt.value == 1) { ch_cb_mute[i].value = 1; };
					if(butt.value == 0) { ch_cb_mute[i].value = 0; };
				});

				win.onClose_({
					numCh.do { |i|
						ch_cb_mute[i].value = 0;
						coll_FreqViews[i].kill;
					};
					win.close;
					"JMix closed".postln;
				});



				list = dict.keys(Array);
				list.sort;
				// ("list: " ++ list).postln;

				wrect = win.view.bounds;
				listview = GUI.popUpMenu.new(win, wrect.copy.width_(wrect.width/2 - 75).height_(50).insetBy(5, 15)).items_(list);
				// ("listview: " ++ listview).postln;

				// add a button to start and stop the sound.
				startButton = GUI.button.new(win, Rect(listview.bounds.right+10, listview.bounds.top, 65, listview.bounds.height))
				.states_([
					["Start", Color.black, Color(0.5, 0.7, 0.5)],
					["Stop", Color.white, Color(0.7, 0.5, 0.5)]
				]).action_{|widg|
					if(widg.value==0){
						if(aSynth.notNil){aSynth.free; aSynth=nil };
					}{
						aSynth = Synth(listview.item);
						// ("listview.item : " ++ listview.item).postln;
						// ("aSynth : " ++ aSynth).postln;

						OSCresponderNode(Server.default.addr, '/n_end', { |time, resp, msg|
							if(aSynth.notNil and: {msg[1]==aSynth.nodeID}){
								// Synth has freed (itself?) so ensure button state is consistent
								{startButton.value=0}.defer;
							};
						}).add.removeWhenDone;
					}
				};
			}
		}
	}


}







