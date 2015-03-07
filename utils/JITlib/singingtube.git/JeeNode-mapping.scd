// read arduino messages via ArduinoSMS



(
// set up Serialport

q = q ? ();

q.allSerials = SerialPort.devices;

// dies gefunden ->   /dev/tty.usbserial-A600dVSu
q.mySerial = "/dev/tty.usbserial-*".pathMatch[0];

// einen empfänger machen
q.jeeLink = ArduinoSMS(q.mySerial, 115200);
)


/*
// test

(
q.jeeLink.action = {|...msg|

	msg.postln;


}
);
*/


/* reset action
q.jeeLink.action = nil; // */


(
q.jeeLink.action = {|...msg|

	var allVals, allAnalogIns, allButtons, gravityPlug, x, y, z, speed, rotate;
	if((msg[0] == "K") && (msg[1] == "a")) {

		///// data acquisition
		allVals = msg.drop(2).asInteger;
		allAnalogIns = allVals.keep(3);
		allAnalogIns = (allAnalogIns / 1023); //normalized analogIns
		allButtons = (1 - allVals.drop(3).keep(3)); //invert but state (pull up thing)
		gravityPlug =  allVals.drop(6); //x,y,z,speed of gravity plug at port 4

		///// preprocessing (normalising)
		rotate = gravityPlug[1].linlin(70, 511, 0.0, 1.0); //2nd y mapping
		x = gravityPlug[0].linlin(-175, 280, 0.0, 1.0); //x
		y = gravityPlug[1].linlin(-273, 204, 0.0, 1.0); //y
		z = gravityPlug[2].linlin(-232, 225, 0.0, 1.0); //z
		speed = (gravityPlug[3] / 128);


		///// mapping to sound parameters
		// available sensor value (values are between 0...1):
		//     x, y, z, speed, rotate

		// pitcher
		Ndef(\pitcher).set(
			\pitchRatio, speed.linlin(0, 1, 0.5, 4),
			\windowSize, (x + y - z).linlin(0, 1, 0.02, 0.5),
			\pitchDispersion, rotate.linexp(0, 1, 0.0001, 0.3)
		);

		// delay
		Ndef(\delay).set(
			\delayTime, speed
		);
	};
}
);
