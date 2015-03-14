TuuButton
{
	var bActive, bTime;
	var timePosition, octave, degree;
	var posX, posY, frame, win;
	var synthDef;
	var uView, buttNode;
	var colBack, colFront, colActive, colTime;

	*new { |time, tone, window|
		^super.new.init(time, tone, window);
	}

	init { |time, tone, window|
		timePosition = time;
		octave = 4;
		degree = tone;
		win = window;
		bActive = false;

		colBack = Color.new255(255,255,255);
		colFront = Color.new255(30,30,30);
		colActive = Color.new255(200,50,50);
		colTime = Color.new255(75,65,45,255);

		this.origin((time*50)+10, (tone*50)+10);
		this.initGui;
	}

	frequency{
		^(octave*12+(12-degree)).midicps;
	}

	origin{|originX, originY|
		posX = originX;
		posY = originY;
		frame = Rect.new(posX, posY, 50, 50);
		// ("posX: " ++ posX ++ " posY : " ++ posY).postln;
	}

	isTime{|currentTime|
		if(currentTime == timePosition) {^true} {^false};
	}

	isActive{^bActive}
	switchActive{
		if(bActive == true){bActive = false;}{bActive = true;};
	}

	initGui{
		uView = UserView.new(win,frame);
		this.stateNormal;

		uView.mouseDownAction_({|me, x, y, mod|
			this.switchActive;
			if(this.isActive){
				this.stateActive;
			}
			{
				this.stateNormal;
			};
			uView.refresh;
		});
	}

	stateActive{
		uView.drawFunc = { |v|
			Pen.strokeColor = colFront;
			Pen.fillColor = colActive;
			Pen.addOval(Rect(0,0,uView.bounds.width, uView.bounds.height));
			Pen.fillStroke;
			Pen.stroke;
		};
	}
	stateTime{
		var routActive = Routine({
			10.do{|i|
				// i.postln;
				uView.drawFunc = { |v|
					Pen.strokeColor = colFront;
					Pen.fillColor = Color.new255(75,65,45,255-(255/10*i));
					Pen.addOval(Rect(0,0,uView.bounds.width, uView.bounds.height));
					Pen.fillStroke;
					Pen.stroke;
				};
				0.01.wait;
				uView.refresh;
			};
		});
		AppClock.play(routActive)
	}
	stateNormal{
		uView.drawFunc = { |v|
			Pen.strokeColor = colFront;
			Pen.addOval(Rect(0,0,uView.bounds.width, uView.bounds.height));
			Pen.stroke;
		};
	}

	update{|currentTime|
		var rout;
		rout = Routine({
			if(this.isTime(currentTime))
			{
				this.stateTime;
				uView.refresh;
				0.125.wait;
				if(this.isActive) {	this.stateActive; }	{ this.stateNormal;	};
				uView.refresh;
			}
		});
		AppClock.play(rout);
	}
}