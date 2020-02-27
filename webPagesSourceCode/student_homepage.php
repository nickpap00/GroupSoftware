<html>
<link rel="stylesheet" type="text/css" href="styles_coursework.css"></link>
	<head>
		<script src="jquery-3.2.1.min.js"></script>
		
		<?php 
			include_once("scriptandstyles.php");
			include_once("userClassObject.php");
			session_start();
		?>
			
	</head>
	
	
	<body>
		<div>
			<center><h1>STUDENT HOMEPAGE</h1></center>
		</div>
		
		<?php include_once("navbar.php"); ?> <!-- Includes the navigation bar -->
		
		
		<div id="footer">
			<?php include_once("footer.php"); ?>
		</div>
	</body>
</html>