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

echo($firstname);
echo($user);
echo($passw);
echo($access);


$conn = new mysqli("localhost", "root", "","projectDB"); 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); 
} else {
	$result=$conn->query("SELECT username FROM users WHERE username = '$user'");
	echo ("just ran the query");
	
	if(mysqli_num_rows($result)>0){
		$complete = 'false';
		echo ("User exists");
	} else {
		$complete = 'true';
	}
}

echo($complete);

if ($complete == 'true'){ // Empty if statement - used to include validation however that was moved to the registration page itself
	
	$conn->query("INSERT INTO users VALUES (NULL, '$firstname', '$user', '".sha1($passw)."', '$access')");
	if ($access = 1){
		echo("student user");
		header("location:student_homepage.php");
	} else {
		echo("game master user");
		header("location:game_master_homepage.php");
	}
	
} else {
	echo("username exists");
	header("location:register_page.php?error=Username already exists"); // Else the user will be redirected back to the registeration page
		
}

?>