function initialize(locations){
	var map = new google.maps.Map(document.getElementById('map-canvas'), 
	{zoom: 8,center: new google.maps.LatLng(locations[0][0], locations[0][1]),
	mapTypeId: google.maps.MapTypeId.ROADMAP});

	var infowindow = new google.maps.InfoWindow();
	var marker, i;
	
	//creating a way to associate names with a color to have unique color identifier on the map
	var color = new Color();
	var counter = 0;
	
	for (i = 0; i < locations.length; i++) {
	  if(!(locations[i][2] in color.person_to_color)){
		  color.person_to_color[locations[i][2]] = color.colorlist[counter];
		  counter = (counter + 1)%color.colorlist.length;
		  //alert("here");
	  }
	  //alert("counter: " +String(counter));
	  //alert(color.person_to_color[locations[i][2]]);
	  var image = selecting_color(color.person_to_color[locations[i][2]]);
	  //alert("Counter: " + String(image)); 
	  marker = new google.maps.Marker({position: new google.maps.LatLng(locations[i][0], locations[i][1]),
		map: map, icon: image});
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				//put together the display tag with the name and the last check in information
				var name_and_checkin = "<p>" + "Name: " + locations[i][2] + "<br />" + "Checked In: " + locations[i][3] + "</p>"; 
				infowindow.setContent(name_and_checkin);
				infowindow.open(map, marker);}
		})(marker, i));
	}

}

//var colorlist = ['0000ff','00cd00','ff0000','ffff00','006400','458b74','838b8b','cdb79e','458b00','8b7d6b','a52a2a','8b7355','5f9ea0','7fff00','cd5b45','00cdcd','ffb90f','8b6508','bdb76b','6e8b3d','ff8c00','8b4500','9932cc','68228b','e9967a','698b69','ff1493','8b0a50','ff00ff','b03060','ff4500']

var selecting_color = function(color){
	return "https://chart.googleapis.com/chart?chst=d_map_pin_icon&chld=camping|" + color;
}

var Color = function(){
	//list of color in hex. you can add more color if you want!!!!!!!!!!
	this.colorlist = ['0000ff','00cd00','ff0000','ffff00','006400','458b74','838b8b','cdb79e','458b00','8b7d6b','a52a2a','8b7355','5f9ea0','7fff00','cd5b45','00cdcd','ffb90f','8b6508','bdb76b','6e8b3d','ff8c00','8b4500','9932cc','68228b','e9967a','698b69','ff1493','8b0a50','ff00ff','b03060','ff4500'];
	//this.colorlist = ['0000ff','00cd00'];
	//each person gets assigned a certain color from the color list
	this.person_to_color = {};
}

;
