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

        $mysqli->select_db("TepDB");
        
        // Naredim poizvedbo za izbrano ime
        $query = "select * from uporabniki where ime = '" .$ime.
                "' and geslo ='".$geslo."';";
        
        $result = $mysqli->query($query);
        
        //echoResult($query, $result);
        //$row = $result->fetch_object();
        //echoResult($row->st, 0);
        
        // Če je vrnjen vsaj en zadetek oz. biti mora natanko eden, potem je prijava uspela
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

