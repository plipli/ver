<?php
	// Piškotek bo veljal 1 uro.
	setcookie ('Piskotek2','Junij',time()-3600);
	
	echo "Piskotek2 je izbrisan<br/>";
	echo "Piskotek2: ".$_COOKIE['Piskotek2'];
?>