<?php session_start(); ?>
<html>

	<head>
	    <?php 
	    	include_once("php/scriptandstyles.php");
	        include_once("php/userClassObject.php");
	    ?>
		<script src="js/jquery-3.2.1.min.js"></script>
	</head>


	<body>
		 <div id="Sidebar" class="sidebar">
          <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    	  <a href="index.php">Home</a>
          <a href="about.php">About</a>
          <a href="">Contact</a>
        </div>
        
        <div class="head" id="main">
          <button class="openbtn" onclick="openNav()">&#9776; Menu </button>
          <h1>Welcome</h1>
        </div>

		<div class="inputbox" id="button_box">
			<!-- The onclick function allows the user to redirect to another page or start a function. -->
			<button type="button" id="main_button" onclick="window.location='php/login_page.php'">Login</button>
			<button type="button" id="main_button" onclick="window.location='php/register_page.php'">Register</button>
			<button type="button" id="main_button" onclick="window.location='php/forgot_password.php'">Forgot Password</button>
		</div>
		
	</body>
</html>
