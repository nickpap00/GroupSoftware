<div id="footer" style="display:none"> <!-- Div tag with the display none so that it can be displayed based on inputs -->
	<?php //include_once("loginbox.php") ?> 
	<span>@PLACEHOLDER</span> 
	<span><input type="button" value="HIDE" onclick="showHide()"/> </span> <!-- When this button is pressed the code will start the showHide javascript function below and show this div tag -->
</div> 

<div id="footer_hide" class="footer">
	<input type="button" value="HIDE" onclick="showHide()"/> <!-- Starts the javascript function - hides this div tag and shows the other -->
	<span><input type="submit" onclick='windows.location="logout.php"' value="Logout"></span>
	<span class="text" id="footer_text" >@PLACEHOLDER</span> <br></br>
</div>


<script>

	function showHide() { /* This function hides and shows the footer when the hide and show buttons are clicked */
		$("#footer").slideToggle(); 
		$("#footer_hide").slideToggle();
	}
	
	/*
	var x = document.getElementById('footer');
	if (x.style.display === 'none') {
		x.style.display = 'block';
	} else {
		x.style.display = 'none';
	}
	*/
</script>

