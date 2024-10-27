<?php foreach($resultat_graus as $fila){ ?>
    <option value="<?php echo $fila["id"]; ?>">
        <?php echo $fila["nom"]; ?>
    </option>
<?php } ?>