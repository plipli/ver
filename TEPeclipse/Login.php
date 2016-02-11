<?php
    session_start();
    
    require('predloga.php');
    require('PassFunctions.php');
    require('Obrazci.php');
    
    head();
    meni();
    leviStolpec();
    
    // Vaje za preverjanje moči gesla
    
    echo "Vaje za preverjanje moči gesla";
    
    display_obrazec();
    
    //
    desniStolpec('Logiranje');
    noga();
?>

