	function draw_dateline(options) {
	 var highlight = "Jul 28";
	 var spacing = 46;
	 var dates = options['dates'];
	 var highlight = options['highlight'];
	 var width = dates.length * spacing;
	 var offset = spacing / 2;

	 var dateline = Raphael("dateline", width, 40);

	 var line = dateline.path("M " + offset + " 10 L " + (width - offset) +" 10").attr("stroke", "grey").attr("stroke-width", "2px");

	 var circles = new Array();
	 for (var i=0; i < dates.length; i++) {
	   var x = (i * spacing) + offset;
	   if(dates[i] == highlight) {
	     circles[i] = dateline.circle(x, 10, 6);

			 circles[i].attr("title", "this week");
	   }
	   else {
	     circles[i] = dateline.circle(x, 10, 4);
	   }

	   circles[i].attr("fill", "grey");
	   circles[i].attr("stroke", "grey");

	   dateline.text(x, 25, dates[i]).attr("fill", "#036").attr("font-size", "11px").attr("font-family", "Lucida Grande");
	 };

	}

