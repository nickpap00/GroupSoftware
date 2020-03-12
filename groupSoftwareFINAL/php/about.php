<html>
 <title>About</title>
  <head>
		<script src="../js/jquery-3.2.1.min.js"></script>
		
		<?php 
			include_once("scriptandstyles.php");
			include_once("userClassObject.php");
		?>
			
	</head>
  <body>
    <div id="Sidebar" class="sidebar">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <a href="../index.php">Home</a>
      <a href="about.php">About</a>
      <a href="contact.php">Contact</a>
    </div>
    <div class="head" id="main">
      <button class="openbtn" onclick="openNav()">&#9776; Menu </button>
      <h1>About </h1>
    </div>
    <p>Shortcut is a web based game that is to be used by new University of Exeter students to acclimate them with the campus</p>
    <p>The game aims to make the process of learning your way around campus easy and fun.</p>
    <p>It does this by guiding your path around the campus and also introduces a competitive aspect as you can compare you scores to your peers.</p>
  </body>
</html>
