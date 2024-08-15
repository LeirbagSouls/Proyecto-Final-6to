-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-08-2024 a las 07:27:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `estatus` tinyint(4) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `email`, `telefono`, `dni`, `estatus`, `fecha_alta`, `fecha_modifica`, `fecha_baja`) VALUES
(1, 'Isaac Brandon', 'Martínez Ramírez', 'isabran221@gmail.com', '2463350119', '1', 1, '2024-07-20 22:00:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_cliente` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `medio_pago` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` tinyint(4) NOT NULL DEFAULT 0,
  `id_categoria` int(11) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `descuento`, `id_categoria`, `activo`) VALUES
(1, 'Monitor gamer 24\'', '<p>Full HD</p>\r\n<br>\r\n<b>Características:</b><br>\r\nMarca: TCL<br>\r\nModelo:<br>\r\nColor: negro<br>\r\nGarantia: 2 años<br>\r\nMaterial sintetico<br>\r\nCompatible con HDMI<br>', 1800.00, 10, 1, 1),
(2, 'Laptop 15.6\" con Windows 10', 'Capacidad:<b>12 GB RAM</b> | <b>512 GB SSD</b>\r\n<br>\r\nProcesador:<b>Intel Core i7 1165G7</b>\r\n<br>\r\nTarj. gráfica:<b>Intel Iris Xe Graphics G7 96EUs</b>\r\n\r\n<br>\r\n\r\n<p><b>Más detalles de este producto</b></p>\r\n<ul>\r\n<li>Pantalla LCD de 15.6\".</li>\r\n<li>Resolución de 1920x1080 px.</li>\r\n<li>Es antirreflejo.</li>\r\n<li>Es táctil.</li>\r\n<li>Conexión wifi y bluetooth.</li>\r\n<li>Cuenta con 3 puertos USB y puerto HDMI.</li>\r\n</ul>', 11999.00, 0, 1, 1),
(3, 'Smartphone Negro 32gb Dual Sim 3gb Ram', '<p>Galaxy A02 es un equipo que te brinda excelentes beneficios: Su doble cámara trasera de 13 MP +2 MP y una cámara frontal de 5 MP te permitirán capturar los mejores momentos con una gran calidad.</p>\r\n\r\nMemoria interna: <b>32 GB</b>\r\n<br>\r\nMemoria RAM: <b>3 GB</b>\r\n<br>\r\nCámara frontal principal: <b>5 Mpx</b>\r\n<br>\r\nCámara trasera principal: <b>13 Mpx</b>', 2899.00, 0, 1, 1),
(4, 'Samsung 860 EVO SSD 500GB', '<p>Haga que su unidad funcione sin problemas con el software mejorado Samsung Magician 6 que lo ayuda a administrar fácilmente su unidad, mantenerse al día con las últimas actualizaciones, monitorear la salud y el estado de la unidad, o incluso mejorar su rendimiento.</p><br><b>Características:</b><br>Marca: SAMSUNG<br>Modelo: 870 EVO<br>Velocidad de lectura y escritura secuencial (máxima): 560MB/s<br>Tipo: SSD SATA de 2,5 pulgadas<br>Capacidad: 500GB<br>', 1499.00, 15, 1, 1),
(5, 'Western Digital Blue 2TB', '<p>UNA NUEVA DIMENSION DE ALMACENAMIENTO Preparado para sus necesidades informáticas de alto rendimiento, el SSD WD Blue™ 3D NAND SATA ofrece alta capacidad, fiabilidad mejorada y una velocidad increíblemente rápida. Alta capacidad El SSD WD Blue 3D NAND SATA utiliza la tecnología 3D NAND no solo para ofrecer capacidades superiores (hasta 2 TB) a las de anteriores generaciones de SSD WD Blue, sino que también ayuda a reducir la interferencia celda a celda para mejorar la fiabilidad.</p><br><b>Especificaciones:</b><br>Color: Gris<br>Voltaje: 1.00 kV<br>Velocidad de rotación: 5400 RPM<br>Tamaño de disco duro: 2.5pulg<br>Interfaz: Serial ATA III<br>', 1299.00, 0, 1, 1),
(6, 'Asus ZenBook 14', '<p>La computadora portátil Zenbook 14 OLED está diseñada para una portabilidad sin esfuerzo. La pantalla táctil expansiva 16:10 2.8K OLED HDR Nano Edge de la computadora portátil ofrece imágenes con píxeles perfectos. La computadora portátil Zenbook 14 OLED le brinda un rendimiento excelente con su batería de 75 Wh de larga duración. Le brinda potencia, elegancia y perfección portátil.</p><br>\\<b>Especificaciones:</b><br>Procesador: AMD Ryzen 7 5800H <br>Memoria RAM: 16 GB <br>Almacenamiento: 1 TB SSD <br>', 26999.00, 10, 1, 1),
(7, 'Xbox Series S', '<p>La Xbox Series S es la consola más pequeña y elegante de Microsoft hasta la fecha. Ofrece tiempos de carga rápidos y velocidades impresionantes con su arquitectura Xbox Velocity. Con su capacidad para juegos en 1440p y hasta 120 FPS, proporciona una experiencia de juego inmersiva a un precio accesible.</p><br>\\<b>Especificaciones:</b><br>Procesador: 8x Cores @ 3.6 GHz (3.4 GHz w/ SMT) Custom Zen 2 CPU <br>Memoria RAM: 10 GB GDDR6 <br>Almacenamiento: 512 GB SSD <br>', 6999.00, 10, 1, 1),
(8, 'PlayStation 5 Slim', '<p>La PlayStation 5 Slim redefine el gaming de próxima generación en un formato más delgado y elegante. Con su CPU y GPU ultrarrápidos, proporciona experiencias de juego de inmersión increíblemente detalladas. Además, su compatibilidad con Ray Tracing y juegos en 4K garantiza una calidad visual sin precedentes.</p><br>\\<b>Especificaciones:</b><br>Procesador: Custom 8-core AMD Zen 2 <br>Memoria RAM: 16 GB GDDR6 <br>Almacenamiento: 1 TB SSD <br>', 8499.00, 5, 1, 1),
(9, 'Teclado Mecánico Corsair K95 RGB Platinum', '<p>El teclado mecánico Corsair K95 RGB Platinum ofrece una respuesta rápida y durabilidad con sus interruptores mecánicos Cherry MX. Su retroiluminación RGB personalizable y la estructura de aluminio hacen de este teclado una elección perfecta para gamers que buscan rendimiento y estilo.</p><br>\\<b>Especificaciones:</b><br>Interruptores: Cherry MX RGB <br>Retroiluminación: RGB por tecla <br>Estructura: Aluminio cepillado <br>', 1699.00, 15, 1, 1),
(10, 'Ratón Logitech G502 HERO', '<p>El ratón Logitech G502 HERO es un ratón de alta precisión diseñado para gamers exigentes. Con su sensor HERO de 25,600 DPI, botones programables y pesas ajustables, ofrece una personalización total para un control absoluto en cada partida.</p><br>\\<b>Especificaciones:</b><br>Sensor: HERO 25K DPI <br>Botones: 11 botones programables <br>Peso: Ajustable <br>', 1124.00, 20, 1, 1),
(11, 'Auriculares HyperX Cloud II', '<p>Los auriculares HyperX Cloud II ofrecen un sonido envolvente 7.1 virtual, un diseño cómodo con almohadillas de espuma viscoelástica, y un micrófono con cancelación de ruido. Son la opción perfecta para gamers que buscan calidad de audio y confort en largas sesiones de juego.</p><br>\\<b>Especificaciones:</b><br>Sonido: 7.1 virtual surround <br>Conectividad: USB y Jack 3.5mm <br>Micrófono: Cancelación de ruido <br>', 1529.00, 8, 1, 1),
(12, 'Silla Gamer Secretlab Omega 2020', '<p>La silla gamer Secretlab Omega 2020 ofrece un soporte ergonómico superior con un diseño que prioriza la comodidad en sesiones de juego prolongadas. Fabricada con cuero PU PRIME™ 2.0 y espuma de alta densidad, es la elección premium para gamers serios.</p><br>\\<b>Especificaciones:</b><br>Material: Cuero PU PRIME™ 2.0 <br>Espuma: Alta densidad <br>Soporte lumbar: Ajustable <br>', 1949.00, 12, 1, 1),
(13, 'Tarjeta Gráfica NVIDIA GeForce RTX 3070', '<p>La tarjeta gráfica NVIDIA GeForce RTX 3070 ofrece un rendimiento excepcional con la arquitectura Ampere, ray tracing de segunda generación, y núcleos tensor de tercera generación. Es ideal para juegos en 4K y VR.</p><br>\\<b>Especificaciones:</b><br>Memoria: 8 GB GDDR6 <br>Velocidad del reloj: 1.73 GHz <br>Ray Tracing: Sí <br>', 1599.00, 16, 1, 1),
(14, 'Sistema de Refrigeración Líquida Corsair Hydro Series H100i', '<p>El Corsair Hydro Series H100i es un sistema de refrigeración líquida de alto rendimiento diseñado para mantener tu CPU en temperaturas óptimas durante largas sesiones de juego. Con su radiador de 240 mm, ventiladores de 120 mm y retroiluminación RGB personalizable, ofrece no solo eficiencia sino también estilo a tu PC gamer.</p><br>\\<b>Especificaciones:</b><br>Radiador: 240 mm <br>Ventiladores: 2x 120 mm <br>Iluminación: RGB personalizable <br>', 3940.00, 17, 1, 1),
(15, 'Xbox Series X', '<p>La Xbox Series X es la consola más poderosa de Microsoft, diseñada para ofrecer juegos en 4K con hasta 120 FPS. Con su arquitectura Xbox Velocity, tiempos de carga rápidos y gráficos de alta fidelidad, ofrece una experiencia de juego inigualable. La compatibilidad con generaciones anteriores y el soporte para Ray Tracing la convierten en una opción ideal para gamers que buscan el máximo rendimiento y calidad visual.</p><br>\\<b>Especificaciones:</b><br>Procesador: 8x Cores @ 3.8 GHz Custom Zen 2 CPU <br>Memoria RAM: 16 GB GDDR6 <br>Almacenamiento: 1 TB SSD <br>', 9499.00, 10, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(120) NOT NULL,
  `activacion` int(11) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `token_password` varchar(40) DEFAULT NULL,
  `password_request` int(11) NOT NULL DEFAULT 0,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `activacion`, `token`, `token_password`, `password_request`, `id_cliente`) VALUES
(1, 'isabran221', '$2y$10$w7ODl2KUUnqStYZDPL6mmeeXNhGgsJ5IgAZJxgs6EtvYAXZ8Lrip6', 1, '3dc12084d576094cc578765ef3e5be2d', NULL, 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
