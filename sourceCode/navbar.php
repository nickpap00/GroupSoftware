<div id="nav">
<?php 
if(isset($_SESSION["User"])){ // If there is details in the session
?>
	<div id="navbar">
		<ul>
		  <?php if(($_SESSION["User"]->accessID) == '0'){ ?> <!-- If the user is a Student the nav bar will display the following tabs -->
			<li><a href="student_homepage.php">Home</a></li>
			<li><a href="#student_play.php">Play</a></li>
			<li><a href="#student_progress.php">Progress</a></li>
		  <?php } else { ?> <!-- If the user is a Game Master the nav bar will display the following tabs -->
		  	<li><a href="teacher_homepage.php">Home</a></li>
			<li><a href="#teacher_routes.php">Routes</a></li>
			<li><a href="#teacher_progress.php">Student Progress</a></li>
		  <?php }?>
			<!-- These page is access by all users -->
		  	<li><a href="#account.php">Account</a></li> 
		  	<li><a href="logout.php">Logout</a></li> 
		</ul>
	</div>
	<?php 
	if(($_SESSION["User"]->accessID) == '0'){ // If the user is a Student the nav bar will display the following 
		echo "<div>Student account - Welcome Back ".($_SESSION['User']->firstname)."</div>"; // Outputs a welcome message + their firstname
	 } else {
		echo "<div>Game Master account - Welcome Back ".($_SESSION['User']->firstname)."</div>"; 
	 }
	 ?>
<?php
} else {
	header("location: login_page.php"); //Redirects to the loginpage if the user hasn't logged in. Allows for a simple checker if the user types in the URL to any page. Stops unauthorised access
}
?>
</div>