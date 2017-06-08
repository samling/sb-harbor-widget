using Toybox.Communications as Comm;

function readConditions( url, callback ) {
	Comm.makeWebRequest(
        url,
		{},
		{
        	"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON
        },
        callback
	);
}