<?php
require_once '../connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// http://localhost:8000/loggin.php?user=usuario2&password=123456

if (isset($_POST["user"])) {
    if (isset($_POST["password"])) {

        $usu = $_POST['user'];
        $pass = $_POST['password'];

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
        $error = [
            'error' => "400",
            'message' => "Contraseña Faltante"
        ];
        echo json_encode($error);
    }
} else{
    $error = [
        'error' => "400",
        'message' => "Usuario Faltante"
    ];
    echo json_encode($error);
}
