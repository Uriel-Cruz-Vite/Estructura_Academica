<?php
require_once('./datosConnect.php');

function get_Connect(){
  global $pass;
  $servername = "localhost:3306";
  $username = "root";
  $password = $pass;
  $dbName = "est_academica";

  try {
    $conn = new PDO(
      "mysql:host=$servername;$dbName",
      $username,
      $password
    );
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->query("use $dbName");
    return $conn;
  } catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    return null;
  }
}
?>