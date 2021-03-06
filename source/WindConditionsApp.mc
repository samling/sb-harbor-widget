using Toybox.Application as App;

var reader;
var page = 0;

class WindConditionsApp extends App.AppBase {
    hidden var mDelegate;
    hidden var mView;

	function initialize() {
		AppBase.initialize();
		App.getApp().setProperty("appVersion", appVersion);
		reader = new WindConditionsReader();
	}
	
    //! onStart() is called on application start up
    function onStart(state) {
    }

    //! onStop() is called when your application is exiting
    function onStop(state) {
    }

    //! Return the initial view of your application here
    function getInitialView() {
    	mView = new WindConditionsView();
    	mDelegate = new WindConditionsDelegate();
        return [ mView, mDelegate ];
    }
}