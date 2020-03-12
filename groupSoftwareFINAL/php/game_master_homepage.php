<?php session_start(); ?>
<html>

	<head>
		<script src="../js/jquery-3.2.1.min.js"></script>
		
		<?php 
			include_once("scriptandstyles.php");
			include_once("userClassObject.php");
		?>
		
		<script type='text/javascript'>
		    function myfunction() {
		        document.getElementById('addRoute').submit();
		        
		    }
		    
		</script>	
	</head>
	
	
	<body>		
		<div>
			<center><h1>GAME MASTER HOMEPAGE</h1></center>
		</div>
		
		<?php include_once("navbar.php"); ?> <!-- Includes the navigation bar -->
		
		<div style="margin-bottom:10px;margin-top:10px;border-bottom:2px white solid;"><p>Add Route</p></div>
		<div style='display:none;' id="show">
		    <div> <p>Please enter a route to be added to the database. (Entered route is to be a coma seperated list of place names, all in lower case with any spaces replaced with '_')<br> E.g. Amory, Harrison, Hatherly, Innovation_centre </p></div>
		    <center>
		        <form method="post" action="addRoute.php" id="addRoute">
		            <span><p>Route:</p></span><input class="textbox" type="text" name="route" id="route"/><br>
		        </form>
		    <button type="submit" onclick="myfunction()">Submit</button>
		    </center>
		</div>
		<center><input type="button" value="Add Route" onclick="showHide2()" id="HIDE"/></center>
		
		<?php 
		    $q="SELECT * FROM `Tours`";
            $conn = new mysqli("localhost", "grpsoftw_admin", "adminroot","grpsoftw_shortcutDB"); // This connects the page to the localhost and creates a connection between the code and the coursework folder on PHP which contains all my databases
            if ($conn->connect_error) { // Check connection
                die("Connection failed: " . $conn->connect_error); // Failed connection will terminate the program
            } else {
            	$result=$conn->query($q); // Runs the query
            	if(mysqli_num_rows($result)>0){ // If the number of rows in the result is greater than 0
            	    $none = 'False';
            	    $row = mysqli_fetch_assoc($result);
            	} else {
            	    $row = 'No routes';
            	}
            }
		?>
		
		<div style="margin-bottom:10px;margin-top:10px;border-bottom:2px white solid;"> <p>Remove Route:</p> </div>
		<div style='display:none;' id="show2">

			<center><select id="remove_title" onchange="window.location.replace('game_master_homepage.php?remove_title='+this.value);">
				<option> Choose: </option>
				<?php if($none == 'False'){
					foreach ($result as $row){
						 echo '
								<option>'.$row['tourRoute'].'</option>
						 ';
					}
				}else{ ?>
				<option>No stock</option>
				<?php } ?>
			</select></center>
		</div>
		<Center><input class="button" type="button" value="Remove Route" onclick="showHide3()" id='HIDE2' /></center>

		<!-- SQL form for removing chosen title -->

		<?php
		if(isset($_REQUEST['remove_title'])){
			$remove_title = $_REQUEST['remove_title'];
			$conn = new mysqli("localhost", "grpsoftw_admin", "adminroot","grpsoftw_shortcutDB");
			if ($conn->connect_error) { // Check connection
				die("Connection failed: " . $conn->connect_error); // Failed connection will terminate the program
			} else {
				$q2 = "DELETE FROM `Tours` WHERE `tourRoute` = '$remove_title'";
				$conn->query($q2);
			}
			
		}
		?>
        
        <div style="margin-bottom:10px;margin-top:10px;border-bottom:2px white solid;"><p> Tours Available:<p/> </div>
		<div class="table">
			<table  id="user_table" stlye="border:2px solid black;">
				<tr>
					<th>tourID</th>
					<th>creatorID</th>
					<th>creationDate</th>
					<th>tourRoute</th>
				</tr>
				<?php
				$conn = new mysqli("localhost", "grpsoftw_admin", "adminroot","grpsoftw_shortcutDB");
				$q1 = "SELECT * FROM Tours";
				$result1=$conn->query($q1); 

				if(mysqli_num_rows($result1)>0){ 
					$none = 'False'; 
					$row1=mysqli_fetch_assoc($result1); 

					foreach ($result1 as $row1){ 
						 echo '
								<tr>
									<td>'. $row1['tourID'].'</td>
									<td>'. $row1['creatorID'].'</td>
									<td>'. $row1['creationDate'].'</td>
									<td>'. $row1['tourRoute'].'</td>
								</tr>
							  '; 
					}
				}else{ ?>
				<tr>
					<td>NO items</td>
					<td>NO items</td>
					<td>NO items</td>
					<td>No items</td>
				</tr>
				<?php } ?>
			</table>
		</div>

		?>
	</body>
	<script type='text/javascript'>
	    function showHide2(){
	        $("#show").slideToggle();
	        $("#HIDE").slideToggle();
	    }
	    function showHide3(){
	        $("#show2").slideToggle();
	        $("#HIDE2").slideToggle();
	    }
	</script>
</html>