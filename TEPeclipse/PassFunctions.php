<?php
function echoResult($info, $ok){
    echo $info . " ";
    if ($ok) {
        echo "<span style='color:green'>";
        echo "DA";
    }
    else {
        echo "<span style='color:red'>";
        echo "NE";
    }
    echo "</span>";
    echo "<br/>";
}


function isLongEnough($pass, $minlen){
    // Preveri, če je geslo dovolj dolgo
    
    return (strlen($pass) > $minlen);
}

function isWithinLength($pass, $minlen, $maxlen){
    // Preveri, če je geslo v podanih mejah glede zahtevane dolžina
	
    return (strlen($pass)>= $minlen)&&(strlen($pass)<=$maxlen);
}

function areDigitsPresent($pass){
    // Ali so uporabljene cifre
    // Uporabim funkcijo za preverjanje regularnih izrazov
    // Alternativa temu je funkcija: preg_match('#[\d]#',$str) (to je PEARL notacija)
    // ereg je notacija POSIX
    
    if (ereg('[[:digit:]]',$pass)){    
        return true;
    }else{
        return false;
    }      
}

function areLowerCharsPresent($pass){
    // Ali so uporabljeni mali znaki abecede
    if (ereg('[[:lower:]]',$pass)){    
        return true;
    }else{
        return false;
    }   
}

function areUpperCharsPresent($pass){
    // Ali so uporabljeni veliki znaki abecede
    if (ereg('[[:upper:]]',$pass)){    
        return true;
    }else{
        return false;
    }   
}

function areSpecCharsPresent($pass){
    // Ali so uporabljeni posebni znaki
    if (ereg('[^a-zA-Z0-9]',$pass)){    
        return true;
    }else{
        return false;
    }   
}

function passwordStrength($pass, $minl){
    // Preveri moč gesla in izpiše oceno moči gesla glede na izbrani kriterij
    /* Samo črke in krajše od N znakov (0)
        Samo črke in daljše od N znakov (1)
        Poleg črk uporablja tudi cifre ter je daljše od N znakov (2)
        Uporablja različno velikost črk in cifre ter je daljše od N znakov (3)
        Poleg črk in cifer uporablja tudi posebne znake ter je daljše od N znakov (4)
 */
    $passStrength = 0;
    
    if (strlen($pass) > $minl) $passStrength++;
    
    if (eregi('[[:alnum:]]', $pass)) $passStrength++;
    
    if (areLowerCharsPresent($pass)&&  areUpperCharsPresent($pass)) $passStrength++;
    
    if (areSpecCharsPresent($pass)) $passStrength++;
    
    return $passStrength;
}

function isStrongEnough($pass, $minl, $maxl, $strength){
    // Preveri ustreznost gesla glede na zahtevano moč
    
    if (isWithinLength($pass, $minl, $maxl)&&(passwordStrength($pass, $minl)>= $strength)){
        return true;
    } else {
        return false;        
    }
}

function isEmailValid($email){
    // Ali je podani email naslov korektno vpisan
    if (eregi('^[a-zA-Z0-9_\-\.]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$',$email)){
        return true;
    } else {
        return false;        
    }
}

?>
