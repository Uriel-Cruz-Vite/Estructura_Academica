<?php
require_once '../connect.php';

// setEspecialidad.php?id=3&nombre=Matematicas&nc=mate&estado=ACTIVA&carrera=1
if (isset($_GET["id"])) {
    if (isset($_GET["nombre"])) {
        if (isset($_GET["nc"])) {
            if (isset($_GET["estado"])) {
                if (isset($_GET["carrera"])) {

                    $id = $_GET['id'];
                    $nom = $_GET['nombre'];
                    $nc = $_GET['nc'];
                    $est = $_GET['estado'];
                    $idCar = $_GET['carrera'];

                    // Consulta SQL
                    $sql = "call sp_setEspecialidad($id,'$nom','$nc','$est',$idCar);";

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
                            'error' => "Connection Error SetEspecialidad",
                            'message' => $e->getMessage()
                        ];
                        echo json_encode($error);
                    } finally {
                        $conn = null;
                    }
                } else {
                    $error = [
                        'error' => "400",
                        'message' => "No se ha enviado el id de la carrera"
                    ];
                    echo json_encode($error);
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
                'error' => "",
                'message' => "Campo nc faltante"
            ];
            echo json_encode($error);
        }
    } else {
        $error = [
            'error' => "400",
            'message' => "Campo nombre faltante"
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
