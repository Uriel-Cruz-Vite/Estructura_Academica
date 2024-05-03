<?php
require_once '../connect.php';

try {
    $conn = get_Connect();
    // Consulta SQL
    $sql = "call sp_getStatusCar();";
    $data = $conn->query($sql);

    // Procesar los resultados
    while ($row = $data->fetch()) {
        echo $row['estatus'];
    }
} catch (PDOException $e) {
    echo "Connection Error: " . $e->getMessage();
} finally {
    $conn = null;
}
