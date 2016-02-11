<?php

function display_obrazec_login($actionScript) {
//  Izpis obrazca za logiranje uporabnika
    ?>
    <h4>Registracija uporabnika</h4>

    <form id="LoginForm" name="LoginForm" method="post" action="<?php $actionScript ?> ">
        <table>
            <tr>
                <td>Uporabniško ime</td><td><input type="text" name="ime" id="username" /></td>
            </tr>
            <tr>                    
                <td>Geslo</td><td><input type="password" name="geslo" id="geslo" /></td>
            </tr>
            <tr>                    
                <td></td><td><button type="submit">Vpis</button></td>
            </tr>
        </table>
    </form>

    <?php
}

function display_obrazec() {
//  Izpis obrazca za registracijo uporabnika
    ?>
    <h4>Registracija uporabnika</h4>

    <form id="LoginForm" name="LoginForm" method="post" action="obdelajobrazec.php">
        <table>
            <tr>
                <td>Uporabniško ime</td><td><input type="text" name="ime" id="username" /></td>
            </tr>
            <tr>                    
                <td>e-mail</td><td><input type="text" name="email" id="email" /></td>
            </tr>
            <tr>                    
                <td>Geslo (6-16 znakov)</td><td><input type="password" name="geslo" id="geslo" /></td>
            </tr>
            <tr>                    
                <td>Ponovi geslo</td><td><input type="password" name="geslo2" id="geslo2" /></td>
            </tr>
            <tr>                    
                <td><a href="#" onclick="document.getElementById('captcha').src = 'securimage/securimage_show.php?' + 
                        Math.random(); return false">Druga slika</a>
                </td>
                <td><img style='border:solid 1px'id="captcha" src="securimage/securimage_show.php" alt="CAPTCHA Image" /></td>
            </tr>
            <tr>                    
                <td>Vpiši varnostno kodo s slike</td>
                <td><input type="text" name="captcha_code" size="10" maxlength="6" /></td>
            </tr>
            <tr>                    
                <td></td><td><button type="submit">Vpis</button></td>
            </tr>
        </table>
    </form>

    <?php
}
?>