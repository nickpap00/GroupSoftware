<?php 

require_once("userClassObject.php");
session_start();
$usern=$_REQUEST["Username"]; // Requests the Username
$passw=$_REQUEST["Password"]; // Requests the Password 

$q="SELECT * FROM users WHERE username='".$usern."' and password='".sha1($passw)."'";
$conn = new mysqli("localhost", "root", "","projectdb"); // This connects the page to the localhost and creates a connection between the code and the coursework folder on PHP which contains all my databases
if ($conn->connect_error) { // Check connection
    die("Connection failed: " . $conn->connect_error); // Failed connection will terminate the program
} else {
	$result=$conn->query($q); // Runs the query
	echo ("just ran the query");
	
	if(mysqli_num_rows($result)>0){ // If the number of rows in the result is greater than 0
		$row=mysqli_fetch_assoc($result); // Sets $row to the result
		
		$myuser=new User($row["userID"],$row["firstName"],$row["username"],$row["password"],$row["accessID"]); // Creates the Class User and sets it with the variables from the query
		$_SESSION["User"]=$myuser; // Adds the class to the session
		if ($row["accessID"]=='0'){ // If the usertype is a teacher
			header("location:student_homepage.php"); // Redirects to the teacher homepage
		}elseif($row["accessID"]=='1'){
			header("location:game_master_homepage.php");
		}else{
			echo("UNAUTHORISED");
		}
	}else{
		echo ($usern);
		echo ($passw);
		//header("location:login_page.php?error=Your details are invalid"); // If the user failed to login because of invalid details this line will set the variable error to .... which displays on the Loginpage
		
	}
}
?>