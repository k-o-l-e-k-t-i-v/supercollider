+ Rect {
	*offsetRect {|parent, offLeft, offTop, offRight, offBottom|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.left + offLeft, rect.top + offTop,	rect.width - offLeft - offRight, rect.height - offTop - offBottom );
	}

	*offsetEdgeLeft {|parent, offLeft, offTop, offBottom, width|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.left + offLeft, rect.top + offTop,	width, rect.height - offTop - offBottom	);
	}

	*offsetEdgeRight {|parent, offRight, offTop, offBottom, width|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.right - width - offRight, rect.top + offTop, width, rect.height - offTop - offBottom );
	}

	*offsetEdgeTop {|parent, offTop, offLeft, offRight, height|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.left + offLeft, rect.top + offTop, rect.width - offLeft - offRight, height );
	}

	*offsetEdgeBottom {|parent, offBottom, offLeft, offRight, height|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.left + offLeft, rect.bottom - height - offBottom, rect.width - offLeft - offRight,	height );
	}

	*offsetCornerLT {|parent, offLeft, offTop, width, height|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.left + offLeft, rect.top + offTop,	width, height );
	}

	*offsetCornerLB {|parent, offLeft, offBottom, width, height|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.left + offLeft, rect.bottom - height - offBottom, width, height );
	}

	*offsetCornerRT {|parent, offRight, offTop, width, height|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.right - width - offRight, rect.top + offTop, width, height );
	}

	*offsetCornerRB {|parent, offRight, offBottom, width, height|
		var rect = this.prParentRect(parent);
		^super.newCopyArgs( rect.right - width - offRight, rect.bottom - height - offBottom, width, height )
	}

	*prParentRect {|parent|
		var parentRect;
		switch ( parent.class,
			Window, { parentRect = parent.view.bounds },
			TopView, { parentRect = parent.bounds },
			UserView, { parentRect = Rect(0,0,parent.bounds.width, parent.bounds.height) },
			ScrollView, { parentRect = parent.innerBounds },
			Rect, { parentRect = Rect(0,0,parent.bounds.width, parent.bounds.height) }
		);
		parentRect.isNil.if(
			{
				("extRect: chybi definice pro %".format(parent.class)).warn;
				^Rect(0,0,100,100);
			},
			{ ^parentRect; }
		);
	}
}

/*
*offsetTemp {|parent, offRight, offBottom, width, height|
var rect = this.prParentRect(parent);

var l, t, w, h;
l = rect.left + offLeft,;
t = rect.top + offTop;
w = rect.width - offLeft - offRight;
h = rect.height - offTop - offBottom;

[ l, t, w, h ].postln;
^super.newCopyArgs( l, t, w, h )
}
*/