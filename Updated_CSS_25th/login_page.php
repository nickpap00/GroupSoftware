<html>
<link rel="stylesheet" type="text/css" href="LoginStylesheet.css"></link>
<link rel="icon" href="padlock.png"/>
	<head>

		<?php
			include_once("scriptandstyles.php"); // This includes the scriptandstyles page which includes all the style sheet and the jquery scripts
			session_start(); // Starts the session so this page can access the details from the session

			include_once("redirect.php"); // Includes a redirect.php page which means if the user has pressed back to get to this page they'll be sent to the previous page

			$error=""; // Sets the variable error equal to an empty string
			if(isset($_REQUEST["error"])) { // Requests error from the login page and if its set/equal to something it'll execute the code below
				$error=$_REQUEST["error"]; // Sets the variable error equal to what its been sent from the login page
			}
		?>

	</head>
	<body>

	<div id="mySidebar" class="sidebar"> <!-- move this to navbar -->
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">About</a>
		<a href="#">Services</a>
		<a href="#">Clients</a>
		<a href="#">Contact</a>
	</div>

	<div id="main"> <!-- This is the menu button to open the nav bar-->
		<button class="openbtn" onclick="openNav()">&#9776; Menu</button>
	</div>


		<center><div class="inputbox"> <!-- Here input data to the page is handled-->

			<form id="login" action="loginPage.php" method="post">
			<h1> Login </h1>
				<span>
					<span></span><input id="username" name="Username" type="text" placeholder="Username">
				</span>

				<span>
					<span></span><input id="password" name="Password" type="password" placeholder="Password" onKeydown="memSort(event);">
				</span>

				<div><p id="displaytext_loginpage"><?=$error?></p></div>

				<span>
					<input id="loginbutton" type="button" value="Login" onclick="myFunction()"/>
					<input id="registerbutton" type="button" value="Register" onclick="window.location='register_page.php'"/>
				</span>

			</form>

		</div></center>


		<script type='text/javascript'>
			$('#password').keydown(function(e){ // Function that takes the parameter e and uses the input box with ID password
				if(e.keyCode === 13){ // If what the user has entered on their keyboard is equal to 13/enter button it'll execute the code below
					myFunction(); // Calls myFunction
				 }
			});

			function myFunction() {
				var user = document.getElementById('username').value; // Gives the variable user the value of the input tag with ID username
				var pass = document.getElementById('password').value; // Like above
				if (user.length > 0 && pass.length > 0){ // If the lengths of the two variables is over 0 then it'll run the code below
					document.getElementById("login").submit(); // Submits the values of the form with ID login to the login page
				}else{
					document.getElementById("displaytext_loginpage").innerHTML="Username or Password not entered"; // Sets the div tag with ID displaytext_loginpage equal to username .....
				}
			}
			function openNav() {
				document.getElementById("mySidebar").style.width = "250px";
				document.getElementById("main").style.marginLeft = "250px";
}

			/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
			function closeNav() {
				document.getElementById("mySidebar").style.width = "0";
				document.getElementById("main").style.marginLeft = "0";
}
		</script>

	</body>
</html>
