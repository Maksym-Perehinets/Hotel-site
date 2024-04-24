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
  `idroomPicture` INT AUTO_INCREMENT NOT NULL,
  `picURL` TEXT NOT NULL,
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
  `rooms_idrooms` INT NOT NULL AUTO_INCREMENT,
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- FULL FILL DB
-- -----------------------------------------------------
-- Insert sample data into roomStatus table
INSERT INTO `mydb`.`roomStatus` (`description`, `roomStatus`)
VALUES
('Standard', 1),
('Deluxe', 2),
('Suite', 3),
('Penthouse', 4),
('Economy', 5);

-- Insert sample data into rooms table
INSERT INTO `mydb`.`rooms` (`roomStatus_idroomStatus`, `roomNumber`, `roomDescription`, `numberOfBeds`, `hasKitchen`, `price_perday`)
VALUES
(1, 104, 'Standard single room with city view', 1, 0, 90),
(2, 105, 'Deluxe double room with sea view', 2, 1, 150),
(3, 106, 'Luxury suite with private jacuzzi', 3, 1, 250),
(4, 107, 'Extravagant penthouse with rooftop terrace', 4, 1, 500),
(5, 108, 'Economy room with shared bathroom', 1, 0, 70),
(1, 109, 'Standard twin room overlooking the garden', 2, 0, 110),
(2, 110, 'Deluxe family room with kitchenette', 4, 1, 200),
(3, 111, 'Luxury suite with panoramic city views', 3, 1, 280),
(4, 112, 'Grand penthouse with personal butler service', 5, 1, 750),
(5, 113, 'Economy bunk bed room for budget travelers', 2, 0, 60),
(1, 114, 'Standard queen room with balcony', 2, 0, 100),
(2, 115, 'Deluxe honeymoon suite with oceanfront balcony', 2, 1, 300),
(3, 116, 'Luxury presidential suite with private elevator', 3, 1, 400),
(4, 117, 'Opulent penthouse with infinity pool', 4, 1, 1000),
(5, 118, 'Economy dormitory room for backpackers', 6, 0, 50),
(1, 119, 'Standard king room with mountain view', 1, 0, 120),
(2, 120, 'Deluxe executive suite with office area', 2, 1, 220),
(3, 121, 'Luxury royal suite with grand dining room', 4, 1, 500),
(4, 122, 'Exclusive penthouse with private cinema', 3, 1, 800),
(5, 123, 'Economy studio apartment with shared kitchen', 1, 1, 80),
(1, 124, 'Standard double room with garden terrace', 2, 0, 110),
(2, 125, 'Deluxe corner suite with wrap-around balcony', 3, 1, 250),
(3, 126, 'Luxury honeymoon villa with private pool', 1, 1, 600),
(4, 127, 'Grand penthouse with panoramic skyline views', 4, 1, 900),
(5, 128, 'Economy capsule room for solo travelers', 1, 0, 40),
(1, 129, 'Standard family room with adjoining kids room', 4, 0, 180),
(2, 130, 'Deluxe oceanfront suite with sunset views', 3, 1, 350),
(3, 131, 'Luxury beachfront bungalow with outdoor shower', 1, 0, 700),
(4, 132, 'Exclusive penthouse with private helipad', 2, 1, 1200),
(5, 133, 'Economy attic room with skylight', 1, 0, 65),
(1, 134, 'Standard loft room with city skyline views', 1, 0, 140),
(2, 135, 'Deluxe riverfront suite with jacuzzi bathtub', 2, 1, 270),
(3, 136, 'Luxury hilltop villa with infinity pool', 3, 1, 800),
(4, 137, 'Grand penthouse with private rooftop garden', 4, 1, 1100),
(5, 138, 'Economy roadside motel room', 1, 0, 45),
(1, 139, 'Standard cottage room with fireplace', 2, 0, 160),
(2, 140, 'Deluxe garden suite with outdoor hot tub', 3, 1, 290),
(3, 141, 'Luxury lakeside chalet with private dock', 1, 0, 750),
(4, 142, 'Exclusive penthouse with panoramic ocean views', 3, 1, 1300),
(5, 143, 'Economy hostel room with bunk beds', 6, 0, 30),
(1, 144, 'Standard log cabin with forest views', 2, 0, 180),
(2, 145, 'Deluxe ski chalet with mountain views', 3, 1, 320),
(3, 146, 'Luxury cliffside villa with glass-bottom pool', 2, 1, 900),
(4, 147, 'Grand penthouse with private yacht dock', 4, 1, 1500),
(5, 148, 'Economy tent for camping enthusiasts', 1, 0, 25),
(1, 149, 'Standard treehouse suite with jungle views', 2, 0, 200),
(2, 150, 'Deluxe safari tent with luxury amenities', 1, 1, 350),
(3, 151, 'Luxury mountain lodge with private hot springs', 4, 0, 850),
(4, 152, 'Exclusive penthouse with private beach access', 3, 1, 1700),
(5, 153, 'Economy roadside motel room with shared bathroom', 1, 0, 40);


-- Insert sample data into roomPicture table
INSERT INTO `mydb`.`roomPicture` (`picURL`, `rooms_idrooms`)
VALUES
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-1.jpg', 1),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-2.jpg', 2),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-3.jpg', 3),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-4.jpg', 4),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-5.jpg', 5),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-6.jpg', 6),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-7.jpg', 7),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-8.jpg', 8),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-9.jpg', 9),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-10.jpg', 10),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-11.jpg', 11),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-12.jpg', 12),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-13.jpg', 13),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-14.jpg', 14),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-15.jpg', 15),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-16.jpg', 16),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-17.jpg', 17),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-18.jpg', 18),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-19.jpg', 19),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-20.jpg', 20),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-21.jpg', 21),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-22.jpg', 22),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-23.jpg', 23),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-24.jpg', 24),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-25.jpg', 25),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-26.jpg', 26),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-27.jpg', 27),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-28.jpg', 28),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-29.jpg', 29),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-30.jpg', 30),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-31.jpg', 31),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-32.jpg', 32),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-33.jpg', 33),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-34.jpg', 34),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-35.jpg', 35),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-36.jpg', 36),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-37.jpg', 37),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-38.jpg', 38),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-39.jpg', 39),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-40.jpg', 40),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-41.jpg', 41),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-42.jpg', 42),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-43.jpg', 43),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-44.jpg', 44),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-45.jpg', 45),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-46.jpg', 46),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-47.jpg', 47),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-48.jpg', 48),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-49.jpg', 49),
('https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-50.jpg', 50);



