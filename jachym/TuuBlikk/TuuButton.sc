TuuButton
{
	var bActive, bTime;
	var timePosition, freq;
	var posX, posY, frame, win;
	var buttNode;
	var colBack, colFront, colActive, colTime;

	*new { |time, tone, window|
		^super.new.init(time, tone, window);
	}

	init { |time, tone, window|
		timePosition = time;
		freq = tone;
		win = window;

		colBack = Color.new255(30,30,30);
		colFront = Color.new255(255,255,255);
		colActive = Color.new255(200,50,50);
		colTime = Color.new255(75,65,45);

		this.origin(time*30+10, tone*30+10)
	}

	origin{|originX, originY|
		posX = originX;
		posY = originY;
		frame = Rect(posX, posY, 30, 30);
	}

	isTime{|currentTime|
		if(currentTime == timePosition) {^true} {^false};
	}

	isActive{^bActive}

	initGui{
		buttNode = Button(win, frame)
		.states_([
			[timePosition,colFront,colBack],
			[freq,colFront,colActive]
		])
		.action_({ |butt|
			if(butt.value == 1) { freq.midicps; };
			if(butt.value == 0) { 0; };
		});
	}

	update{

	}
}