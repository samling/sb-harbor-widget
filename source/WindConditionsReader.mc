using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;

var appVersion = "1.0.0";

class WindConditionsReader {

	var location;
	var time = new [4];
	var spd = new [4];
	var dir = new [4];

	hidden var loadedCallback;
	hidden var url;
	
	function initialize() {
		url = Application.getApp().getProperty("link");
		if (url.equals("")) {
			url = Ui.loadResource(Rez.Strings.DefaultLink);
		}
	}
	
	function load() {
		Ui.pushView (new LoadingView(), null, 0);
		readConditions(url, method(:loaded));
	}
	
	function loaded(status, data) {
		for (var i = 0; i < 4; i += 1) {
			location = data["location"];
			time[i] = data[(i + (page * 4)).toString()]["time"];
			spd[i] = data[(i + (page * 4)).toString()]["wind_spd"];
			dir[i] = data[(i + (page * 4)).toString()]["wind_dir"];
		}
		Ui.popView(0);
	}
}