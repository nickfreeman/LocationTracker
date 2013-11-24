function initialize(locations){
	var map = new google.maps.Map(document.getElementById('map-canvas'), 
	{zoom: 8,center: new google.maps.LatLng(locations[0][0], locations[0][1]),
	mapTypeId: google.maps.MapTypeId.ROADMAP});

	var infowindow = new google.maps.InfoWindow();
	var marker, i;
	for (i = 0; i < locations.length; i++) {
	  marker = new google.maps.Marker({position: new google.maps.LatLng(locations[i][0], locations[i][1]),
		map: map});
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				//put together the display tag with the name and the last check in information
				var name_and_checkin = "<p>" + "Name: " + locations[i][2] + "<br />" + "Checked In: " + locations[i][3] + "</p>"; 
				infowindow.setContent(name_and_checkin);
				infowindow.open(map, marker);}
		})(marker, i));
	}

}

