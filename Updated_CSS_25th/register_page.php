<html> 
<link rel="stylesheet" type="text/css" href="LoginStylesheet.css"></link>
<link rel="icon" href="registericon.png"/>
	<head> 
	
		<?php 
			include_once("scriptandstyles.php"); // This includes the scriptandstyles page which includes all the style sheet and the jquery scripts
			session_start(); // Starts the session and passes through all the details in the session
			include_once("redirect.php"); // Includes the redirect php page
			
			$error=""; // Sets the variable error equal to an empty string
			if(isset($_REQUEST["error"])) { // Requests error from the login page and if its set/equal to something it'll execute the code below
				$error=$_REQUEST["error"]; // Sets the variable error equal to what its been sent from the login page
			}
		?> 
		<script type="text/javascript">
			
			function myFunction() { // function called myfunction which is the validation for all the inputs on this page
				
				// Sets the variables equal to the value of the input tags
				var firstname = document.getElementById('Firstname');
				var user = document.getElementById('Username');
				var pass = document.getElementById('Password');
				var confirmPassword = document.getElementById('ConfirmPassword');
				var userType = document.getElementById('UserType');
				var error = '';
				}
				// Series of if statements that check if the variables are correct
				if (firstname.value.length == 0){ 
					error += "Please enter a Firstname\n";
				}
		
				if (user.value.length == 0){
					error += "Please enter a Username\n"; 
				}
				
				//if ((userType.value).toLowerCase() != "student" || (userType.value).toLowerCase() != "game master" || (userType.value).toLowerCase() != "gamemaster"){
				//	error += "Invalid user type\n";
				//}
				
				// username longer than 6 characters
				if (pass.value.length == 0){
					error += "Please enter a Password\n"; 
				}
				// password includes at least one capital letter and special character
				if (confirmPassword.value.length == 0){
					error += "Please confirm your password\n"; 
				}
				
				if (pass.value != confirmPassword.value){
					error += "Passwords don't match\n"; 
				}
				
				if (error.length > 0){ // If the length of the error string is greater than 0, the page will alert the list of errors
					document.getElementById("error_register_page").innerHTML=error;
				}else{
					document.getElementById("register").submit(); // Submits the details to the register page
				}
				/* Opens the sidebar */
				function openNav() {
				document.getElementById("Sidebar").style.width = "250px";
				document.getElementById("main").style.marginLeft = "250px";
				}

				/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
				function closeNav() {
				document.getElementById("Sidebar").style.width = "0";
				document.getElementById("main").style.marginLeft = "0";
				}
			
			
			
		</script>
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
		
		<center>
		<div id="textBoxes_register_page" class="inputbox">
			<form id="register" action="registerPage.php" method="post">
			<h1>Register</h1>
				<span class="label"> First Name: </span><input type="text" name="Firstname" id="Firstname"/>
				<span class="label"> Username: </span><input type="text" name="Username" id="Username"/>
				<span class="label"> Password: </span><input type="password" name="Password" id="Password"/>
				<span class="label"> Confirm Password: </span><input type="password" name="CfmPassword" id="ConfirmPassword"/>
				<span class="label"> User Type: </span><input type="text" name="UserType" id="UserType"/>
				<button id="loginbutton" type="button" onClick="myFunction()" >Register</button> <!-- Calls the function -->
				<button id="registerbutton" type="button" onclick="window.location='login_page.php'">Login</button>
			</form>
		</div>
		</center>

		<div class="error_register_page">
			<p id="text"> Requirements: <br> Username longer than 6 characters </br> Password is to be longer than 6 characters </br> Password includes at least one capital letter and special character </br> User type must be either Student or Game Master </p>
			<div id="error_register_page"><p><?=$error?></p></div>
		</div>
		
		

	</body>
</html>