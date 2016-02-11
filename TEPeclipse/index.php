<?php

// ...........................................................
// Z namenom, da si stvari poenostavimo t.j. da se izoognemu pisanju istih
// stvari večkrat in da si poenostavimo vzdrževanje kode, si lahko sestavimo
// predlogo. Dokument razdelimo na več delov (po več funkcijah). S klici
// v pravem vrstnem redu sestavimo dokument na zelo enostaven način.
// Vse strani na spletni strani lahko oblikujemo po tem vzorcu
// ...........................................................
// Najprej poskrbim za uporabo sej
session_start();

// Vključim datoteko, v kateri so shranjene funkcije, ki izrišejo zaslon
require('predloga.php');


// S klici v pravem vrstnem redu sestavim HTML dokument.
// Po potrebi spreminjamo tudi obliko ostalih elementov.
// Npr. meni(), meniGost(), meniAdmin(), desniStolpec(), desniStolpecInfo() ipd. 

head();
meni();
leviStolpec();

// ...........................................................
// Tukaj vnesemo kodo ali kličemo funkcijo, ki bo izpisovala
// v osrednji del zaslona t.j. v blok z ID-jem "content"
// ...........................................................

echo "Pozdravljan! <br/>";
echo "<a href='izpisB.php'>Tukaj skočiš na vsebino B</a>";

// ...........................................................

desniStolpec("Uvodna stran");
noga();
?>

