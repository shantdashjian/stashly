-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema collectorsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `collectorsdb` ;

-- -----------------------------------------------------
-- Schema collectorsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `collectorsdb` DEFAULT CHARACTER SET utf8 ;
USE `collectorsdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `item_condition` VARCHAR(255) NULL,
  `notes` VARCHAR(255) NULL,
  `purchase_price` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `current_value` DECIMAL(11,2) NULL,
  `purchase_date` VARCHAR(255) NOT NULL,
  `sold_date` VARCHAR(255) NULL,
  `sold_price` DECIMAL(11,2) NULL,
  `retired` TINYINT(1) NULL,
  `image_url` VARCHAR(255) NULL,
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_user_idx` (`user_id` ASC),
  INDEX `fk_item_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_item_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `price` ;

CREATE TABLE IF NOT EXISTS `price` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(11) NOT NULL,
  `date` VARCHAR(255) NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_price_item1_idx` (`item_id` ASC),
  CONSTRAINT `fk_price_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO collectors@localhost;
 DROP USER collectors@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'collectors'@'localhost' IDENTIFIED BY 'comic';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'collectors'@'localhost';



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `collectorsdb`;
INSERT INTO `user` (`id`, `username`, `password`) VALUES (1, 'jandis', 'pw');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `collectorsdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'comic');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'action figure');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'sports card');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'coin');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'stamp');

COMMIT;


-- -----------------------------------------------------
-- Data for table `item`
-- -----------------------------------------------------
START TRANSACTION;
USE `collectorsdb`;
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (1, 'Uncanny X-Men (1963 1st Series) #2 FR 1.0', 'Published 1963 by Marvel. Grade: FR 1.0', 'poor', 'I got this from a friend of mine on Christmas.', 0.12, 220.00, '1963-11-02', '', NULL, 0, 'http://i.ebayimg.com/images/g/XbEAAOSww9xZA~V-/s-l1600.jpg', 1, 1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (2, 'The X-Men #11 (May 1965, Marvel) ', 'Published 1965 by Marvel', 'very good', 'Bought this at ComicCon San Diego', 0.12, 28.00, '1965-05-11', NULL, NULL, 0, 'http://i.ebayimg.com/images/g/tvIAAOSwzqFY~l2E/s-l1600.jpg', 1, 1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (3, 'Teenage Mutant Ninja Turtles: Donatello S.H.Figuarts Action Figure', 'Teenage Mutant Ninja Turtles (TMNT): Donatello S.H.Figuarts Action Figure', 'excellent', 'Given to me on my 8th birthday', 8.99, 59.33, '1980-09-27', NULL, NULL, 0, 'http://i.ebayimg.com/images/g/yhMAAOSwmfhX263D/s-l1600.jpg', 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `price`
-- -----------------------------------------------------
START TRANSACTION;
USE `collectorsdb`;
INSERT INTO `price` (`id`, `price`, `date`, `item_id`) VALUES (1, 220.00, '2017-05-01', 1);
INSERT INTO `price` (`id`, `price`, `date`, `item_id`) VALUES (2, 28.00, '2017-05-01', 2);
INSERT INTO `price` (`id`, `price`, `date`, `item_id`) VALUES (3, 59.33, '2017-05-01', 3);

COMMIT;
