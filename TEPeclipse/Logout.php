<?php
    session_start();
    
    require('predloga.php');
    require('PassFunctions.php');
    require('Obrazci.php');
    
    head();
    meni();
    leviStolpec();
    
    // Shranim uporabnika, da vem, če je bil pred tem sploh logiran.
    $old_user = $_SESSION['valid_user'];
    
    // Uporabnika odstranim oz. uničim spremenljivko.
    unset($_SESSION['valid_user']);
    
    echo "<h3>Odjava iz sistema</h3>";

    if (!empty($old_user)) {
    //Če je bil uporabnik pred tem res že vpisan, dobi naslednje sporočilo.

      echo 'Zdaj si odjavljen iz sistema.<br/>';

    } else {
      echo 'Saj sploh še nisi bil vpisan ... <br/>';
    }
    
    //
    desniStolpec('Logiranje s fiksnim uporabniškim imenom in geslom');
    noga();
?>

