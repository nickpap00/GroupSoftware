<html>
 <title>Map</title>
  
	
    <head>
		<script src="../js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cairo&display=swap">
		
		<?php 
			include_once("php/scriptandstyles.php");
			include_once("php/userClassObject.php");
		?>
			
	</head>
  
  <body>


	<!-- Title of our game / seperation from top navigation -->
    <div id="title"></div>
	<!-- Creates Sidebar for sitewide links -->
	<div id="Sidebar" class="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="php/about.php">About</a>
		<a href="php/contact.php">Contact</a>
	</div>
		<div class="head" id="main">
			<button class="openbtn" onclick="openNav()">&#9776; Menu </button>
			<h1>Shortcut</h1>
		</div>

    <!-- Map -->
    <div id="map"></div>
	<h3>Your next clue:</h3>
	<!-- Will need some kind of request to get the clue for the next building in the tour-->
    <div class="clueParagraph">
		<!-- Set the clue here-->
		<p id="clueP">This is a clue</p>
    </div>
    <div class="qr_div">
      <button  id="scanbutton" class="button" onclick="document.getElementById('QR_scanner').click()"></button>
		<input class="buildingtextbox" type=text size=16 placeholder="Building name will appear here" class=qrcode-text readonly/>
		<label class=qrcode-text-btn>
		<input id="QR_scanner" type=file accept="image/*" capture=environment onchange="openQRCamera(this);" tabindex=-1></label>
		<button class="button">Check In</button>
    </div>

	<script src="js/qr_scanner.js"></script>
	<?php include_once("php/addData.php");?>
  </body>
</html>
