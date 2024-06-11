<?php
require_once '../connect.php';
// http://localhost:8000/setProfesor.php?id=123&nombre=John&paterno=Doe&materno=Smith&rfc=JDOS123456789&estatus=activo&genero=m&estudios=maestria&titulo=ingeniero&email=johndoe@example.com&telefono=5551234567
if (isset($_GET["id"])) {
    if (isset($_GET["nombre"]) && isset($_GET["paterno"]) && isset($_GET["materno"])) {
        if (isset($_GET["rfc"])) {
            if (isset($_GET["estatus"])) {
                if (isset($_GET["genero"])) {
                    if (isset($_GET["estudios"])) {
                        if (isset($_GET["titulo"])) {
                            if (isset($_GET["email"])) {
                                if (isset($_GET["telefono"])) {

                                    $id = $_GET['id'];
                                    $nom = $_GET['nombre'];
                                    $pat = $_GET['paterno'];
                                    $mat = $_GET['materno'];
                                    $rfc = $_GET['rfc'];
                                    $stat = $_GET['estatus'];
                                    $gen = $_GET['genero'];
                                    $stu = $_GET['estudios'];
                                    $tit = $_GET['titulo'];
                                    $ema = $_GET['email'];
                                    $tel = $_GET['telefono'];

                                    // Consulta SQL
                                    $sql = "call sp_setProfesor('$id','$nom','$pat','$mat','$rfc','$stat','$gen','$stu','$tit','$ema','$tel');";

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
                                            'error' => "Connection Error Set: Profesor",
                                            'message' => $e->getMessage()
                                        ];
                                        echo json_encode($error);
                                    } finally {
                                        $conn = null;
                                    }
                                } else{
                                    $error = [
                                        'error' => "400",
                                        'message' => "Campo telefono faltante"
                                    ];
                                    echo json_encode($error);
                                }
                            } else{
                                $error = [
                                    'error' => "400",
                                    'message' => "Campo email faltante"
                                ];
                                echo json_encode($error);
                            }
                        } else{
                            $error = [
                                'error' => "400",
                                'message' => "Campo titulo faltante"
                            ];
                            echo json_encode($error);
                        }
                    } else{
                        $error = [
                            'error' => "400",
                            'message' => "Campo estudios faltante"
                        ];
                        echo json_encode($error);
                    }
                } else{
                    $error = [
                        'error' => "400",
                        'message' => "Campo genero faltante"
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
                'message' => "Campo rfc faltante"
            ];
            echo json_encode($error);
        }
    } else {
        $error = [
            'error' => "400",
            'message' => "Campos pertenecientes al nombre faltantes"
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
