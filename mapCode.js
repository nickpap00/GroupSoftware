/*
  Reminders:
    1. base and config specific arrays can be constructed and only general array can be sent to user
      1.1 Make AJAX request to fill arrays (locations, )

  Information:
    1. Base arrays hold information that is shared in every configuration so its not repeated
    2. Config arrays hold information that is configuration specific and may differ from user to user

*/
var iconPath = "icons/"; //folder with icons;

/* arrays that hold location strings */
var baseLocations = ["forum", "car_park_amory", "car_park_forum", "car_park_sports", "car_park_queens", "into"]; //shared in every config
var configLocations = ["harrison", "physics", "newman", "peter_chalk", "queens", "amory", "streatham_court"]; //configuration specific
var locations = baseLocations.concat(configLocations); //baseLocations + configLocations

/* number of locations in each array */
var baseLocationsLength = baseLocations.length;
var configLocationsLength = configLocations.length;
var locationsLength = locations.length;

/* arrays that hold coords for each location */
var baseLocationsCoords = [ //coords of shared locations
  {lat: 50.735466, lng: -3.533202},
  {lat: 50.737383, lng: -3.530348},
  {lat: 50.736247, lng: -3.534458},
  {lat: 50.737641, lng: -3.536463},
  {lat: 50.733906, lng: -3.534868},
  {lat: 50.736111, lng: -3.533717}
];
var configLocationsCoords = [ //coords of configuration specific locations
  {lat: 50.737759, lng: -3.532615},
  {lat: 50.736922, lng: -3.536284},
  {lat: 50.736606, lng: -3.536127},
  {lat: 50.736450, lng: -3.536074},
  {lat: 50.734125, lng: -3.534583},
  {lat: 50.736525, lng: -3.531449},
  {lat: 50.735832, lng: -3.530549}
];
var locationsCoords = baseLocationsCoords.concat(configLocationsCoords); //baseLocationsCoords + configLocationsCoords

/* change this according to each player */
var unlocked = new Array(locationsLength);
for (var i=0; i<locationsLength; i++) {
  unlocked[i] = true;
}

var markerDescriptions = new Array(locationsLength); //content for InfoWindow
for (var i=0; i<locationsLength; i++) {
  markerDescriptions[i] = "this is a description for " + makeName(locations[i]);
}

/* arrays with Marker objects for each location */
var baseMarkers = new Array(baseLocationsLength);
var configMarkers = new Array(configLocationsLength);
var markers = new Array(locationsLength);

/* arrays with icon file of each Marker object on the map */
var baseIcons = new Array(baseLocationsLength);
baseIcons = ["question_mark.png", "parking1.png", "parking1.png", "parking1.png", "parking1.png", "question_mark.png"]
var configIcons = new Array(configLocationsLength);
var icons = baseIcons.concat(configIcons);//new Array(locationsLength);
for (var i=baseLocationsLength; i<locationsLength; i++) {
  icons[i] = "question_mark.png";
}

var infoWindow;
var playerMarker;
var playerid;

var directionsService;
var directionsRenderer;

function initMap() {
  var playerIcon = iconPath + "player_face.png";

  //bounds of map
  var cage = 0.006;
  var bounds = {
    latLngBounds: {
    north: locationsCoords[0].lat + cage,
    south: locationsCoords[0].lat - cage,
    east: locationsCoords[0].lng + cage,
    west: locationsCoords[0].lng - cage
    }
  };
  //map options
  var mapArgs = {
    center: locationsCoords[0],
    zoom: 18,
    mapTypeId: "roadmap",
    disableDefaultUI: true,
    restriction: bounds,
    styles: [
      //removes all labels off the map
      {
        featureType: "all",
        elementType: "labels",
        stylers: [{visibility: "off"}]
      },
      //style roads
      {
        featureType: "road.local",
        elementType: "geometry.stroke",
        stylers: [
          {hue: "#97B3D0FF"},
          {saturation: 100},
          {lightness: -50}
        ]
      }
    ]
  };
  var map = new google.maps.Map(document.getElementById('map'), mapArgs); //map
  infoWindow = new google.maps.InfoWindow(); //infoWindow
  playerMarker = new google.maps.Marker({icon: playerIcon, map: map}); //player's Marker
  playerid = navigator.geolocation.watchPosition(updatePos, errorPos); //activate geolocation
  directionsService = new google.maps.DirectionsService(); //make request for directions
  directionsRenderer = new google.maps.DirectionsRenderer( { polylineOptions: { strokeColor: "purple", strokeWeight: 5}, suppressMarkers: true, map: map}); //show directions on map

  initMarkers(map);
  initEventListeners(map);

  var centerControlDiv = document.createElement('div');
  var centerControl = new CenterControl(centerControlDiv, map);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(centerControlDiv);

  var toggleControlDiv = document.createElement('div');
  var toggleControl = new ToggleControl(toggleControlDiv, map);
  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(toggleControlDiv);
}

function initMarkers(map) {
  for (var i=0; i<locationsLength; i++) {
    markers[i] = new google.maps.Marker({position: locationsCoords[i], animation: google.maps.Animation.DROP, icon: iconPath + icons[i], map: map});
  }
}

function initEventListeners(map) {
  var buildingName;
  var buildingDescription;

  for (var i=0; i<locationsLength; i++) {
    markers[i].addListener('click', function() {
      var ind = markers.indexOf(this); //get index of marker clicked
      buildingName = makeName(locations[ind]); //name to show
      buildingDescription = getDesc(ind); //description to show

      infoWindow.close();
      infoWindow.setContent('<div>' +
        '<h1>'+ buildingName +'</h1>' +
        '<div>' +
          '<p>'+ buildingDescription +'</p>' +
          '<strong>Start: </strong>' +
          '<select id=start>' +
            '<option value=-1>My position</option>' +
            addOptions() +
          '</select>' +
          '<br>' + '<br>' +
          '<center>' +
            '<button id='+ ind +' type="button" onclick="showPath(this)">Get me here!</button>' +
          '</center>' +
        '</div>' +
      '</div>');
      infoWindow.open(map, this);
    });
  }
}

/* loop through discovered buildings and appends to string
returns the string*/
function addOptions() {
  var text = '';
  for (var i=0; i<locationsLength; i++) {
    if (unlocked[i]) {
      text = text + '<option value='+ i +'>'+ makeName(locations[i]) +'</option>'
    }
  }
  return text;
}

function updatePos(pos) {
  var p = {lat: pos.coords.latitude, lng: pos.coords.longitude};
  playerMarker.setPosition(p);
}

function errorPos(err) {
  //error is displayed in the div tag instead of map
  var msg;
  switch (err.code) {
    case err.PERMISSION_DENIED:
      msg = "Please activate geolocation.";
      break;
    case err.POSITION_UNAVAILABLE:
      msg = "Position unavailable.";
      break;
    case err.TIMEOUT:
      msg = "Request for geolocation timed out.";
      break;
    case err.UNKNOWN_ERROR:
      msg = "An unknown error has occurred.";
      break;
  }
  var mapDiv = document.getElementById('map');
  mapDiv.innerHTML = msg;
}

function getDesc(ind) {
  if (unlocked[ind]) {
    return markerDescriptions[ind];
  }
  return "You haven't discovered this building";
}

/* capitalize first letter of string */
function capitalize(s) {
  if (!(s.length == 0)) {
    return s[0].toUpperCase() + s.slice(1);
  }
}

/* replace all "_" chars with " " */
function replaceChar(s) {
  var regex = /_/g;
  return s.replace(regex, " ");
}

/* Capitalize first letter and replace "_" with spaces */
function makeName(s) {
  s = capitalize(s);
  s = replaceChar(s);
  return s;
}

/* get locations for user */
function loadData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      loadArrays(this);
    }
  };
  xhttp.open("POST", "comp_sci.txt", true);
  xhttp.send();
}

/* load data received to arrays */
function loadArrays(xhttp) {

}

function showPath(button) {
  var startVal = document.getElementById('start').value;
  var startPos;

  if (startVal == -1) {
    startPos = playerMarker.getPosition();
  }
  else {
    startPos = locationsCoords[startVal];
  }
  console.log(startPos);
  var request = {
    origin: startPos,
    destination: locationsCoords[button.id],
    provideRouteAlternatives: false, //make use of that
    travelMode: 'WALKING',
    unitSystem: google.maps.UnitSystem.IMPERIAL //make use of that
  };

  directionsService.route(request, function(result, status) {
    if (checkRequest(result, status)) {
      directionsRenderer.setDirections(result);
      var last = directionsRenderer.getMap().controls[google.maps.ControlPosition.TOP_RIGHT].getLength() - 1;
      directionsRenderer.getMap().controls[google.maps.ControlPosition.TOP_RIGHT].getAt(last).style.display = "inline";
    }
  });
}

function CenterControl(controlDiv, m) {
  var controlUI = document.createElement('div');
  controlUI.style.backgroundColor = '#FDDB27FF';
  controlUI.style.cursor = 'pointer';
  controlUI.style.textAlign = 'center';
  controlDiv.appendChild(controlUI);

  var controlText = document.createElement('div');
  controlText.style.color = 'rgb(25,25,25)';
  controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
  controlText.style.fontSize = '16px';
  controlText.style.lineHeight = '38px';
  controlText.style.paddingLeft = '5px';
  controlText.style.paddingRight = '5px';
  controlText.innerHTML = 'Center Map';
  controlUI.appendChild(controlText);

  controlUI.addEventListener('click', function() {
      m.setCenter(locationsCoords[0]);
    });
}

function ToggleControl(controlDiv, m) {
  var controlUI = document.createElement('div');
  controlUI.style.backgroundColor = '#FDDB27FF';
  controlUI.style.cursor = 'pointer';
  controlUI.style.textAlign = 'center';
  controlDiv.appendChild(controlUI);
  controlDiv.style.display = "none";

  var controlText = document.createElement('div');
  controlText.style.color = 'rgb(25,25,25)';
  controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
  controlText.style.fontSize = '16px';
  controlText.style.lineHeight = '38px';
  controlText.style.paddingLeft = '5px';
  controlText.style.paddingRight = '5px';
  controlText.innerHTML = 'Toggle Directions';
  controlUI.appendChild(controlText);

  controlUI.addEventListener('click', function() {
   directionsRenderer.set('directions', null);
   controlDiv.style.display = "none";
   infoWindow.close();
 });
}

function checkRequest(result, status) {
  var msg = " ";

  switch (status) {
    case google.maps.DirectionsStatus.OK:
      break;
    case google.maps.DirectionsStatus.NOT_FOUND:
      msg = "Cannot geocode path";
      break;
    case google.maps.DirectionsStatus.ZERO_RESULTS:
      msg = "Cannot find any directions";
      break;
    case google.maps.DirectionsStatus.MAX_WAYPOINTS_EXCEEDED:
      msg = "Limit of waypoints reached";
      break;
    case google.maps.DirectionsStatus.MAX_ROUTE_LENGTH_EXCEEDED:
      msg = "Route is too long";
      break;
    case google.maps.DirectionsStatus.INVALID_REQUEST:
      msg = "Request is invalid";
      break;
    case google.maps.DirectionsStatus.OVER_QUERY_LIMIT:
      msg = "Webpage sent too many results";
      break;
    case google.maps.DirectionsStatus.REQUEST_DENIED:
      msg = "Request denied";
      break;
    case google.maps.DirectionsStatus.UNKNOWN_ERROR:
      msg = "An unknown error has occurred";
      break;
  }
  if (msg == " ") {
    return true;
  }
  return false;
}
