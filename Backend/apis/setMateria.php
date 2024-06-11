<?php
require_once '../connect.php';

/*
IN id varchar(8),
    IN nom VARCHAR(65),
    IN nc VARCHAR(10),
    IN ht int,
    IN hp int,
    IN cred int,
    IN tipo enum('BASICAS','CARRERA','ESPECIALIDAD'),
    IN stat enum('VIGENTE','LIQUIDACIÓN','BAJA')
*/

//http://localhost:8000/setMateria.php?id=Aula3&nombre=materiacompleta&nc=mat&ht=1&hp=5&creditos=3&tipo=BASICAS&estatus=VIGENTE

if (isset($_GET["id"])) {
    if (isset($_GET["nombre"])) {
        if (isset($_GET["nc"])) {
            if (isset($_GET["ht"])) {
                if(isset($_GET["hp"])){
                   if(isset($_GET["creditos"])){
                        if(isset($_GET["tipo"])){
                            if(isset($_GET["estatus"])){
                                $id = $_GET['id'];
                                $nom = $_GET['nombre'];
                                $nc = $_GET['nc'];
                                $ht = $_GET['ht'];
                                $hp = $_GET['hp'];
                                $cred = $_GET['creditos'];
                                $tipo = $_GET['tipo'];
                                $status = $_GET['estatus'];

                                // Consulta SQL
                                $sql = "call sp_setMateria('$id','$nom','$nc',$ht,$hp,$cred,'$tipo','$status');";

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
                                        'error' => "Connection Error Set: Materia",
                                        'message' => $e->getMessage()
                                    ];
                                    echo json_encode($error);
                                } finally {
                                    $conn = null;
                                }
                            } else{
                                $error = [
                                    'error' => "400",
                                    'message' => "Campo estatus faltante"
                                ];
                                echo json_encode($error);
                            }
                        } else{
                            $error = [
                                'error' => "400",
                                'message' => "Campo tipo faltante"
                            ];
                            echo json_encode($error);
                        }
                   } else{
                    $error = [
                        'error' => "400",
                        'message' => "Campo creditos faltante"
                    ];
                    echo json_encode($error);
                   }
                } else{
                    $error = [
                        'error' => "400",
                        'message' => "Campo hp faltante"
                    ];
                    echo json_encode($error);
                }
                
            } else {
                $error = [
                    'error' => "400",
                    'message' => "Edificio faltante"
                ];
                echo json_encode($error);
            }
        } else {
            $error = [
                'error' => "400",
                'message' => "Campo proyector faltante"
            ];
            echo json_encode($error);
        }
    } else {
        $error = [
            'error' => "400",
            'message' => "Campo capacidad faltante"
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
