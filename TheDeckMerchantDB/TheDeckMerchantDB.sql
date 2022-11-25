DROP DATABASE IF EXISTS TheDeckMerchantDB; 
CREATE DATABASE TheDeckMerchantDB CHARACTER SET utf8mb4;
USE TheDeckMerchantDB;

CREATE TABLE direccion (
    id_direccion INT NOT NULL AUTO_INCREMENT,
    calle VARCHAR(255),
    c_postal VARCHAR(255),
    ciudad VARCHAR(255),
    provincia VARCHAR(255),
    pais VARCHAR(255),
    PRIMARY KEY (id_direccion)
);

CREATE TABLE redes (
    id_redes INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    rrss1 VARCHAR(255),
    rrss2 VARCHAR(255),
    rrss3 VARCHAR(255),
    PRIMARY KEY (id_redes)
    CONSTRAINT fk_id_redes FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    id_direccion INT NOT NULL,
    email VARCHAR(255),
    contrasenya VARCHAR(255),
    usuario VARCHAR(255),
    nombre VARCHAR(255),
    apellido1 varchar(255),
    apellido2 varchar(255),
    rrss1 VARCHAR(255),
    rrss2 VARCHAR(255),
    rrss3 VARCHAR(255),
    fecha_alta DATE,
    admin INT,
    PRIMARY KEY (id_usuario),
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_direccion) REFERENCES direccion (id_direccion)
);


CREATE TABLE tipo (
    id_tipo INT NOT NULL AUTO_INCREMENT,
    tema VARCHAR(255),
    formato VARCHAR(255),
    PRIMARY KEY (id_tipo)
);

CREATE TABLE coleccion (
    id_coleccion INT NOT NULL,
    id_tipo INT NOT NULL,
    nombre VARCHAR(255),
    descripcion VARCHAR(2000),
    anyo INT,
    editorial VARCHAR(255),
    idioma VARCHAR(255),
    PRIMARY KEY (id_coleccion),
    CONSTRAINT fk_id_tipo FOREIGN KEY (id_tipo) REFERENCES tipo (id_tipo)
);

CREATE TABLE elemento (
    id_elemento INT NOT NULL,
    id_relativo INT NOT NULL, -- ESTE ID ES PARA IDENTIFICAR EL ELEMENTO DENTRO DE LA COLECCION
    nombre varchar(255),
    descripcion VARCHAR(2000),
    PRIMARY KEY (id_elemento)
);

CREATE TABLE biblioteca (
    id_biblioteca INT NOT NULL,
    id_usuario INT NOT NULL,
    lotengo BOOLEAN,
    PRIMARY KEY (id_biblioteca),
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE elemento_de_biblioteca (
    id_elemento_de_biblioteca INT NOT NULL,
    id_biblioteca INT NOT NULL,
    id_elemento INT NOT NULL,
    PRIMARY KEY (id_elemento_de_biblioteca),
    CONSTRAINT fk_id_biblioteca FOREIGN KEY (id_biblioteca) REFERENCES biblioteca (id_biblioteca),
    CONSTRAINT fk_id_elemento FOREIGN KEY (id_elemento) REFERENCES elemento (id_elemento)
);

CREATE TABLE estado (
    id_estado INT NOT NULL,
    estado VARCHAR(255),
    PRIMARY KEY (id_estado)
);

CREATE TABLE anuncio (
    id_anuncio INT NOT NULL,
    id_estado INT NOT NULL,
    id_usuario INT NOT NULL,
    precio float NOT NULL,
    descripcion VARCHAR(500),
    PRIMARY KEY (id_anuncio),
    CONSTRAINT fk_id_estado FOREIGN KEY (id_estado) REFERENCES estado (id_estado),
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);


INSERT INTO direccion (id_direccion, calle, c_postal, ciudad, provincia, pais) 
VALUES (1, "Av. Rajolar 3, 27", "46100", "Burjassot", "Valencia", "España");

INSERT INTO redes (id_redes, id_usuario, rrss1, rrss2, rrss3)
VALUES (1, 1, "@jaumoso", "@jaumoso", NULL);

INSERT INTO usuario (id_usuario, email, contrasenya, usuario, nombre, apellido1, apellido2, fecha_alta, admin) 
VALUES (1, "jaumosoelpro@gmail.com", "123456789", "jaumoso", "Jaume", "Civera", "Soriano", "2022-11-20", 1);

INSERT INTO tipo (id_tipo, tema, formato) 
VALUES (1, "Pokémon", "Stacks");

INSERT INTO coleccion (id_coleccion, id_tipo, nombre, descripcion, anyo, editorial, idioma) 
VALUES (1, 1, "Pokémon Stacks 2006", "Stacks de pokémon del año 2006, por panini", 2006, "Panini", "español");

INSERT INTO elemento (id_elemento, id_coleccion, id_relativo, nombre, descripcion)
VALUES (1, 1, "001", "Bulbasaur 001", "Stack de bulbasaur descripcion");

INSERT INTO biblioteca (id_biblioteca, id_elemento, id_usuario, lotengo) 
VALUES (1, 1, 1, 1);

INSERT INTO elemento_biblioteca (id_biblioteca, id_elemento) 
VALUES (1, 1);

INSERT INTO estado (id_estado, estado) 
VALUES (1, "Nuevo");

INSERT INTO elemento_de_biblioteca(id_elemento_de_biblioteca, id_biblioteca, id_elemento) 
VALUES (1, 1, 1);

INSERT INTO anuncio (id_anuncio, id_elemento_biblioteca, id_estado, id_usuario, precio, descripcion) 
VALUES (1, 1, 1, 1, 3.89, "Este stack me lo dio mi abuela. Lo vendo porque es feísimo. Solo gente seria.");