<?php

session_start();

require('predloga.php');

head();
meni();
leviStolpec();
    

    echo "Kreiranje (JSON)<br/>";
    $url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=6e59943ed19e98f608207034eca4f464&tags=pink+floyd&format=json&nojsoncallback=1&auth_token=72157636769993395-8f878f1a02985df8&api_sig=6445e2c65f2a2dd9937af74e536a0b90";
    
    $jsonObject = json_decode(file_get_contents($url),true);

    //print_r($jsonObject);
    /*
    foreach($jsonObject['photo'] as $fotka){
    	echo $fotka['title']."<br/>";	
    }*/

    echo "Page:" . $jsonObject[photos][page] . "<br/>";
    echo "Pages:" . $jsonObject[photos][pages] . "<br/>";
    echo "Per page:" . $jsonObject[photos][perpage] . "<br/>";
    echo "Total" . $jsonObject[photos][total] . "<br/>";
    echo "Photo" . $jsonObject[photos][photo] . "<br/>";
    echo "Title" . $jsonObject[photos][photo][0][title] . "<br/>";

    echo "<hr/>";
    
    for ($i=0;$i<100; $i++){
    	echo $jsonObject[photos][photo][$i][title] . "<br/>";
    }
    
    
    
desniStolpec("Stran B");
noga();
?>

