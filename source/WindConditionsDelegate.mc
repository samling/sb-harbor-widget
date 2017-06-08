using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Attention as Attention;
using Toybox.System as Sys;

class WindConditionsDelegate extends Ui.BehaviorDelegate
{
	hidden var size;
	hidden var notify;

	function initialize() {
        Ui.BehaviorDelegate.initialize();
     }

	function onNextPage() {
		page += 1;
		Ui.requestUpdate();
		return true;
	}
	
	function onPreviousPage() {
		page -= 1;
		Ui.requestUpdate();
		return true;
	}
}
