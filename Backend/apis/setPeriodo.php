<?php
require_once '../connect.php';

//http://localhost:8000/setPeriodo.php?id=5&ciclo=2024-2025&estado=PROXIMO

if (isset($_GET["id"])) {
    if (isset($_GET["ciclo"])) {
        if (isset($_GET["estado"])) {

            $id = $_GET['id'];
            $cic = $_GET['ciclo'];
            $stat = $_GET['estado'];


            // Consulta SQL
            $sql = "call sp_setPeriodo($id,'$cic','$stat');";

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
                    'error' => "Connection Error Set: Periodo",
                    'message' => $e->getMessage()
                ];
                echo json_encode($error);
            } finally {
                $conn = null;
            }
        } else {
            $error = [
                'error' => "400",
                'message' => "Campo estado faltante"
            ];
            echo json_encode($error);
        }
    } else {
        $error = [
            'error' => "400",
            'message' => "Campo ciclo faltante"
        ];
        echo json_encode($error);
    }
} else {
    $error = [
        'error' => "400",
        'message' => "id Faltante"
    ];
    echo json_encode($error);
}
