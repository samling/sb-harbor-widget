using Toybox.Communications as Comm;

function readConditions( url, callback ) {
	Comm.makeWebRequest(
        "http://127.0.0.1:5000/",
		{},
		{
        	"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON
        },
        callback
	);
}