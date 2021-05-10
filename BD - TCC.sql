-- MySQL Script generated by MySQL Workbench
-- Sat Apr 10 15:35:52 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 3804792_refugiopet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 3804792_refugiopet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `3804792_refugiopet` DEFAULT CHARACTER SET utf8 ;
USE `3804792_refugiopet` ;

-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`USUARIO` (
  `IDUSUARIO` INT NOT NULL AUTO_INCREMENT,
  `LOGIN` VARCHAR(45) NOT NULL,
  `SENHA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDUSUARIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`DOADORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`DOADORES` (
  `IDDOARES` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(45) NOT NULL,
  `TELEFONE` INT NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `USUARIO_IDUSUARIO` INT NOT NULL,
  PRIMARY KEY (`IDDOARES`),
  INDEX `fk_DOADORES_USUARIO1_idx` (`USUARIO_IDUSUARIO` ASC),
  CONSTRAINT `fk_DOADORES_USUARIO1`
    FOREIGN KEY (`USUARIO_IDUSUARIO`)
    REFERENCES `3804792_refugiopet`.`USUARIO` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`TIPO_DOACOES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`TIPO_DOACOES` (
  `IDTIPO_DOACOES` INT NOT NULL AUTO_INCREMENT,
  `QUANTIDADE` INT NULL,
  `VALOR` INT NULL,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDTIPO_DOACOES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`DOACOES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`DOACOES` (
  `IDDOACOES` INT NOT NULL AUTO_INCREMENT,
  `DATAENTRADA` DATE NOT NULL,
  `DATASAIDA` DATE NOT NULL,
  `DOADORES_IDDOARES` INT NOT NULL,
  `TIPO_DOACOES_IDTIPO_DOACOES` INT NOT NULL,
  PRIMARY KEY (`IDDOACOES`, `DOADORES_IDDOARES`, `TIPO_DOACOES_IDTIPO_DOACOES`),
  INDEX `fk_DOACOES_DOADORES1_idx` (`DOADORES_IDDOARES` ASC),
  INDEX `fk_DOACOES_TIPO_DOACOES1_idx` (`TIPO_DOACOES_IDTIPO_DOACOES` ASC),
  CONSTRAINT `fk_DOACOES_DOADORES1`
    FOREIGN KEY (`DOADORES_IDDOARES`)
    REFERENCES `3804792_refugiopet`.`DOADORES` (`IDDOARES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOACOES_TIPO_DOACOES1`
    FOREIGN KEY (`TIPO_DOACOES_IDTIPO_DOACOES`)
    REFERENCES `3804792_refugiopet`.`TIPO_DOACOES` (`IDTIPO_DOACOES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`VOLUNTARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`VOLUNTARIOS` (
  `IDVOLUNTARIOS` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(45) NOT NULL,
  `TELEFONE` INT NOT NULL,
  `ENDERECO` VARCHAR(45) NOT NULL,
  `RG` INT NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `ATUACAO` VARCHAR(45) NOT NULL,
  `USUARIO_IDUSUARIO` INT NOT NULL,
  PRIMARY KEY (`IDVOLUNTARIOS`),
  INDEX `fk_VOLUNTARIOS_USUARIO1_idx` (`USUARIO_IDUSUARIO` ASC),
  CONSTRAINT `fk_VOLUNTARIOS_USUARIO1`
    FOREIGN KEY (`USUARIO_IDUSUARIO`)
    REFERENCES `3804792_refugiopet`.`USUARIO` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`ESPECIE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`ESPECIE` (
  `IDESPECIE` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDESPECIE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`ANIMAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`ANIMAIS` (
  `IDANIMAIS` INT NOT NULL AUTO_INCREMENT,
  `DATARESGATE` DATE NOT NULL,
  `SEXO` TINYINT NOT NULL,
  `PORTE` VARCHAR(45) NOT NULL,
  `USUARIO_IDUSUARIO` INT NOT NULL,
  `ESPECIE_IDESPECIE` INT NOT NULL,
  PRIMARY KEY (`IDANIMAIS`, `ESPECIE_IDESPECIE`),
  INDEX `fk_ANIMAIS_USUARIO1_idx` (`USUARIO_IDUSUARIO` ASC),
  INDEX `fk_ANIMAIS_ESPECIE1_idx` (`ESPECIE_IDESPECIE` ASC),
  CONSTRAINT `fk_ANIMAIS_USUARIO1`
    FOREIGN KEY (`USUARIO_IDUSUARIO`)
    REFERENCES `3804792_refugiopet`.`USUARIO` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANIMAIS_ESPECIE1`
    FOREIGN KEY (`ESPECIE_IDESPECIE`)
    REFERENCES `3804792_refugiopet`.`ESPECIE` (`IDESPECIE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3804792_refugiopet`.`TIPO_VOLUNTARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3804792_refugiopet`.`TIPO_VOLUNTARIOS` (
  `IDTIPO_VOLUNTARIOS` INT NOT NULL AUTO_INCREMENT,
  `VOLUNTARIOS_IDVOLUNTARIOS` INT NOT NULL,
  PRIMARY KEY (`IDTIPO_VOLUNTARIOS`, `VOLUNTARIOS_IDVOLUNTARIOS`),
  INDEX `fk_TIPO_VOLUNTARIOS_VOLUNTARIOS1_idx` (`VOLUNTARIOS_IDVOLUNTARIOS` ASC),
  CONSTRAINT `fk_TIPO_VOLUNTARIOS_VOLUNTARIOS1`
    FOREIGN KEY (`VOLUNTARIOS_IDVOLUNTARIOS`)
    REFERENCES `3804792_refugiopet`.`VOLUNTARIOS` (`IDVOLUNTARIOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;