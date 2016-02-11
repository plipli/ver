<?php
    // Najprej poskrbim za uporabo sej
    session_start();

    // Definiram spremenljivke, da se iuognem nerodnemu deluj s poljem.
    $ime = $_POST['ime'];
    $geslo = $_POST['geslo'];
    $geslo2 = $_POST['geslo2'];
    $email = $_POST['email'];
    $captchaCode = $_POST['captcha_code'];
   
    // Vključim datoteko, v kateri so shranjene funkcije, ki izrišejo zaslon
    require('predloga.php');
    require('passfunctions.php'); 
    require_once 'securimage/securimage.php';
    
    // Kreiram CAPTCHA objekt
    $imgCaptcha = new Securimage();
    
    head();
    meni();
    leviStolpec();
    
    // ...........................................................
    // Tukaj obdelamo obrazec
    // ...........................................................
    
    // Izpis vpisanih vrednosti v obrazec
    echo "Ime = " . htmlspecialchars($ime, ENT_NOQUOTES, "UTF-8") . "<br/>";
    echo "E-mail = " . $email . "<br/>";
    echo "Geslo = " . $geslo . "<br/>";
    echo "Geslo2 = " . $geslo2 . "<br/>";
    echo "CaptchaCode = " . $captchaCode . "<br/>";
    
    // Preverjanje funkcij za odstranjevanje / dodajanje slashev
    echo "<hr/>";
    echo "Odstranim slashe:" . stripslashes($_POST['ime']) . "<br/>";
    echo "Dodam slashe:" . addslashes($_POST['ime']) . "<br/>";
    echo "<hr/>";
    
    echoResult("Preverjanje dolžine (med 6 in 16 znaki): ", isWithinLength($geslo,6,16));
    echoResult("Preverjanje ujemanja obeh vpisanih gesel: ", ($geslo == $geslo2));
    echoResult("Ali geslo vsebuje cifre: ", areDigitsPresent($geslo));
    echoResult("Ali geslo vsebuje male znake abecede: ", areLowerCharsPresent($geslo));
    echoResult("Ali geslo vsebuje velike znake abecede: ", areUpperCharsPresent($geslo));
    echoResult("Ali geslo vsebuje posebne znake: ", areSpecCharsPresent($geslo));
    echo "Moč gesla (pri min. dolžini 6 znakov) = " . passwordStrength($geslo, 6) . "<br/>";
    echoResult ("Ali geslo ima moč 4 in je med 6 - 16 znaki? ", isStrongEnough($geslo, 6, 16, 4));
    echoResult ("Je e-mail ustrezen? ", isEmailValid($email));
    echoResult('Ali je bila CAPTCHA koda pravilno vnešena? ', $imgCaptcha->check($captchaCode) == true);

    // ...........................................................
    // Izpis informacije v desn stolpec
    // ...........................................................
    
    $infoOdstavek = "Preverjanje moči gesla, funkcij za delo z nizi, ter preprečevanje " .
                    "napadov kot sta XSS in SQL injection"; 
    desniStolpec($infoOdstavek);
    
    noga();
?>

