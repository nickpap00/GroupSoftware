<?php
session_start(); // Starts the session
session_unset(); // Clears the session
session_destroy(); // Destroys the session
header("location: index.php"); // Redirect to the index page
?>