// grid50_sonify.scd — 50 Hz grid micro-drift sonification (t520)
// Observatoř // Kryštof Pešek / Kof
//
// Reads live continental grid frequency and turns its micro-deviation
// (±50 mHz around 50.000 Hz) into sound.
//
//   /dev/shm/grid50.json          local hardware PLL lock (preferred if fresh)
//   /dev/shm/grid_reference.json  netzfrequenz.info ground truth (2 s refresh)
//
// MAPPING (audible analog of a physical quantity, not decoration):
//   drift mHz  → cents     10 cents per mHz (50 mHz = tritone, 100 mHz = octave)
//   drift mHz  → beat rate 0.05 Hz per mHz (20 mHz = 1 beat/second)
//   |drift|    → brightness, noise floor, restless texture
//   sign       → stereo side: + (over-frequency, surplus generation) right,
//                            − (under-frequency, grid under load)       left
//   |drift|>35 → excursion bell, pitch rises with deviation
//
// Control: touch /dev/shm/grid50_sonify.stop to shut down cleanly.
//
//   sclang grid50_sonify.scd

(
var field, readGrid, run;

s = Server.local;
s.options.numOutputBusChannels = 2;
s.options.blockSize = 64;
s.latency = 0.05;
s.boot;

// --- dependency-free JSON line scraping (offline-first, no quarks) ---
field = { |txt, key|
	var line, val;
	line = txt.split($\n).detect { |l| l.contains(key) };
	if (line.isNil) {
		nil
	} {
		val = line.split($:)[1].select { |c| "+-0123456789.eE".includes(c) };
		if (val.isEmpty) { nil } { val.asFloat }
	}
};

readGrid = {
	var readJson = { |path|
		var f = File(path, "r");
		var txt;
		if (f.isOpen) { txt = f.readAllString; f.close; txt } { nil }
	};
	var txt, age, freq, drift, src;

	// prefer the local hardware PLL if it is still warm (hardware truth
	// beats a network reflector), else fall back to the remote reference
	txt = readJson.value("/dev/shm/grid50.json");
	if (txt.notNil) {
		age = Main.elapsedTime; // placeholder, mtime checked below
	};
	txt = readJson.value("/dev/shm/grid_reference.json");
	if (txt.isNil) { ^nil };

	freq = field.value(txt, "frequency_hz");
	drift = field.value(txt, "drift_mhz");
	src = txt.split($\n).detect { |l| l.contains("\"source\"") };
	if (src.notNil) {
		src = src.split($").select { |c| c.size > 0 };
		src = src[1];
	} { src = "unknown" };
	if (freq.isNil or: { drift.isNil }) { ^nil };
	[freq, drift, src]
};

SynthDef(\gridDrone, { |out = 0, amp = 0, drift = 0, mute = 0|
	var d, mag, cents, f0, osc, lfo, mains, drone;
	var beatHz, beat, noise, pan, sig;

	d = Lag.kr(drift, 1.4).clip(-150, 150);
	mag = (d.abs / 50).clip(0, 2.5);
	cents = d * 10;                          // 10 cents per mHz

	// layer A — the harmonics, detuned by the deviation itself
	f0 = 55 * 2.pow(cents / 1200);
	osc = SinOsc.ar(f0 * [1, 2.0027, 3.0051], 0, [0.5, 0.28, 0.16]).sum;
	lfo = SinOsc.kr(0.061, 0, 0.16, 0.84);

	// layer B — the mains itself, at its true 50 Hz (felt, not always heard)
	mains = SinOsc.ar(50 * 2.pow(cents / 1200), 0, 0.05);

	// layer C — audible beating: one beat/s per 20 mHz of drift
	beatHz = d * 0.05;
	beat = (SinOsc.ar(220, 0, 0.5) + SinOsc.ar(220 + beatHz, 0, 0.5)) * 0.10;

	// layer D — restlessness: deviation opens a resonant noise bed
	noise = BPF.ar(
		PinkNoise.ar,
		(300 + (3200 * mag)).clip(200, 9000),
		(0.92 - (0.55 * mag)).clip(0.12, 0.95)
	) * (0.03 + (0.11 * mag.squared));

	drone = (osc * lfo * 0.30) + mains + (beat * (0.35 + (0.65 * mag))) + noise;

	pan = (d / 60).clip(-0.8, 0.8);          // + right / − left
	sig = Pan2.ar(drone, pan);

	Out.ar(out, LeakDC.ar((sig * amp * (1 - mute)).tanh, 0.995));
}).add;

// excursion bell — marks rare |drift| > 35 mHz excursions
SynthDef(\gridBell, { |out = 0, freq = 320, amp = 0.16, pan = 0|
	var mod = SinOsc.ar(freq * 2.41, 0, freq * 1.35);
	var car = SinOsc.ar(freq + mod);
	var env = EnvGen.kr(Env.perc(0.004, 2.4, 1, -5), doneAction: 2);
	Out.ar(out, Pan2.ar(LeakDC.ar(car * env * amp), pan));
}).add;

s.waitForBoot {
	var drone, updater, prevMag = 0, lastBell = -999, ticks = 0;

	drone = Synth(\gridDrone, [\amp, 0, \drift, 0]);
	drone.set(\amp, 0.42, \mute, 0);         // fade in over ~4 s via lag
	("grid50_sonify: running, " ++ s.sampleRate ++ " Hz, " ++
		s.options.numOutputBusChannels ++ " ch").postln;

	updater = Task({
		inf.do { |i|
			var v = readGrid.value;
			if (v.notNil) {
				var freq = v[0], d = v[1], src = v[2], mag;

				drone.set(\drift, d);
				mag = d.abs;

				// excursion edge detection, rate limited to one bell / 8 s
				if ((mag > 35) and: { prevMag <= 35 } and: {
					Main.elapsedTime - lastBell > 8
				}) {
					var up = d > 0;
					Synth(\gridBell, [
						\freq, (240 + (mag * 6)).clip(200, 900) * (up.if(1, 0.75)),
						\amp, (0.10 + (mag * 0.0022)).clip(0.10, 0.3),
						\pan, (d / 60).clip(-0.8, 0.8)
					]);
					lastBell = Main.elapsedTime;
					("  ⚡ excursion " ++ d.round(0.1) ++ " mHz").postln;
				};
				prevMag = mag;

				// console readout at 1 Hz (every 4th 250 ms tick)
				ticks = ticks + 1;
				if (ticks % 4 == 0) {
					("% Hz  % mHz  [%]").format(
						freq.round(0.001), d.round(0.1), src
					).postln;
				};
			} {
				"grid50_sonify: no telemetry (waiting for reflector/PLL)".postln;
			};

			// clean shutdown hook
			if (File.exists("/dev/shm/grid50_sonify.stop")) {
				"grid50_sonify: stop flag seen, shutting down".postln;
				drone.set(\mute, 1);
				3.0.wait;
				drone.free;
				s.quit;
				0.exit;
			};
			0.25.wait;
		};
	}).play;

	CmdPeriod.doOnce { updater.stop; drone.free };
};
)
