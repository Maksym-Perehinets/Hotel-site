-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`roomStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roomStatus` (
  `idroomStatus` INT NOT NULL AUTO_INCREMENT,
  `description` LONGTEXT NOT NULL,
  `roomStatus` INT NOT NULL,
  PRIMARY KEY (`idroomStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rooms` (
  `idrooms` INT NOT NULL AUTO_INCREMENT,
  `roomStatus_idroomStatus` INT NOT NULL,
  `roomNumber` INT NOT NULL,
  `roomDescription` LONGTEXT NOT NULL,
  `numberOfBeds` INT NOT NULL,
  `hasKitchen` TINYINT NOT NULL,
  `price_perday` INT NOT NULL,
  PRIMARY KEY (`idrooms`),
  INDEX `fk_rooms_roomStatus_idx` (`roomStatus_idroomStatus` ASC) VISIBLE,
  CONSTRAINT `fk_rooms_roomStatus`
    FOREIGN KEY (`roomStatus_idroomStatus`)
    REFERENCES `mydb`.`roomStatus` (`idroomStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`roomReviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roomReviews` (
  `idroomReviews` INT NOT NULL AUTO_INCREMENT,
  `description` LONGTEXT NOT NULL,
  `stars` INT NOT NULL,
  `rooms_idrooms` INT NOT NULL,
  PRIMARY KEY (`idroomReviews`),
  INDEX `fk_roomReviews_rooms1_idx` (`rooms_idrooms` ASC) VISIBLE,
  CONSTRAINT `fk_roomReviews_rooms1`
    FOREIGN KEY (`rooms_idrooms`)
    REFERENCES `mydb`.`rooms` (`idrooms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`roomPicture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roomPicture` (
  `idroomPicture` INT NOT NULL,
  `picURL` VARCHAR(255) NOT NULL,
  `rooms_idrooms` INT NOT NULL,
  PRIMARY KEY (`idroomPicture`, `rooms_idrooms`),
  INDEX `fk_roomPicture_rooms1_idx` (`rooms_idrooms` ASC) VISIBLE,
  CONSTRAINT `fk_roomPicture_rooms1`
    FOREIGN KEY (`rooms_idrooms`)
    REFERENCES `mydb`.`rooms` (`idrooms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  `userBehaviour` VARCHAR(255) NOT NULL,
  `user_first_name` VARCHAR(45) NOT NULL,
  `user_last_name` VARCHAR(45) NOT NULL,
  `user_password_salted` VARCHAR(45) NULL,
  PRIMARY KEY (`idusers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`userAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`userAddress` (
  `iduserAddress` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL,
  `postalCode` INT NULL,
  `users_idusers` INT NOT NULL,
  PRIMARY KEY (`iduserAddress`),
  INDEX `fk_userAddress_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_userAddress_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`services` (
  `idservices` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_name` VARCHAR(255) NOT NULL,
  `service_price` INT NOT NULL,
  PRIMARY KEY (`idservices`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bookedRooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bookedRooms` (
  `rooms_idrooms` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `overal_price` VARCHAR(45) NULL,
  PRIMARY KEY (`rooms_idrooms`, `users_idusers`),
  INDEX `fk_rooms_has_users_users1_idx` (`users_idusers` ASC) VISIBLE,
  INDEX `fk_rooms_has_users_rooms1_idx` (`rooms_idrooms` ASC) VISIBLE,
  CONSTRAINT `fk_rooms_has_users_rooms1`
    FOREIGN KEY (`rooms_idrooms`)
    REFERENCES `mydb`.`rooms` (`idrooms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rooms_has_users_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`services_has_bookedRooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`services_has_bookedRooms` (
  `services_idservices` INT UNSIGNED NOT NULL,
  `bookedRooms_rooms_idrooms` INT NOT NULL,
  `bookedRooms_users_idusers` INT NOT NULL,
  `order_time` DATETIME NOT NULL,
  `delivery_time` DATETIME NOT NULL,
  PRIMARY KEY (`services_idservices`, `bookedRooms_rooms_idrooms`, `bookedRooms_users_idusers`),
  INDEX `fk_services_has_bookedRooms_bookedRooms1_idx` (`bookedRooms_rooms_idrooms` ASC, `bookedRooms_users_idusers` ASC) VISIBLE,
  INDEX `fk_services_has_bookedRooms_services1_idx` (`services_idservices` ASC) VISIBLE,
  CONSTRAINT `fk_services_has_bookedRooms_services1`
    FOREIGN KEY (`services_idservices`)
    REFERENCES `mydb`.`services` (`idservices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_services_has_bookedRooms_bookedRooms1`
    FOREIGN KEY (`bookedRooms_rooms_idrooms` , `bookedRooms_users_idusers`)
    REFERENCES `mydb`.`bookedRooms` (`rooms_idrooms` , `users_idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`admin` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `admin_name` VARCHAR(45) NOT NULL,
  `admin_surname` VARCHAR(45) NOT NULL,
  `admin_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Permissions` (
  `idadminPermissions` INT NOT NULL AUTO_INCREMENT,
  `permission` JSON NOT NULL,
  PRIMARY KEY (`idadminPermissions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`adminPermissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adminPermissions` (
  `admin_idAdmin` INT NOT NULL,
  `adminPermissions_idadminPermissions` INT NOT NULL,
  PRIMARY KEY (`admin_idAdmin`, `adminPermissions_idadminPermissions`),
  INDEX `fk_admin_has_adminPermissions_adminPermissions1_idx` (`adminPermissions_idadminPermissions` ASC) VISIBLE,
  INDEX `fk_admin_has_adminPermissions_admin1_idx` (`admin_idAdmin` ASC) VISIBLE,
  CONSTRAINT `fk_admin_has_adminPermissions_admin1`
    FOREIGN KEY (`admin_idAdmin`)
    REFERENCES `mydb`.`admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_has_adminPermissions_adminPermissions1`
    FOREIGN KEY (`adminPermissions_idadminPermissions`)
    REFERENCES `mydb`.`Permissions` (`idadminPermissions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
