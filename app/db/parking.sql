-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2023 a las 06:38:57
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parking`
--
CREATE DATABASE IF NOT EXISTS `parking` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `parking`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores_autos`
--

CREATE TABLE `colores_autos` (
  `id` int(10) NOT NULL,
  `color` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamientos`
--

CREATE TABLE `estacionamientos` (
  `id` int(10) NOT NULL,
  `estacionamiento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_parking`
--

CREATE TABLE `historico_parking` (
  `id` int(10) NOT NULL,
  `id_registro_auto` int(10) NOT NULL,
  `feha_entrada` datetime NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `id_lugar_estacionamiento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares_estacionamientos`
--

CREATE TABLE `lugares_estacionamientos` (
  `id` int(10) NOT NULL,
  `id_estacionamiento` int(10) NOT NULL,
  `lugar` varchar(10) NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas_autos`
--

CREATE TABLE `marcas_autos` (
  `id` int(10) NOT NULL,
  `marca` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_marca`
--

CREATE TABLE `modelo_marca` (
  `id` int(10) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `id_marca` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_autos`
--

CREATE TABLE `registro_autos` (
  `id` int(10) NOT NULL,
  `matricula` varchar(8) NOT NULL,
  `id_marca_modelo` int(10) NOT NULL,
  `id_color` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colores_autos`
--
ALTER TABLE `colores_autos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estacionamientos`
--
ALTER TABLE `estacionamientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historico_parking`
--
ALTER TABLE `historico_parking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_registro_auto` (`id_registro_auto`),
  ADD KEY `id_lugar_estacionamiento` (`id_lugar_estacionamiento`);

--
-- Indices de la tabla `lugares_estacionamientos`
--
ALTER TABLE `lugares_estacionamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estacionamiento` (`id_estacionamiento`);

--
-- Indices de la tabla `marcas_autos`
--
ALTER TABLE `marcas_autos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelo_marca`
--
ALTER TABLE `modelo_marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `registro_autos`
--
ALTER TABLE `registro_autos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca_modelo` (`id_marca_modelo`),
  ADD KEY `id_color` (`id_color`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colores_autos`
--
ALTER TABLE `colores_autos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estacionamientos`
--
ALTER TABLE `estacionamientos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historico_parking`
--
ALTER TABLE `historico_parking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugares_estacionamientos`
--
ALTER TABLE `lugares_estacionamientos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas_autos`
--
ALTER TABLE `marcas_autos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelo_marca`
--
ALTER TABLE `modelo_marca`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_autos`
--
ALTER TABLE `registro_autos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historico_parking`
--
ALTER TABLE `historico_parking`
  ADD CONSTRAINT `historico_parking_ibfk_1` FOREIGN KEY (`id_registro_auto`) REFERENCES `registro_autos` (`id`),
  ADD CONSTRAINT `historico_parking_ibfk_2` FOREIGN KEY (`id_lugar_estacionamiento`) REFERENCES `lugares_estacionamientos` (`id`);

--
-- Filtros para la tabla `lugares_estacionamientos`
--
ALTER TABLE `lugares_estacionamientos`
  ADD CONSTRAINT `lugares_estacionamientos_ibfk_1` FOREIGN KEY (`id_estacionamiento`) REFERENCES `estacionamientos` (`id`);

--
-- Filtros para la tabla `modelo_marca`
--
ALTER TABLE `modelo_marca`
  ADD CONSTRAINT `modelo_marca_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas_autos` (`id`);

--
-- Filtros para la tabla `registro_autos`
--
ALTER TABLE `registro_autos`
  ADD CONSTRAINT `registro_autos_ibfk_1` FOREIGN KEY (`id_marca_modelo`) REFERENCES `modelo_marca` (`id`),
  ADD CONSTRAINT `registro_autos_ibfk_2` FOREIGN KEY (`id_color`) REFERENCES `colores_autos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
