<?php
require_once '../connect.php';

//http://localhost:8000/setAula.php?id=Aula3&capacidad=25&proyector=si&edificio=Edificio1
if (isset($_GET["id"])) {
    if (isset($_GET["capacidad"])) {
        if (isset($_GET["proyector"])) {
            if (isset($_GET["edificio"])) {

                $id = $_GET['id'];
                $cap = $_GET['capacidad'];
                $proy = $_GET['proyector'];
                $ed = $_GET['edificio'];

                // Consulta SQL
                $sql = "call sp_setAula('$id',$cap,'$proy','$ed');";

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
                        'error' => "Connection Error SetAula",
                        'message' => $e->getMessage()
                    ];
                    echo json_encode($error);
                } finally {
                    $conn = null;
                }
            } else {
                $error = [
                    'error' => "Edificio faltante",
                    'message' => $e->getMessage()
                ];
                echo json_encode($error);
            }
        } else {
            $error = [
                'error' => "Campo proyector faltante",
                'message' => $e->getMessage()
            ];
            echo json_encode($error);
        }
    } else {
        $error = [
            'error' => "Capacidad faltante",
            'message' => $e->getMessage()
        ];
        echo json_encode($error);
    }
} else {
    $error = [
        'error' => "id Faltante",
        'message' => $e->getMessage()
    ];
    echo json_encode($error);
}
