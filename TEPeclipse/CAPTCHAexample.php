<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();

require('predloga.php');
require('PassFunctions.php');
require('Obrazci.php');

require_once 'securimage/securimage.php';

head();
meni();
leviStolpec();

// Vaje za preverjanje moči gesla

echo "Vaja za prikaz konfiguriranja CAPTCHA objekta";

echo "<img style='border:solid 1px' src='securimage/mathimage.php'/>";

desniStolpec('CAPTCHA primer');
noga();

?>

