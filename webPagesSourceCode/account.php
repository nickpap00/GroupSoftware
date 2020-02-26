<html>
	<head>
		<?php include_once("scriptandstyles.php"); // This includes the scriptandstyles page which includes all the style sheet and the jquery scripts
			  require_once("userClassObject.php"); // Includes userClassObject.php - lets me access the variables in the session
			  session_start(); // Starts the session and passes through all the details in the session
			  
			  $message=""; // Sets the variable error equal to an empty string
			  if(isset($_REQUEST["message"])) { // Requests error from the login page and if its set/equal to something it'll execute the code below
				$message=$_REQUEST["message"]; // Sets the variable error equal to what its been sent from the login page
			  }
		?> 
	</head>
	
	<body>

		<?php include_once("navbar.php"); ?> <!-- Includes the navigation bar -->
		
		
		<!-- account -->
		<div>
			<div> Your Details: </div><!-- class="text_student_account" not loading but otherwise the styles are correct -->
			<div>
				<table> <!-- Table for the users details -->
				  <tr>
					<th>Firstname</th>
					<th>Username</th> 
				  </tr>
				  <tr>
					<td><?php if(isset($_SESSION["User"])){echo $_SESSION["User"]->firstname;}?></td>
					<td><?php if(isset($_SESSION["User"])){echo $_SESSION["User"]->username;}?></td>
				  </tr>
				</table>
			</div>		
			
			<div> Change your details: </div>						
			<div>
				<div>
					<span >Requirements:</span>
					<ul>
						<li>Username - longer than 6 characters</li>
						<li>Password - longer than 6 characters with at least one uppercase letter and special character</li>
					</ul>
					<div><?php echo $message; ?></div> <!-- Displays an error message if the user enters in invalid details -->
				</div>
				<form id="change_details" action="updateUser.php" method="post"> <!-- Form that posts the users information to the resubbmit_details  -->
					<span class="label"> First Name: </span><input type="text" name="Firstname" class="input_register_page" id="Firstname"/>
					<span class="label"> Username: </span><input type="text" name="Username" class="input_register_page" id="Username"/>
					<span class="label"> Password: </span><input type="password" name="Password" class="input_register_page" id="Password"/>
					<span class="label"> Confirm Password: </span><input type="password" name="CfmPassword" class="input_register_page" id="ConfirmPassword"/>
					<center><input type="button" class="button" value="Submit" onclick="myFunction()"/></center>
				</form>
			</div>

		</div>
		
		<div id="footer1">
			<?php include_once("footer.php"); ?> <!-- Includes the footer -->
		</div>
		
		<script type='text/javascript'>
		function myFunction() { // Submits the details of the change_details form
			document.getElementById("change_details").submit();
		}		
		</script>
	</body>
</html>