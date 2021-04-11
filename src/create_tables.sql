-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `currency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `currency` (
  `id_iso4217` INT NOT NULL,
  `code_iso4217` VARCHAR(3) NOT NULL,
  `symbol` VARCHAR(16) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `obsolete` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_iso4217`))
ENGINE = InnoDB;

                                
-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `country` (
  `id_iso3166` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `code_alpha2` VARCHAR(2) NOT NULL,
  `code_alpha3` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`id_iso3166`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `country_has_currency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `country_has_currency` (
  `country_id_iso3166` INT NOT NULL,
  `currency_id_iso4217` INT NOT NULL,
  INDEX `fk_country_has_currency_currency1_idx` (`currency_id_iso4217` ASC),
  INDEX `fk_country_has_currency_country_idx` (`country_id_iso3166` ASC),
  CONSTRAINT `fk_country_has_currency_country`
    FOREIGN KEY (`country_id_iso3166`)
    REFERENCES `country` (`id_iso3166`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_has_currency_currency1`
    FOREIGN KEY (`currency_id_iso4217`)
    REFERENCES `currency` (`id_iso4217`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
