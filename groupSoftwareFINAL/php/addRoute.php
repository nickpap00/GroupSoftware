<?php session_start();
require_once("userClassObject.php");

$route = $_REQUEST["route"];
$userID = 1;
$date = date("Y/m/d");

$no_results = 2;
$errors = 0;

if ($errors==0){ // If there aren't any errors
	$q = "INSERT INTO `Tours`(`tourID`, `creatorID`, `creationDate`, `tourRoute`) VALUES (NULL,'$userID','$date','$route')";
	echo $q;
	$conn = new mysqli("localhost", "grpsoftw_admin", "adminroot","grpsoftw_shortcutDB");
	if ($conn->connect_error) { // Check connection
		die("Connection failed: " . $conn->connect_error); // Failed connection will terminate the program 
	} else {
		$conn->query($q);
	}
}
header('Location: game_master_homepage.php');
?>