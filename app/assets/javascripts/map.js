$(document).ready(function(){

    function initialize(){
	var mapOptions = {
	    center: new google.maps.LatLn(-34.397, 150.644)//include variable long and lat
	    zoom: 8,
	    mapTypeId: google.maps.MaptTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementByID("map-canvas"), mapOptions);
    }
    google.maps.event.addDomListener(window, 'load', initialize);

}