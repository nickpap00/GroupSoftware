<html>

	<head>
		<script src="jquery-3.2.1.min.js"></script>
		
		<?php 
			include_once("scriptandstyles.php");
			include_once("userClassObject.php");
			session_start();
		?>
			
	</head>
	
	
	<body>
		<div id="Sidebar" class="sidebar">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="#">About</a>
			<a href="#">Services</a>
			<a href="#">Clients</a>
			<a href="#">Contact</a>
		</div>
		
		<div id="main">
			<button class="openbtn" onclick="openNav()">&#9776; Menu </button>
		</div>
		
		<div id="title_homepage">
			<center><h1>Welcome <br> to <br> GROUP SOFTWARE PROJECT</h1></center>
		</div>
		
		<div id="button_box">
			<!-- The onclick function allows the user to redirect to another page or start a function. -->
			<button type="button" class="" onclick="window.location='login_page.php'">Login</button> 
			<button type="button" class="" onclick="window.location='register_page.php'">Register</button>
			<button type="button" class="" onclick="window.location='forgot_password.php'">Forgot Password</button>
		</div> 
		
		<div id="footer">
			<?php include_once("footer.php"); ?>
		</div>
	</body>
</html>