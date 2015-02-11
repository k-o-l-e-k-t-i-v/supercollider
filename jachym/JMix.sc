// put it into your SCClassLibrary/DefaultLibrary and recompile the class library (Ctr+Shift+L)

// Ja_Mixer SC object, in progress..

JMix {
	classvar server;
	var numCh;
	var <synG, mixG, ch_group;
	var master_ab, ch_ab;
	var ch_cb_amp, ch_cb_mute;
	var master_Synth, ch_Synth;

	classvar win;
	classvar sizeXChnl,sizeYChnl;
	classvar colBack, colFront, colActive;
	classvar fontBig, fontSmall;

	classvar coll_FreqViews;
	classvar coll_fx_Pan_Synth, coll_fx_Pan_cb_freq;
	classvar coll_fx_FVerb_Synth, coll_fx_FVerb_cb_room;
	classvar coll_fx_LPF_Synth, coll_fx_LPF_cb_freq;
	classvar coll_fx_HPF_Synth, coll_fx_HPF_cb_freq;
	classvar coll_fx_Comb_Synth, coll_fx_Comb_cb_time, coll_fx_Comb_cb_gap;
	classvar coll_fx_DBass_Synth, coll_fx_DBass_cb_freq;

	*new{arg xCh;
		^super.new.init(xCh);
	}

	init{arg initCh;

		numCh = initCh;
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
		"JMix version 0.01".postln;
	}

	chBus{ arg num; ^ch_ab[num]; }

	gui{
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

		coll_fx_Pan_Synth = List.newClear(numCh);
		coll_fx_Pan_cb_freq = List.new(numCh);

		coll_fx_FVerb_Synth = List.newClear(numCh);
		coll_fx_FVerb_cb_room = List.new(numCh);

		coll_fx_LPF_Synth = List.newClear(numCh);
		coll_fx_LPF_cb_freq = List.new(numCh);

		coll_fx_HPF_Synth = List.newClear(numCh);
		coll_fx_HPF_cb_freq = List.new(numCh);

		coll_fx_Comb_Synth = List.newClear(numCh);
		coll_fx_Comb_cb_time = List.new(numCh);
		coll_fx_Comb_cb_gap = List.new(numCh);

		coll_fx_DBass_Synth = List.newClear(numCh);
		coll_fx_DBass_cb_freq = List.new(numCh);

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


			// efx control //////////////////////////////////////

			// fx Pan ////////////

			coll_fx_Pan_cb_freq.add(Bus.control(server,1));
			coll_fx_Pan_cb_freq[i].value = 1;

			fxButt_Pan = Button(uv, Rect(5, 139, uv.bounds.width-40,15));
			fxButt_Pan.states_([
				["Pan",colFront,colBack],
				["Pan",colFront,colActive]
			]);
			fxButt_Pan.font_(fontSmall);
			fxButt_Pan.action_({ arg butt;
				if(butt.value == 1) {
					coll_fx_Pan_Synth.put(i, Synth(\JMix_Efx_Pan, [
						\bus, ch_ab[i],
						\freq, coll_fx_Pan_cb_freq[i].asMap;
					], ch_Synth[i],\addBefore))
				};
				if(butt.value == 0) {
					coll_fx_Pan_Synth[i].free;
				};
			});

			val_Pan_freq = NumberBox(uv, Rect(uv.bounds.width-30, 139, 25, 15));
			val_Pan_freq.normalColor_(colFront);
			val_Pan_freq.background_(colBack);
			val_Pan_freq.align_(\center);
			val_Pan_freq.font_(fontSmall);
			val_Pan_freq.value_(1);
			val_Pan_freq.clipLo_(0);
			val_Pan_freq.scroll_step_(0.1);
			val_Pan_freq.action_({
				coll_fx_Pan_cb_freq[i].value = val_Pan_freq.value;
			});

			// fx Blur ////////////

			coll_fx_FVerb_cb_room.add(Bus.control(server,1));
			coll_fx_FVerb_cb_room[i].value = 0;

			fxButt_FVerb = Button(uv, Rect(5, 166, uv.bounds.width-40,15));
			fxButt_FVerb.states_([
				["Blur",colFront,colBack],
				["Blur",colFront,colActive]
			]);
			fxButt_FVerb.font_(fontSmall);
			fxButt_FVerb.action_({ arg butt;
				if(butt.value == 1) {
					coll_fx_FVerb_Synth.put(i, Synth(\JMix_Efx_Blur, [
						\bus, ch_ab[i],
						\room, coll_fx_FVerb_cb_room[i].asMap;
					], ch_group[i]))
				};
				if(butt.value == 0) {
					coll_fx_FVerb_Synth[i].free;

				};
			});

			val_FVerb_room = NumberBox(uv, Rect(uv.bounds.width-30, 166, 25, 15));
			val_FVerb_room.normalColor_(colFront);
			val_FVerb_room.background_(colBack);
			val_FVerb_room.align_(\center);
			val_FVerb_room.font_(fontSmall);
			val_FVerb_room.clipLo_(0);
			val_FVerb_room.scroll_step_(0.5);
			val_FVerb_room.action_({
				coll_fx_FVerb_cb_room[i].value = val_FVerb_room.value;
			});

			// fx LPF ////////////

			coll_fx_LPF_cb_freq.add(Bus.control(server,1));
			coll_fx_LPF_cb_freq[i].value = 1000;

			fxButt_LPF = Button(uv, Rect(5, 186, uv.bounds.width-40,15));
			fxButt_LPF.states_([
				["LPF",colFront,colBack],
				["LPF",colFront,colActive]
			]);
			fxButt_LPF.font_(fontSmall);
			fxButt_LPF.action_({ arg butt;
				if(butt.value == 1) {
					coll_fx_LPF_Synth.put(i, Synth(\JMix_Efx_LPF, [
						\bus, ch_ab[i],
						\freq, coll_fx_LPF_cb_freq[i].asMap;
					], ch_group[i]))
				};
				if(butt.value == 0) {
					coll_fx_LPF_Synth[i].free;

				};
			});

			val_LPF_freq = NumberBox(uv, Rect(uv.bounds.width-30, 186, 25, 15));
			val_LPF_freq.normalColor_(colFront);
			val_LPF_freq.background_(colBack);
			val_LPF_freq.align_(\center);
			val_LPF_freq.font_(fontSmall);
			val_LPF_freq.value_(1000);
			val_LPF_freq.clipLo_(50);
			val_LPF_freq.scroll_step_(50);
			val_LPF_freq.action_({
				coll_fx_LPF_cb_freq[i].value = val_LPF_freq.value;
			});

			// fx HPF ////////////

			coll_fx_HPF_cb_freq.add(Bus.control(server,1));
			coll_fx_HPF_cb_freq[i].value = 1500;

			fxButt_HPF = Button(uv, Rect(5, 206, uv.bounds.width-40,15));
			fxButt_HPF.states_([
				["HPF",colFront,colBack],
				["HPF",colFront,colActive]
			]);
			fxButt_HPF.font_(fontSmall);
			fxButt_HPF.action_({ arg butt;
				if(butt.value == 1) {
					coll_fx_HPF_Synth.put(i, Synth(\JMix_Efx_HPF, [
						\bus, ch_ab[i],
						\freq, coll_fx_HPF_cb_freq[i].asMap;
					], ch_group[i]))
				};
				if(butt.value == 0) {
					coll_fx_HPF_Synth[i].free;

				};
			});

			val_HPF_freq = NumberBox(uv, Rect(uv.bounds.width-30, 206, 25, 15));
			val_HPF_freq.normalColor_(colFront);
			val_HPF_freq.background_(colBack);
			val_HPF_freq.align_(\center);
			val_HPF_freq.font_(fontSmall);
			val_HPF_freq.value_(1500);
			val_HPF_freq.clipLo_(400);
			val_HPF_freq.scroll_step_(100);
			val_HPF_freq.action_({
				coll_fx_HPF_cb_freq[i].value = val_HPF_freq.value;
			});

			// fx Comb ////////////

			coll_fx_Comb_cb_time.add(Bus.control(server,1));
			coll_fx_Comb_cb_gap.add(Bus.control(server,1));
			coll_fx_Comb_cb_time[i].value = 4;
			coll_fx_Comb_cb_gap[i].value = 0.25;

			fxButt_Comb = Button(uv, Rect(5, 226, uv.bounds.width-40,15));
			fxButt_Comb.states_([
				["Comb",colFront,colBack],
				["Comb",colFront,colActive]
			]);
			fxButt_Comb.font_(fontSmall);
			fxButt_Comb.action_({ arg butt;
				if(butt.value == 1) {
					coll_fx_Comb_Synth.put(i, Synth(\JMix_Efx_CombC, [
						\bus, ch_ab[i],
						\decay, coll_fx_Comb_cb_time[i].asMap,
						\gap, coll_fx_Comb_cb_gap[i].asMap
					], ch_group[i]))
				};
				if(butt.value == 0) {
					coll_fx_Comb_Synth[i].free;
				};
			});

			val_Comb_time = NumberBox(uv, Rect(uv.bounds.width-30, 226, 25, 15));
			val_Comb_time.normalColor_(colFront);
			val_Comb_time.background_(colBack);
			val_Comb_time.align_(\center);
			val_Comb_time.font_(fontSmall);
			val_Comb_time.value_(4);
			val_Comb_time.clipLo_(0.5);
			val_Comb_time.scroll_step_(0.5);
			val_Comb_time.action_({
				coll_fx_Comb_cb_time[i].value = val_Comb_time.value;
			});

			val_Comb_gap = NumberBox(uv, Rect(uv.bounds.width-30, 246, 25, 15));
			val_Comb_gap.normalColor_(colFront);
			val_Comb_gap.background_(colBack);
			val_Comb_gap.align_(\center);
			val_Comb_gap.font_(fontSmall);
			val_Comb_gap.value_(0.25);
			val_Comb_gap.clipLo_(0.25);
			val_Comb_gap.scroll_step_(0.25);
			val_Comb_gap.action_({
				coll_fx_Comb_cb_gap[i].value = val_Comb_gap.value;
			});

			// fx DBass ////////////

			coll_fx_DBass_cb_freq.add(Bus.control(server,1));
			coll_fx_DBass_cb_freq[i].value = 10;
			// ~coll_fx_Comb_cb_gap[i].value = 0.25;

			fxButt_DBass = Button(uv, Rect(5, 266, uv.bounds.width-40,15));
			fxButt_DBass.states_([
				["dBass",colFront,colBack],
				["dBass",colFront,colActive]
			]);
			fxButt_DBass.font_(fontSmall);
			fxButt_DBass.action_({ arg butt;
				if(butt.value == 1) {
					coll_fx_DBass_Synth.put(i, Synth(\JMix_Efx_DBass, [
						\bus, ch_ab[i],
						\freq, coll_fx_DBass_cb_freq[i].asMap
					], ch_group[i]))
				};
				if(butt.value == 0) {
					coll_fx_DBass_Synth[i].free;
				};
			});

			val_DBass_freq = NumberBox(uv, Rect(uv.bounds.width-30, 266, 25, 15));
			val_DBass_freq.normalColor_(colFront);
			val_DBass_freq.background_(colBack);
			val_DBass_freq.align_(\center);
			val_DBass_freq.font_(fontSmall);
			val_DBass_freq.value_(10);
			val_DBass_freq.clipLo_(0.0);
			val_DBass_freq.scroll_step_(5);
			val_DBass_freq.action_({
				coll_fx_DBass_cb_freq[i].value = val_DBass_freq.value;
			});

			win.onClose_({
				numCh.do { |i|
					ch_cb_mute[i].value = 0;
					coll_FreqViews[i].kill;

					coll_fx_Pan_Synth[i].free;
					coll_fx_FVerb_Synth[i].free;
					coll_fx_LPF_Synth[i].free;
					coll_fx_HPF_Synth[i].free;
					coll_fx_Comb_Synth[i].free;
					coll_fx_DBass_Synth[i].free;
				};
				win.close;
				"JMix closed".postln;
			});
		};
	}

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

	// *initClass Class Methods are called when the library compiles = you can initialize things here
	// that are classvars
	*initClass {

		server = Server.default;




	}


}


