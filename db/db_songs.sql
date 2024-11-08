-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2024 a las 17:13:29
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
  `song_id` int(11) NOT NULL,
  `rating` tinyint(10) UNSIGNED NOT NULL,
  `comment` varchar(100) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `review`
--

INSERT INTO `review` (`id_review`, `song_id`, `rating`, `comment`) VALUES
(1, 0, 6, 'La canción tiene una gran energía, pero la letra es algo superficial.'),
(2, 0, 9, 'Una de las mejores canciones de este artista, la melodía es adictiva.'),
(3, 0, 5, 'El ritmo es pegajoso, pero la voz del cantante no me convence.'),
(4, 0, 8, 'Excelente colaboración, el sonido es fresco y moderno.'),
(5, 0, 7, 'La canción es emocional, pero su duración la hace algo repetitiva.'),
(6, 0, 10, 'Una pieza maestra que muestra todo el talento del compositor.'),
(7, 0, 6, 'La instrumentación es increíble, pero la letra no tiene mucha profundidad.'),
(8, 0, 9, 'Amo cómo el artista logra mezclar géneros de forma tan natural.'),
(9, 0, 4, 'Siento que ya he escuchado esta canción muchas veces antes.'),
(10, 0, 8, 'Un tema con una gran carga emocional, que realmente me tocó.'),
(11, 0, 7, 'Es una canción perfecta para el verano, llena de buen rollo.'),
(12, 0, 6, 'La voz de la cantante es única, pero la canción no me atrapó por completo.'),
(13, 0, 9, 'Este álbum es increíblemente cohesivo, cada canción fluye de maravilla.'),
(14, 0, 7, 'Es una balada hermosa, pero un poco larga para mi gusto.'),
(15, 0, 10, 'Una obra maestra, la letra tiene mucho significado personal para mí.');

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
(18, 11, 'Something About Us', 'Electronic', 2001);

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
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `fk_id_song` (`song_id`);

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
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `song`
--
ALTER TABLE `song`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_id_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `fk_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
