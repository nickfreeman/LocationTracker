function initialize(locations){
		  var map = new google.maps.Map(document.getElementById('map-canvas'), 
			{zoom: 10,center: new google.maps.LatLng(locations[0][0], locations[0][1]),
			mapTypeId: google.maps.MapTypeId.ROADMAP});
			
		  var infowindow = new google.maps.InfoWindow();
		  var marker, i;
		  for (i = 0; i < locations.length; i++) {
			  marker = new google.maps.Marker({position: new google.maps.LatLng(locations[i][0], locations[i][1]),
				map: map});
				google.maps.event.addListener(marker, 'click', (function(marker, i) {
					return function() {
						infowindow.setContent("Shaumik!");
						infowindow.open(map, marker);}
				})(marker, i));
		  }

}

