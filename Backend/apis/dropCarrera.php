<?php
require_once '../connect.php';
// Establecer las respectivas restricciones, dado que las especialidades dependen de esta

if (isset($_GET["id"])) {

    $id = $_GET['id']; // Ha eliminar


    // Consulta SQL
    $sql = "call sp_dropCarrera('$id');";

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
            'error' => "Connection Error dropCarrera",
            'message' => $e->getMessage()
        ];
        echo json_encode($error);
    } finally {
        $conn = null;
    }
} else {
    echo "id Faltante";
}
