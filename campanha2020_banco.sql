-- -----------------------------------------------------
-- Schema campanha2020
-- -----------------------------------------------------

CREATE database IF NOT EXISTS campanha2020 DEFAULT CHARACTER SET utf8mb4 ;

USE campanha2020 ;
-- -----------------------------------------------------
-- Table Estados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS estados (
  id INT AUTO_INCREMENT,
  estado VARCHAR(50),
  sigla VARCHAR(2),
  PRIMARY KEY (id))
ENGINE=InnoDB CHARSET = utf8mb4;
-- -----------------------------------------------------
-- Table cidades
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cidades (
  id INT AUTO_INCREMENT,
  cidade VARCHAR(60),
  estado INT,
  PRIMARY KEY (id),
  FOREIGN KEY (estado) REFERENCES estados(id))
ENGINE = InnoDB CHARSET=utf8mb4;

-- -----------------------------------------------------
-- Table usuarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT,
  email VARCHAR(60),
  snhpwd VARCHAR(512),
  ativo BOOLEAN DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE(email))
  ENGINE = InnoDB CHARSET = utf8mb4;
-- -----------------------------------------------------
-- Table campanhas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS campanhas (
  id INT AUTO_INCREMENT,
  candidato VARCHAR(50),
  estado INT,
  cidade INT,
  PRIMARY KEY (id),
  FOREIGN KEY (estado) REFERENCES estados(id),
  FOREIGN KEY (cidade) REFERENCES cidades(id))
ENGINE = InnoDB CHARSET = utf8mb4;
-- -----------------------------------------------------
-- Table typeuser
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS typeuser (
  id INT AUTO_INCREMENT,
  tipo VARCHAR(50),
  PRIMARY KEY (id))
ENGINE = InnoDB CHARSET = utf8mb4;

-- -----------------------------------------------------
-- Table licencetype
-- -----------------------------------------------------
create table licencetype(
id int auto_increment,
typelicence varchar(30),
primary key(id))
ENGINE = InnoDB CHARSET = utf8mb4;
-- -----------------------------------------------------
-- Table userlicence
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS userlicence (
  id INT AUTO_INCREMENT,
  emailid INT,
  usertype INT,
  dtactivation DATETIME DEFAULT CURRENT_TIMESTAMP,
  licencecode TEXT,
  licencetype int,
  PRIMARY KEY (id),
  FOREIGN KEY (emailid) REFERENCES usuarios(id),
  FOREIGN KEY (usertype) REFERENCES typeuser(id),
  FOREIGN KEY (licencetype) REFERENCES licencetype(id))
ENGINE = InnoDB CHARSET = utf8mb4;

