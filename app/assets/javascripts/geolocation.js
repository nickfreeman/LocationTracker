var myPosition = new Array();
var success;

function get_position() {
	navigator.geolocation.getCurrentPosition(
		onSuccess,
		onError, {
			enableHighAccuracy: true,
			timeout: 20000,
			maximumAge: 25000 
		}
	);
};

function onSuccess(position) {
	myPosition[0] = position.coords.latitude;
	myPosition[1] = position.coords.longitude;
	param = 'latitude=' + myPosition[0] + '&longitude=' + myPosition[1]
	success = true;
	$.ajax({
		url: "/locations/create",
		data: param
	});
	alert("Sucessfully entered the location into the database");
};

function onError(error) {
	if (error.code == 1) {
		// The user denied permission, don't try again
		var message = "The app was denied permission to your location"
		alert(message);
		success = false;
	} else {
		// Try to find the location again using low accuracy
		navigator.geolocation.getCurrentPosition(
			onSuccess,
			onSecondError, {
				enableHighAccuracy: false,
				timeout: 20000,
				maximumAge: 25000 
			}
		);
	}
};

function secondError(error) {
	// Both attempts to locate the user failed, inform the user that
	// tracker failed
	var message = "Unable to find your location";
	alert(message);
	success = false;
};

$(function($) {
	$("#getLocation").click(function() {
		get_position();
	});
});
