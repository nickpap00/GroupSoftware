<?php
session_start();
require_once("userClassObject.php");

$l = $_REQUEST["last"];

$conn = new mysqli("localhost", "grpsoftw_admin", "adminroot", "grpsoftw_shortcutDB");
if ($conn->connect_error) {
    die("Connection failed: ". $conn->connect_error);
}
else {
    $uid = $_SESSION["User"]->userID;
    
    $updateLastLocation = "UPDATE Bookings SET lastLocation = $l WHERE userID = $uid";
    if ($conn->query($updateLastLocation) == TRUE) {
    }
    else {
        echo("Failed to update last location");
    }
}
?>