<?php
require_once '../connect.php';

if (isset($_POST["user"]) && isset($_POST["password"])) {
    try {
        $user = $_POST["user"];
        $password = $_POST["password"];

        $conn = get_Connect();

        $sql = "call sp_insertAction('$status');";
        $data= $conn-> query($sql);

        while($row = $data->fetch()){
            echo $row[1];
        }

    } catch (\Throwable $error) {
        echo "Error en POST ".$error;
    } finally{
        $conn = null;
    }
} else {
    // Si no se recibió el campo "nombre"
    echo "No se recibió el nombre";
}
?>