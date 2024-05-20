<?php
require_once '../connect.php';

// Consulta SQL
$sql = "call sp_getAula();";

try {
    $conn = get_Connect();

    $stmt = $conn->prepare($sql); // Preparar la consulta
    $stmt->execute(); // Ejecutar la consulta

    // Obtener resultados
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $json = json_encode($data);
    echo $json;
    
} catch (PDOException $e) {
    $error = [
        'error' => "Connection Error GetAula",
        'message' => $e->getMessage()
    ];
    echo json_encode($error);
} finally {
    $conn = null;
}
