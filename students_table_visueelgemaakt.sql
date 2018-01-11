-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema student_table_visueel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student_table_visueel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_table_visueel` DEFAULT CHARACTER SET utf8 ;
USE `student_table_visueel` ;

-- -----------------------------------------------------
-- Table `student_table_visueel`.`Trajectories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_table_visueel`.`Trajectories` (
  `Trajectory ID` INT NOT NULL,
  `Trajectory` VARCHAR(45) NULL,
  PRIMARY KEY (`Trajectory ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_table_visueel`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_table_visueel`.`Students` (
  `Student_number` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `Birthdate` DATE NULL,
  `Sex` ENUM('M', 'F') NULL,
  `Trajectory ID` INT NOT NULL,
  PRIMARY KEY (`Student_number`),
  INDEX `Trajectory ID_idx` (`Trajectory ID` ASC),
  CONSTRAINT `Trajectory ID`
    FOREIGN KEY (`Trajectory ID`)
    REFERENCES `student_table_visueel`.`Trajectories` (`Trajectory ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_table_visueel`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_table_visueel`.`Courses` (
  `course ID` INT NOT NULL,
  `Course` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  PRIMARY KEY (`course ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_table_visueel`.`Course_of _student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_table_visueel`.`Course_of _student` (
  `ID` INT NOT NULL,
  `course ID` INT NOT NULL,
  `Student_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `course ID_idx` (`course ID` ASC),
  INDEX `Student_id_idx` (`Student_id` ASC),
  CONSTRAINT `course ID`
    FOREIGN KEY (`course ID`)
    REFERENCES `student_table_visueel`.`Courses` (`course ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Student_id`
    FOREIGN KEY (`Student_id`)
    REFERENCES `student_table_visueel`.`Students` (`Student_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
