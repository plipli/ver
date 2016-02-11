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
        
        $mysqli = new mysqli("178.172.41.68", "tepauth", "tepauth");

        /* check connection */
        if ($mysqli->connect_errno) {
            printf("Connect failed: %s\n", $mysqli->connect_error);
            exit();
        }

        // Izberem podatkovno bazo
        $mysqli->select_db("TepDB");
        
        // Naredim poizvedbo za izbrano ime
        // POZOR: kriptiranje gesla naredim pred klicem MySQL
        // Če se shranjeno kriptirano geslo in tiso, ki ga je vnesel uporabnik
        // ujemata, je prijava uspešna.
        
        $query = "select * from uporabniki where ime = '" .$ime.
                "' and geslo = sha1('".$geslo."')";
        
        // Izvedem poizvedbo v MySQL
        $result = $mysqli->query($query);
        
        if ($result->num_rows > 0){
            echo "Uspešno si se prijavil v sistem <b>" . $ime . "</b> !";
            $_SESSION['valid_user'] = $ime;
        } else {
            echo "Neuspešna prijava! Poizkusi ponovno.";
        }
    } 
    
    //
    desniStolpec('Logiranje preko podatkovne baze MySQL');
    noga();
?>

