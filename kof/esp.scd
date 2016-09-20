
Esp.person = "Kof"; // set your name on the grid
Esp.machine = "t520"; // identify the machine on the grid
Esp.broadcast = "192.168.0.255"; // change the broadcast address (if necessary)
Esp.clockMode = 5; // change the clock sync mode (see EspGrid documentation)
Esp.chat("hi there"); // send a chat message with EspGrid
// TempoClock synchronization

TempoClock.default = EspClock.new; // make the default clock a new EspClock
TempoClock.default.start; // if the beat is paused/was-never-started, make it go
TempoClock.tempo = 1.8; // change tempo in normal SC way (all changes shared via EspGrid)
TempoClock.default.pause; // pause the beat


(
p.clock = TempoClock.default;

)

