<?php 
session_start();
?>
<div id="nav">
<?php
if(isset($_SESSION["User"])){ // If there is details in the session
?>
	<div id="Sidebar" class="sidebar">
		<ul>
		
		  <?php if(isset($_SESSION["User"]->accessID) == 0){ ?> <!-- If the user is a Student the nav bar will display the following tabs -->
			<li><a href="student_homepage.php">Home</a></li>
			<li><a href="../main.php">Play</a></li>
			<li><a href="leaderboard_page.php">Leaderboard</a></li>
		  <?php } else { ?> <!-- If the user is a Game Master the nav bar will display the following tabs -->
		  	<li><a href="game_master_homepage.php">Home</a></li>
		  <?php }?>
			<!-- These page is access by all users -->
			<li><a href="about.php">About</a></li>
			<li><a href="contact.php">Contact</a></li>
		  	<li><a href="account.php">Account</a></li> 
		  	<li><a href="logout.php">Logout</a></li> 
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		</ul>
	</div>
	
	<div id="main">
		<button class="openbtn" onclick="openNav()">&#9776; Menu </button>
	</div>
		
<?php
} else {
	header("Location: https://www.shortcutexeter.com"); //Redirects to the loginpage if the user hasn't logged in. Allows for a simple checker if the user types in the URL to any page. Stops unauthorised access
}
?>
</div>





