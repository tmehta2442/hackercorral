	    
$(function(){
	var map;
  var markers = [];
  var currentLat;
  var currentLng;
  var infobox = new google.maps.InfoWindow({
     content: "Hello!",
     boxStyle:{
      border: "1px solid black"
  }
});

var isWindowOpen = false;
var newMarkerExists = false;
var blueDot = "/assets/blueDot.png";
var currentMarker;

function initialize() {
	var mapOptions = {
    center: new google.maps.LatLng(37.7833, -122.4167),
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDoubleClickZoom: true,
    styles: [{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"},{"lightness":20}]},{"featureType":"administrative.land_parcel","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"landscape.man_made","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road.local","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"poi","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road.arterial","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"hue":"#a1cdfc"},{"saturation":30},{"lightness":49}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"hue":"#f49935"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"hue":"#fad959"}]}] 
  	};
  	map = new google.maps.Map(document.getElementById("map-canvas"),
  		mapOptions);
	}
		google.maps.event.addDomListener(window, 'load', initialize);
		
		if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
      var currentPosition = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	      var userMarker = new google.maps.Marker({
	        position: currentPosition,
	        map: map,
	        icon: blueDot
	      });
      map.setCenter(currentPosition);
    }, 
  	function() {
      handleNoGeolocation(true);
    });
  }



  
});