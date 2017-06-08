using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Communications as Comm;
using Toybox.System as Sys;

class WindConditionsView extends Ui.View {
	var size;
	var status  = -1;
	var index; // Page index (0, 1, 2)
	var x;
	var y;
	var width;
	var height;
    
    function initialize() {
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
    }

    //! Update the view
    function onUpdate(dc) {
        var location = reader.location;
        var time = reader.time;
        var spd = reader.spd;
        var dir = reader.dir;
    
    	View.onUpdate(dc);
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_BLACK );
        dc.clear();
        dc.drawText(dc.getWidth() / 2, ( dc.getHeight() / 4 - 10 ), Gfx.FONT_SYSTEM_TINY, location,  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
		for (var i = page; i <= (page + 3); i += 1) {
        	dc.drawText(dc.getWidth() / 2 - 50, ( dc.getHeight() / 4 + 25 ) + ( ( dc.getHeight() / 7 ) * i ), Gfx.FONT_TINY | Gfx.COLOR_ORANGE, time[i],  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_RIGHT);
			dc.drawLine(dc.getWidth() / 2 - 100, ( dc.getHeight() / 4 + 8 ) + ( ( dc.getHeight() / 7 ) * i ), dc.getWidth() / 2 + 100, ( dc.getHeight() / 4 + 8 ) + ( ( dc.getHeight() / 7 ) * i ) );
        	dc.drawText(dc.getWidth() / 2 - 30, ( dc.getHeight() / 4 + 25 ) + ( ( dc.getHeight() / 7 ) * i ), Gfx.FONT_XTINY, spd[i],  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);        	
        	dc.drawText(dc.getWidth() / 2 + 50, ( dc.getHeight() / 4 + 25 ) + ( ( dc.getHeight() / 7 ) * i ), Gfx.FONT_XTINY, dir[i],  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);        	
        }
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }
}
