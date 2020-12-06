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
-- Table tiposconta
-- -----------------------------------------------------
create table tipoconta(
tipo varchar()
)engine=innodb charset=utf8mb4;
-- -----------------------------------------------------
-- Table usuarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT,
  email VARCHAR(60),
  snhpwd VARCHAR(512),
  ativo BOOLEAN DEFAULT '0',
  tipoconta int,
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
  unique(licencecode),
  FOREIGN KEY (emailid) REFERENCES usuarios(id),
  FOREIGN KEY (usertype) REFERENCES typeuser(id),
  FOREIGN KEY (licencetype) REFERENCES licencetype(id))
ENGINE = InnoDB CHARSET = utf8mb4;

create table simpatizantes (
id int auto_increment,
licendecode text,
nome varchar(75),
cidade estado int,
cidade int,
bairro varchar(75),
logradouro varchar(150),
numero varchar(15),
complemento varchar(150),
hastags text,
coordenadas text,
primary key(id)) engine=innodb charset=utf8mb4;

create table tiporecurso

create table recursos(
id int auto_increment,
campanha text,
tiporecurso int,
nome varchar(45),
descricao text,
valor double(6,2)
primary key(id))engine=innodb charset utf8mb4;

-- https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyDlDBpi5f5xdGjAAIJC14_2fIQYkrnpwjs&address=carneiro+leao+9,mogi+cruzes,SP

create table contas (
id int auto_increment,
nome varchar(75),
email varchar(60),
estado int
cidade int,
unique(email),
foreign key(estado) references estados(id)
primary key(id))engine=innodb charset=utf8mb4;

create table candidatura_tipo(
para varchar(30),
primary key(para)
)engine=innodb charset=utf8mb4;

create table candidaturas (
id int auto_increment,
candidato int,
tipocandidatura varchar(30),
primary key(id),
foreign key(tipocandidatura) references candidatura_tipo(para)
)engine=innodb charset=utf8mb4;

create table propostascampanha( 
id int auto_increment,
proposta text,
candidatura int,
primary key(id)
)engine=innodb charset=utf8mb4;

create table eleitor (
id int auto_increment,
nome varchar(75),
estado int,
cidade int,
bairro varchar(75),
logradouro int,
numero varchar(15),
complemento varchar(150),
cpf bigint(11),
email varchar(60),
accountlogin boolean default 0,
cadfor varchar(150),
primary key(id),
unique (cpf),
unique (email)
)engine=innodb charset=utf8mb4;
