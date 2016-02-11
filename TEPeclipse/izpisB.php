<?php

session_start();

require('predloga.php');

head();
meni();
leviStolpec();

// Klic funkcije vsebinaB lahko nadomestiš s PHP kodo za izpis
// poljubne vsebine v osrednjem delu dokumenta.
// Še en komentar

vsebinaB();

desniStolpec("Stran B");
noga();

?>

