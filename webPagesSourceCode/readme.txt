This document states the format of the html and php code,

Front-end pages are in the format  ---	name_name.php					i.e. login_page.php
Back-end pages are in the format   ---	nameName.php 					i.e. loginPage.php

class names are defined using BEM  ---	some-type 						i.e. stick-man 
	if class name is page specific ---	some-type__pagename				i.e. stick-man__arm
	OTHER						   ---  some-type__pagename--specific	i.e. stick-man__arm--small
	
ID's are defined are to be defined using BEM 							i.e. USE ABOVE EXAMPLE
-----E.G.-----
.stick-man__arm {
	background-color: lightblue;
	text-align: centre;
}
--------------

Names/other delarations must also follow BEM rules



Information about certain pages -- UNFINISHED

scriptsandstyles.php
	Contains
		link to styles_coursework.css
		all javascript libraries/packages
		jquery
		
userClassObject.php
	About:
		This page defines the user class and stores the current users details e.g. username, password etc,
		If a page needs to access the users details, refer back to the variable names in this page for access,
		
index.php
	USE THIS PAGE FOR REFERENCE OF THE LAYOUT
	otherwise use code below

navbar.php
	Use:
		The navigation bar is included once in each homepage,
		Each user will see a different set of tabs as it checks the accessID from the session
	
	

HTML LAYOUT - update with class names
	<html>
		<head> 
			<?php 
				include_once("scriptandstyles.php");
				include_once("userClassObject.php");
				session_start();
			?>
		</head>
		<body>
			<div>
				<h1>GAME MASTER HOMEPAGE</h1>
			</div>
			
			<?php include_once("navbar.php"); ?>
			
			----SOMECONTENT----
			
			<div id="footer">
				<?php include_once("footer.php"); ?>
			</div>
		</body>
	</html>
	
	
PLEASE UPDATE README