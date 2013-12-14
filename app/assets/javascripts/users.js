	    
$(function(){
	var map;
  var markers = [];                             // Where all markers are stored
  var currentLat;                               // These two used to create pothole with last position
  var currentLng;
  var infobox = new google.maps.InfoWindow({    // One infobox, only content changes
     content: "Hello!",
     boxStyle:{
      border: "1px solid black"
     }
  });
  var isWindowOpen = false;                     // Used so only one window opens at a time
  var newMarkerExists = false;                  // Used so only one marker creaed at a time
  var blueDot = "/assets/blueDot.png";
  var currentMarker; 



	function initialize() {
	  var mapOptions = {
	    center: new google.maps.LatLng(37.7833, -122.4167),
	    zoom: 12,
	    mapTypeId: google.maps.MapTypeId.ROADMAP,
      disableDoubleClickZoom: true,
      styles: [{"featureType": "administrative", "stylers": [{"visibility": "off"} ] }, {"featureType": "poi", "stylers": [{"visibility": "simplified"} ] }, {"featureType": "road", "elementType": "labels", "stylers": [{"visibility": "simplified"} ] }, {"featureType": "water", "stylers": [{"visibility": "simplified"} ] }, {"featureType": "transit", "stylers": [{"visibility": "simplified"} ] }, {"featureType": "landscape", "stylers": [{"visibility": "simplified"} ] }, {"featureType": "road.highway", "stylers": [{"visibility": "off"} ] }, {"featureType": "road.local", "stylers": [{"visibility": "on"} ] }, {"featureType": "road.highway", "elementType": "geometry", "stylers": [{"visibility": "on"} ] }, {"featureType": "water", "stylers": [{"color": "#84afa3"}, {"lightness": 52 } ] }, {"stylers": [{"saturation": -17 }, {"gamma": 0.36 } ] }, {"featureType": "transit.line", "elementType": "geometry", "stylers": [{"color": "#3f518c"} ] } ] };
	  var map = new google.maps.Map(document.getElementById("map-canvas"),
	      mapOptions);
	}
	google.maps.event.addDomListener(window, 'load', initialize);
});