<?php
require_once '../connect.php';
// setCarrera.php?id=3&nombre=Matematicas&nc=mate&estatus=ACTIVA
if (isset($_GET["id"])) {
    if (isset($_GET["nombre"])) {
        if (isset($_GET["nc"])) {
            if (isset($_GET["estatus"])) {

                $id = $_GET['id'];
                $nom = $_GET['nombre'];
                $nc = $_GET['nc'];
                $est = $_GET['estatus'];

                // Consulta SQL
                $sql = "call sp_setCarrera($id,'$nom','$nc','$est');";

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
                        'error' => "Connection Error SetCarrera",
                        'message' => $e->getMessage()
                    ];
                    echo json_encode($error);
                } finally {
                    $conn = null;
                }
            } else {
                echo "Edificio faltante";
            }
        } else {
            echo "Campo proyector faltante";
        }
    } else {
        echo "Capacidad faltante";
    }
} else {
    echo "id Faltante";
}
