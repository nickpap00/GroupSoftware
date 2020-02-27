<?php 
require_once("userClassObject.php");
session_start();

$firstname=$_REQUEST["Firstname"];
$user=$_REQUEST["Username"];
$passw=$_REQUEST["Password"];

if(strlen($firstname) == 0){
	$firstname = ($_SESSION['User']->firstname);
}

if(strlen($user) == 0){
	$user = ($_SESSION['User']->username);
}
if(strlen($passw) == 0){
	$passw = ($_SESSION['User']->password);
}

$userID = ($_SESSION["User"]->userID);
$userType = ($_SESSION["User"]->aid);

$q = "UPDATE `users` SET `Firstname`='$firstname',`Username`='$user',`Password`='$passw',`User_type`=$userType WHERE `User_ID`='$userID'";
$conn = new mysqli("localhost", "root", "","projectdb");
if ($conn->connect_error) { // Check connection
	die("Connection failed: " . $conn->connect_error); // Failed connection will terminate the program 
} else {
	$conn->query($q);
	$myuser=new User($row["userID"],$row["firstName"],$row["username"],$row["password"],$row["accessID"]);
	$_SESSION["User"]=$myuser; // Adds the class to the session
}
header('Location: account.php?message=Update Successful');


?>