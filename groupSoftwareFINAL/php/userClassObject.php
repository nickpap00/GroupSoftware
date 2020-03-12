<?php
class User {//defines the class user
	
	function __construct($id, $fn, $ur, $ps, $aid){ //this line contructs/creates the class user with the following attributes
		
		$this ->userID=$id;
		$this ->firstname=$fn;
		$this ->username=$ur;
		$this ->password=$ps;
		$this ->accessID=$aid;
		
	}
	
}

?>