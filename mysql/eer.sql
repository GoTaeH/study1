-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db1` ;

-- -----------------------------------------------------
-- Table `db1`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`user_info` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `uid_UNIQUE` (`uid` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db1`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`user_info` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `uid_UNIQUE` (`uid` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db1`.`bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`bank` (
  `bankid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`bankid`),
  UNIQUE INDEX `bankid_UNIQUE` (`bankid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db1`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`account` (
  `accid` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NOT NULL,
  `user_info_uid` INT NOT NULL,
  `bank_bankid` INT NOT NULL,
  PRIMARY KEY (`accid`),
  UNIQUE INDEX `accid_UNIQUE` (`accid` ASC) VISIBLE,
  INDEX `fk_account_user_info_idx` (`user_info_uid` ASC) VISIBLE,
  INDEX `fk_account_bank1_idx` (`bank_bankid` ASC) VISIBLE,
  CONSTRAINT `fk_account_user_info`
    FOREIGN KEY (`user_info_uid`)
    REFERENCES `db1`.`user_info` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_bank1`
    FOREIGN KEY (`bank_bankid`)
    REFERENCES `db1`.`bank` (`bankid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db1`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`card` (
  `cardnum` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `user_info_uid` INT NOT NULL,
  `account_accid` INT NOT NULL,
  `bank_bankid` INT NOT NULL,
  UNIQUE INDEX `cardnum_UNIQUE` (`cardnum` ASC) VISIBLE,
  PRIMARY KEY (`cardnum`),
  INDEX `fk_card_user_info1_idx` (`user_info_uid` ASC) VISIBLE,
  INDEX `fk_card_account1_idx` (`account_accid` ASC) VISIBLE,
  INDEX `fk_card_bank1_idx` (`bank_bankid` ASC) VISIBLE,
  CONSTRAINT `fk_card_user_info1`
    FOREIGN KEY (`user_info_uid`)
    REFERENCES `db1`.`user_info` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_account1`
    FOREIGN KEY (`account_accid`)
    REFERENCES `db1`.`account` (`accid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_bank1`
    FOREIGN KEY (`bank_bankid`)
    REFERENCES `db1`.`bank` (`bankid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db1`.`deposit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`deposit` (
  `deposit_id` INT NOT NULL AUTO_INCREMENT,
  `info` VARCHAR(255) NOT NULL,
  `user_info_uid` INT NULL,
  `bank_bankid` INT NOT NULL,
  PRIMARY KEY (`deposit_id`),
  UNIQUE INDEX `deposit_id_UNIQUE` (`deposit_id` ASC) VISIBLE,
  INDEX `fk_deposit_user_info1_idx` (`user_info_uid` ASC) VISIBLE,
  INDEX `fk_deposit_bank1_idx` (`bank_bankid` ASC) VISIBLE,
  CONSTRAINT `fk_deposit_user_info1`
    FOREIGN KEY (`user_info_uid`)
    REFERENCES `db1`.`user_info` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deposit_bank1`
    FOREIGN KEY (`bank_bankid`)
    REFERENCES `db1`.`bank` (`bankid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db1`.`loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`loan` (
  `loanid` VARCHAR(45) NOT NULL,
  `amount` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  `user_info_uid` INT NULL,
  `bank_bankid` INT NOT NULL,
  PRIMARY KEY (`loanid`, `bank_bankid`),
  UNIQUE INDEX `loanid_UNIQUE` (`loanid` ASC) VISIBLE,
  INDEX `fk_loan_user_info1_idx` (`user_info_uid` ASC) VISIBLE,
  INDEX `fk_loan_bank1_idx` (`bank_bankid` ASC) VISIBLE,
  CONSTRAINT `fk_loan_user_info1`
    FOREIGN KEY (`user_info_uid`)
    REFERENCES `db1`.`user_info` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_bank1`
    FOREIGN KEY (`bank_bankid`)
    REFERENCES `db1`.`bank` (`bankid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db1`.`bank_has_user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db1`.`bank_has_user_info` (
  `bank_bankid` INT NOT NULL,
  `user_info_uid` INT NOT NULL,
  PRIMARY KEY (`bank_bankid`, `user_info_uid`),
  INDEX `fk_bank_has_user_info_user_info1_idx` (`user_info_uid` ASC) VISIBLE,
  INDEX `fk_bank_has_user_info_bank1_idx` (`bank_bankid` ASC) VISIBLE,
  CONSTRAINT `fk_bank_has_user_info_bank1`
    FOREIGN KEY (`bank_bankid`)
    REFERENCES `db1`.`bank` (`bankid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bank_has_user_info_user_info1`
    FOREIGN KEY (`user_info_uid`)
    REFERENCES `db1`.`user_info` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
