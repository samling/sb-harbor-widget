using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Communications as Comm;
using Toybox.System as Sys;

class WindConditionsView extends Ui.View {
	var index; // Page number (1, 2, 3, etc.)
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
   		var barFill = 0;
   		var maxSafeSpeed = 20; // Maximum safe wind speed
   		var safetyLevel = 0;
    
    	View.onUpdate(dc);
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_BLACK );
        dc.clear();
        dc.drawText(width / 2, ( height / 4 - 10 ), Gfx.FONT_SYSTEM_TINY, location,  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
		for (var i = 0; i < 4; i += 1) {
				// Scale our index by a factor of 4 to get sets of 4 hours
				index = i + (page * 4);
				// Calculate the bar length as a percentage of the maximum safe speed threshold (currently 20MPH)
				if (spd[index] != null) {
					barFill = spd[index].toFloat() / 20 * 100;
					
					if (barFill / 100 <= 0.25) {
						safetyLevel = Gfx.COLOR_GREEN;
					} else if (barFill / 100 <= 0.50) {
						safetyLevel = Gfx.COLOR_YELLOW;
					} else if (barFill / 100 <= 0.75) {
						safetyLevel = Gfx.COLOR_ORANGE;
					} else if (barFill / 100 <= 1) {
						safetyLevel = Gfx.COLOR_RED;
					}
				}
				
				// Display the hour of the day in 12H time
         		dc.drawText(dc.getWidth() / 2 - 50, ( dc.getHeight() / 4 + 25 ) + ( ( dc.getHeight() / 7 ) * i ), Gfx.FONT_TINY, time[index],  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_RIGHT);

				// Draw and color-code a percentage bar divider based on wind speed out of 20MPH
				dc.setColor(safetyLevel, Gfx.COLOR_BLACK);
				dc.fillRectangle(dc.getWidth() / 2 - 100, ( dc.getHeight() / 4 + 40 ) + ( ( dc.getHeight() / 7 ) * i ), barFill * 2, 3);
				dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
				
				// Display the speed and direction of the wind at the given hour
        		dc.drawText(dc.getWidth() / 2 - 30, ( dc.getHeight() / 4 + 25 ) + ( ( dc.getHeight() / 7 ) * i ), Gfx.FONT_XTINY, spd[index] + " MPH",  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);        	
        		dc.drawText(dc.getWidth() / 2 + 50, ( dc.getHeight() / 4 + 25 ) + ( ( dc.getHeight() / 7 ) * i ), Gfx.FONT_XTINY, dir[index],  Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);        	
        	}
        // Display which page we're on
		dc.drawText(width / 2, 220, Gfx.FONT_SYSTEM_TINY, (page + 1) + "/3", Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }
}
