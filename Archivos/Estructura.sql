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
  `Sanitario` TINYINT UNSIGNED NOT NULL,
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
  `Nombre_Carrera` VARCHAR(65) NOT NULL,
  `Nombre_Corto_Carrera` VARCHAR(10) NOT NULL,
  `Status_Carrera` ENUM('ACTIVA', 'LIQUIDACIÓN', 'BAJA') NOT NULL,
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
  `Status_Especialidad` ENUM('ACTIVO', 'LIQUIDACION', 'BAJA') NOT NULL,
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

##  NOT NULL DEFAULT GENERATED ALWAY AS (HP + HT)

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
  `telefono` VARCHAR(10) NOT NULL,
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
  INDEX `fk_Grupo_Aula1_idx` (`Aula_idAula_Viernes` ASC) VISIBLE,
  INDEX `fk_Grupo_Periodo1_idx` (`Periodo_idPeriodo` ASC) VISIBLE,
  INDEX `fk_grupo_aula2_idx` (`aula_idAula_Lunes` ASC) VISIBLE,
  INDEX `fk_grupo_aula3_idx` (`aula_idAula_Martes` ASC) VISIBLE,
  INDEX `fk_grupo_aula4_idx` (`aula_idAulaMiercoles` ASC) VISIBLE,
  INDEX `fk_grupo_aula5_idx` (`aula_idAula_Jueves` ASC) VISIBLE,
  CONSTRAINT `fk_Grupo_aula0`
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
  CONSTRAINT `fk_grupo_aula1`
    FOREIGN KEY (`aula_idAula_Lunes`)
    REFERENCES `Est_academica`.`aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_aula2`
    FOREIGN KEY (`aula_idAula_Martes`)
    REFERENCES `Est_academica`.`aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_aula3`
    FOREIGN KEY (`aula_idAulaMiercoles`)
    REFERENCES `Est_academica`.`aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_aula4`
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
