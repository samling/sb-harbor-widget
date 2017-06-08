using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Attention as Attention;
using Toybox.System as Sys;

class WindConditionsDelegate extends Ui.BehaviorDelegate
{
	function initialize() {
        Ui.BehaviorDelegate.initialize();
     }

    function onKey(evt) {
    	if (evt.getKey() == Ui.KEY_ENTER) {
			if (page < 2) {
				page += 1;
				Ui.requestUpdate();
			} else {
				page = 0;
				Ui.requestUpdate();
			}
    		return true;
    	}
		return false;
    }
}
