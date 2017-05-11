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
  `item_price` DECIMAL(11,2) NOT NULL,
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
INSERT INTO `user` (`id`, `username`, `password`) VALUES (1, 'jandis', '$2a$10$Ydo0cKGrccptibhW5XZZIuLyJZcjuCpg6p8HatIy8EzKLTnNQYbZG');

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
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (1, 'The X-Men #11 (May 1965, Marvel) ', 'Published 1965 by Marvel', 'very good', 'Bought this at ComicCon San Diego', 0.12,NULL, '1965-05-11T09:00:00', NULL, NULL, 0, 'http://i.ebayimg.com/images/g/tvIAAOSwzqFY~l2E/s-l1600.jpg', 1, 1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (2, 'Teenage Mutant Ninja Turtles: Donatello S.H.Figuarts Action Figure', 'Teenage Mutant Ninja Turtles (TMNT): Donatello S.H.Figuarts Action Figure', 'excellent', 'Given to me on my 8th birthday', 8.99,NULL, '1980-09-27T09:00:00', NULL, NULL, 0, 'http://i.ebayimg.com/images/g/yhMAAOSwmfhX263D/s-l1600.jpg', 1, 2);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (3,'Detective Comics # 577 Year Two Todd McFarlane Batman CGC 9.8 WHITE Pages','Copper Age','excellent','',0.75,NULL,'1987-08-01T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/JuYAAOSwiDFYOgb3/s-l1600.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (4,'Batman #426 12/88 DC Comics 1940 CGC 9.8 NM/M A Death In The Family Part 1 Joker','Copper Age','excellent','',1.25,NULL,'1992-02-01T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/vN0AAOSwuMZZD9Za/s-l1600.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (5,'Batman #429 1/89 DC Comics 1940 CGC 9.6 NM+ A Death In The Family Part 4 Joker','Copper Age','excellent','',1.25,NULL,'1990-05-01T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/4coAAOSwrhBZD9ct/s-l1600.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (6,'Marvel Comics 2016 Deadpool #13 Hit Monkey 1:25 Variant NEW','Modern Age','mint/unopened','',3.99,NULL,'2016-08-01T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/ykcAAOSw2xRYUcqM/s-l500.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (7,'Black Panther #13 1:25 Kris Anka Variant Marvel 2016','Modern Age','mint/unopened','',3.99,NULL,'2016-03-01T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/CZcAAOSw~y9ZCRIa/s-l1600.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (8,'Spider-Man and Batman # [nn] (Sep 1995, Marvel) NM Never read DC','Modern Age','mint/unopened','',4.99,NULL,'1995-09-01T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/bYUAAOSwax5Yue7C/s-l1600.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (9,'BATMAN DARK KNIGHT III MASTER RACE #8 1/50 VARIANT SIENKIEWICZ RETAIL INCENTIVE','Modern Age','mint/unopened','',4.99,NULL,'2016-08-11T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/kboAAOSwlndZEOQi/s-l1600.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (10,'FCBD SECRET EMPIRE SPIDER-MAN 1 FREE COMIC BOOK DAY VARIANT 2017','Modern Age','mint/unopened','',0,NULL,'2017-02-19T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/6yoAAOSwIWVY-XsQ/s-l1600.jpg',1,1);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (11,'Star Wars Rogue One Tates Comics Krennic Action Figure Variant John Christopher','Star Wars Rogue One','mint/unopened','',9.99,NULL,'2016-11-13T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/wBkAAOSwuMZZBzzP/s-l1600.jpg',1,2);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (12,'Funko Pop! Star Wars Rebels Chopper #133 2017 Star Wars Celebration Exclusive','Star Wars','mint/unopened','',9.99,NULL,'2016-11-13T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/dT4AAOSwtZJZANQl/s-l500.jpg',1,2);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (13,'LEONARDO Basic Action Figure Teenage Mutant Ninja Turtles Playmates TMNT 90501','TMNT','good','',7.49,NULL,'2011-06-27T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/RYYAAOSwB-1YsNCH/s-l500.jpg',1,2);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (14,'Teenage Mutant Ninja Turtles Out Of The Shadows DONATELLO 11 Playmates NEW!','TMNT','mint/unopened','',12.99,NULL,'2017-01-24T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/q6oAAOSwX61ZA~Nu/s-l1600.jpg',1,2);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (15,'1986 Fleer Update #14 Barry Bonds Pittsburgh Pirates RC Rookie BGS 9 MINT','Baseball Card','fair','',0.50,NULL,'1986-11-04T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/iW0AAOSw0hlZFIbD/s-l1600.jpg',1,3);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (16,'PSA 9 MINT KEN GRIFFEY JR 1990 TOYS R US ROOKIES #13','Baseball Card','fair','',0.65,NULL,'1986-11-04T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/weQAAOSwmLlYBTsN/s-l1600.jpg',1,3);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (17,'United States Postage Stamp Scott CVP100 Unprinted Sheet Of 10','United States Postage Stamp','excellent','',3.99,NULL,'2015-11-19T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/jOMAAOSwjL5ZDxB2/s-l1600.jpg',1,5);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (18,'Morocco Scott #C7-C8 MNH King Hassan II CV$3+','Morocco Postage Stamp','good','',0.23,NULL,'2016-02-25T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/kRoAAOSw3gJZEmpV/s-l1600.jpg',1,5);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (19,'South Africa Blue Train Booklet with 10 stamps. MNH Mint Never Hinged','South Africa Blue Train','good','',0.75,NULL,'2016-02-25T06:00:00.000Z',NULL,NULL,0,'http://i.ebayimg.com/images/g/qXIAAOSwOgdYvIs5/s-l1600.jpg',1,5);
INSERT INTO `item` (`id`, `name`, `description`, `item_condition`, `notes`, `purchase_price`, `current_value`, `purchase_date`, `sold_date`, `sold_price`, `retired`, `image_url`, `user_id`, `category_id`) VALUES (20, 'Uncanny X-Men (1963 1st Series) #2 FR 1.0', 'Published 1963 by Marvel. Grade: FR 1.0', 'poor', 'I got this from a friend of mine on Christmas.', 0.12,NULL, '1963-11-02T09:00:00', '', NULL, 0, 'http://i.ebayimg.com/images/g/XbEAAOSww9xZA~V-/s-l1600.jpg', 1, 1);


COMMIT;


-- -----------------------------------------------------
-- Data for table `price`
-- -----------------------------------------------------
START TRANSACTION;
USE `collectorsdb`;
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (1,14.80,'2017-05-01T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (2,39.99,'2017-05-01T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (3,0.99,'2017-05-01T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (4,95.51,'2017-05-01T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (5,95.51,'2017-05-01T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (6,1.72,'2017-05-01T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (7,30.99,'2017-05-01T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (8,21.00,'2017-05-01T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (9,79.99,'2017-05-01T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (10,1.99,'2017-05-01T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (11,15.14,'2017-05-02T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (12,41.16,'2017-05-02T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (13,1.32,'2017-05-02T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (14,98.33,'2017-05-02T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (15,99.09,'2017-05-02T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (16,0.62,'2017-05-02T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (17,32.25,'2017-05-02T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (18,21.20,'2017-05-02T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (19,84.52,'2017-05-02T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (20,2.76,'2017-05-02T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (21,15.03,'2017-05-03T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (22,40.7,'2017-05-03T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (23,0.3,'2017-05-03T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (24,100.9,'2017-05-03T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (25,100.29,'2017-05-03T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (26,0.21,'2017-05-03T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (27,32.77,'2017-05-03T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (28,21.52,'2017-05-03T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (29,86.42,'2017-05-03T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (30,0.2,'2017-05-03T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (31,15.65,'2017-05-04T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (32,42.45,'2017-05-04T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (33,0.11,'2017-05-04T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (34,102.26,'2017-05-04T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (35,99.13,'2017-05-04T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (36,0.97,'2017-05-04T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (37,33.39,'2017-05-04T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (38,21.69,'2017-05-04T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (39,89.39,'2017-05-04T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (40,0.75,'2017-05-04T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (41,16.05,'2017-05-05T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (42,44.2,'2017-05-05T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (43,0.08,'2017-05-05T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (44,100.48,'2017-05-05T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (45,99.09,'2017-05-05T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (46,1.68,'2017-05-05T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (47,34.9,'2017-05-05T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (48,22.29,'2017-05-05T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (49,93.07,'2017-05-05T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (50,0.04,'2017-05-05T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (51,16.26,'2017-05-06T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (52,46.29,'2017-05-06T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (53,0.9,'2017-05-06T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (54,106.29,'2017-05-06T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (55,98.82,'2017-05-06T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (56,0.77,'2017-05-06T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (57,34.01,'2017-05-06T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (58,22.18,'2017-05-06T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (59,97.23,'2017-05-06T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (60,0.52,'2017-05-06T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (61,17.27,'2017-05-07T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (62,47.61,'2017-05-07T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (63,0.76,'2017-05-07T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (64,110.22,'2017-05-07T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (65,97.01,'2017-05-07T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (66,0.96,'2017-05-07T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (67,34.27,'2017-05-07T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (68,23.32,'2017-05-07T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (69,101.76,'2017-05-07T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (70,0.94,'2017-05-07T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (71,17.28,'2017-05-08T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (72,48.74,'2017-05-08T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (73,0.26,'2017-05-08T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (74,107.07,'2017-05-08T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (75,101.03,'2017-05-08T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (76,1.49,'2017-05-08T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (77,34.49,'2017-05-08T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (78,23.19,'2017-05-08T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (79,101.75,'2017-05-08T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (80,0.89,'2017-05-08T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (81,17.80,'2017-05-09T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (82,49.3,'2017-05-09T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (83,0.75,'2017-05-09T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (84,105.29,'2017-05-09T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (85,103.7,'2017-05-09T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (86,0.37,'2017-05-09T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (87,34.84,'2017-05-09T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (88,23.86,'2017-05-09T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (89,105.83,'2017-05-09T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (90,0.64,'2017-05-09T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (91,18.40,'2017-05-10T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (92,52.06,'2017-05-10T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (93,0.86,'2017-05-10T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (94,104.78,'2017-05-10T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (95,103.24,'2017-05-10T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (96,0.68,'2017-05-10T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (97,35.59,'2017-05-10T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (98,25.71,'2017-05-10T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (99,107.12,'2017-05-10T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (100,0.54,'2017-05-10T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (101,18.46,'2017-05-11T06:00:00.000Z',1);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (102,53.36,'2017-05-11T06:00:00.000Z',2);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (103,0.02,'2017-05-11T06:00:00.000Z',3);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (104,105.57,'2017-05-11T06:00:00.000Z',4);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (105,109.26,'2017-05-11T06:00:00.000Z',5);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (106,0.58,'2017-05-11T06:00:00.000Z',6);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (107,35.19,'2017-05-11T06:00:00.000Z',7);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (108,25.87,'2017-05-11T06:00:00.000Z',8);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (109,109.66,'2017-05-11T06:00:00.000Z',9);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (110,0.44,'2017-05-11T06:00:00.000Z',10);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (111,10.00,'2017-05-01T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (112,5.65,'2017-05-01T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (113,12.99,'2017-05-01T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (114,24.99,'2017-05-01T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (115,11.02,'2017-05-01T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (116,9.00,'2017-05-01T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (117,5.00,'2017-05-01T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (118,80.00,'2017-05-01T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (119,6.95,'2017-05-01T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (120,925.00,'2017-05-01T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (121,10.88,'2017-05-02T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (122,0.65,'2017-05-02T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (123,13.42,'2017-05-02T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (124,25.77,'2017-05-02T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (125,11.38,'2017-05-02T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (126,9.89,'2017-05-02T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (127,5.69,'2017-05-02T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (128,83.70,'2017-05-02T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (129,7.23,'2017-05-02T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (130,962.05,'2017-05-02T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (131,11.30,'2017-05-03T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (132,0.88,'2017-05-03T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (133,14.31,'2017-05-03T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (134,27.9,'2017-05-03T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (135,12.54,'2017-05-03T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (136,10.82,'2017-05-03T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (137,6.45,'2017-05-03T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (138,83.53,'2017-05-03T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (139,0.01,'2017-05-03T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (140,1016.79,'2017-05-03T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (141,11.71,'2017-05-04T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (142,0.37,'2017-05-04T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (143,14.59,'2017-05-04T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (144,29.16,'2017-05-04T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (145,13.8,'2017-05-04T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (146,11.33,'2017-05-04T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (147,0.53,'2017-05-04T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (148,84.55,'2017-05-04T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (149,0.31,'2017-05-04T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (150,1043.00,'2017-05-04T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (151,12.20,'2017-05-05T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (152,0.53,'2017-05-05T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (153,15.42,'2017-05-05T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (154,30.05,'2017-05-05T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (155,14.9,'2017-05-05T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (156,12.16,'2017-05-05T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (157,0.07,'2017-05-05T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (158,87.04,'2017-05-05T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (159,0.21,'2017-05-05T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (160,1017.14,'2017-05-05T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (161,12.28,'2017-05-06T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (162,0.67,'2017-05-06T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (163,15.16,'2017-05-06T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (164,31.39,'2017-05-06T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (165,15.95,'2017-05-06T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (166,12.27,'2017-05-06T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (167,0.53,'2017-05-06T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (168,89.59,'2017-05-06T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (169,0.02,'2017-05-06T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (170,1050.65,'2017-05-06T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (171,12.45,'2017-05-07T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (172,0.3,'2017-05-07T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (173,15.62,'2017-05-07T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (174,33.05,'2017-05-07T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (175,16.59,'2017-05-07T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (176,12.78,'2017-05-07T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (177,0.09,'2017-05-07T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (178,88.63,'2017-05-07T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (179,0.94,'2017-05-07T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (180,1025.70,'2017-05-07T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (181,13.67,'2017-05-08T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (182,0.69,'2017-05-08T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (183,16.63,'2017-05-08T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (184,34.65,'2017-05-08T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (185,17.06,'2017-05-08T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (186,13.90,'2017-05-08T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (187,0.68,'2017-05-08T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (188,86.58,'2017-05-08T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (189,0.86,'2017-05-08T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (190,1046.39,'2017-05-08T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (191,14.89,'2017-05-09T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (192,0.97,'2017-05-09T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (193,17.44,'2017-05-09T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (194,35.08,'2017-05-09T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (195,18.24,'2017-05-09T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (196,14.12,'2017-05-09T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (197,0.52,'2017-05-09T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (198,84.92,'2017-05-09T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (199,0.63,'2017-05-09T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (200,1024.04,'2017-05-09T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (201,15.41,'2017-05-10T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (202,1.04,'2017-05-10T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (203,18.94,'2017-05-10T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (204,36.38,'2017-05-10T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (205,18.84,'2017-05-10T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (206,14.02,'2017-05-10T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (207,0.87,'2017-05-10T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (208,86.65,'2017-05-10T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (209,0.85,'2017-05-10T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (210,999.64,'2017-05-10T06:00:00.000Z',20);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (211,15.68,'2017-05-11T06:00:00.000Z',11);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (212,0.85,'2017-05-11T06:00:00.000Z',12);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (213,20.05,'2017-05-11T06:00:00.000Z',13);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (214,37.52,'2017-05-11T06:00:00.000Z',14);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (215,19.78,'2017-05-11T06:00:00.000Z',15);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (216,14.30,'2017-05-11T06:00:00.000Z',16);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (217,0.35,'2017-05-11T06:00:00.000Z',17);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (218,90.55,'2017-05-11T06:00:00.000Z',18);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (219,0.29,'2017-05-11T06:00:00.000Z',19);
INSERT INTO `price` (`id`, `item_price`, `date`, `item_id`) VALUES (220,1014.73,'2017-05-11T06:00:00.000Z',20);

COMMIT;
