<?php

session_start();

require('predloga.php');

head();
meni();
leviStolpec();

// Klic funkcije vsebinaB lahko nadomestiš s PHP kodo za izpis
// poljubne vsebine v osrednjem delu dokumenta.

require_once 'CreateCookieSetCookie.php';
require_once 'ShowCookies.php';

desniStolpec("Stran C");
noga();

?>

