CREATE SCHEMA PORTALDB;

CREATE TABLE `PORTALDB`.`ROLE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ROLE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `PORTALDB`.`user` (
	`PKID` INT NOT NULL AUTO_INCREMENT,
	`FIRST_NAME` VARCHAR(400),
	`LAST_NAME` VARCHAR(400),
	`PASSWORD` VARCHAR(400),
	`EMAIL` VARCHAR(400) NOT NULL,
	`ROLE_ID` VARCHAR(100) NOT NULL,
  	FOREIGN KEY (ROLE_ID) REFERENCES `PORTALDB`.`ROLE`(ID),
	PRIMARY KEY (`PKID`)
);

CREATE TABLE `PORTALDB`.`JOBS` (
	`PKID` INT NOT NULL AUTO_INCREMENT,
	`JOB_CATEGORY` VARCHAR(400) NOT NULL,
	`JOB_CODE` VARCHAR(400) NOT NULL,
	`JOB_TITLE` VARCHAR(400) NOT NULL,
	`JOB_LOCATION` VARCHAR(400) NOT NULL,
	`JOB_TYPE` VARCHAR(400) NOT NULL,
	`JOB_REQUIREMENTS` VARCHAR(400) NOT NULL,
	`JOB_DESCRIPTION` VARCHAR(2000) NOT NULL,
	
	PRIMARY KEY (`PKID`)
);



