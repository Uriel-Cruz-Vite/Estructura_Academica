<?php
require_once '../connect.php';

$idAnt = $_GET["idAnterior"];
$sql = "call sp_updEdificio('$idAnt',";


$id = isset($_GET["id"]) ? $sql .= "'". $_GET["id"] . "'," : $sql .= "null,";
$niv = isset($_GET["niveles"]) ? $sql .= "'". $_GET["niveles"] . "'," : $sql .= "null,";
$san = isset($_GET["sanitarios"]) ? $sql .= $_GET["sanitarios"] : $sql .= "null";

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
        'error' => "Connection Error Update Edificio",
        'message' => $e->getMessage()
    ];
    echo json_encode($error);
} finally {
    $conn = null;
}


?>