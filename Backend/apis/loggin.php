<?php
require_once '../connect.php';

if (isset($_GET["user"])) {
    if (isset($_GET["password"])) {

        $usu = $_GET['user'];
        $pass = $_GET['password'];

        // Consulta SQL
        $sql = "call sp_loggin('$usu', '$pass')";

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
                'error' => "Connection Error Loggin",
                'message' => $e->getMessage()
            ];
            echo json_encode($error);
        } finally {
            $conn = null;
        }
    } else{
        echo "Contraseña Faltante";
    }
} else{
    echo "Usuario Faltante";
}
