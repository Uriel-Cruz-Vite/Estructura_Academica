-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: est_academica
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `idAula` varchar(7) NOT NULL,
  `Capacidad` tinyint unsigned NOT NULL,
  `Proyector` enum('SI','NO') NOT NULL,
  `Edificio_idEdificio` varchar(20) NOT NULL,
  PRIMARY KEY (`idAula`),
  KEY `fk_Aula_Edificio1_idx` (`Edificio_idEdificio`),
  CONSTRAINT `fk_Aula_Edificio1` FOREIGN KEY (`Edificio_idEdificio`) REFERENCES `edificio` (`idEdificio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES ('Aula101',30,'SI','Edificio5'),('Aula3',15,'NO','Edificio5');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `idCarrera` tinyint unsigned NOT NULL,
  `Nombre_carrera` varchar(65) NOT NULL,
  `Nombre_corto_carrera` varchar(10) NOT NULL,
  `Status_carrera` enum('ACTIVA','LIQUIDACIÓN','BAJA') NOT NULL,
  `Fecha_Alta` date NOT NULL,
  `Fecha_Baja` date DEFAULT NULL,
  `Fecha_Liquidacion` date DEFAULT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Ingeniería en Sistemas Computacionales','ISC','ACTIVA','2022-01-01',NULL,NULL),(3,'Super materia','mate','LIQUIDACIÓN','2024-05-24','2024-05-24','2024-05-24');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edificio` (
  `idEdificio` varchar(20) NOT NULL,
  `Niveles` enum('1','2') NOT NULL,
  `Sanitarios` tinyint unsigned NOT NULL,
  PRIMARY KEY (`idEdificio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES ('Edificio1','2',8),('Edificio2','1',8),('Edificio5','1',5),('Edificio6','1',5);
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `idEspecialidad` tinyint unsigned NOT NULL,
  `Nombre_especialidad` varchar(50) NOT NULL,
  `Nombre_Corto_especialidad` varchar(15) NOT NULL,
  `Status_Especialidad` enum('ACTIVA','LIQUIDACION','BAJA') NOT NULL,
  `Carrera_idCarrera` tinyint unsigned NOT NULL,
  PRIMARY KEY (`idEspecialidad`),
  KEY `fk_Especialidad_Carrera1_idx` (`Carrera_idCarrera`),
  CONSTRAINT `fk_Especialidad_Carrera1` FOREIGN KEY (`Carrera_idCarrera`) REFERENCES `carrera` (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (3,'Otro','ot','ACTIVA',1);
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `idGrupo` int unsigned NOT NULL,
  `Grupo` char(1) NOT NULL,
  `Limite` tinyint unsigned NOT NULL,
  `Inscritos` tinyint unsigned NOT NULL,
  `Lunes_inicio` int DEFAULT NULL,
  `Lunes_Fin` int DEFAULT NULL,
  `aula_idAula_Lunes` varchar(7) NOT NULL,
  `Martes_inicio` int DEFAULT NULL,
  `Martes_Fin` int DEFAULT NULL,
  `aula_idAula_Martes` varchar(7) NOT NULL,
  `Miercoles_inicio` int DEFAULT NULL,
  `Miercoles_Fin` int DEFAULT NULL,
  `aula_idAulaMiercoles` varchar(7) NOT NULL,
  `Jueves_inicio` int DEFAULT NULL,
  `Jueves_fin` int DEFAULT NULL,
  `aula_idAula_Jueves` varchar(7) NOT NULL,
  `Viernes_inicio` int DEFAULT NULL,
  `Viernes_fin` int DEFAULT NULL,
  `Aula_idAula_Viernes` varchar(7) NOT NULL,
  `Status_Grupo` enum('ABIERTO','CERRADO','CANCELADO') NOT NULL,
  `Profesor_idProfesor` smallint unsigned NOT NULL,
  `Materia_Clave_Materia` varchar(8) NOT NULL,
  `Periodo_idPeriodo` int unsigned NOT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `fk_Grupo_Profesor1_idx` (`Profesor_idProfesor`),
  KEY `fk_Grupo_Materia1_idx` (`Materia_Clave_Materia`),
  KEY `fk_grupo_aula1_idx` (`Aula_idAula_Viernes`),
  KEY `fk_Grupo_Periodo1_idx` (`Periodo_idPeriodo`),
  KEY `fk_grupo_aula2_idx` (`aula_idAula_Lunes`),
  KEY `fk_grupo_aula3_idx` (`aula_idAula_Martes`),
  KEY `fk_grupo_aula4_idx` (`aula_idAulaMiercoles`),
  KEY `fk_grupo_aula5_idx` (`aula_idAula_Jueves`),
  CONSTRAINT `fk_Grupo_Aula1` FOREIGN KEY (`Aula_idAula_Viernes`) REFERENCES `aula` (`idAula`),
  CONSTRAINT `fk_grupo_aula2` FOREIGN KEY (`aula_idAula_Lunes`) REFERENCES `aula` (`idAula`),
  CONSTRAINT `fk_grupo_aula3` FOREIGN KEY (`aula_idAula_Martes`) REFERENCES `aula` (`idAula`),
  CONSTRAINT `fk_grupo_aula4` FOREIGN KEY (`aula_idAulaMiercoles`) REFERENCES `aula` (`idAula`),
  CONSTRAINT `fk_grupo_aula5` FOREIGN KEY (`aula_idAula_Jueves`) REFERENCES `aula` (`idAula`),
  CONSTRAINT `fk_Grupo_Materia1` FOREIGN KEY (`Materia_Clave_Materia`) REFERENCES `materia` (`Clave_Materia`),
  CONSTRAINT `fk_Grupo_Periodo1` FOREIGN KEY (`Periodo_idPeriodo`) REFERENCES `periodo` (`idPeriodo`),
  CONSTRAINT `fk_Grupo_Profesor1` FOREIGN KEY (`Profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'A',30,0,NULL,NULL,'Aula101',NULL,NULL,'Aula101',NULL,NULL,'Aula101',NULL,NULL,'Aula101',NULL,NULL,'Aula101','ABIERTO',1,'MAT1234',1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `Clave_Materia` varchar(8) NOT NULL,
  `Nombre_Materia` varchar(65) NOT NULL,
  `Nombre_corto_materia` varchar(15) NOT NULL,
  `HT` tinyint unsigned NOT NULL,
  `HP` tinyint unsigned NOT NULL,
  `Creditos` tinyint DEFAULT NULL,
  `Tipo` enum('BASICAS','CARRERA','ESPECIALIDAD') NOT NULL,
  `ESTATUS` enum('VIGENTE','BAJA','LIQUIDACION') NOT NULL,
  PRIMARY KEY (`Clave_Materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES ('MAT1234','Matemáticas Avanzadas','Mat. Avanz.',48,32,8,'BASICAS','VIGENTE');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `idPeriodo` int unsigned NOT NULL,
  `Ciclo` varchar(15) NOT NULL,
  `Estatus_Periodo` enum('ACTIVO','INACTIVO','PROXIMO') NOT NULL,
  PRIMARY KEY (`idPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'2023-2024','ACTIVO'),(2,'2024-2025','ACTIVO');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plaza`
--

DROP TABLE IF EXISTS `plaza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plaza` (
  `idPlaza` varchar(5) NOT NULL,
  `Descripcion` varchar(40) NOT NULL,
  PRIMARY KEY (`idPlaza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plaza`
--

LOCK TABLES `plaza` WRITE;
/*!40000 ALTER TABLE `plaza` DISABLE KEYS */;
INSERT INTO `plaza` VALUES ('PLZ01','Profesor de tiempo completo'),('PLZ02','Profesor de medio tiempo');
/*!40000 ALTER TABLE `plaza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `idProfesor` smallint unsigned NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Paterno` varchar(15) NOT NULL,
  `Materno` varchar(15) DEFAULT NULL,
  `RFC` varchar(13) NOT NULL,
  `Status` enum('ACTIVO','BAJA','LICENCIA','JUBILADO') NOT NULL,
  `Genero` enum('M','F') NOT NULL,
  `Estudios` enum('LICENCIATURA','MAESTRÍA','DOCTORADO') NOT NULL,
  `Titulo` tinytext NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`idProfesor`),
  UNIQUE KEY `RFC_UNIQUE` (`RFC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Juan','Pérez','Gómez','PERG890123JKL','ACTIVO','M','LICENCIATURA','Licenciado en Educación','juan@example.com','1234567890'),(2,'María','López','García','LOGM890123JKL','ACTIVO','F','MAESTRÍA','Maestra en Ingeniería','maria@example.com','9876543210');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor_has_plaza`
--

DROP TABLE IF EXISTS `profesor_has_plaza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor_has_plaza` (
  `Id` smallint NOT NULL AUTO_INCREMENT,
  `Profesor_idProfesor` smallint unsigned NOT NULL,
  `Plaza_idPlaza` varchar(5) NOT NULL,
  `Horas_Plaza` tinyint unsigned NOT NULL,
  `Status_Plaza` enum('10','20','95') NOT NULL,
  PRIMARY KEY (`Id`,`Profesor_idProfesor`,`Plaza_idPlaza`),
  KEY `fk_Profesor_has_Plaza_Plaza1_idx` (`Plaza_idPlaza`),
  KEY `fk_Profesor_has_Plaza_Profesor_idx` (`Profesor_idProfesor`),
  CONSTRAINT `fk_Profesor_has_Plaza_Plaza1` FOREIGN KEY (`Plaza_idPlaza`) REFERENCES `plaza` (`idPlaza`),
  CONSTRAINT `fk_Profesor_has_Plaza_Profesor` FOREIGN KEY (`Profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor_has_plaza`
--

LOCK TABLES `profesor_has_plaza` WRITE;
/*!40000 ALTER TABLE `profesor_has_plaza` DISABLE KEYS */;
INSERT INTO `profesor_has_plaza` VALUES (1,1,'PLZ01',40,'10'),(2,2,'PLZ02',20,'10');
/*!40000 ALTER TABLE `profesor_has_plaza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reticula`
--

DROP TABLE IF EXISTS `reticula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reticula` (
  `idReticula` int NOT NULL,
  `Plan` varchar(25) NOT NULL,
  `Estatus_Reticula` enum('ACTIVA','LIQUIDACION','BAJA') NOT NULL,
  `Fecha_autorizacion` date NOT NULL,
  `Carrera_idCarrera` tinyint unsigned NOT NULL,
  PRIMARY KEY (`idReticula`),
  KEY `fk_Reticula_Carrera1_idx` (`Carrera_idCarrera`),
  CONSTRAINT `fk_Reticula_Carrera1` FOREIGN KEY (`Carrera_idCarrera`) REFERENCES `carrera` (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reticula`
--

LOCK TABLES `reticula` WRITE;
/*!40000 ALTER TABLE `reticula` DISABLE KEYS */;
INSERT INTO `reticula` VALUES (1,'Plan 2023','ACTIVA','2023-01-01',1),(2,'Plan 2024','ACTIVA','2024-01-01',1);
/*!40000 ALTER TABLE `reticula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reticula_has_materia`
--

DROP TABLE IF EXISTS `reticula_has_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reticula_has_materia` (
  `Reticula_idReticula` int NOT NULL,
  `Materia_Clave_Materia` varchar(8) NOT NULL,
  `Clave_interna_Materia` varchar(4) NOT NULL,
  PRIMARY KEY (`Reticula_idReticula`,`Materia_Clave_Materia`),
  KEY `fk_Reticula_has_Materia_Materia1_idx` (`Materia_Clave_Materia`),
  KEY `fk_Reticula_has_Materia_Reticula1_idx` (`Reticula_idReticula`),
  CONSTRAINT `fk_Reticula_has_Materia_Materia1` FOREIGN KEY (`Materia_Clave_Materia`) REFERENCES `materia` (`Clave_Materia`),
  CONSTRAINT `fk_Reticula_has_Materia_Reticula1` FOREIGN KEY (`Reticula_idReticula`) REFERENCES `reticula` (`idReticula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reticula_has_materia`
--

LOCK TABLES `reticula_has_materia` WRITE;
/*!40000 ALTER TABLE `reticula_has_materia` DISABLE KEYS */;
INSERT INTO `reticula_has_materia` VALUES (1,'MAT1234','MAT1');
/*!40000 ALTER TABLE `reticula_has_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` varchar(8) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Estatus` enum('ACTIVO','INACTIVO') NOT NULL,
  `Image_Direct` varchar(60) DEFAULT NULL,
  `profesor_idProfesor` smallint unsigned NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_profesor1_idx` (`profesor_idProfesor`),
  CONSTRAINT `fk_Usuario_profesor1` FOREIGN KEY (`profesor_idProfesor`) REFERENCES `profesor` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('usuario1','contraseña123','ACTIVO','ruta/imagen.jpg',1),('usuario2','123456','ACTIVO','ruta/imagen2.jpg',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'est_academica'
--
/*!50003 DROP FUNCTION IF EXISTS `edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `edad`(Y VARCHAR (13)) RETURNS int
    DETERMINISTIC
BEGIN
RETURN TIMESTAMPDIFF(YEAR,(CONCAT('19',SUBSTR(Y,5,2),'/',SUBSTR(Y,7,2),'/',SUBSTR(Y,9,2))),CURDATE());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Grupo_Abierto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Grupo_Abierto`(X int) RETURNS varchar(20) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	IF (SELECT Status_grupo FROM GRUPO WHERE idGrupo = X) = 1
		THEN RETURN 'ABIERTO';
		ELSE RETURN 'CERRADO';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `holaMundo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `holaMundo`() RETURNS varchar(20) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    RETURN 'Hola Mundo';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Horas_Profe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Horas_Profe`( F_idProfesor Smallint) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE Valor Varchar(2);
    
	SELECT SUBSTR(PLAZA_IDPLAZA,2,2) FROM profesor_has_plaza 
    WHERE PROFESOR_IDPROFESOR =F_idprofesor INTO Valor;
		CASE Valor 
        WHEN "38" THEN RETURN 22;
        WHEN "37" THEN RETURN ((SELECT SUM(Horas_Plaza) FROM Profesor_has_plaza
					WHERE PROFESOR_IDPROFESOR =F_idprofesor)-12);
						
        WHEN "36" THEN RETURN ((SELECT SUM(Horas_Plaza) FROM Profesor_has_plaza
					WHERE PROFESOR_IDPROFESOR =F_idprofesor)-6);
        ELSE RETURN (SELECT SUM(Horas_Plaza) FROM Profesor_has_plaza
					WHERE PROFESOR_IDPROFESOR =F_idprofesor);
		END CASE;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Maestro_Activo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Maestro_Activo`(F_IdProfesor SMALLINT) RETURNS int
    DETERMINISTIC
IF (SELECT status FROM profesor WHERE idProfesor=F_IdProfesor)="ACTIVO"
    THEN RETURN 1;
    ELSE RETURN 0;
    END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Maestro_Existe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Maestro_Existe`(F_IdProfesor SMALLINT) RETURNS int
    DETERMINISTIC
IF (SELECT COUNT(*) FROM profesor WHERE idProfesor=F_IdProfesor)
    THEN RETURN 1;
    ELSE RETURN 0;
    END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Materia_Activa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Materia_Activa`(F_Materia varchar(8)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(*) FROM materia WHERE clave_materia=F_materia);
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Profe_Activo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Profe_Activo`(F_id_Profesor smallint) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF (SELECT STATUS FROM profesor WHERE idProfesor=F_Id_Profesor)="ACTIVO"
    THEN RETURN 1;
    ELSE RETURN 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alta_Grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_Grupo`(P_Id_Profesor smallint,P_Materia VARCHAR (8))
BEGIN
	IF Profe_Activo(P_Id_Profesor)=1
    THEN IF Materia_Activa(P_Materia)
			THEN SELECT "Profesor y materia activa";
			ELSE SELECT "ERROR 1002 MATERIA NO EXISTENTE" AS ERROR;
        END IF;
		
    ELSE SELECT "ERROR 1001 PROFESOR INACTIVO" AS ERROR;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alta_Grupo2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_Grupo2`(P_Idprofesor smallint)
BEGIN
	IF (Maestro_Existe(P_IdProfesor))
    THEN IF (Maestro_Activo(P_IdProfesor)) 
			THEN SELECT ("EL MAESTRO EXISTE Y ESTA ACTIVO");
            ELSE SELECT ("ERROR 1002 EL MAESTRO EXISTE PERO NO ESTA ACTIVO") AS ERROR;
            END IF;
    ELSE SELECT ("ERROR 1001 EL MAESTRO NO EXISTE") AS ERROR;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Alta_Profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_Profesor`(IN id smallint, N Varchar (25),P Varchar(15),m varchar(15))
BEGIN
INSERT INTO profesor VALUES(id,TRIM(UPPER(N)),TRIM(UPPER(P)),TRIM(UPPER(M)),"jsjsjsjs",'ACTIVO','M','LICENCIATURA','DOCTOR EN MATEMATICAS','KJKJJL','898989');
SELECT 'REGISTRO INSERTADO CON EXITO';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inscripcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscripcion`(in g int, nc varchar(10))
    DETERMINISTIC
BEGIN
IF EXISTS (SELECT idGrupo FROM grupo WHERE idGrupo = g)
	THEN 
		IF (SELECT status_Grupo FROM grupo WHERE idGrupo = g)
			THEN 
				UPDATE grupo SET inscritos = inscritos + 1 WHERE idGrupo = g;
                IF (SELECT inscritos FROM grupo WHERE idGrupo = g) = (SELECT Limite FROM grupo WHERE idGrupo = g)
					THEN UPDATE grupo SET Status_Grupo = 0 WHERE idGrupo = g;
                END IF;
                INSERT INTO inscripcion VALUES (DEFAULT,nc,now(),g);
                SELECT 'ALUMNO REGISTRADO CON EXITO' MENSAJE;
            ELSE SELECT 'EL GRUPO EXISTE PERO NO HAY CUPO' ERROR;
		END IF;
	ELSE SELECT 'EL GRUPO NO EXISTE' ERROR;
END IF ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dropAula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dropAula`(
	in id varchar(20)
)
BEGIN
	if exists (select idAula from aula where idAula = id) then
		delete from aula where idAula = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dropCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dropCarrera`(
	in id int
)
BEGIN
	if exists (select idCarrera from carrera where idCarrera = id) then
		delete from carrera where idCarrera = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dropEdificio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dropEdificio`(
	in id varchar(20)
)
BEGIN
	if exists (select idEdificio from edificio where idEdificio = id) then
		delete from edificio where idEdificio = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dropEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dropEspecialidad`(
	in id int
)
BEGIN
	if exists (select idEspecialidad from especialidad where idEspecialidad = id) then
		delete from especialidad where idEspecialidad = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAula`()
BEGIN
	select * from aula order by idAula desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAulaInd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAulaInd`(in id varchar(7))
BEGIN
	if exists (select idAula from aula where idAula = id) then
		select * from aula where idAula = id;
	else
		select 'Elemento no encontrado' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCarrera`()
BEGIN
	select * from carrera order by idCarrera desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCarreraInd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getCarreraInd`(IN nombre VARCHAR(65))
BEGIN
    DECLARE countMatches INT;

    -- Contar el número de coincidencias usando LIKE
    SELECT COUNT(*) INTO countMatches
    FROM carrera
    WHERE Nombre_carrera LIKE CONCAT('%', nombre, '%');

    IF countMatches > 0 THEN
        -- Si hay coincidencias, realizar la consulta y devolver los resultados
        SELECT * FROM carrera
        WHERE Nombre_carrera LIKE CONCAT('%', nombre, '%');
    ELSE
        -- Si no hay coincidencias, devolver un mensaje de error
        SELECT 'Sin coincidencias' AS ERROR;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEdificio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getEdificio`()
BEGIN
	select * from edificio order by idEdificio desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEdificioInd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getEdificioInd`(in id varchar(20))
BEGIN
	if exists (select idEdificio from edificio where idEdificio = id) then
		select * from edificio where idEdificio = id;
	else
		select 'Elemento no encontrado' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getEspecialidad`()
BEGIN
	select * from especialidad order by idEspecialidad desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEspecialidadInd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getEspecialidadInd`(IN nombre VARCHAR(50))
BEGIN
    DECLARE countMatches INT;

    -- Contar el número de coincidencias usando LIKE
    SELECT COUNT(*) INTO countMatches
    FROM especialidad
    WHERE Nombre_especialidad LIKE CONCAT('%', nombre, '%');

    IF countMatches > 0 THEN
        -- Si hay coincidencias, realizar la consulta y devolver los resultados
        SELECT * FROM especialidad
        WHERE Nombre_especialidad LIKE CONCAT('%', nombre, '%');
    ELSE
        -- Si no hay coincidencias, devolver un mensaje de error
        SELECT 'Sin coincidencias' AS ERROR;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_loggin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loggin`(
    IN idUser VARCHAR(45), 
    IN pass VARCHAR(8)
)
BEGIN
    IF EXISTS (SELECT idUsuario FROM usuario WHERE idUsuario = idUser) THEN
        IF (SELECT Password FROM usuario WHERE idUsuario = idUser) = pass THEN
            IF (SELECT Estatus FROM usuario WHERE idUsuario = idUser) = 'ACTIVO' THEN
                SELECT 'true' as 'respuesta', Image_Direct FROM usuario WHERE idUsuario = idUser;
            ELSE
                SELECT 'EL USUARIO ESTÁ INACTIVO' AS ERROR;
            END IF;
		ELSE
			SELECT 'CONTRASEÑA INCORRECTA' AS ERROR;
		END IF;
	ELSE
		SELECT 'USUARIO INEXISTENTE' AS ERROR;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_setAula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setAula`(
	in idAula varchar(20),
    in capacidad int,
    in proyector varchar(2),
	in idEdificio varchar(20)
)
BEGIN
	if exists (select idEdificio from edificio where edificio.idEdificio = idEdificio) then
		if not exists (select idAula from aula where aula.idAula = idAula) then
			insert into aula values (idAula, capacidad, upper(proyector), idEdificio);
			select 'Insercion correcta' as respuesta;
		else
			select 'Aula ya existente' as ERROR;
        end if;
    else
		select 'Edificio inexistente' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_setCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setCarrera`(
	in id int,
	in nombre varchar(65),
    in nc varchar(10),
    in estatus enum('ACTIVA','LIQUIDACIÓN','BAJA')
)
BEGIN
	if not exists (select Nombre_carrera from carrera where Nombre_carrera = nombre) then
		if not exists (select Nombre_corto_carrera from carrera where Nombre_corto_carrera = nc) then
			if not exists (select idCarrera from carrera where idCarrera = id) then
				insert into carrera values (id, nombre, nc, estatus,now(),null,null);
				select 'Insercion correcta' as respuesta;
            else
				select 'Id repetido' as ERROR;
            end if;
		else
			select 'Nombre corto repetido' as ERROR;
        end if;
    else
		select 'Nombre de carrera ocupado' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_setEdificio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setEdificio`(
    IN id VARCHAR(20), 
    IN nivel char,
    IN sanitario int(3)
)
BEGIN
	if not exists (select idEdificio from edificio where idEdificio = id) then
		INSERT INTO edificio VALUES (id,nivel,sanitario);
	else
		select 'Edificio ya existente' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_setEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setEspecialidad`(
	in id int,
	in nombre varchar(50),
    in nc varchar(15),
    in estatus enum('ACTIVA','LIQUIDACIÓN','BAJA'),
    in idCarrera int
)
BEGIN
	if exists (select idCarrera from carrera where carrera.idCarrera = idCarrera) then
		if not exists (select Nombre_especialidad from especialidad where Nombre_especialidad = nombre) then
			if not exists (select Nombre_Corto_especialidad from especialidad where idEspecialidad = id) then
				if not exists(select idEspecialidad from especialidad where idEspecialidad = id) then
                
					insert into especialidad values (id, nombre, nc, estatus, idCarrera);
					select 'Insercion correcta' as respuesta;
                else
					select 'Nombre corto repetido' as ERROR;
                end if;
            else
				select 'Nombre repetido' as ERROR;
            end if;
		else
			select 'Nombre corto repetido' as ERROR;
        end if;
    else
		select 'Carreta Inexistente' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updAula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updAula`(
    IN idAnt VARCHAR(7),
    IN id VARCHAR(7),
    IN cap int,
    IN proy ENUM('SI', 'NO'),
    IN edificio varchar(20)
)
BEGIN
    if exists (select idAula from aula where idAula = idAnt) then
		if not exists (select idAula from aula where idAula = id) then
			UPDATE aula 
			SET 
				idAula = COALESCE(id, idAula),
				Capacidad = COALESCE(cap, Capacidad),
				Proyector = COALESCE(proy, Proyector),
				Edificio_idEdificio = COALESCE(edificio, Edificio_idEdificio)
			WHERE idAula = idAnt;
        else
			select 'ID del aula ya existente' as ERROR;
        end if;
	else
		select 'Aula Inexistente' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updCarrera`(
    IN id int,
    IN nom VARCHAR(65),
    IN nc VARCHAR(10),
    IN est enum('ACTIVA','LIQUIDACIÓN','BAJA')
)
BEGIN

		if exists (select idCarrera from carrera where idCarrera = id) then
			if (est = 'ACTIVA') THEN
				UPDATE carrera 
				SET 
					Nombre_carrera = COALESCE(nom, Nombre_carrera),
					Nombre_corto_carrera = COALESCE(nc, Nombre_corto_carrera),
					Status_carrera = COALESCE(est, Status_carrera),
					Fecha_Alta = curdate()
				WHERE idCarrera = id;
				ELSEIF (est = 'BAJA') THEN
					UPDATE carrera 
					SET 
						Nombre_carrera = COALESCE(nom, Nombre_carrera),
						Nombre_corto_carrera = COALESCE(nc, Nombre_corto_carrera),
						Status_carrera = COALESCE(est, Status_carrera),
						Fecha_Baja = curdate()
					WHERE idCarrera = id;
				ELSEIF (est = 'LIQUIDACION') THEN
					UPDATE carrera 
					SET 
						Nombre_carrera = COALESCE(nom, Nombre_carrera),
						Nombre_corto_carrera = COALESCE(nc, Nombre_corto_carrera),
						Status_carrera = COALESCE(est, Status_carrera),
						Fecha_Liquidacion = curdate()
					WHERE idCarrera = id;
			END IF;
		else
			select 'Carrera Inexistente' as ERROR;
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updEdificio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updEdificio`(
    IN idAnt VARCHAR(20),
    IN id VARCHAR(20),
    IN niv ENUM('1', '2'),
    IN san INT
)
BEGIN
    if exists (select idEdificio from edificio where idEdificio = idAnt) then
		if not exists (select idEdificio from edificio where idEdificio = id) then
			UPDATE aula 
			SET Edificio_idEdificio = COALESCE(id, Edificio_idEdificio) 
			WHERE Edificio_idEdificio = idAnt;

			UPDATE edificio 
			SET 
				idEdificio = COALESCE(id, idEdificio), 
				Niveles = COALESCE(niv, Niveles), 
				Sanitarios = COALESCE(san, Sanitarios) 
			WHERE idEdificio = idAnt;
            select CONCAT('Se ha actualizado el registro: ', idAnt) as respuesta;
		else
			select 'Id ya existente' as ERROR;
        end if;
	else
		select 'Edificio Inexistente' as ERROR;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updEspecialidad`(
    IN id int,
    IN nom VARCHAR(65),
    IN nc VARCHAR(10),
    IN est enum('ACTIVA','LIQUIDACIÓN','BAJA'),
    IN carr int
)
BEGIN
		if exists(select idEspecialidad from especialidad where idEspecialidad = id) then
			IF carr IS NOT NULL THEN
				if exists(select idCarrera from carrera where idCarrera = carr) then
					UPDATE especialidad 
					SET 
						Nombre_especialidad = COALESCE(nom, Nombre_especialidad),
						Nombre_Corto_especialidad = COALESCE(nc, Nombre_Corto_especialidad),
						Status_Especialidad = COALESCE(est, Status_Especialidad),
						Carrera_idCarrera = carr
					WHERE idEspecialidad = id;
				else
					select 'Carrera Inexistente' as ERROR;
                end if;
			else
				UPDATE especialidad 
				SET 
					Nombre_especialidad = COALESCE(nom, Nombre_especialidad),
					Nombre_Corto_especialidad = COALESCE(nc, Nombre_Corto_especialidad),
					Status_Especialidad = COALESCE(est, Status_Especialidad)
				WHERE idEspecialidad = id;
			end if;
		else
			select 'Especialidad inexistente' as ERROR;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31 13:39:38
