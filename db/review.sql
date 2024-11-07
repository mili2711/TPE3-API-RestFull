-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2024 a las 20:21:41
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
-- Estructura de tabla para la tabla `review`
--

CREATE TABLE `review` (
  `id_review` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rating` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `review`
--

INSERT INTO `review` (`id_review`, `comment`, `rating`) VALUES
(1, 'La canción tiene una gran energía, pero la letra es algo superficial.', 6),
(2, 'Una de las mejores canciones de este artista, la melodía es adictiva.', 9),
(3, 'El ritmo es pegajoso, pero la voz del cantante no me convence.', 5),
(4, 'Excelente colaboración, el sonido es fresco y moderno.', 8),
(5, 'La canción es emocional, pero su duración la hace algo repetitiva.', 7),
(6, 'Una pieza maestra que muestra todo el talento del compositor.', 10),
(7, 'La instrumentación es increíble, pero la letra no tiene mucha profundidad.', 6),
(8, 'Amo cómo el artista logra mezclar géneros de forma tan natural.', 9),
(9, 'Siento que ya he escuchado esta canción muchas veces antes.', 4),
(10, 'Un tema con una gran carga emocional, que realmente me tocó.', 8),
(11, 'Es una canción perfecta para el verano, llena de buen rollo.', 7),
(12, 'La voz de la cantante es única, pero la canción no me atrapó por completo.', 6),
(13, 'Este álbum es increíblemente cohesivo, cada canción fluye de maravilla.', 9),
(14, 'Es una balada hermosa, pero un poco larga para mi gusto.', 7),
(15, 'Una obra maestra, la letra tiene mucho significado personal para mí.', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_review`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `review`
--
ALTER TABLE `review`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
