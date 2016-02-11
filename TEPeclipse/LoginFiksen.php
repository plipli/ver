<?php
    session_start();
    
    require('predloga.php');
    require('PassFunctions.php');
    require('Obrazci.php');
    
    head();
    meni();
    leviStolpec();
    
    // Vaje za fiksno logiranje    
    $ime = $_POST['ime'];
    $geslo = $_POST['geslo'];
    
    // Preverim, če se je uporabnik logiral (izpolnil uime in geslo)
    if (!isset ($ime)||(!isset ($geslo))){
        // Ni še izpolnil obrazca, zato mu go ponudim v izpolnjevanje
        
        display_obrazec_login($_SERVER['PHP_SELF']);
    } else {
        // Obrazec je izpolnjen. Zdaj moram preveriti, če sta
        // Prava uporabniško ime in geslo.
        
        if (($ime == 'admin')&&($geslo == 'glavni')){
            echo "Uspešno si se prijavil v sistem <b>" . $ime . "</b> !";
            $_SESSION['valid_user'] = $ime;
        } else {
            echo "Neuspešna prijava! Poizkusi ponovno.";
        }
    }
    
    
    //
    desniStolpec('Logiranje s fiksnim uporabniškim imenom in geslom');
    noga();
?>

