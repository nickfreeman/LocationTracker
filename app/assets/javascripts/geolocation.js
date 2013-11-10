var myPosition;
function get_location() {
	if (navigator.geolocation) {
		alert("Asking for geolocation");
		navigator.geolocation.getCurrentPosition(
			onSuccess,
			onError, 
			{
				enableHighAccuracy: true,
				timeout: 20000,
				maximumAge: 25000 
			}
		);
	} else {
		alert("Your browser does not support geolocation");
	}
}

function onSuccess(position) {
	// Right now this function is never getting called because the
	// Geolocation is failing to find a location inside the VM
	// I don't know if this is due to the VM or Airbears
	// As a solution, this function is called directly with hardcoded
	// values and the AJAX is working just fine 
	myPosition = new Array();
	//myPosition[0] = position.coords.latitude;
	//myPosition[1] = position.coords.longitude;
	myPosition[0] = 25.0
	myPosition[1] = 3439.934
	//param = 'latitude=' + myPosition[0] + '&longitude=' + myPosition[1];
	param = {latitude: myPosition[0], longitude: myPosition[1]};
	alert("Starting the ajax call");
	$.ajax({
		type: 'POST',
		url: "/locations",
		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		data: param,
		success: ajaxSuccess
	});
}

$.ajaxSetup({
	headers: {
		'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
	}
});

$("#find_my_location").click(function() {
	// Calling the success function directly for right now because the
	// VM isn't behaving nicely with the geolocation procedures
	onSuccess(5);
});


function ajaxSuccess(data, status, jqXHR) {
	$("#location_show").text("Latitude: " + myPosition[0].toString() + " Longitude: " + myPosition[1].toString());
}

function onError(error) {
	if (error.code == 1) {
		// The user denied permission, don't try again
		var message = "The app was denied permission to your location";
		alert(message);
		success = false;
	} else {
		// Try to find the location again using low accuracy
		alert("Trying again with lower accuracy due to error " + error.code.toString());
		navigator.geolocation.getCurrentPosition(
			onSuccess,
			onSecondError, 
			{
				enableHighAccuracy: false,
				timeout: 20000,
				maximumAge: 25000 
			}
		);
	}
}

function onSecondError(error) {
	// Both attempts to locate the user failed, inform the user that
	// tracker failed
	var message = "Unable to find your location";
	alert(message);
}

