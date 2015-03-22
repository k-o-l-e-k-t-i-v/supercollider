// placing the following code in the file will cause these modifications to be made
// at startup (see also: ServerOptions)

Server.local.options.numOutputBusChannels = 2;    // change number of input and output channels
Server.local.options.numInputBusChannels = 2;
Server.internal.options.numOutputBusChannels = 2;
Server.internal.options.numInputBusChannels = 2;

Server.local.options.device = nil;                // use the system default soundcard

Server.local.options.blockSize = 128; // increase block size (default is 64)
Server.internal.options.blockSize = 128;


Server.local.options.maxLogins = 10; // increase block size (default is 64)
Server.internal.options.maxLogins = 10;

Server.local.options.memSize = 65536*4; // increase block size (default is 64)
Server.internal.options.blockSize = 65536*4;


// Server.local.options.protocol=\tcp;
// Server.internal.options.protocol=\tcp;

// Server.local.options.sampleRate = 48000; // increase sampling rate (if your hardware supports it)
// Server.internal.options.sampleRate = 48000;
Server.internal.options.sampleRate = nil;    // use the currently selected samplerate of the soundcard

// change the standard archive path to a custom one:
Archive.archiveDir = "/sketchBook/scwork".standardizePath;

// hook up jack ports to audio channels
"SC_JACK_DEFAULT_INPUTS".setenv("system");
"SC_JACK_DEFAULT_OUTPUTS".setenv("system");



"Starting MIDI".postln;
m = CCIn.new;

// s.boot;
p = ProxySpace.push(s.boot);


// History.clean;
// History.start;
// History.end;


// cmdPeriod(p = ProxySpace.push(s));


Ndef.defaultNumAudio=2;


// MIDIIn.noteOn = { |port, chan, note, vel| n[note-35].set(vel/127.0); n[note-35,n[note-35]].postln; };
// MIDIIn.noteOff = { |port, chan, note, vel| n.set(;};

//#[cc1, cc2, cc3, cc4, cc5, cc6, cc7, cc8].do{ |k| p[k] = { |cc=0| (cc/127).lag(0.01) } };

// (
// #[cc1, cc2, cc3, cc4, cc5, cc6, cc7, cc8].do{ |k, i|
// 	MIDIdef.noteOn(k, { |v|
// 		p[k].set(\cc, v);
// 	}, i+1)
// };
// )

// Ndef.defaultReshaping = \elastic;


// s.waitForBoot({p = ProxySpace.push(s);},3);

// Server.local =s;
// Server.default=s;

//StageLimiter.activate;

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// republic
/*
r = Republic(NetAddr("192.168.1.255", 57120)).makeDefault;
r.join(\kof, 10); //<- YOUR unique id here, and YOUR name over there.

// to share your code, evaluate the following:
// (use tab to chat from chat window)

(
    OSCresponder(nil, '/hist', {|t,r,msg|
        History.enter(msg[2].asString, msg[1])
    }).add;

    History.start;
    History.makeWin;
    History.forwardFunc = { |code|
        r.send(\all, '/hist', r.nickname, code)
    };
    History.localOff;
    EZRepublicGui(republic: r);
);

// Responder for controlling the Ndef
a = OSCresponder(nil, '/setndef', { |t, resp, msg|
        var which;
        var pairs;
        which = msg[1];
        pairs[2..];
        Ndef(which).set(*pairs);
}).add;
*/

MIDIIn.connectAll;


(
~n1={ |cc=0| (cc/127).lag(0.001) };
~n2={ |cc=0| (cc/127).lag(0.001) };
~n3={ |cc=0| (cc/127).lag(0.001) };
~n4={ |cc=0| (cc/127).lag(0.001) };
~n5={ |cc=0| (cc/127).lag(0.001) };
~n6={ |cc=0| (cc/127).lag(0.001) };
~n7={ |cc=0| (cc/127).lag(0.001) };
~n8={ |cc=0| (cc/127).lag(0.001) };
~n={ |cc=0| (cc).lag(0.001) };
);

(
MIDIFunc.noteOn({
	arg ...args;
	~n1.set(\cc,args[0]);
	~n.set(\cc,0);
	args[0].postln;

},36);

MIDIFunc.noteOn({
	arg ...args;
	~n2.set(\cc,args[0]);
	~n.set(\cc,1);
	args[0].postln;

},37);

MIDIFunc.noteOn({
	arg ...args;
	~n3.set(\cc,args[0]);
	~n.set(\cc,2);
	args[0].postln;

},38);

MIDIFunc.noteOn({
	arg ...args;
	~n4.set(\cc,args[0]);
	~n.set(\cc,3);
	args[0].postln;

},39);

MIDIFunc.noteOn({
	arg ...args;
	~n5.set(\cc,args[0]);
	~n.set(\cc,4);
	args[0].postln;

},40);

MIDIFunc.noteOn({
	arg ...args;
	~n6.set(\cc,args[0]);
	~n.set(\cc,5);
	args[0].postln;

},41);

MIDIFunc.noteOn({
	arg ...args;
	~n7.set(\cc,args[0]);
	~n.set(\cc,6);
	args[0].postln;

},42);

MIDIFunc.noteOn({
	arg ...args;
	~n8.set(\cc,args[0]);
	~n.set(\cc,7);
	args[0].postln;

},43);

);


(
MIDIFunc.noteOff({
	arg ...args;
	~n1.set(\cc,0);
	args[0].postln;

},36);

MIDIFunc.noteOff({
	arg ...args;
	~n2.set(\cc,0);
	args[0].postln;

},37);

MIDIFunc.noteOff({
	arg ...args;
	~n3.set(\cc,0);
	args[0].postln;

},38);

MIDIFunc.noteOff({
	arg ...args;
	~n4.set(\cc,0);
	args[0].postln;

},39);

MIDIFunc.noteOff({
	arg ...args;
	~n5.set(\cc,0);
	args[0].postln;

},40);

MIDIFunc.noteOff({
	arg ...args;
	~n6.set(\cc,0);
	args[0].postln;

},41);

MIDIFunc.noteOff({
	arg ...args;
	~n7.set(\cc,0);
	args[0].postln;

},42);

MIDIFunc.noteOff({
	arg ...args;
	~n8.set(\cc,0);
	args[0].postln;

},43);

)
