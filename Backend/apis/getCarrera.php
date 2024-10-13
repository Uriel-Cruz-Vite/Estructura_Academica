<?php
require_once '../connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Consulta SQL
if(isset($_GET["name"])){
    $aux = $_GET["name"];
    $sql = "call sp_getcarreraInd('$aux');";
    
} else {
    $sql = "call sp_getCarrera();";
}


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
        'error' => "Connection Error GetEdificio",
        'message' => $e->getMessage()
    ];
    echo json_encode($error);
} finally {
    $conn = null;
}
