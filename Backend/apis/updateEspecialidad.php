<?php
require_once '../connect.php';

$id = $_GET["id"];
$sql = "call sp_updEspecialidad('$id',";


$id = isset($_GET["nombre"]) ? $sql .= "'". $_GET["nombre"] . "'," : $sql .= "null,";
$niv = isset($_GET["nc"]) ? $sql .= "'". $_GET["nc"] . "'," : $sql .= "null,";
$niv = isset($_GET["estado"]) ? $sql .= "'". $_GET["estado"] . "'," : $sql .= "null,";
$san = isset($_GET["carrera"]) ? $sql .= $_GET["carrera"] : $sql .= "null";

$sql .= ");";

echo $sql;




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
        'error' => "Connection Error Update Especialidad",
        'message' => $e->getMessage()
    ];
    echo json_encode($error);
} finally {
    $conn = null;
}


?>