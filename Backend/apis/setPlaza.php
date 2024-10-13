<?php
require_once '../connect.php';

//http://localhost:8000/setPlaza.php?id=PLZ08&descripcion=Este es un comentario

if (isset($_GET["id"])) {
    if (isset($_GET["descripcion"])) {

        $id = $_GET['id'];
        $des = $_GET['descripcion'];

        // Consulta SQL
        $sql = "call sp_setPlaza('$id','$des');";

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
                'error' => "Connection Error Set: Plaza",
                'message' => $e->getMessage()
            ];
            echo json_encode($error);
        } finally {
            $conn = null;
        }
    } else {
        $error = [
            'error' => "400",
            'message' => "Campo descripcion faltante"
        ];
        echo json_encode($error);
    }
} else {
    $error = [
        'error' => "400",
        'message' => "Campo id Faltante"
    ];
    echo json_encode($error);
}
