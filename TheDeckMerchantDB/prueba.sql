-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2021 a las 22:57:13
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `thedeckmerchant`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `calle` VARCHAR(255) DEFAULT NULL,
  `c_postal` VARCHAR(255) DEFAULT NULL,
  `ciudad` VARCHAR(255) DEFAULT NULL,
  `provincia` VARCHAR(255) DEFAULT NULL,
  `pais` VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `calle`, `c_postal`, `ciudad`, `provincia`, `pais`) 
VALUES (1, "Av. Rajolar 3, 27", "46100", "Burjassot", "Valencia", "España");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `redes` (
  `id_redes` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `rrss1` VARCHAR(255) DEFAULT NULL,
  `rrss2` VARCHAR(255) DEFAULT NULL,
  `rrss3` VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `redes`
--

INSERT INTO `redes` (`id_redes`, `id_usuario`, `rrss1`, `rrss2`, `rrss3`) 
VALUES (1, 1, "@jaumoso", "@jaumoso", NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contrasenya` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `apellido1` varchar(255) DEFAULT NULL,
  `apellido2` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `admin` SMALLINT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_direccion`, `email`, `contrasenya`, `usuario`, `nombre`, `apellido1`, `apellido2`, `fecha_alta`, `admin`) 
VALUES (1, 1, "jaumosoelpro@gmail.com", "123456789", "jaumoso", "Jaume", "Civera", "Soriano", "2022-11-20", 1);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `tema` varchar(255) DEFAULT NULL,
  `formato` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `tema`, `formato`) 
VALUES (1, "Pokémon", "Stacks");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coleccion`
--

CREATE TABLE `coleccion` (
  `id_coleccion` int(11) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `anyo` int(11) DEFAULT NULL,
  `editorial` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coleccion`
--

INSERT INTO coleccion (`id_coleccion`,`id_tipo`, `nombre`, `descripcion`, `anyo`, `editorial`, `idioma`) 
VALUES (1, 1, "Pokémon Stacks 2006", "Stacks de pokémon del año 2006, por panini", 2006, "Panini", "español");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento`
--

CREATE TABLE `elemento` (
  `id_elemento` int(11) NOT NULL,
  `id_coleccion` int(11) DEFAULT NULL,
  `id_relativo` varchar(255) DEFAULT NULL, -- Puede ser varchar o int
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `elemento`
--

INSERT INTO `elemento` (`id_elemento`,`id_coleccion`,`id_relativo`, `nombre`, `descripcion`) 
VALUES (1, 1, "001", "Bulbasaur 001", "Stack de bulbasaur descripcion");


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biblioteca`
--

CREATE TABLE `biblioteca` (
  `id_biblioteca` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `elemento` int(11) DEFAULT NULL,
  `lotengo` SMALLINT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `biblioteca`
--

INSERT INTO `biblioteca` (`id_biblioteca`, `id_usuario`, `elemento`, `lotengo`) 
VALUES (1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento_biblioteca`
--

CREATE TABLE `elemento_biblioteca` (
  `id_elemento` int(11) NOT NULL,
  `id_biblioteca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `elemento_biblioteca`
--

INSERT INTO `elemento_biblioteca` (`id_elemento`, `id_biblioteca`) 
VALUES (1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento_de_biblioteca`
--

CREATE TABLE `elemento_de_biblioteca` (
  `id_elemento_de_biblioteca` int(11) NOT NULL,
  `id_elemento` int(11) DEFAULT NULL,
  `id_biblioteca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `elemento_de_biblioteca`
--

INSERT INTO `elemento_de_biblioteca` (`id_elemento_de_biblioteca`, `id_elemento`, `id_biblioteca`) 
VALUES (1,1,1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) 
VALUES 
(1, "Nuevo"),
(1, "En buen estado"),
(1, "Gastado"),
(1, "En mal estado"),
(1, "Roto");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncio`
--

CREATE TABLE `anuncio` (
  `id_anuncio` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_elemento_de_biblioteca` int(11) DEFAULT NULL,
  `precio` varchar(255) DEFAULT NULL,
  `descripcion` varchar(750) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `anuncio`
--

INSERT INTO `anuncio` (`id_anuncio`, `id_usuario`, `id_estado`, `id_elemento_de_biblioteca`, `precio`, `descripcion`) 
VALUES (1, 1, 1, 1, 3.89, "Este stack me lo dio mi abuela. Lo vendo porque es feísimo. Solo gente seria.");

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`,`id_direccion`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`id_redes`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `coleccion`
--
ALTER TABLE `coleccion`
  ADD PRIMARY KEY (`id_coleccion`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`id_elemento`),
  ADD KEY `id_coleccion` (`id_elemento`);
  
--
-- Indices de la tabla `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD PRIMARY KEY (`id_biblioteca`),
  ADD KEY `id_elemento` (`id_elemento`),
  ADD KEY `id_id_usuario` (`id_usuario`);
  
--
-- Indices de la tabla `elemento_biblioteca`
--
ALTER TABLE `elemento_biblioteca`
  ADD KEY `id_elemento` (`id_elemento`),
  ADD KEY `id_biblioteca` (`id_biblioteca`);
  
--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `elemento_de_biblioteca`
  ADD PRIMARY KEY `id_elemento_de_biblioteca` (`id_elemento_de_biblioteca`),
  ADD KEY `id_biblioteca` (`id_biblioteca`),
  ADD KEY `id_elemento` (`id_elemento`);
  
--
-- Indices de la tabla `anuncio`
--
ALTER TABLE `anuncio`
  ADD PRIMARY KEY `id_anuncio` (`id_anuncio`),
  ADD KEY `id_elemento_de_biblioteca` (`id_elemento_de_biblioteca`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_usuario` (`id_usuario`);
  
  


--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `id_redes` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `coleccion`
--
ALTER TABLE `coleccion`
  MODIFY `id_coleccion` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `elemento`
--
ALTER TABLE `elemento`
  MODIFY `id_elemento` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `id_biblioteca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `elemento_de_biblioteca`
--
ALTER TABLE `elemento_de_biblioteca`
  MODIFY `id_elemento_de_biblioteca` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT de la tabla `anuncio`
--
ALTER TABLE `anuncio`
  MODIFY `anuncio` int(11) NOT NULL AUTO_INCREMENT;






--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

--
-- Filtros para la tabla `coleccion`
--
ALTER TABLE `coleccion`
  ADD CONSTRAINT `coleccion_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`);
  
--
-- Filtros para la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD CONSTRAINT `elemento_ibfk_1` FOREIGN KEY (`id_coleccion`) REFERENCES `coleccion` (`id_coleccion`);
  
--
-- Filtros para la tabla `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD CONSTRAINT `biblioteca_ibfk_1` FOREIGN KEY (`id_elemento`) REFERENCES `elemento` (`id_elemento`),
  ADD CONSTRAINT `biblioteca_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);


--
-- Filtros para la tabla `elemento_biblioteca`
--
ALTER TABLE `elemento_biblioteca`
  ADD CONSTRAINT `elemento_biblioteca_ibfk_1` FOREIGN KEY (`id_elemento`) REFERENCES `elemento` (`id_elemento`),
  ADD CONSTRAINT `elemento_biblioteca_ibfk_2` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`);
  

--
-- Filtros para la tabla `elemento_de_biblioteca`
--
ALTER TABLE `elemento_de_biblioteca`
  ADD CONSTRAINT `elemento_de_biblioteca_ibfk_1` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id_biblioteca`),
  ADD CONSTRAINT `elemento_de_biblioteca_ibfk_2` FOREIGN KEY (`id_elemento`) REFERENCES `elemento` (`id_elemento`);
  
--
-- Filtros para la tabla `anuncio`
--
ALTER TABLE `anuncio`
  ADD CONSTRAINT `anuncio_ibfk_1` FOREIGN KEY (`id_elemento_de_biblioteca`) REFERENCES `elemento_de_biblioteca` (`id_elemento_de_biblioteca`),
  ADD CONSTRAINT `anuncio_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `anuncio_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

  
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;