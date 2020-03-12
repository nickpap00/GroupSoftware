<?php
session_start();
// Sets the variables equal to whats been sent to this page from the registration page
$firstname=$_REQUEST["Firstname"];
$user=$_REQUEST["Username"];
$passw=$_REQUEST["Password"];
$access=$_REQUEST["UserType"];
$complete = 'false';

if (strtolower($access) == "student"){
	$access = 0;
} else {
	$access = 1;
}

$conn = new mysqli("localhost", "grpsoftw_admin", "adminroot","grpsoftw_shortcutDB"); 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); 
} else {
	$result=$conn->query("SELECT Username FROM Users WHERE Username = '$user'");
	
	if(mysqli_num_rows($result)>0){
		$complete = 'false';
	} else {
		$complete = 'true';
	}
}


if ($complete == 'true'){ // Empty if statement - used to include validation however that was moved to the registration page itself
	
	$conn->query("INSERT INTO users VALUES (NULL, '$firstname', '$user', '".sha1($passw)."', '$access')");
	if ($access = 1){
		header("Location:student_homepage.php");
	} else {
		header("Location:game_master_homepage.php");
	}
	
} else {
	header("Location:register_page.php?error=Username already exists"); // Else the user will be redirected back to the registeration page
	ob_enf_fluch();
}

?>