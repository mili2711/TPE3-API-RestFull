-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2024 a las 01:30:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_songs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(200) NOT NULL,
  `artist_img` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_name`, `artist_img`) VALUES
(11, 'Daft Punk', ''),
(12, 'Andres Calamaro', ''),
(13, 'Sonic Youth', ''),
(14, 'Roosvelt', ''),
(15, 'Luis Alberto Spinetta', 'asdfsd'),
(16, 'Charly García', ''),
(17, 'Sumo', ''),
(18, 'Los Piojos', ''),
(19, 'Oasis', ''),
(20, 'Radiohead', ''),
(21, 'Conociendo Rusia', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `review`
--

CREATE TABLE `review` (
  `id_review` int(11) NOT NULL,
  `song_name` varchar(20) NOT NULL,
  `rating` tinyint(10) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `review`
--

INSERT INTO `review` (`id_review`, `song_name`, `rating`, `comment`) VALUES
(1, 'Giorgio by Moroder', 9, 'Excelente colaboración, el sonido es fresco y moderno.'),
(2, 'Symphonia IX', 10, 'Sin duda, esta versión supera a la original que fue compuesta por Grimes.'),
(3, 'Walkaway Blues', 10, 'Una de las mejores canciones de este artista, la melodía es adictiva.'),
(4, 'Just Like You', 7, 'Descuidada y audaz. Viagra Boys nunca defrauda.'),
(5, 'YOU MAKE ME FEEL LIK', 6, 'No sé qué estaban pensando cuando compusieron esta canción, pero es genial de todos modos.'),
(6, 'You And Whose Army?', 8, 'Una pieza maestra que muestra todo el talento de la banda.'),
(7, 'Heridas Dulces', 9, 'Un tema hermoso para bailar en el verano.'),
(8, 'Smile', 10, 'Imposible que no te sientas feliz escuchando esta preciosa canción.'),
(9, 'sometimes', 10, 'Una absoluta obra maestra. Inigualable.'),
(10, 'Jugo', 8, 'Este álbum es increíblemente cohesivo, cada canción fluye de maravilla.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song`
--

CREATE TABLE `song` (
  `song_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `song_name` varchar(250) NOT NULL,
  `song_genre` varchar(200) NOT NULL,
  `song_year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `song`
--

INSERT INTO `song` (`song_id`, `artist_id`, `song_name`, `song_genre`, `song_year`) VALUES
(15, 13, 'Kool Thing', 'Alternative Rock', 1990),
(17, 11, 'Instant Crush (feat. Julian Casablancas)', 'Electronic', 2013),
(18, 11, 'Something About Us', 'Electronic', 2001),
(30, 12, 'El tercio de los sueños', 'Rock', 1997),
(31, 18, 'Te diria', 'Rock', 1994),
(32, 18, 'Al atardecer', 'Rock', 1996),
(33, 20, 'My Iron Lung', 'Alternative Rock', 1994),
(34, 19, 'Cigarettes &amp; Alcohol', 'Rock, Britpop', 1994);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_password` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`) VALUES
(1, 'webadmin', '$2y$10$kQqfeP5/j7VqcZeQ03kNdOCvRcV1iMMeu3XgM5kEHL6OLB/bjlFba');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indices de la tabla `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_review`);

--
-- Indices de la tabla `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`song_id`),
  ADD KEY `artist_id` (`artist_id`) USING BTREE;

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `review`
--
ALTER TABLE `review`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `song`
--
ALTER TABLE `song`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `fk_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
