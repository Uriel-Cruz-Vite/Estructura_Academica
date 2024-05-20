<?php
require_once '../connect.php';


if (isset($_GET["id"])) {
    if (isset($_GET["nivel"])) {
        if (isset($_GET["sanitario"])) {

            $id = $_GET['id'];
            $niv = $_GET['nivel'];
            $san = $_GET['sanitario'];

            // Consulta SQL
            $sql = "call sp_setEdificio('$id','$niv',$san);";

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
                    'error' => "Connection Error SetEdificio",
                    'message' => $e->getMessage()
                ];
                echo json_encode($error);
            } finally {
                $conn = null;
            }
        } else {
            echo "No. Sanitarios faltante";
        }
    } else {
        echo "Niveles faltantes";
    }
} else {
    echo "id Faltante";
}