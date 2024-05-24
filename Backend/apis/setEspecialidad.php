<?php
require_once '../connect.php';

// setEspecialidad.php?id=3&nombre=Matematicas&nc=mate&estatus=ACTIVA&carrera=1
if (isset($_GET["id"])) {
    if (isset($_GET["nombre"])) {
        if (isset($_GET["nc"])) {
            if (isset($_GET["estatus"])) {
                if (isset($_GET["carrera"])) {

                    $id = $_GET['id'];
                    $nom = $_GET['nombre'];
                    $nc = $_GET['nc'];
                    $est = $_GET['estatus'];
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
                        'error' => "No se ha enviado el id de la carrera",
                        'message' => $e->getMessage()
                    ];
                    echo json_encode($error);
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
