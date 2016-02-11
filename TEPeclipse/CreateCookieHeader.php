<?php
	// Kreiranje piškotka s headerjem
	$date = gmstrftime("%A, %d-%b-%Y %H:%M:%S",(mktime()+6400) );

	header ("Set-Cookie: Piskotek1='Keks'; expires=$date;");
	echo "Datum veljavnosti:".$date;

?>