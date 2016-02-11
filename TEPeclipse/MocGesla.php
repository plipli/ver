<?php

    $ime = $_POST['ime'];
    $geslo = $_POST['geslo'];
    $gesloPonovno = $_POST['geslo2'];
    $email = $_POST['email'];

    session_start();
    
    require('predloga.php');
    require('PassFunctions.php');
    
    head();
    meni();
    leviStolpec();
    
    // Vaje za preverjanje moči gesla
    
    echo "Tukaj obdelamo obrazec<hr/>";
    
    echo "Uporabniško ime z veliki črkami: " . strtoupper($ime) . "<br/>";
    echo "Uporabniško ime z dodanimi slaši: " . addslashes($ime) . "<br/>";
    echo "Uporabniško ime z odstranjenimi slashi: " . stripslashes($ime) . "<br/>";
    echo "Vpisal si naslednje geslo: " . $geslo . "<br/>";

    echo "Izpis prvega dela e-maila: " . strtok($email, '@') . "<br/>";

    echo "Razbitje stringa pri afni: ";
    $polje = explode('@', $email);
    foreach ($polje as $value) {
        echo "--" . $value . "--<br/>";
    }
    
    // Dodam še eno vrednost v polje
    $polje[2] = 'dodatek';
    
    $povezan = implode('@', $polje);
    echo "Združitev imena pri afni: " . $povezan . "<br/>";
    echo "Geslo brez začetnih in končnih presledkov: " . trim($geslo) . "<br/>";
    echo "Je geslo dovolj dolgo? " . isLongEnough($geslo, 10) . "<br/>";
    //echo "Je geslo obakrat enako: " . isDoubleChecked($geslo, $geslo2) . "<br/>";
    echo "Je geslo obakrat enako: " . isDoubleChecked('abc', 'abc') . "<br/>";
    
    echo nl2br("foo isn't\n bar");
    
    $str ='sdfsdrtreteqtqe7gsdfwevtertq';

    if (preg_match('#[0-9]#',$geslo)){    
        echo ' Ima cifre';
    }else{
        echo ' Nima cifer';
    }  
    
    // Alternativa temu je: preg_match('#[\d]#',$str)
    if (ereg('[[:digit:]]',$geslo)){    
        echo '<br/>RE: Ima cifre';
    }else{
        echo '<br/>RE: Nima cifer';
    }   
    
    if (preg_match('#[a-b]#',$geslo)){    
        echo ' Ima male znake';
    }else{
        echo ' Nima malih znakov';
    }  
    
    //
    desniStolpec();
    noga();
?>

