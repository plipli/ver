<?php
	// Piškotek bo veljal 1 uro.
	setcookie ('Piskotek2','Junij',time()+3600);
	
	echo "Cas veljavnosti v sek:".(time()+3600);
?>