-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Est_academica
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Est_academica` ;

-- -----------------------------------------------------
-- Schema Est_academica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Est_academica` DEFAULT CHARACTER SET utf8 ;
USE `Est_academica` ;

-- -----------------------------------------------------
-- Table `Est_academica`.`edificio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`edificio` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`edificio` (
  `idEdificio` VARCHAR(20) NOT NULL,
  `Niveles` ENUM('1', '2') NOT NULL,
  `Sanitarios` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idEdificio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`aula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`aula` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`aula` (
  `idAula` VARCHAR(7) NOT NULL,
  `Capacidad` TINYINT UNSIGNED NOT NULL,
  `Proyector` ENUM('SI', 'NO') NOT NULL,
  `Edificio_idEdificio` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idAula`),
  INDEX `fk_Aula_Edificio1_idx` (`Edificio_idEdificio` ASC) VISIBLE,
  CONSTRAINT `fk_Aula_Edificio1`
    FOREIGN KEY (`Edificio_idEdificio`)
    REFERENCES `Est_academica`.`edificio` (`idEdificio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`carrera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`carrera` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`carrera` (
  `idCarrera` TINYINT UNSIGNED NOT NULL,
  `Nombre_carrera` VARCHAR(65) NOT NULL,
  `Nombre_corto_carrera` VARCHAR(10) NOT NULL,
  `Status_carrera` ENUM('ACTIVA', 'LIQUIDACIÓN', 'BAJA') NOT NULL,
  `Fecha_Alta` DATE NOT NULL,
  `Fecha_Baja` DATE NULL DEFAULT NULL,
  `Fecha_Liquidacion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idCarrera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`especialidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`especialidad` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`especialidad` (
  `idEspecialidad` TINYINT UNSIGNED NOT NULL,
  `Nombre_especialidad` VARCHAR(50) NOT NULL,
  `Nombre_Corto_especialidad` VARCHAR(15) NOT NULL,
  `Status_Especialidad` ENUM('ACTIVA', 'LIQUIDACION', 'BAJA') NOT NULL,
  `Carrera_idCarrera` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idEspecialidad`),
  INDEX `fk_Especialidad_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Especialidad_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `Est_academica`.`carrera` (`idCarrera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`materia` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`materia` (
  `Clave_Materia` VARCHAR(8) NOT NULL,
  `Nombre_Materia` VARCHAR(65) NOT NULL,
  `Nombre_corto_materia` VARCHAR(15) NOT NULL,
  `HT` TINYINT UNSIGNED NOT NULL,
  `HP` TINYINT UNSIGNED NOT NULL,
  `Creditos` TINYINT,
  `Tipo` ENUM("BASICAS", "CARRERA", "ESPECIALIDAD") NOT NULL,
  `ESTATUS` ENUM("VIGENTE", "BAJA", "LIQUIDACION") NOT NULL,
  PRIMARY KEY (`Clave_Materia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`periodo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`periodo` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`periodo` (
  `idPeriodo` INT UNSIGNED NOT NULL,
  `Ciclo` VARCHAR(15) NOT NULL,
  `Estatus_Periodo` ENUM('ACTIVO', 'INACTIVO', 'PROXIMO') NOT NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`profesor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`profesor` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`profesor` (
  `idProfesor` SMALLINT UNSIGNED NOT NULL,
  `Nombre` VARCHAR(25) NOT NULL,
  `Paterno` VARCHAR(15) NOT NULL,
  `Materno` VARCHAR(15) NULL DEFAULT NULL,
  `RFC` VARCHAR(13) NOT NULL,
  `Status` ENUM('ACTIVO', 'BAJA', 'LICENCIA', 'JUBILADO') NOT NULL,
  `Genero` ENUM('M', 'F') NOT NULL,
  `Estudios` ENUM('LICENCIATURA', 'MAESTRÍA', 'DOCTORADO') NOT NULL,
  `Titulo` TINYTEXT NOT NULL,
  `Email` VARCHAR(60) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idProfesor`),
  UNIQUE INDEX `RFC_UNIQUE` (`RFC` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`grupo` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`grupo` (
  `idGrupo` INT UNSIGNED NOT NULL,
  `Grupo` CHAR(1) NOT NULL,
  `Limite` TINYINT UNSIGNED NOT NULL,
  `Inscritos` TINYINT UNSIGNED NOT NULL,
  `Lunes_inicio` INT NULL DEFAULT NULL,
  `Lunes_Fin` INT NULL DEFAULT NULL,
  `aula_idAula_Lunes` VARCHAR(7) NOT NULL,
  `Martes_inicio` INT NULL DEFAULT NULL,
  `Martes_Fin` INT NULL DEFAULT NULL,
  `aula_idAula_Martes` VARCHAR(7) NOT NULL,
  `Miercoles_inicio` INT NULL DEFAULT NULL,
  `Miercoles_Fin` INT NULL DEFAULT NULL,
  `aula_idAulaMiercoles` VARCHAR(7) NOT NULL,
  `Jueves_inicio` INT NULL DEFAULT NULL,
  `Jueves_fin` INT NULL DEFAULT NULL,
  `aula_idAula_Jueves` VARCHAR(7) NOT NULL,
  `Viernes_inicio` INT NULL DEFAULT NULL,
  `Viernes_fin` INT NULL DEFAULT NULL,
  `Aula_idAula_Viernes` VARCHAR(7) NOT NULL,
  `Status_Grupo` ENUM("ABIERTO", "CERRADO", "CANCELADO") NOT NULL,
  `Profesor_idProfesor` SMALLINT UNSIGNED NOT NULL,
  `Materia_Clave_Materia` VARCHAR(8) NOT NULL,
  `Periodo_idPeriodo` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idGrupo`),
  INDEX `fk_Grupo_Profesor1_idx` (`Profesor_idProfesor` ASC) VISIBLE,
  INDEX `fk_Grupo_Materia1_idx` (`Materia_Clave_Materia` ASC) VISIBLE,
  INDEX `fk_grupo_aula1_idx` (`Aula_idAula_Viernes` ASC) VISIBLE,
  INDEX `fk_Grupo_Periodo1_idx` (`Periodo_idPeriodo` ASC) VISIBLE,
  INDEX `fk_grupo_aula2_idx` (`aula_idAula_Lunes` ASC) VISIBLE,
  INDEX `fk_grupo_aula3_idx` (`aula_idAula_Martes` ASC) VISIBLE,
  INDEX `fk_grupo_aula4_idx` (`aula_idAulaMiercoles` ASC) VISIBLE,
  INDEX `fk_grupo_aula5_idx` (`aula_idAula_Jueves` ASC) VISIBLE,
  CONSTRAINT `fk_Grupo_Aula1`
    FOREIGN KEY (`Aula_idAula_Viernes`)
    REFERENCES `Est_academica`.`aula` (`idAula`),
  CONSTRAINT `fk_Grupo_Materia1`
    FOREIGN KEY (`Materia_Clave_Materia`)
    REFERENCES `Est_academica`.`materia` (`Clave_Materia`),
  CONSTRAINT `fk_Grupo_Periodo1`
    FOREIGN KEY (`Periodo_idPeriodo`)
    REFERENCES `Est_academica`.`periodo` (`idPeriodo`),
  CONSTRAINT `fk_Grupo_Profesor1`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `Est_academica`.`profesor` (`idProfesor`),
  CONSTRAINT `fk_grupo_aula2`
    FOREIGN KEY (`aula_idAula_Lunes`)
    REFERENCES `Est_academica`.`aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_aula3`
    FOREIGN KEY (`aula_idAula_Martes`)
    REFERENCES `Est_academica`.`aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_aula4`
    FOREIGN KEY (`aula_idAulaMiercoles`)
    REFERENCES `Est_academica`.`aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_aula5`
    FOREIGN KEY (`aula_idAula_Jueves`)
    REFERENCES `Est_academica`.`aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`plaza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`plaza` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`plaza` (
  `idPlaza` VARCHAR(5) NOT NULL,
  `Descripcion` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idPlaza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`profesor_has_plaza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`profesor_has_plaza` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`profesor_has_plaza` (
  `Id` SMALLINT NOT NULL AUTO_INCREMENT,
  `Profesor_idProfesor` SMALLINT UNSIGNED NOT NULL,
  `Plaza_idPlaza` VARCHAR(5) NOT NULL,
  `Horas_Plaza` TINYINT UNSIGNED NOT NULL,
  `Status_Plaza` ENUM('10', '20', '95') NOT NULL,
  PRIMARY KEY (`Id`, `Profesor_idProfesor`, `Plaza_idPlaza`),
  INDEX `fk_Profesor_has_Plaza_Plaza1_idx` (`Plaza_idPlaza` ASC) VISIBLE,
  INDEX `fk_Profesor_has_Plaza_Profesor_idx` (`Profesor_idProfesor` ASC) VISIBLE,
  CONSTRAINT `fk_Profesor_has_Plaza_Plaza1`
    FOREIGN KEY (`Plaza_idPlaza`)
    REFERENCES `Est_academica`.`plaza` (`idPlaza`),
  CONSTRAINT `fk_Profesor_has_Plaza_Profesor`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `Est_academica`.`profesor` (`idProfesor`))
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`reticula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`reticula` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`reticula` (
  `idReticula` INT NOT NULL,
  `Plan` VARCHAR(25) NOT NULL,
  `Estatus_Reticula` ENUM('ACTIVA', 'LIQUIDACION', 'BAJA') NOT NULL,
  `Fecha_autorizacion` DATE NOT NULL,
  `Carrera_idCarrera` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idReticula`),
  INDEX `fk_Reticula_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Reticula_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `Est_academica`.`carrera` (`idCarrera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`reticula_has_materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`reticula_has_materia` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`reticula_has_materia` (
  `Reticula_idReticula` INT NOT NULL,
  `Materia_Clave_Materia` VARCHAR(8) NOT NULL,
  `Clave_interna_Materia` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`Reticula_idReticula`, `Materia_Clave_Materia`),
  INDEX `fk_Reticula_has_Materia_Materia1_idx` (`Materia_Clave_Materia` ASC) VISIBLE,
  INDEX `fk_Reticula_has_Materia_Reticula1_idx` (`Reticula_idReticula` ASC) VISIBLE,
  CONSTRAINT `fk_Reticula_has_Materia_Materia1`
    FOREIGN KEY (`Materia_Clave_Materia`)
    REFERENCES `Est_academica`.`materia` (`Clave_Materia`),
  CONSTRAINT `fk_Reticula_has_Materia_Reticula1`
    FOREIGN KEY (`Reticula_idReticula`)
    REFERENCES `Est_academica`.`reticula` (`idReticula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Est_academica`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Est_academica`.`usuario` ;

CREATE TABLE IF NOT EXISTS `Est_academica`.`usuario` (
  `idUsuario` VARCHAR(8) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Estatus` ENUM('ACTIVO', 'INACTIVO') NOT NULL,
  `Image_Direct` VARCHAR(60) NULL,
  `profesor_idProfesor` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_profesor1_idx` (`profesor_idProfesor` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_profesor1`
    FOREIGN KEY (`profesor_idProfesor`)
    REFERENCES `Est_academica`.`profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Est_academica` ;

-- -----------------------------------------------------
-- procedure Alta_Grupo
-- -----------------------------------------------------

USE `Est_academica`;
DROP procedure IF EXISTS `Est_academica`.`Alta_Grupo`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_Grupo`(P_Id_Profesor smallint,P_Materia VARCHAR (8))
BEGIN
	IF Profe_Activo(P_Id_Profesor)=1
    THEN IF Materia_Activa(P_Materia)
			THEN SELECT "Profesor y materia activa";
			ELSE SELECT "ERROR 1002 MATERIA NO EXISTENTE" AS ERROR;
        END IF;
		
    ELSE SELECT "ERROR 1001 PROFESOR INACTIVO" AS ERROR;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Alta_Grupo2
-- -----------------------------------------------------

USE `Est_academica`;
DROP procedure IF EXISTS `Est_academica`.`Alta_Grupo2`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_Grupo2`(P_Idprofesor smallint)
BEGIN
	IF (Maestro_Existe(P_IdProfesor))
    THEN IF (Maestro_Activo(P_IdProfesor)) 
			THEN SELECT ("EL MAESTRO EXISTE Y ESTA ACTIVO");
            ELSE SELECT ("ERROR 1002 EL MAESTRO EXISTE PERO NO ESTA ACTIVO") AS ERROR;
            END IF;
    ELSE SELECT ("ERROR 1001 EL MAESTRO NO EXISTE") AS ERROR;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure Alta_Profesor
-- -----------------------------------------------------

USE `Est_academica`;
DROP procedure IF EXISTS `Est_academica`.`Alta_Profesor`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Alta_Profesor`(IN id smallint, N Varchar (25),P Varchar(15),m varchar(15))
BEGIN
INSERT INTO profesor VALUES(id,TRIM(UPPER(N)),TRIM(UPPER(P)),TRIM(UPPER(M)),"jsjsjsjs",'ACTIVO','M','LICENCIATURA','DOCTOR EN MATEMATICAS','KJKJJL','898989');
SELECT 'REGISTRO INSERTADO CON EXITO';

END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Grupo_Abierto
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`Grupo_Abierto`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Grupo_Abierto`(X int) RETURNS varchar(20) CHARSET utf8
    DETERMINISTIC
BEGIN
	IF (SELECT Status_grupo FROM GRUPO WHERE idGrupo = X) = 1
		THEN RETURN 'ABIERTO';
		ELSE RETURN 'CERRADO';
	END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Horas_Profe
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`Horas_Profe`;

DELIMITER $$
USE `Est_academica`$$
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
	END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Maestro_Activo
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`Maestro_Activo`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Maestro_Activo`(F_IdProfesor SMALLINT) RETURNS int
    DETERMINISTIC
IF (SELECT status FROM profesor WHERE idProfesor=F_IdProfesor)="ACTIVO"
    THEN RETURN 1;
    ELSE RETURN 0;
    END IF$$

DELIMITER ;

-- -----------------------------------------------------
-- function Maestro_Existe
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`Maestro_Existe`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Maestro_Existe`(F_IdProfesor SMALLINT) RETURNS int
    DETERMINISTIC
IF (SELECT COUNT(*) FROM profesor WHERE idProfesor=F_IdProfesor)
    THEN RETURN 1;
    ELSE RETURN 0;
    END IF$$

DELIMITER ;

-- -----------------------------------------------------
-- function Materia_Activa
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`Materia_Activa`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Materia_Activa`(F_Materia varchar(8)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(*) FROM materia WHERE clave_materia=F_materia);
 END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Profe_Activo
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`Profe_Activo`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Profe_Activo`(F_id_Profesor smallint) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF (SELECT STATUS FROM profesor WHERE idProfesor=F_Id_Profesor)="ACTIVO"
    THEN RETURN 1;
    ELSE RETURN 0;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function edad
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`edad`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `edad`(Y VARCHAR (13)) RETURNS int
    DETERMINISTIC
BEGIN
RETURN TIMESTAMPDIFF(YEAR,(CONCAT('19',SUBSTR(Y,5,2),'/',SUBSTR(Y,7,2),'/',SUBSTR(Y,9,2))),CURDATE());

END$$

DELIMITER ;

-- -----------------------------------------------------
-- function holaMundo
-- -----------------------------------------------------

USE `Est_academica`;
DROP function IF EXISTS `Est_academica`.`holaMundo`;

DELIMITER $$
USE `Est_academica`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `holaMundo`() RETURNS varchar(20) CHARSET utf8
    DETERMINISTIC
BEGIN
    RETURN 'Hola Mundo';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure inscripcion
-- -----------------------------------------------------

USE `Est_academica`;
DROP procedure IF EXISTS `Est_academica`.`inscripcion`;

DELIMITER $$
USE `Est_academica`$$
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

END$$
DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_setEdificio`(
    IN id VARCHAR(20), 
    IN nivel char,
    IN sanitario int(3)
)
BEGIN
	if not exists (select idEdificio from edificio where idEdificio = id) then
		INSERT INTO edificio VALUES (id,nivel,sanitario);
        select "200" as respuesta;
	else
		select 'Edificio ya existente' as ERROR;
    end if;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_getEdificio`()
BEGIN
	select * from edificio order by idEdificio desc;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_dropEdificio`(
	in id varchar(20)
)
BEGIN
	if exists (select idEdificio from edificio where idEdificio = id) then
		delete from edificio where idEdificio = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `sp_setAula`(
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
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_getAula`()
BEGIN
	select * from aula order by idAula desc;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_dropAula`(
	in id varchar(20)
)
BEGIN
	if exists (select idAula from aula where idAula = id) then
		delete from aula where idAula = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_setCarrera`(
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
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_getCarrera`()
BEGIN
	select * from carrera order by idCarrera desc;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `sp_dropCarrera`(
	in id int
)
BEGIN
	if exists (select idCarrera from carrera where idCarrera = id) then
		delete from carrera where idCarrera = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_setEspecialidad`(
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
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_getEspecialidad`()
BEGIN
	select * from especialidad order by idEspecialidad desc;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_dropEspecialidad`(
	in id int
)
BEGIN
	if exists (select idEspecialidad from especialidad where idEspecialidad = id) then
		delete from especialidad where idEspecialidad = id;
        select 'Se ha eliminado con exito' as respuesta;
    else
		select 'Elemento no encontrado' as 	ERROR;
    end if;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_getAulaInd`(in id varchar(7))
BEGIN
	if exists (select idAula from aula where idAula = id) then
		select * from aula where idAula = id;
	else
		select 'Elemento no encontrado' as ERROR;
    end if;
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE `sp_getEdificioInd`(in id varchar(20))
BEGIN
	if exists (select idEdificio from edificio where idEdificio = id) then
		select * from edificio where idEdificio = id;
	else
		select 'Elemento no encontrado' as ERROR;
    end if;
END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE `sp_getCarreraInd`(IN nombre VARCHAR(20))
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
END$$

DELIMITER ;


drop procedure sp_getCarreraInd;


call sp_getCarreraInd("Matematicas");


call sp_getAulaInd('Aula3');
call sp_getEdificioInd('Edificio1');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


select * from usuario;