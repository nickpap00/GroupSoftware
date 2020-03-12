<?php session_start(); ?>

<html>
	<head>
		<script src="../js/jquery-3.2.1.min.js"></script>
		
		<?php 
			include_once("scriptandstyles.php");
			include_once("userClassObject.php");
		?>
			
	</head>
	
	
	<body>
		
		<?php include_once("navbar.php"); ?>
		
		<div style="margin-bottom:10px; margin-top:10px; border-bottom:2px white solid"><p>Leaderboard for your route</p></div>
		<div>
		    <table>
		        <tr>
		            <th>Username</th>
		            <th>Score</th>
		        </tr>
		        
		        <?php 
		            //$userID = $_SESSION["User"]->userID;
		            $userID = 1;
		            $q = "SELECT Users.Username,score FROM Bookings INNER JOIN Users on Bookings.userID=Users.UserID WHERE tourID = (SELECT tourID FROM Bookings WHERE userID = '".$userID."')";
		            $conn = new mysqli("localhost", "grpsoftw_admin", "adminroot","grpsoftw_shortcutDB"); // This connects the page to the localhost and creates a connection between the code and the coursework folder on PHP which contains all my databases
                    if ($conn->connect_error) { // Check connection
                        die("Connection failed: " . $conn->connect_error); // Failed connection will terminate the program
                    } else {
                    	$result=$conn->query($q); // Runs the query
                    	if(mysqli_num_rows($result)>0){
                    	    $row=mysqli_fetch_assoc($result);
                    	    
                    	    foreach ($result as $row){
                    	        echo '
                    	            <tr>
                    	                <th>'.$row['Username'].'</th>
                    	                <th>'.$row['score'].'</th>
                    	            </tr>
                    	        ';
                    	    }
                    	    
                    	} else { ?>
                    	    <tr>
                    	        <td>NONE</td>
                    	        <td>NONE</td>
                    	    </tr>
                    	<?php 
                    	    
                    	} 
                    }
                    ?>
		        
		    </table>    
		</div>
	
	</body>
</html>