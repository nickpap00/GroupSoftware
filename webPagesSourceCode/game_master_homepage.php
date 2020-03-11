<?php
session_start();
?>
<html>
  <head>
    <script src"../js/jquery-3.2.1.min.js"></script>
	<?php
		include_once("scriptandstyles.php");
		include_once("userClassObject.php");
		?>
	<link href="https://fonts.googleapis.com/css?family=Cairo&display=swap" rel="stylesheet">
  </head>
  <link rel="stylesheet" type="text/css" href="styles_coursework.css"></link>
  <body>


	<!-- Title of our game / seperation from top navigation -->
    <div id="title">
		<center><h1>GameMaster Homepage</h1></center>
	</div>
	<?php include_once("navbar.php");?>
	
	<!-- Creates Sidebar for sitewide links -->
	
	<div class="route_selection">
		<h3>Select a Route from the list below to make a game.</h3>
			<label for="routes">Choose a route:</label>

			<select id="routes">
				<option value="r1">R1</option>
				<option value="r2">R2</option>
				<option value="r3">R3</option>
				<option value="r3">R4</option>
			</select>
			<input id="main_button" type="button" value="Make Game" onclick="myFunction()"/>
	</div>
	<div class="route_creation">
		<h3>Alternativley create your own routes here:</h3>
	</div>

	<script src="js\qr_scanner.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9mz_14PT9i5meW0Ds5xAHe5nBBmaZqXQ&callback=initMap" async defer></script>
  </body>
</html>
