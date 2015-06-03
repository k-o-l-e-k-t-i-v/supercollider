##LICENCE

This is Kof's history logger, it should record everything I type into supercollider. 
Copyright (C) 2015 Krystof Pesek

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, see <http://www.gnu.org/licenses/>.

#HISTORY LOGGER

In this frantic era we produce enormous ammounts of data every day, one of the way how to reflect this, is to actually record as many of them as possible, to see it bare eyed.

#HOWTO

To record your own history whitin supercollider add this line into startup script
```
History.clear.start;
```
It will record everything the interpreter is receiving in precise time.
If you want to save your text recording to temporary directory choose:

```
History.end
```

You can load history files to play them later like this:
```
h = History.new.loadCS("~/path/to/a/file.scd",forward:true);
h.play();
```

To record it after you can just do:

```
s.prepareForRecord("/tmp/record.aiff");
s.record;

h=History.new.loadCS("/path/to/HistoryLogs/log_History_150603_020439.scd",forward:true);
h.play();

// now wait until end of story

s.stopRecording;
```

Enjoy!

kof
