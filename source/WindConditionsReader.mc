using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;

var appVersion = "1.0.0";

class WindConditionsReader {

	var location;
	var time = new [12];
	var spd = new [12];
	var dir = new [12];

	hidden var url;
	
	function initialize() {
		url = Application.getApp().getProperty("link");
		if (url.equals("")) {
			url = Ui.loadResource(Rez.Strings.DefaultLink);
		}
	}
	
	function load() {
		Ui.pushView (new LoadingView(), null, 0);
		System.println("Request URL: " + url);
		readConditions(url, method(:loaded));
	}
	
	function loaded(status, data) {
		System.println("Request status: " + status);
		System.println("Request data: " + data);
		for (var i = 0; i < 12; i += 1) {
			location = data["location"];
			time[i] = data[i.toString()]["time"];
			spd[i] = data[i.toString()]["wind_spd"];
			dir[i] = data[i.toString()]["wind_dir"];
		}
		Ui.popView(0);
	}
}