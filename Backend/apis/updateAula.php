<?php
require_once '../connect.php';

$idAnt = $_GET["idAnterior"];
$sql = "call sp_updAula('$idAnt',";


$id = isset($_GET["id"]) ? $sql .= "'". $_GET["id"] . "'," : $sql .= "null,";
$niv = isset($_GET["capacidad"]) ? $sql .= $_GET["capacidad"] . "," : $sql .= "null,";
$niv = isset($_GET["proyector"]) ? $sql .= "'". $_GET["proyector"] . "'," : $sql .= "null,";
$san = isset($_GET["edificio"]) ? $sql .= "'". $_GET["edificio"] . "'": $sql .= "null";

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
        'error' => "Connection Error Update Aula",
        'message' => $e->getMessage()
    ];
    echo json_encode($error);
} finally {
    $conn = null;
}


?>