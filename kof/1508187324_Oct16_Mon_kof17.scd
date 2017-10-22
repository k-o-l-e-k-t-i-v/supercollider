
p.push();
(
    var notes, on, off;

    MIDIClient.init;
    MIDIIn.connectAll;

    notes = Array.newClear(128);    // array has one slot per possible MIDI note

    on = MIDIFunc.noteOn({ |veloc, num, chan, src|
        notes[num] = Synth(\default, [\freq, num.midicps,
            \amp, veloc * 0.00315]);
        });

        off = MIDIFunc.noteOff({ |veloc, num, chan, src|
            notes[num].release;
        });

        q = { on.free; off.free; };
    )
q.value
