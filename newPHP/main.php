<html>
  <head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cairo&display=swap">
	<link rel="stylesheet" type="text/css" href="css/styles_coursework.css">
  </head>
  
  <body>


	<!-- Title of our game / seperation from top navigation -->
    <div id="title"></div>
	<!-- Creates Sidebar for sitewide links -->
	<div id="Sidebar" class="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">Leaderboard</a>
		<a href="about.html">About</a>
		<a href="contact.html">Contact</a>
	</div>
		<div class="head" id="main">
			<button class="openbtn" onclick="openNav()">&#9776; Menu </button>
			<h1>Shortcut</h1>
		</div>

    <!-- Map -->
    <div id="map"></div>
	   <h3>Your next clue:</h3>
    <div class="clueParagraph">
      <p>This is a clue</p>
    </div>
    <div class="qr_div">
      <button  id="scanbutton" class="button" onclick="document.getElementById('QR_scanner').click()"></button>
		<input class="buildingtextbox" type=text size=16 placeholder="Building name will appear here" class=qrcode-text readonly/>
		<label class=qrcode-text-btn>
		<input id="QR_scanner" type=file accept="image/*" capture=environment onchange="openQRCamera(this);" tabindex=-1></label>
		<button class="button">Check In</button>
    </div>
    <!--<script src="js/mapCode.js"></script>-->
	<script src="js/qr_scanner.js"></script>
	<?php include_once("php/addData.php");?>
    <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9mz_14PT9i5meW0Ds5xAHe5nBBmaZqXQ&callback=initMap" async defer></script>-->
  </body>
</html>
