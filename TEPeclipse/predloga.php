<?php
function head(){
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="predloga.css" type="text/css"></link>
        <title>(VI)TEP vaje</title>
    </head>
    <body>
<?php
}
    
function meni(){
?>
        <div id="container">
            <div id="header">
                <h1>
                    VI-TEP vaje
                </h1>
            </div>
            <div id="navigation">
                <ul>
                    <li><a href="index.php">Domov</a></li>
                    <li><a href="CAPTCHAexample.php">CAPTCHA</a></li>
                    <li><a href="Login.php">Moč gesla</a></li>
                    <li><a href="Registracija.php">Registracija</a></li>
                    <li><a href="Logout.php">Odjava</a></li>
                </ul>                
            </div>      
<?php } 

function leviStolpec(){
?>

            <div id="content-container">
                <div id="section-navigation">
                    <ul>
                        <li><a href="LoginFiksen.php">Fiksno logiranje</a></li>
                        <li><a href="LoginDB.php">Login preko PB</a></li>
                        <li><a href="LoginDBsha.php">Login preko PB (sha)</a></li>
                        <li><a href="Cookies.php">Piškotki</a></li>
                        <li><a href="FlickrSearchPhotos.php">Iskanje fotografij (FLICKR)</a></li>
                        </ul>
                </div>
                <div id="content">
<?php
}

function vsebinaA(){
    echo 'Izpisana je vsebina A';
}

function vsebinaB(){
    echo 'Izpisana je vsebina BBBBBBBBBB';
}

function vsebinaC(){
    echo 'Izpisana je vsebina c c c c c c c';
}

function desniStolpec($info){
?>
                    </div>
                <div id="aside">
                    <span style="text-align: right; background: #b7ddf2;">
                        Prijavljen: <?php if (isset($_SESSION['valid_user'])) echo $_SESSION['valid_user'] ?>
                    </span>
                    <h3>
                        Informacija o vaji
                    </h3>
                    <p>
                        <?php echo $info; ?>
                    </p>
                </div>
<?php
}

function desniStolpecInfo(){
?>
                    </div>
                <div id="aside">
                    <h3>
                        Drugačen stolpec
                    </h3>
                    <p>
                        Izpis stolpca z drugimi informacijami.
                    </p>
                </div>
<?php
}

function noga(){
?>
                <div id="footer">
                    Copyright © Site name, 20XX
                </div>
            </div>
        </div>    
    </body>
</html>
                
<?php } ?>
