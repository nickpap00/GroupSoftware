<?php 

if(isset($_SESSION['User'])){
	header("location:javascript://history.go(-1)"); //redirects the user to the last page they visited
}

?>