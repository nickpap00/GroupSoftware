<?php
require_once("userClassObject.php");

$baseMarkerDescriptionsPHP = array();
$configMarkerDescriptionsPHP = array();
$markerDescriptionsPHP = array();

$baseIconsPHP = array();
$configIconsPHP = array();
$iconsPHP = array();

$baseLocationsPHP = array("forum", "car_park_amory", "car_park_forum", "car_park_sports", "car_park_queens");
$configLocationsPHP = array();
$locationsPHP = array();

$baseLatCoordsPHP = array();
$baseLongCoordsPHP = array();
$baseCoordsPHP = array();

$configLatCoordsPHP = array();
$configLongCoordsPHP = array();
$configCoordsPHP = array();

$latCoordsPHP = array();
$longCoordsPHP = array();
$coordsPHP = array();

$baseCluesPHP = array();
$configCluesPHP = array();
$cluesPHP = array();

$lastLocationPHP = -1;


$conn = new mysqli("localhost", "grpsoftw_admin", "adminroot", "grpsoftw_shortcutDB");
if ($conn->connect_error) {
    die("Connection failed: ". $conn->connect_error);
}
else {

    $tourID = 2;
    $userID = 1;
    
    $getTourID = "SELECT tourID FROM Bookings WHERE userID= $userID;";
    $tourIDResult = $conn->query($getTourID);
    if ($tourIDResult == FALSE) {
        die("User id is not defined 1");
    }
    if (mysqli_num_rows($tourIDResult) > 0) {
        $tourRows = $tourIDResult->fetch_assoc();
        $tourID = $tourRows["tourID"];
    }
    else {
        ?>
        <script>window.alert("Couldn't find tour id, please contant us");</script>
        <?php
    }
    $lastLocationQuery = "SELECT lastLocation FROM Bookings WHERE userID=".$userID.";";
    $lastLocationResult = $conn->query($lastLocationQuery);
    if ($lastLocationResult == FALSE) {
        die("User id is not defined 2");
    }
    if (mysqli_num_rows($lastLocationResult) > 0) {
        $rows = $lastLocationResult->fetch_assoc();
        $lastLocatinPHP = $rows["lastLocation"];
    }
    else {
        ?>
        <script>window.alert("Couldn't find previous save location for your id");</script>
        <?php
    }
    ?>
    <?php
    for ($i=0; $i<count($baseLocationsPHP); $i++) {
        $baseLocationsQuery = "SELECT POIDescription, latCoordinate, longCoordinate, iconPath, clue FROM `Locations` WHERE POIname ="."'".$baseLocationsPHP[$i]."'".";";
        $baseLocationsResult = $conn->query($baseLocationsQuery);
        if ($baseLocationsResult == FALSE) {
            die("Base Locations are empty 3");
        }
        if (mysqli_num_rows($baseLocationsResult) > 0) {
            $baseLocationsData = $baseLocationsResult->fetch_assoc();
            array_push($baseMarkerDescriptionsPHP, $baseLocationsData["POIDescription"]);
            array_push($baseLatCoordsPHP, $baseLocationsData["latCoordinate"]);
            array_push($baseLongCoordsPHP, $baseLocationsData["longCoordinate"]);
            array_push($baseIconsPHP, $baseLocationsData["iconPath"]);
            array_push($baseCluesPHP, $baseLocationsData["clue"]);
        }
        else {
            ?>
            <script>window.alert("Couldn't find any results for common locations");</script>
            <?php
        }
    }
    $routeQuery = "SELECT tourRoute FROM Tours WHERE tourID =".$tourID.";";
    $routeResult = $conn->query($routeQuery);
    if ($routeResult == FALSE) {
        die("Tour id is empty 4");
    }
    $values = explode(",", $routeResult->fetch_assoc()["tourRoute"]);
    ?>
    <?php
    if (mysqli_num_rows($routeResult) > 0) {
        $rows = $routeResult->fetch_assoc();
        for ($i=0; $i<count($values); $i++) {
            $dataQuery = "SELECT POIname, POIDescription, latCoordinate, longCoordinate, iconPath, clue FROM `Locations` WHERE placeID =".$values[$i].";";
            $dataResult = $conn->query($dataQuery);
            if ($dataResult == FALSE) {
                die("values of routes are empty");
            }
            if (mysqli_num_rows($dataResult) > 0) {
                while ($row = mysqli_fetch_assoc($dataResult)) {
                    $configLocationsPHP[] = $row['POIname'];
                    $configMarkerDescriptionsPHP[] = $row['POIDescription'];
                    $configIconsPHP[] = $row['iconPath'];
                    $configLatCoordsPHP[] = $row['latCoordinate'];
                    $configLongCoordsPHP[] = $row['longCoordinate'];
                    $configCluesPHP[] = $row['clue'];
                }
            }
            else {
                ?>
                <script>window.alert("Couldn't find any locations for your route");</script>
                <?php
            }
        }
    }
    else {
        ?>
        <script>window.alert("Couldn't find the route");</script>
        <?php
    }
}
?>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9mz_14PT9i5meW0Ds5xAHe5nBBmaZqXQ&callback=initMap" async defer></script>
<script>
var iconPath = "../icons/"; //folder with icons;

var baseClues = <?php echo json_encode($baseCluesPHP)?>;
var configClues = <?php echo json_encode($configCluesPHP)?>;
var clues = baseClues.concat(configClues);

/* arrays that hold location strings */
var baseLocations = <?php echo json_encode($baseLocationsPHP)?>;
var configLocations = <?php echo json_encode($configLocationsPHP)?>; //configuration specific
var locations = baseLocations.concat(configLocations); //baseLocations + configLocations

/* number of locations in each array */
var baseLocationsLength = baseLocations.length;
var configLocationsLength = configLocations.length;
var locationsLength = locations.length;

/* arrays that hold coords for each location */
/* !!! php generated */
var baseLocationsCoords = new Array();
var configLocationsCoords = new Array();
var locationsCoords = new Array();

<?php 
    for ($i=0; $i<count($baseLatCoordsPHP); $i++) {
        ?>baseLocationsCoords.push({lat: <?php echo json_encode($baseLatCoordsPHP[$i], JSON_NUMERIC_CHECK)?>, lng: <?php echo json_encode($baseLongCoordsPHP[$i], JSON_NUMERIC_CHECK)?>});
    <?php
    }
?>
<?php 
    for ($i=0; $i<count($configLatCoordsPHP); $i++) {
        ?>configLocationsCoords.push({lat: <?php echo json_encode($configLatCoordsPHP[$i], JSON_NUMERIC_CHECK)?>, lng: <?php echo json_encode($configLongCoordsPHP[$i], JSON_NUMERIC_CHECK)?>});
    <?php
    }
?>

var locationsCoords = baseLocationsCoords.concat(configLocationsCoords); //baseLocationsCoords + configLocationsCoords
var unlocked = new Array(locationsLength);

/* php generated */
var baseMarkerDescriptions = <?php echo json_encode($baseMarkerDescriptionsPHP)?>;
var configMarkerDescriptions = <?php echo json_encode($configMarkerDescriptionsPHP)?>;
var markerDescriptions = baseMarkerDescriptions.concat(configMarkerDescriptions);

/* arrays with Marker objects for each location */
var baseMarkers = new Array(baseLocationsLength);
var configMarkers = new Array(configLocationsLength);
var markers = new Array(locationsLength);

/* arrays with icon file of each Marker object on the map */
var baseIcons = <?php echo json_encode($baseIconsPHP)?>;
var configIcons = <?php echo json_encode($configIconsPHP)?>;
var icons = baseIcons.concat(configIcons);

var infoWindow;
var playerMarker;
var playerid;
var lastLoc = <?php echo $lastLocationPHP?>;

var directionsService;
var directionsRenderer;
var helpWindow;

if (lastLoc != -1) {
    for (var i=0; i<lastLoc; i++) {
        unlocked[i] = true;
    }
    for (var i=lastLoc; i<locationsLength; i++) {
        unlocked[i] = false;
    }
}
else {
    for (var i=0; i<baseLocationsLength; i++) {
        unlocked[i] = true;
    }
    for (var i=baseLocationsLength; i<locationsLength; i++) {
        unlocked[i] = false;
    }
}

function initMap() {
  var playerIcon = iconPath + "player_face.png";

  //bounds of map
  var cage = 0.010;
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
    gestureHandling: "greedy",
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
  directionsRenderer = new google.maps.DirectionsRenderer( { polylineOptions: { strokeColor: "purple", strokeWeight: 5}, suppressMarkers: true, map: map} ); //show directions on map
  if (lastLoc == -1) {
    lastLoc = baseLocationsLength;
    makeHelpWindow(map);
  }
  initMarkers(map);
  initEventListeners(map);
  addMarker();


  var centerControlDiv = document.createElement('div');
  var centerControl = new CenterControl(centerControlDiv, map);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(centerControlDiv);

  var toggleControlDiv = document.createElement('div');
  var toggleControl = new ToggleControl(toggleControlDiv, map);
  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(toggleControlDiv);
}

function initMarkers(map) {
  for (var i=0; i<lastLoc; i++) {
    markers[i] = new google.maps.Marker({position: locationsCoords[i], animation: google.maps.Animation.DROP, icon: iconPath + icons[i], map: map});
  }
}

function initEventListeners(map) {
  var buildingName;
  var buildingDescription;

  for (var i=0; i<lastLoc; i++) {
    markers[i].addListener('click', function() {
      var ind = markers.indexOf(this); //get index of marker clicked
      buildingName = makeName(locations[ind]); //name to show
      buildingDescription = getDesc(ind); //description to show
      infoWindow.close();
      infoWindow.setContent(
        '<div>' +
          '<h1>'+ buildingName + '</h1>' +
          '<div>' +
            '<p>'+ buildingDescription +'</p>' +
            '<strong>Start: </strong>' +
            '<select id=start>' +
              '<option value=-1>My position</option>' +
              addOptions(ind) +
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

function addMarker() {
  if (lastLoc == locationsLength) {
    window.alert("Game finished");
  }
  var m = markers[lastLoc-1].getMap();
  markers[lastLoc] = new google.maps.Marker({position: locationsCoords[lastLoc], animation: google.maps.Animation.DROP, icon: iconPath + "question_mark.png", map: m});
  markers[lastLoc].addListener('click', function() {
    var ind = markers.indexOf(this); //get index of marker clicked
    if (unlocked[ind]) { 
        buildingName = makeName(locations[ind]);
        buildingDescription = getDesc(ind);
    }
    else {
        buildingName = "You haven't discovered this building";
        buildingDescription = getDesc(ind);
    }
    //buildingName = makeName(locations[ind]); //name to show
    //buildingDescription = getDesc(ind); //description to show
    infoWindow.close();
    infoWindow.setContent('<div>' +
      '<h1>'+ buildingName +'</h1>' +
      '<div>' +
        '<p>'+ buildingDescription +'</p>' +
        '<strong>Start: </strong>' +
        '<select id=start>' +
          '<option value=-1>My position</option>' +
          addOptions(ind) +
        '</select>' +
        '<br>' + '<br>' +
        '<center>' +
          '<button id='+ ind +' type="button" onclick="showPath(this)">Get me here!</button>' +
        '</center>' +
      '</div>' +
    '</div>');
    infoWindow.open(m, this);
  });
  m.setCenter(locationsCoords[lastLoc]);
  lastLoc++;
}
/* loop through discovered buildings and appends to string
returns the string*/
function addOptions(index) {
  var text = '';
  for (var i=0; i<lastLoc; i++) {
    if (unlocked[i]) {
      if (index == i) {
        continue;
      }
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

function makeHelpWindow(map) {
  helpWindow = new google.maps.InfoWindow();
  helpWindow.setContent('<div>' +
    '<center>' +
      '<h1>Information</h1>' +
      '<div>' +
        '<p>You have to go to all the markers, scan a qr code found in the location and answer a couple of questions</p>' +
      '</div>' +
    '</center>'+
  '</div>');
  helpWindow.setPosition(locationsCoords[0]);
  helpWindow.open(map);
}

/* @Deprecated */
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

function showPath(button) {
  var startVal = document.getElementById('start').value;
  var startPos;

  if (startVal == -1) {
    startPos = playerMarker.getPosition();
  }
  else {
    startPos = locationsCoords[startVal];
  }
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

// Function to create and control centre map button and functionality
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
      m.setCenter(playerMarker.getPosition());
    });
}

// Function to toggle directions on and off of the map
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
  controlText.innerHTML = 'Close Directions';
  controlUI.appendChild(controlText);

  controlUI.addEventListener('click', function() {
   directionsRenderer.set('directions', null);
   controlDiv.style.display = "none";
   infoWindow.close();
 });
}

// Function to check requests are valid
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

function revealBuilding(ind) {
    unlocked[ind-1] = true;
    markers[ind-1].setIcon(iconPath + icons[ind-1]);
    addMarker();
    updateLast();
}

function matchName(code) {
    if (locations[lastLoc-1] == code) {
        window.alert("hurray good code");
        revealBuilding(lastLoc);
    } else
    {
        window.alert("code failed");
    }
}
function addClue() {
    document.getElementById('clueP').innerHTML = clues[lastLoc-1];
    //cl.innerHTML = clues[lastLoc-1];
}
function updateLast() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
    }
  };
  xhttp.open("GET", "php/checkCode.php?last="+lastLoc, true);
  xhttp.send();
}
</script>