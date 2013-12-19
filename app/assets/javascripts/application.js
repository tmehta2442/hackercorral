// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$('.navHeaderCollapse').collapse({
  toggle: false
})

var geocoder;
var map;
var infowindow;
var isWindowOpen = false;
var newMarkerExists = false;
var blueDot = "/assets/blueDot.png";
var currentMarker;

// map opens @ zoom level 14
  function initialize() {
    geocoder = new google.maps.Geocoder();
    var home = new google.maps.LatLng(37.7833, -122.4167);

    map = new google.maps.Map(document.getElementById('map'), {
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: home,
      zoom: 14

    });
  }

  function callback(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    }
  }
  // function to place markers
  function placeMarkers() {
    // getting the latitude/longitude
    function getLatLng (address) {
      var result = "";
      geocoder = new google.maps.Geocoder();
      
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          // using first address found
          result = results[0].geometry.location;
          dropTheMarker(result)
        };
      });
    };
    // using the gon gem, from the users controller
    for (allEvents in gon.events) {
      var eventAddress = (gon.events[allEvents].event_location)
      var latLong = getLatLng(eventAddress)
    
    }
  }

  function dropTheMarker(latLong) {
    new google.maps.Marker({
      position: latLong,
      map: map,
      title: 'Hello World!'
    });
  }
	// blue dot, thank you Bryan and Marco ;)   .... essentially follows the some logic as 
// dropping the marker
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

  function codeAddress() {
    var address = document.getElementById("address").value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
  
        infowindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: 200
        });

        var contentString = "please work"
        var service = new google.maps.places.PlacesService(map);
        // service.nearbySearch(request, callback);
        service.nearbySearch(callback);
        } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });

// below is testing to get popup working... close


    var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
      'sandstone rock formation in the southern part of the '+
      'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
      'south west of the nearest large town, Alice Springs; 450&#160;km '+
      '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
      'features of the Uluru - Kata Tjuta National Park. Uluru is '+
      'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
      'Aboriginal people of the area. It has many springs, waterholes, '+
      'rock caves and ancient paintings. Uluru is listed as a World '+
      'Heritage Site.</p>'+
      '<p>Attribution: Uluru, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
      'http://en.wikipedia.org/w/index.php?title=Uluru</a> '+
      '(last visited June 22, 2009).</p>'+
      '</div>'+
      '</div>';

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: 'Uluru (Ayers Rock)'
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map,marker);
    });
  }