<?php
class User {//defines the class user
	
	function __construct($id, $fn, $ur, $ps, $aid){ //this line contructs/creates the class user with the following attributes
		
		$this ->userID=$id;
		$this ->firstname=$fn;
		$this ->username=$ur;
		$this ->password=$ps;
		$this ->accessID=$aid;
		
	}
	

	function printType(){ // print function
		if($this->accessID==0){ //if statement checking if user_type is equal to 1
			return "Student"; // prints out student
		} elseif ($this->accessID==1){
			return "Game Master";
		} else {
			return "UNAUTHORISED";
		}
	}
}

?>