<?php foreach($resultat_mencions as $fila){ ?>
    <option value="<?php echo $fila["id"]; ?>">
        <?php echo $fila["nom"]; ?>
    </option>
<?php } ?>