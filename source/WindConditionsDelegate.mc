using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Attention as Attention;
using Toybox.System as Sys;

class WindConditionsDelegate extends Ui.BehaviorDelegate
{
	hidden var size;
	hidden var notify;

	function initialize(s, handler) {
        Ui.BehaviorDelegate.initialize();
        notify = handler;
        if (size == 0) {
        	Comm.makeWebRequest(
            	"http://127.0.0.1:5000/",
				{},
				{
               		"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON
            	},
            	method(:onReceive)
        	);
        }
        
     }

    function onKey(evt) {
        var key = evt.getKey();
 		if ( key == KEY_ENTER ) {
    		Comm.makeWebRequest(
            	"http://127.0.0.1:5000",
				{},
				{
               		"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON
            	},
            	method(:onReceive)
        	);
 			return true;
 		}
 	
        return Ui.BehaviorDelegate.onKey(evt); 
    }
    
    function onReceive(responseCode, data) {
    	Sys.println(responseCode);
        if( responseCode == 200 ) {
 			notify.invoke(data); // invokes onReceive method
        }
        else {
            size = 0;
            notify.invoke(0);
            Sys.println("No size");
        }
    }
}
