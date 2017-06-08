using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Communications as Comm;
using Toybox.System as Sys;

class WindConditionsView extends Ui.View {
	var size;
	var status  = -1;
	var index;
	var x;
	var y;
	var width;
	var height;
	var forecast;
    
    function initialize(i, s) {
    	index = i;
    	size = s;
    	View.initialize();
    }
    //! Load your resources here
    function onLayout(dc) {
    	reader.load();
        width = dc.getWidth();
        height = dc.getHeight();
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    	var time = reader.time;
        System.println(time[0]);
    }

    //! Update the view
    function onUpdate(dc) {
    
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }
    
    function onReceive(data) {
    	forecast = data;
    	status = 1;
    	//if (size != s) {
        //	size = s;
        //	index = -1;
        //}
        //requestImage();
        Ui.requestUpdate();
    }

}
