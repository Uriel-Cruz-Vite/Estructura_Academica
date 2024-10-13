<?php
require_once '../connect.php';

//http://localhost:8000/setReticula.php?id=10&planta=1&estado=ACTIVA&carrera=1

if (isset($_GET["id"])) {
    if (isset($_GET["planta"])) {
        if (isset($_GET["estado"])) {

            if (isset($_GET["carrera"])) {
                $id = $_GET['id'];
                $cic = $_GET['planta'];
                $stat = $_GET['estado'];
                $carr = $_GET["carrera"];

                // Consulta SQL
                $sql = "call sp_setReticula($id,'$cic','$stat',$carr);";

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
                        'error' => "Connection Error Set: Reticula",
                        'message' => $e->getMessage()
                    ];
                    echo json_encode($error);
                } finally {
                    $conn = null;
                }
            } else {
                $error = [
                    'error' => "400",
                    'message' => "Campo carrera faltante"
                ];
                echo json_encode($error);
            }
        } else {
            $error = [
                'error' => "400",
                'message' => "Campo estatus faltante"
            ];
            echo json_encode($error);
        }
    } else {
        $error = [
            'error' => "400",
            'message' => "Campo planta faltante"
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
