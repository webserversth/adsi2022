-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3310
-- Tiempo de generación: 09-06-2022 a las 01:02:01
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `DBadsi2022`
--
CREATE DATABASE IF NOT EXISTS `DBadsi2022` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `DBadsi2022`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblBitacora`
--

DROP TABLE IF EXISTS `TblBitacora`;
CREATE TABLE `TblBitacora` (
  `IdBitacora` bigint(20) NOT NULL,
  `Bit_Usuario` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Bit_Datecreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Bit_Tabla` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Bit_Accion` varchar(20) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Bit_Descripcion` varchar(250) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblCategoria`
--

DROP TABLE IF EXISTS `TblCategoria`;
CREATE TABLE `TblCategoria` (
  `IdCategoria` bigint(20) NOT NULL,
  `Cat_Nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cat_Descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cat_Portada` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cat_Datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `Cat_Ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblCategoria`
--

INSERT INTO `TblCategoria` (`IdCategoria`, `Cat_Nombre`, `Cat_Descripcion`, `Cat_Portada`, `Cat_Datecreated`, `Cat_Ruta`, `Est_IdEstado`) VALUES
(1, 'Hombre', 'Artículos de moda', 'img_125e45445bd33723d025d7f815ca29f7.jpg', '2021-08-20 03:04:04', 'hombre', 1),
(2, 'Mujer', 'Artículos de moda', 'img_78678a3fe95890d155115d5301e0761d.jpg', '2021-08-21 00:47:10', 'mujer', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblCliente`
--

DROP TABLE IF EXISTS `TblCliente`;
CREATE TABLE `TblCliente` (
  `idcliente` bigint(20) NOT NULL,
  `identificacion` varchar(30) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblCliente`
--

INSERT INTO `TblCliente` (`idcliente`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
(1, '12345678', 'Ciente', 'Cliente', 4687987, 'cliente@admin.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '468798', 'Ricardo HP', 'Ciudad de Guatemala', NULL, 3, '2021-08-20 03:41:28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblContacto`
--

DROP TABLE IF EXISTS `TblContacto`;
CREATE TABLE `TblContacto` (
  `IdContacto` bigint(20) NOT NULL,
  `Cont_Nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cont_Email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cont_Mensaje` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cont_Ip` varchar(15) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cont_Dispositivo` varchar(25) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cont_Useragent` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Cont_Datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblContacto`
--

INSERT INTO `TblContacto` (`IdContacto`, `Cont_Nombre`, `Cont_Email`, `Cont_Mensaje`, `Cont_Ip`, `Cont_Dispositivo`, `Cont_Useragent`, `Cont_Datecreated`) VALUES
(1, 'Fernando Herrera', 'toolsfordeveloper@gmail.com', 'Mensaje del primer suscriptor!', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', '2021-08-20 04:06:18'),
(2, 'Jose Her', 'webserversth@gmail.com', 'prueba de funcionalidad', '::1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '2021-11-21 16:11:25'),
(3, 'Juannnn', 'juan@gmail.com', 'prueba de funnnnn', '::1', 'Movil', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Mobile Safari/537.36', '2022-06-06 14:01:22'),
(4, 'Jossssssssss', 'joss@gmail.com', 'prueba pc', '::1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', '2022-06-06 14:02:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblDetalle_pedido`
--

DROP TABLE IF EXISTS `TblDetalle_pedido`;
CREATE TABLE `TblDetalle_pedido` (
  `IdDetallePed` bigint(20) NOT NULL,
  `Ped_IdPedido` bigint(20) NOT NULL,
  `Prod_IdProducto` bigint(20) NOT NULL,
  `DetP_Precio` decimal(11,2) NOT NULL,
  `DetP_Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblDetalle_pedido`
--

INSERT INTO `TblDetalle_pedido` (`IdDetallePed`, `Ped_IdPedido`, `Prod_IdProducto`, `DetP_Precio`, `DetP_Cantidad`) VALUES
(1, 1, 2, '200.00', 1),
(2, 1, 1, '100.00', 2),
(3, 2, 1, '100.00', 3),
(4, 3, 1, '100.00', 1),
(5, 3, 2, '200.00', 1),
(6, 4, 2, '200.00', 1),
(7, 4, 3, '300.00', 1),
(8, 4, 1, '100.00', 1),
(9, 5, 7, '169000.90', 1),
(10, 6, 7, '169001.00', 1),
(11, 7, 6, '209001.00', 1),
(12, 8, 2, '189001.00', 1),
(13, 8, 3, '169001.00', 1);

--
-- Disparadores `TblDetalle_pedido`
--
DROP TRIGGER IF EXISTS `Trig_DeleteTblDetalle_pedido`;
DELIMITER $$
CREATE TRIGGER `Trig_DeleteTblDetalle_pedido` AFTER DELETE ON `TblDetalle_pedido` FOR EACH ROW begin
	call Pro_AuditoriaTblDetalle_pedido('Eliminar','TblDetalle_pedido',OLD.IdDetallePed,OLD.Ped_IdPedido ,OLD.Prod_IdProducto,OLD.DetP_Precio,OLD.DetP_Cantidad,OLD.IdDetallePed,OLD.Ped_IdPedido ,OLD.Prod_IdProducto,OLD.DetP_Precio,OLD.DetP_Cantidad);
end
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Trig_InsertTblDetalle_pedido`;
DELIMITER $$
CREATE TRIGGER `Trig_InsertTblDetalle_pedido` BEFORE INSERT ON `TblDetalle_pedido` FOR EACH ROW begin
	call Pro_AuditoriaTblDetalle_pedido('Registro','TblDetalle_pedido',NEW.IdDetallePed,NEW.Ped_IdPedido ,NEW.Prod_IdProducto,NEW.DetP_Precio,NEW.DetP_Cantidad,NEW.IdDetallePed,NEW.Ped_IdPedido ,NEW.Prod_IdProducto,NEW.DetP_Precio,NEW.DetP_Cantidad);
end
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Trig_UpdateTblDetalle_pedido`;
DELIMITER $$
CREATE TRIGGER `Trig_UpdateTblDetalle_pedido` BEFORE UPDATE ON `TblDetalle_pedido` FOR EACH ROW begin
	call Pro_AuditoriaTblDetalle_pedido('Actualizo','TblDetalle_pedido',NEW.IdDetallePed,NEW.Ped_IdPedido ,NEW.Prod_IdProducto,NEW.DetP_Precio,NEW.DetP_Cantidad,OLD.IdDetallePed,OLD.Ped_IdPedido ,OLD.Prod_IdProducto,OLD.DetP_Precio,OLD.DetP_Cantidad);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblDetalle_temp`
--

DROP TABLE IF EXISTS `TblDetalle_temp`;
CREATE TABLE `TblDetalle_temp` (
  `IdDetalleTemp` bigint(20) NOT NULL,
  `Per_IdPersona` bigint(20) NOT NULL,
  `Prod_IdProducto` bigint(20) NOT NULL,
  `DetT_Precio` decimal(11,2) NOT NULL,
  `DetT_Cantidad` int(11) NOT NULL,
  `DetT_Transaccionid` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblDevolucion`
--

DROP TABLE IF EXISTS `TblDevolucion`;
CREATE TABLE `TblDevolucion` (
  `IdDevolucion` bigint(20) NOT NULL,
  `Ped_IdPedido` bigint(20) NOT NULL,
  `Dev_Idtransaccion` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Dev_DetalleDevolucion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Dev_Descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblEstado`
--

DROP TABLE IF EXISTS `TblEstado`;
CREATE TABLE `TblEstado` (
  `IdEstado` int(11) NOT NULL,
  `Est_Nombre` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_Descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblEstado`
--

INSERT INTO `TblEstado` (`IdEstado`, `Est_Nombre`, `Est_Descripcion`) VALUES
(1, 'Activo', 'Estado activo '),
(2, 'Inactivo', 'Estado Inactivo'),
(3, 'Completo', 'Estado Completo'),
(4, 'Aprobado', 'Estado Aprobado'),
(5, 'Cancelado', 'Estado Cancelado'),
(6, 'Pendiente', 'Estado Pendiente'),
(7, 'Entregado', 'Estado Entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblImagen`
--

DROP TABLE IF EXISTS `TblImagen`;
CREATE TABLE `TblImagen` (
  `IdImagen` bigint(20) NOT NULL,
  `Prod_IdProducto` bigint(20) NOT NULL,
  `Img_Imagen` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblImagen`
--

INSERT INTO `TblImagen` (`IdImagen`, `Prod_IdProducto`, `Img_Imagen`) VALUES
(1, 1, 'pro_1018ac4efefe93878b7468ce72c630a3.jpg'),
(2, 1, 'pro_f90affec1052d2bf94047cb224d16568.jpg'),
(3, 1, 'pro_053da6d3ee7d346b6577ccfef6dac02d.jpg'),
(4, 2, 'pro_04e3bbf847b466de4aed691fca982d9d.jpg'),
(12, 2, 'pro_bb8108451aa8a21610931110c19fb369.jpg'),
(13, 3, 'pro_2b1a81cfe27f85486abbf5a7f8860cd9.jpg'),
(14, 3, 'pro_ff9d29decc4d30b32e6f54f470140448.jpg'),
(15, 3, 'pro_05785de7b5aad5b8db5d41c1408eb0cc.jpg'),
(16, 2, 'pro_12e4cd7e39f2b9dfeec0b89459e98c09.jpg'),
(17, 4, 'pro_62163894b108434c5304af28c872cf1f.jpg'),
(18, 4, 'pro_9faa1a7413fb3e41b88098ea337b0df5.jpg'),
(19, 4, 'pro_d390406e2dab2587026d06ebba8b10c8.jpg'),
(20, 5, 'pro_d8484450bbaf9a1429c7a93f9fcdc97e.jpg'),
(21, 5, 'pro_b04153c91176844c8a2f5e8c3abae31f.jpg'),
(22, 5, 'pro_055fdcd176d2eb5645cafee8c9d7e877.jpg'),
(23, 6, 'pro_f486d71ff9461be98436974e7b76711c.jpg'),
(24, 6, 'pro_5f39927a52ce6bb1152b9fb98fa756b4.jpg'),
(25, 6, 'pro_c988b62758f7b6a872f1f4f5d48a6607.jpg'),
(26, 7, 'pro_3ada7b6ebb793ef775c6f5868de7c03e.jpg'),
(27, 7, 'pro_78051abf16596b9c7427973947799bbc.jpg'),
(28, 7, 'pro_a83866122f937b88315935c0cc5d51c7.jpg'),
(29, 8, 'pro_0673baf807f145e20d57eeccbd1d8b51.jpg'),
(30, 8, 'pro_e7fcec8e8ea251459686aef85bb983e8.jpg'),
(31, 8, 'pro_3ed0bed54f0fea2df5759063c8b4ca81.jpg'),
(32, 9, 'pro_9b6b398f4cb222b62da2551393cebccc.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblModulo`
--

DROP TABLE IF EXISTS `TblModulo`;
CREATE TABLE `TblModulo` (
  `IdModulo` bigint(20) NOT NULL,
  `Mod_Titulo` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Mod_Descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblModulo`
--

INSERT INTO `TblModulo` (`IdModulo`, `Mod_Titulo`, `Mod_Descripcion`, `Est_IdEstado`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1),
(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
(8, 'Contactos', 'Mensajes del formulario contacto', 1),
(9, 'Páginas', 'Páginas del sitio web', 1),
(10, 'Parametros', 'Configuración inicial del sistema', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblPagina`
--

DROP TABLE IF EXISTS `TblPagina`;
CREATE TABLE `TblPagina` (
  `IdPagina` bigint(20) NOT NULL,
  `Pag_Titulo` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Pag_Contenido` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Pag_Portada` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Pag_Datecreate` datetime NOT NULL DEFAULT current_timestamp(),
  `Pag_Ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblPagina`
--

INSERT INTO `TblPagina` (`IdPagina`, `Pag_Titulo`, `Pag_Contenido`, `Pag_Portada`, `Pag_Datecreate`, `Pag_Ruta`, `Est_IdEstado`) VALUES
(1, 'Inicio', '<div class=\"p-t-80\"> <h3 class=\"ltext-103 cl5\">Nuestras marcas</h3> </div> <div> <p>Trabajamos con las mejores marcas para tu mejor satifacci&oacute;n ...</p> </div> <div class=\"row\"> <div class=\"col-md-3\"><img src=\"Assets/images/m1.png\" alt=\"Marca 1\" width=\"110\" height=\"110\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m2.png\" alt=\"Marca 2\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m3.png\" alt=\"Marca 3\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m4.png\" alt=\"Marca 4\" /></div> <div class=\"col-md-3\">&nbsp;</div> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:27', 'tienda', 1),
(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:52', 'carrito', 1),
(4, 'Nosotros', '<section class=\"bg0 p-t-75 p-b-120\"> <div class=\"container\"> <div class=\"row p-b-148\"> <div class=\"col-md-7 col-lg-8\"> <div class=\"p-t-7 p-r-85 p-r-15-lg p-r-0-md\"> <section class=\"py-5 text-center\"> <div class=\"container\"> <h2><span style=\"color: #236fa1;\"><img src=\"https://ipmark.com/wp-content/uploads/nuevo-modelo-de-negocio-auge-del-ecommerce-ok-800x445.jpg\" alt=\"Nuevo modelo comercial: el auge del ecommerce\" /></span></h2> <h2><span style=\"color: #236fa1;\">Nuestra Historia</span></h2> <p>&nbsp;</p> <p>Creamos&nbsp;<strong>Soluciones &amp; tecnolog&iacute;a a tu medida&nbsp; Sth </strong>en el 2020, present&aacute;ndonos como una empresa de desarrollo enfocada en sitios web y aplicaciones. El incremento del uso de Internet como medio de comunicaci&oacute;n y plataforma de negocios durante la pandemia del covid-19, hizo que nuestros clientes demandar&aacute;n de soluciones integrales para el mercado de&nbsp; E-Commerce .</p> <p>Este nuevo enfoque nos permiti&oacute; elaborar estrategias m&aacute;s completas y generar&nbsp;<strong>experiencias interactivas</strong> m&aacute;s cautivantes. Desde entonces hemos llevado a cabo el desarrollo de proyectos a la medida obteniendo grandes resultados y mejorando el posicionamiento de nuestros clientes.</p> </div> </section> <div class=\"py-5 bg-light\"> <div class=\"container\"> <div class=\"row\"> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://www.aquilum.com/images/about/slide_5.jpg\" alt=\"Aquilum System - Sistemas de informaci&oacute;n y comunicaci&oacute;n. Soluciones corporativas\" width=\"442\" height=\"229\" /><br /> <div class=\"card-body\"> <h2><span style=\"color: #236fa1;\">Nuestra Visi&oacute;n</span></h2> <p>Nuestra visi&oacute;n es poder llegar a ser en el 2030 una empresa l&iacute;der e innovadora en el mercado del desarrollo web, proporcionando una alta calidad de atenci&oacute;n y satisfacci&oacute;n con nuestra calidad y buen servicio.</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://magnesioymetal.com/wp-content/uploads/2018/04/MM_mision.jpg\" alt=\"Visi&oacute;n, Misi&oacute;n y Valores - Magnesio &amp; Metal\" width=\"237\" height=\"229\" /><br /> <div class=\"card-body\"> <h2><span style=\"color: #236fa1;\">Nuestra Misi&oacute;n</span></h2> <p class=\"stext-113\">Lograr que las peque&ntilde;as y medianas empresas tengan acceso a nuestros productos y servicios de calidad con la m&aacute;s avanzada tecnolog&iacute;a en desarrollo web, elevando continuamente el nivel de la experiencia del cliente mediante el uso de E-Commerce para ayudar a los consumidores a encontrar, descubrir y comprar los productos y servicios de una forma c&oacute;moda, f&aacute;cil y sencilla.</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://economipedia.com/wp-content/uploads/valores-sociales.jpg\" alt=\"Valores sociales - Qu&eacute; es, definici&oacute;n y concepto | Economipedia\" width=\"229\" height=\"229\" /><br /> <div class=\"card-body\"> <h2><span style=\"color: #236fa1;\">Nuestros valores&nbsp;</span></h2> <ul> <li>Rendimiento</li> <li>Pasi&oacute;n</li> <li>Integridad</li> <li>Honestidad</li> </ul> </div> </div> </div> </div> </div> </div> </div> </div> </div> <div class=\"row\"> <div class=\"order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30\"> <div class=\"how-bor2\"> <div class=\"hov-img0\"> <p>&nbsp;</p> </div> </div> </div> </div> </div> </section>', 'img_39bfaeff9e797519063ccd97ec416745.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
(5, 'Contacto', '<div class=\"map\"><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.669473297446!2d-76.49379918625903!3d3.430393497503131!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e30a70596ecc481%3A0x3ab0980f36ef915c!2sCentro%20de%20Dise%C3%B1o%20Tecnol%C3%B3gico%20Industrial%20SENA!5e0!3m2!1ses!2sco!4v1654558788019!5m2!1ses!2sco\" width=\"100%\" height=\"600\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe></div>', 'img_3024f13dc010ffab8c22da05ac6a32b9.jpg', '2021-08-09 03:11:08', 'contacto', 1),
(6, 'Preguntas frecuentes', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style=\"color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
(7, 'Términos y Condiciones', '<p>A continuaci&oacute;n se describen los t&eacute;rmino y condiciones de la Tienda Virtual!</p> <ol> <li>Pol&iacute;tica uno</li> <li>Termino dos</li> <li>Condici&oacute;n tres</li> </ol> <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</p>', '', '2021-08-11 01:51:06', 'terminos-y-condiciones', 1),
(8, 'Sucursales', '<section class=\"py-5 text-center\"> <div class=\"container\"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class=\"btn btn-info\" href=\"../../tienda_virtual/tienda\">VER PRODUCTOS</a></div> </section> <div class=\"py-5 bg-light\"> <div class=\"container\"> <div class=\"row\"> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s1.jpg\" alt=\"Tienda Uno\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: La Apartada - C&oacute;rdoba<br />Tel&eacute;fono: 4654645 <br />Correo: info@webserversth.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s2.jpg\" alt=\"Sucural dos\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Monteria - C&oacute;rdoba<br />Tel&eacute;fono: 4654645 <br />Correo: info@webserversth.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s3.jpg\" alt=\"Sucural tres\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Lorica - C&oacute;rdoba<br />Tel&eacute;fono: 465464533<br />Correo: info@webserversth.com</p> </div> </div> </div> </div> </div> </div>', 'img_d72cb5712933863e051dc9c7fac5e253.jpg', '2021-08-11 02:26:45', 'sucursales', 1),
(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblParametro`
--

DROP TABLE IF EXISTS `TblParametro`;
CREATE TABLE `TblParametro` (
  `IdParametro` bigint(20) NOT NULL,
  `Par_Valor` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Par_Descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblParametro`
--

INSERT INTO `TblParametro` (`IdParametro`, `Par_Valor`, `Par_Descripcion`, `Est_IdEstado`) VALUES
(1, '1067839748', 'Numero de registro tributario NIT', 1),
(2, 'Sth Tecnologia', 'Nombre de la empresa', 1),
(3, 'Calle 21 N° 13-04 Apto 104', 'Direccion', 1),
(4, 'La Apartada', 'Municipio', 1),
(5, 'Cordoba', 'Departamento', 1),
(6, 'Colombia', 'Pais', 1),
(7, '3155660671', 'Celular de contacto', 1),
(8, '7868590', 'Telefono fijo de contacto', 1),
(9, 'infowebserversth@gmail.com', 'Email de la empresa', 1),
(10, 'infowebserversth@gmail.com', 'Email de contacto', 1),
(11, 'www.webserversth.com', 'Páginas web de la empresa', 1),
(12, 'La mejor tienda en línea con artículos de moda.', 'Descripcion de la tienda', 1),
(13, 'Solucion a tu medida', 'Slogan de la empresa', 1),
(14, 'TiendaVirtual', 'sharedhash', 1),
(15, 'Projectos/Projectos/tienda_virtual/Assets/tienda/i', 'ruta de acceso del Logo de la empresa', 1),
(16, 'Projectos/Projectos/tienda_virtual/Assets/tienda/i', 'ruta de acceso del Icono de la pagina', 1),
(17, 'Tienda Virtual', 'Nombre remitente para envio de correo', 1),
(18, 'webserversth@gmail.com', 'Email remitente para envio de correo', 1),
(19, '1', 'constante de envio de correo // Local: 0, Produccón: 1 ', 1),
(20, 'infowebserversth@gmail.com', 'Email de pedido', 1),
(21, 'infowebserversth@gmail.com', 'Email de suscripcion', 1),
(22, 'https://api-m.sandbox.paypal.com', 'Url paypal', 1),
(23, 'https://api-m.sandbox.paypal.com', 'Url pse', 1),
(24, 'https://www.facebook.com/webserversth', 'red social de facebook44', 1),
(25, 'https://www.instagram.com/webserversth/', 'red social de instagram', 1),
(26, 'https://www.instagram.com/webserversth/', 'red social de twiter', 1),
(27, '.', 'Deliminadores decimal', 1),
(28, ',', 'Deliminadores millar', 1),
(29, '$', 'Simbolo de moneda', 1),
(30, 'USD', 'Divisa', 1),
(31, 'webserversth', 'key para Encriptar / Desencriptar', 1),
(32, 'AES-128-ECB', 'Metodo para Encriptar / Desencriptar', 1),
(33, 'uuuuu', 'pruba', 1),
(34, 'sssss', 'sssssssssssssssssssssssssss', 0),
(35, 'uuuuo', 'pruba', 1),
(36, 'pruebafin', 'prueba final', 1),
(37, 'prueba', 'ppppppppppppp', 1),
(38, 'prueba77777777777', 'ppppppppppppp', 1),
(39, 'prueb', 'ppppppppppppp', 1),
(40, 'jjjjjjjjjj', 'hhhhhhhhhhhhhhhh', 1),
(41, 'pruebjjjj', 'ppppppppppppp', 1),
(42, 'jjjjjjjjggg', 'fffffffffffffffj', 1),
(43, 'iiiiiiiiiiiii', 'fffffffffffffffj', 1),
(44, 'ssssjjjjj', 'jjjjj', 1),
(45, 'ssss99', 'jjjjj', 1),
(46, 'yyyyyy', 'jjjjj', 0),
(47, 'ssss', 'jjjjj', 1),
(48, 'hhhhhhhh', 'jjjjj', 1),
(49, 'hhhh', 'bbbb', 1),
(50, 'hhhh8', 'bbbb', 0),
(51, 'ssddddddddddddd', 'ffffffffffffff', 0),
(52, 'yyuuu', 'ffffffffffffff', 0),
(53, 'hhhhiii', 'ooooooooooo', 1),
(54, 'ghghgh', 'ooooooooooo', 1),
(55, 'ghfds3', 'juuuuuuuu', 0),
(56, 'undefined', 'undefined77', 0),
(57, 'undefinedjjjjjj', 'undefined', 1),
(58, 'undefinediiii', 'undefined', 0),
(59, 'dddddddddddddd', 'fffffffffffffffffffff', 1),
(60, 'usssssssssssss', 'kkkkkkkkkkkkkkk44', 1),
(61, 'pruebajjj', 'jjjjjjjjjjjjjjjjj', 0),
(62, 'pruebajjjjjjjjj', 'jjjjjjj', 0),
(63, 'jjjjjj', 'undefined', 0),
(64, 'prueba dia', 'prueeee', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblPedido`
--

DROP TABLE IF EXISTS `TblPedido`;
CREATE TABLE `TblPedido` (
  `IdPedido` bigint(20) NOT NULL,
  `Ped_Referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Tpay_IdTransaccionpaypal` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Ped_Datospaypal` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Per_IdPersona` bigint(20) NOT NULL,
  `Ped_Fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `Ped_Costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Ped_Monto` decimal(11,2) NOT NULL,
  `Tpag_IdTipopago` bigint(20) NOT NULL,
  `Ped_Direccion_envio` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Ped_Proceso` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblPedido`
--

INSERT INTO `TblPedido` (`IdPedido`, `Ped_Referenciacobro`, `Tpay_IdTransaccionpaypal`, `Ped_Datospaypal`, `Per_IdPersona`, `Ped_Fecha`, `Ped_Costo_envio`, `Ped_Monto`, `Tpag_IdTipopago`, `Ped_Direccion_envio`, `Ped_Proceso`) VALUES
(1, '4561654687', NULL, NULL, 3, '2021-08-20 03:41:57', '50.00', '450.00', 3, 'Antigua Guatemala, Antigua Guatemala', 'Completo'),
(2, NULL, '8XD37465755620710', '{\"id\":\"4S6284553D668511R\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"350.00\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"description\":\"Compra de artículos en Tienda Virtual por $350 \",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"id\":\"8XD37465755620710\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"350.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2021-08-20T09:48:38Z\",\"update_time\":\"2021-08-20T09:48:38Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"}},\"create_time\":\"2021-08-20T09:46:25Z\",\"update_time\":\"2021-08-20T09:48:38Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/4S6284553D668511R\",\"rel\":\"self\",\"method\":\"GET\"}]}', 3, '2021-08-20 03:48:39', '50.00', '350.00', 1, 'Guatemala, Guatemala', 'Completo'),
(3, NULL, NULL, NULL, 1, '2021-12-02 20:41:23', '5.00', '305.00', 2, 'apartadad, cordoba', 'Pendiente'),
(4, '123456789', NULL, NULL, 5, '2021-12-02 20:49:22', '5.00', '605.00', 5, 'monteria, monteria', 'Completo'),
(5, '123564', NULL, NULL, 1, '2022-02-18 20:05:07', '5.00', '169005.90', 2, 'la apartada, apartada cordoba', 'Aprobado'),
(6, NULL, NULL, NULL, 1, '2022-06-06 23:59:38', '5.00', '169006.00', 2, 'ddddddddd, ssssssssssssssssssssss', 'Pendiente'),
(7, NULL, NULL, NULL, 1, '2022-06-07 00:03:02', '5.00', '209006.00', 2, 'aaaaaaaaaaaa, ddddddddddddd', 'Pendiente'),
(8, NULL, NULL, NULL, 1, '2022-06-07 00:11:09', '5.00', '358007.00', 2, 'kkkkkkkkkkkkkkkkkk, lllllllllllllllllll', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblPermisos`
--

DROP TABLE IF EXISTS `TblPermisos`;
CREATE TABLE `TblPermisos` (
  `IdPermiso` bigint(20) NOT NULL,
  `Rol_IdRol` bigint(20) NOT NULL,
  `Mod_IdModulo` bigint(20) NOT NULL,
  `Perm_read` int(11) NOT NULL DEFAULT 0,
  `Perm_write` int(11) NOT NULL DEFAULT 0,
  `Perm_update` int(11) NOT NULL DEFAULT 0,
  `Perm_delete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblPermisos`
--

INSERT INTO `TblPermisos` (`IdPermiso`, `Rol_IdRol`, `Mod_IdModulo`, `Perm_read`, `Perm_write`, `Perm_update`, `Perm_delete`) VALUES
(2, 1, 1, 1, 1, 1, 1),
(3, 1, 2, 1, 1, 1, 1),
(4, 1, 3, 1, 1, 1, 1),
(5, 1, 4, 1, 1, 1, 1),
(6, 1, 5, 1, 1, 1, 1),
(7, 1, 6, 1, 1, 1, 1),
(8, 1, 7, 1, 1, 1, 1),
(9, 1, 8, 1, 1, 1, 1),
(10, 1, 9, 1, 1, 1, 1),
(11, 1, 10, 1, 1, 1, 1),
(12, 8, 1, 0, 0, 0, 0),
(13, 8, 2, 1, 1, 0, 0),
(14, 8, 3, 0, 0, 0, 0),
(15, 8, 4, 0, 0, 0, 0),
(16, 8, 5, 0, 0, 0, 0),
(17, 8, 6, 0, 0, 0, 0),
(18, 8, 7, 0, 0, 0, 0),
(19, 8, 8, 0, 0, 0, 0),
(20, 8, 9, 0, 0, 0, 0),
(21, 8, 10, 0, 0, 0, 0),
(75, 4, 1, 0, 1, 0, 0),
(76, 4, 2, 0, 0, 0, 0),
(77, 4, 3, 0, 0, 0, 0),
(78, 4, 4, 0, 0, 0, 0),
(79, 4, 5, 0, 0, 0, 0),
(80, 4, 6, 0, 0, 0, 0),
(81, 4, 7, 0, 0, 0, 0),
(82, 4, 8, 0, 0, 0, 0),
(83, 4, 9, 0, 0, 0, 0),
(84, 4, 10, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblPersona`
--

DROP TABLE IF EXISTS `TblPersona`;
CREATE TABLE `TblPersona` (
  `IdPersona` bigint(20) NOT NULL,
  `Per_Identificacion` varchar(30) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Per_Nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Per_Apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Per_Telefono` bigint(20) NOT NULL,
  `Per_Email` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Per_Password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Per_Token` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Rol_IdRol` bigint(20) NOT NULL,
  `Per_Datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblPersona`
--

INSERT INTO `TblPersona` (`IdPersona`, `Per_Identificacion`, `Per_Nombres`, `Per_Apellidos`, `Per_Telefono`, `Per_Email`, `Per_Password`, `nit`, `nombrefiscal`, `direccionfiscal`, `Per_Token`, `Rol_IdRol`, `Per_Datecreated`, `Est_IdEstado`) VALUES
(1, '1067839748', 'Jose', 'Hdez', 3125660671, 'admin@admin.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'CF', 'Abel OSH', 'Ciudad', 'cad05cb963874fc579ac-3739092b384e45c33983-36585f48de90dc6d65fc-8da2dec9bd398dea8dcf', 1, '2021-08-20 01:34:15', 1),
(2, '123456780', 'Supervisor', 'Supervisor', 456878977, 'supervisor@admin.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', NULL, NULL, NULL, NULL, 2, '2021-08-20 02:58:47', 1),
(3, '12345678', 'Ciente', 'Cliente', 4687987, 'cliente@admin.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '468798', 'Ricardo HP', 'Ciudad de Guatemala', NULL, 3, '2021-08-20 03:41:28', 1),
(4, '1234567890', 'Vendedor', 'Vendedor', 468498, 'vendedor@vendedor.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', NULL, NULL, NULL, NULL, 4, '2021-08-21 18:07:00', 1),
(5, '123456', 'Prueba', 'Prueba', 12345678, 'cliente2@admin.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '123566', 'gggg', 'ggg', NULL, 3, '2021-12-02 20:48:54', 0),
(6, '1234533', 'Hjj', 'Prue', 3126535412, 'admin1@admin.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', NULL, NULL, NULL, NULL, 1, '2022-01-08 10:14:37', 0),
(12, '12345678909', 'Pepito', 'Perez', 3216549874, 'pepitoperez@gmail.com', '57eb83ef3219f5c564395f90b33cd8c63d3fc6aa687a658b30cb4d9debb3e237', NULL, NULL, NULL, NULL, 3, '2022-02-17 21:33:02', 0);

--
-- Disparadores `TblPersona`
--
DROP TRIGGER IF EXISTS `Trig_DeleteTblPersona`;
DELIMITER $$
CREATE TRIGGER `Trig_DeleteTblPersona` AFTER DELETE ON `TblPersona` FOR EACH ROW begin
	call Pro_AuditoriaTblPersona('Eliminar','TblPersona',OLD.IdPersona,OLD.Per_Identificacion,OLD.Per_Nombres,OLD.IdPersona,OLD.Per_Identificacion,OLD.Per_Nombres);
end
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Trig_InsertTblPersona`;
DELIMITER $$
CREATE TRIGGER `Trig_InsertTblPersona` BEFORE INSERT ON `TblPersona` FOR EACH ROW begin
	call Pro_AuditoriaTblPersona('Registro','TblPersona',NEW.IdPersona,NEW.Per_Identificacion,NEW.Per_Nombres,NEW.IdPersona,NEW.Per_Identificacion,NEW.Per_Nombres);
end
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Trig_UpdateTblPersona`;
DELIMITER $$
CREATE TRIGGER `Trig_UpdateTblPersona` BEFORE UPDATE ON `TblPersona` FOR EACH ROW begin
	call Pro_AuditoriaTblPersona('Actualizo','TblPersona',NEW.IdPersona,NEW.Per_Nombres,NEW.Per_Identificacion,OLD.IdPersona,OLD.Per_Nombres,OLD.Per_Identificacion);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblProducto`
--

DROP TABLE IF EXISTS `TblProducto`;
CREATE TABLE `TblProducto` (
  `IdProducto` bigint(20) NOT NULL,
  `Cat_IdCategoria` bigint(20) NOT NULL,
  `Prod_Codigo` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Prod_Nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Prod_Descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Prod_Precio` decimal(11,0) NOT NULL,
  `Prod_Stock` int(11) NOT NULL,
  `Prod_Imagen` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `Prod_Datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `Prod_Ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblProducto`
--

INSERT INTO `TblProducto` (`IdProducto`, `Cat_IdCategoria`, `Prod_Codigo`, `Prod_Nombre`, `Prod_Descripcion`, `Prod_Precio`, `Prod_Stock`, `Prod_Imagen`, `Prod_Datecreated`, `Prod_Ruta`, `Est_IdEstado`) VALUES
(1, 2, '103213501', 'BOLSO PARA MUJER EN SINTETICO TIPO BAGUETTE CON MONEDERO REMOVIBLE', '<p><strong>Descripci&oacute;n:</strong>Dise&ntilde;o tipo baguette con cierres metalicos y doble cargadera para darle vesatilidad a su uso. Cuenta con un mondero externo removible en sintetico tipo piton a tono con el bolso principal. Su forro es estampado con compartimentos internos para una casi&oacute;n de uso casual o formal.</p> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"820\"> <div>820</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"15,3 CM\"> <div>15,3 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"24 CM\"> <div>24 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"32 CM\"> <div>32 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Sintetico Pu | Forro: 100% Poliester\"> <div>Externo: 100% Sintetico Pu | Forro: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"China\"> <div>China</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Con Forro\"> <div>Con Forro</div> </td> </tr> </tbody> </table> <p>&nbsp;</p> </div> </div> </div> </div> </section> </div>', '159000', 50, NULL, '2021-08-20 03:12:14', 'bolso-para-mujer-en-sintetico-tipo-baguette-con-monedero-removible', 1),
(2, 1, '103182719', 'BOLSO PARA HOMBRE TIPO TULA MORRAL EN LONA CON SISTEMA DE MALLA PARA CASCO', '<div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Descripci&oacute;n:</strong>Dise&ntilde;o outdoor en lona con colores en contraste, cuenta con una malla extraible, para sostener cascos ya sea de moto o bicicleta. La marcacion es en caucho y tiene llavero removible, cuenta con cierres invertidos y jaladeras plasticas en contraste. Esta referencia cuenta con bolsillo de seguridad en espaldas, bolsillo en cargadera, y sistema de conexi&oacute;n USB,ademas cuenta con rain cover o protector para la lluvia. Cuenta con forro textil y compartimientos internos para guardar objetos de uso cotidiano tales como llaves, celular y art&iacute;culos personales, Ocasi&oacute;n de uso casual e informal.</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas:</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"1100 GR\"> <div>1100 GR</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"17 CM\"> <div>17 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"33 CM\"> <div>33 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"46 CM\"> <div>46 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Nailon | Forro: 100% Poliester\"> <div>Externo: 100% Nailon | Forro: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"China\"> <div>China</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Con Forro\"> <div>Con Forro</div> </td> </tr> </tbody> </table> </div> </div> </div> </div> </section> </div> </div> </div> </div>', '189001', 100, NULL, '2021-08-20 03:14:10', 'bolso-para-hombre-tipo-tula-morral-en-lona-con-sistema-de-malla-para-casco', 1),
(3, 2, '103244639', 'BOLSO TIPO TULA MORRAL PARA MUJER EN LONA CON COLORES VIBRANTES Y TAPA FRONTAL', '<div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Descripci&oacute;n:</strong> Bolso tipo tula morral en lona para mujer, Dise&ntilde;o de tama&ntilde;o mediano con compartimento para portatil de entre 10 y 12 pulgadas. Esta referencia viene en colores vibrantes de moda con jaladeras y marcaci&oacute;n en caucho. Su forro es estampado con compartimentos internos, Ocasi&oacute;n de uso casual e informal.</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas:</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"650\"> <div>650</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"11\"> <div>11</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"30\"> <div>30</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"38\"> <div>38</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Nailon | Forro: 100% Poliester\"> <div>Externo: 100% Nailon | Forro: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"China\"> <div>China</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Con Forro\"> <div>Con Forro</div> </td> </tr> </tbody> </table> </div> </div> </div> </div> </section> </div> </div> </div> </div>', '169001', 100, NULL, '2021-08-21 00:48:21', 'bolso-tipo-tula-morral-para-mujer-en-lona-con-colores-vibrantes-y-tapa-frontal', 1),
(4, 2, '103128600', 'SHOPPING ERIE DE CUERO PARA MUJER GRABADO', '<div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Descripci&oacute;n:</strong> La silueta de nuestros bolsos tipo shopping se adapta a tus circusntancias; dise&ntilde;os pr&aacute;cticos y c&oacute;modos que se combinan a la perfecci&oacute;n con su capacidad. &iexcl;&Uacute;salo! Las variaciones en colores y texturas de este producto son propias del proceso de elaboraci&oacute;n, con el uso y paso del tiempo tiende a presentar cambios en el acabado y p&eacute;rdida gradual del color, por lo anterior, el producto puede variar al exhibido en la foto.</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\">&nbsp;</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas:</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"602\"> <div>602</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"15\"> <div>15</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"27\"> <div>27</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"30\"> <div>30</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Cuero Bovino | Forro: 10% Cuero Cerdo, 90% Sin Forro | Externo Compl: 100% Poliester | Forro Compl: 100% Poliester\"> <div>Externo: 100% Cuero Bovino | Forro: 10% Cuero Cerdo, 90% Sin Forro | Externo Compl: 100% Poliester | Forro Compl: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"ALTURA CORREA\"> <div>ALTURA CORREA</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"36 CM\"> <div>36 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Colombia\"> <div>Colombia</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Sin Forro\"> <div>Sin Forro</div> </td> </tr> </tbody> </table> </div> </div> </div> </div> </section> </div> </div> </div> </div>', '369001', 100, NULL, '2021-12-26 10:45:24', 'shopping-erie-de-cuero-para-mujer-grabado', 1),
(5, 1, '102714701', 'MALETÍN PORTÁTIL MULTIFUNCIONAL DE CUERO PARA HOMBRE HALADERAS CONTRASTE', '<div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\">Descripci&oacute;n: Malet&iacute;n port&aacute;til elaborado en cuero liso, de brillo sutil y acabdo natural. Este dise&ntilde;o es sobrio y funcional. Permite llevar protegidos todos sus art&iacute;culos, desde un port&aacute;til o tableta hasta gafas, tel&eacute;fono y llaves. Este morral es perfecto para aquellos que viajan con frecuencia, ya sea por ocio o trabajo.</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas:</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"1,088\"> <div>1,088</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"10\"> <div>10</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"40\"> <div>40</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"29\"> <div>29</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Cuero Bovino | Forro: 100% Poliester\"> <div>Externo: 100% Cuero Bovino | Forro: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Colombia\"> <div>Colombia</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Con Forro\"> <div>Con Forro</div> </td> </tr> </tbody> </table> </div> </div> </div> </div> </section> </div> </div> </div> </div>', '274001', 50, NULL, '2021-12-26 10:49:42', 'maletin-portatil-multifuncional-de-cuero-para-hombre-haladeras-contraste', 1);
INSERT INTO `TblProducto` (`IdProducto`, `Cat_IdCategoria`, `Prod_Codigo`, `Prod_Nombre`, `Prod_Descripcion`, `Prod_Precio`, `Prod_Stock`, `Prod_Imagen`, `Prod_Datecreated`, `Prod_Ruta`, `Est_IdEstado`) VALUES
(6, 1, '103212600', 'BOLSO PARA HOMBRE TIPO TULA MORRAL EN LONA CON TAPA FRONTAL.', '<div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Descripci&oacute;n:</strong> Dise&ntilde;o utilitario moda con tapa frontal y sistema de cierre por medio de broches .Cuenta con cierres invertido impermeables, marcaci&oacute;n en caucho y jaladeras metalicas, tira para trolley y covertor para lluvia. Cuenta con forro textil y compartimientos internos para guardar objetos de uso cotidiano tales como llaves, celular y art&iacute;culos personales, Ocasi&oacute;n de uso casual e informal.</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas:</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"950 GR\"> <div>950 GR</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"14 CM\"> <div>14 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"31 CM\"> <div>31 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"46 CM\"> <div>46 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Nailon | Forro: 100% Poliester\"> <div>Externo: 100% Nailon | Forro: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"China\"> <div>China</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Con Forro\"> <div>Con Forro</div> </td> </tr> </tbody> </table> </div> </div> </div> </div> </section> </div> </div> </div> </div>', '209001', 30, NULL, '2021-12-26 10:56:13', 'bolso-para-hombre-tipo-tula-morral-en-lona-con-tapa-frontal', 1),
(7, 2, '103214232', 'BOLSO PARA MUJER EN SINTETICO TIPO SHOPPING CON MONEDERO REMOVIBLE', '<div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Descripci&oacute;n:</strong>Dise&ntilde;o tipo shopping con cierres metalicos y doble cargadera para darle vesatilidad a su uso. Cuenta con un mondero externo removible en sintetico tipo piton a tono con el bolso principal. Su forro es estampado con compartimentos internos para una casi&oacute;n de uso casual o formal.</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas:</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"870\"> <div>870</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"13,3 CM\"> <div>13,3 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"32 CM\"> <div>32 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"39 CM\"> <div>39 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Sintetico Pu | Forro: 100% Poliester\"> <div>Externo: 100% Sintetico Pu | Forro: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"China\"> <div>China</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Con Forro\"> <div>Con Forro</div> </td> </tr> </tbody> </table> </div> </div> </div> </div> </section> </div> </div> </div> </div>', '169001', 50, NULL, '2021-12-26 11:00:24', 'bolso-para-mujer-en-sintetico-tipo-shopping-con-monedero-removible', 1),
(8, 1, '103183201', 'BOLSO PARA HOMBRE TIPO TULA MORRAL EN LONA CON CIERRES INVERTIDOS CON LÍNEA DE COLOR .', '<div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Descripci&oacute;n: </strong>Dise&ntilde;o utilitario b&aacute;sico con cierres invertidos y l&iacute;neas en contraste con la lona, Marcaci&oacute;n estampada y jaladeras en caucho con forro en poli&eacute;ster estampado de Nappa. Ocasi&oacute;n de uso casual e informal.</div> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"> <div class=\"vtex-menu-2-x-menuItemInnerDiv vtex-menu-2-x-menuItemInnerDivmenu-item-product-description\"> <div class=\"vtex-menu-2-x-styledLinkContainer vtex-menu-2-x-styledLinkContainermenu-item-product-description mh6 pv2\"> <div class=\"vtex-menu-2-x-styledLinkContent vtex-menu-2-x-styledLinkContentmenu-item-product-description flex justify-between nowrap\"><strong>Carater&iacute;sticas:</strong></div> </div> </div> <div class=\"overflow-hidden\"> <section class=\"vtex-menu-2-x-submenuAccordion vtex-menu-2-x-submenuAccordionaccordion-product-description w-100 flex pl4 flex\"> <div class=\"vtex-flex-layout-0-x-flexRow vtex-flex-layout-0-x-flexRowproduct-politicas\"> <div class=\"flex mt0 mb0 pt0 pb0 justify-start vtex-flex-layout-0-x-flexRowContent vtex-flex-layout-0-x-flexRowContentproduct-politicas items-stretch w-100\"> <div class=\"pr0 items-stretch vtex-flex-layout-0-x-stretchChildrenWidth flex\"> <div class=\"vtex-store-components-3-x-specificationsTableContainer vtex-store-components-3-x-specificationsTableContainerproduct-specifications mt9 mt0-l pl8-l\"> <table class=\"vtex-store-components-3-x-specificationsTable vtex-store-components-3-x-specificationsTableproduct-specifications w-100 bg-base border-collapse\"> <thead class=\"vtex-store-components-3-x-specificationsTableHead vtex-store-components-3-x-specificationsTableHeadproduct-specifications\"></thead> <tbody class=\"vtex-store-components-3-x-specificationsTableBody vtex-store-components-3-x-specificationsTableBodyproduct-specifications\"> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Peso (gr)\"> <div>Peso (Gr)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"600 GR\"> <div>600 GR</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Largo (cm)\"> <div>Largo (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"16 CM\"> <div>16 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Ancho (cm)\"> <div>Ancho (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"28 CM\"> <div>28 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Alto (cm)\"> <div>Alto (Cm)</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"46 CM\"> <div>46 CM</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Composici&oacute;n\"> <div>Composici&oacute;n</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Externo: 100% Poliester | Forro: 100% Poliester\"> <div>Externo: 100% Poliester | Forro: 100% Poliester</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Pa&iacute;s de origen\"> <div>Pa&iacute;s De Origen</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"China\"> <div>China</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Fabricante y/o importador\"> <div>Fabricante Y/O Importador</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Cueros V&eacute;lez S.A.S. | NIT 800191700-8\"> <div>Cueros V&eacute;lez S.A.S. | NIT 800191700-8</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Registro SIC\"> <div>Registro SIC</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"800191700\"> <div>800191700</div> </td> </tr> <tr class=\"vtex-store-components-3-x-specificationsTableRow vtex-store-components-3-x-specificationsTableRowproduct-specifications\"> <td class=\"vtex-store-components-3-x-specificationItemProperty vtex-store-components-3-x-specificationItemPropertyproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Forro\"> <div>Forro</div> </td> <td class=\"vtex-store-components-3-x-specificationItemSpecifications vtex-store-components-3-x-specificationItemSpecificationsproduct-specifications w-50 bmuted-4 bb pa5\" data-specification=\"Con Forro\"> <div>Con Forro</div> </td> </tr> </tbody> </table> </div> </div> </div> </div> </section> </div> </div> </div> </div>', '149001', 40, NULL, '2021-12-26 11:03:06', 'bolso-para-hombre-tipo-tula-morral-en-lona-con-cierres-invertidos-con-linea-de-color-', 2),
(9, 2, '123456789', 'prueba de funcionamiento', '<p><strong>Descripcion: </strong>Pulsera <strong>3 corazones</strong>&nbsp;rosados ba&ntilde;o de oro cadena con significado para mujer ajustable, delicada y femenina elaborada a mano.&nbsp;<strong>El dije de coraz&oacute;n es un s&iacute;mbolo de amor propio y poder personal</strong>. Nuestras pulseras est&aacute;n llenas de significado y amor para inspirar y empoderar, &uacute;sala todos los d&iacute;as.</p> <p><strong>Especificaciones:</strong></p> <ul> <li>Dije con ba&ntilde;o de oro y pintado a mano</li> <li>Herrajes con ba&ntilde;o de oro</li> <li>Cadena con ba&ntilde;o de oro</li> <li>Pulsera con broche y extensor</li> </ul>', '50000', 10, NULL, '2021-12-26 11:32:43', 'prueba-de-funcionamiento', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblRol`
--

DROP TABLE IF EXISTS `TblRol`;
CREATE TABLE `TblRol` (
  `IdRol` bigint(20) NOT NULL,
  `Rol_Nombre` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Rol_Descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblRol`
--

INSERT INTO `TblRol` (`IdRol`, `Rol_Nombre`, `Rol_Descripcion`, `Est_IdEstado`) VALUES
(1, 'Administrdor', 'Administrador del sistema', 1),
(2, 'prueba1', 'prueba rol', 1),
(3, 'prueba2', 'rol', 1),
(4, 'prueba3', 'pru', 1),
(5, 'prueba4', 'bbbbb', 0),
(6, 'nnnnnnnnnnn', 'bbbbbbbbbbbbb', 0),
(7, 'kkkkkkkkkkkk', 'kkkkkkkkkkk', 0),
(8, 'gggggggggggg', 'gggggggggggg', 0),
(9, 'jjjjjj', 'jsssssssssss', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblSuscripciones`
--

DROP TABLE IF EXISTS `TblSuscripciones`;
CREATE TABLE `TblSuscripciones` (
  `IdSuscripcion` bigint(20) NOT NULL,
  `Sus_Nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Sus_Email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Sus_Datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblSuscripciones`
--

INSERT INTO `TblSuscripciones` (`IdSuscripcion`, `Sus_Nombre`, `Sus_Email`, `Sus_Datecreated`, `Est_IdEstado`) VALUES
(1, 'Roberto', 'toolsfordeveloper@gmail.com', '2021-08-20 04:05:10', 1),
(2, 'Jose Hdez Cor', 'admin.cor@admin.com', '2021-11-21 16:40:42', 1),
(3, 'Juanito Perez Sanchez', 'juanto13@gmail.com', '2022-06-06 13:36:19', 1),
(4, 'Juanito Perez Sanchezs', 'juanto14@gmail.com', '2022-06-06 13:47:43', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblTipopago`
--

DROP TABLE IF EXISTS `TblTipopago`;
CREATE TABLE `TblTipopago` (
  `IdTipopago` bigint(20) NOT NULL,
  `Tpag_Tipopago` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `Est_IdEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `TblTipopago`
--

INSERT INTO `TblTipopago` (`IdTipopago`, `Tpag_Tipopago`, `Est_IdEstado`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1),
(4, 'Cheque', 1),
(5, 'Despósito Bancario', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pedidos`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_pedidos`;
CREATE TABLE `vista_pedidos` (
`IdPedido` bigint(20)
,`Ped_Referenciacobro` varchar(255)
,`Tpay_IdTransaccionpaypal` varchar(255)
,`fecha` varchar(10)
,`Ped_Monto` decimal(11,2)
,`Tpag_IdTipopago` bigint(20)
,`Ped_Proceso` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_persona`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_persona`;
CREATE TABLE `vista_persona` (
`IdPersona` bigint(20)
,`Per_Identificacion` varchar(30)
,`Per_Nombres` varchar(80)
,`Per_Apellidos` varchar(100)
,`Per_Telefono` bigint(20)
,`Per_Email` varchar(100)
,`Rol_Nombre` varchar(50)
,`fecha` varchar(10)
,`Est_Descripcion` text
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pedidos`
--
DROP TABLE IF EXISTS `vista_pedidos`;

DROP VIEW IF EXISTS `vista_pedidos`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbadsi2022`.`vista_pedidos`  AS SELECT `p`.`IdPedido` AS `IdPedido`, `p`.`Ped_Referenciacobro` AS `Ped_Referenciacobro`, `p`.`Tpay_IdTransaccionpaypal` AS `Tpay_IdTransaccionpaypal`, date_format(`p`.`Ped_Fecha`,'%d/%m/%Y') AS `fecha`, `p`.`Ped_Monto` AS `Ped_Monto`, `p`.`Tpag_IdTipopago` AS `Tpag_IdTipopago`, `p`.`Ped_Proceso` AS `Ped_Proceso` FROM (`dbadsi2022`.`tblpedido` `p` join `dbadsi2022`.`tbltipopago` `tp` on(`p`.`Tpag_IdTipopago` = `tp`.`IdTipopago`)) WHERE `p`.`Per_IdPersona` <> 0 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_persona`
--
DROP TABLE IF EXISTS `vista_persona`;

DROP VIEW IF EXISTS `vista_persona`;
CREATE OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbadsi2022`.`vista_persona`  AS SELECT `p`.`IdPersona` AS `IdPersona`, `p`.`Per_Identificacion` AS `Per_Identificacion`, `p`.`Per_Nombres` AS `Per_Nombres`, `p`.`Per_Apellidos` AS `Per_Apellidos`, `p`.`Per_Telefono` AS `Per_Telefono`, `p`.`Per_Email` AS `Per_Email`, `r`.`Rol_Nombre` AS `Rol_Nombre`, date_format(`p`.`Per_Datecreated`,'%d/%m/%Y') AS `fecha`, `st`.`Est_Descripcion` AS `Est_Descripcion` FROM ((`dbadsi2022`.`tblpersona` `p` join `dbadsi2022`.`tblrol` `r` on(`p`.`Rol_IdRol` = `r`.`IdRol`)) join `dbadsi2022`.`tblestado` `st` on(`p`.`Est_IdEstado` = `st`.`IdEstado`)) WHERE `p`.`IdPersona` <> 0 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `TblBitacora`
--
ALTER TABLE `TblBitacora`
  ADD PRIMARY KEY (`IdBitacora`);

--
-- Indices de la tabla `TblCategoria`
--
ALTER TABLE `TblCategoria`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `TblCliente`
--
ALTER TABLE `TblCliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `TblContacto`
--
ALTER TABLE `TblContacto`
  ADD PRIMARY KEY (`IdContacto`);

--
-- Indices de la tabla `TblDetalle_pedido`
--
ALTER TABLE `TblDetalle_pedido`
  ADD PRIMARY KEY (`IdDetallePed`),
  ADD KEY `pedidoid` (`Ped_IdPedido`),
  ADD KEY `productoid` (`Prod_IdProducto`);

--
-- Indices de la tabla `TblDetalle_temp`
--
ALTER TABLE `TblDetalle_temp`
  ADD PRIMARY KEY (`IdDetalleTemp`),
  ADD KEY `productoid` (`Prod_IdProducto`),
  ADD KEY `personaid` (`Per_IdPersona`);

--
-- Indices de la tabla `TblDevolucion`
--
ALTER TABLE `TblDevolucion`
  ADD PRIMARY KEY (`IdDevolucion`),
  ADD KEY `pedidoid` (`Ped_IdPedido`);

--
-- Indices de la tabla `TblEstado`
--
ALTER TABLE `TblEstado`
  ADD PRIMARY KEY (`IdEstado`);

--
-- Indices de la tabla `TblImagen`
--
ALTER TABLE `TblImagen`
  ADD PRIMARY KEY (`IdImagen`),
  ADD KEY `productoid` (`Prod_IdProducto`);

--
-- Indices de la tabla `TblModulo`
--
ALTER TABLE `TblModulo`
  ADD PRIMARY KEY (`IdModulo`);

--
-- Indices de la tabla `TblPagina`
--
ALTER TABLE `TblPagina`
  ADD PRIMARY KEY (`IdPagina`);

--
-- Indices de la tabla `TblParametro`
--
ALTER TABLE `TblParametro`
  ADD PRIMARY KEY (`IdParametro`);

--
-- Indices de la tabla `TblPedido`
--
ALTER TABLE `TblPedido`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `personaid` (`Per_IdPersona`),
  ADD KEY `tipopagoid` (`Tpag_IdTipopago`);

--
-- Indices de la tabla `TblPermisos`
--
ALTER TABLE `TblPermisos`
  ADD PRIMARY KEY (`IdPermiso`),
  ADD KEY `moduloid` (`Mod_IdModulo`),
  ADD KEY `rolid` (`Rol_IdRol`);

--
-- Indices de la tabla `TblPersona`
--
ALTER TABLE `TblPersona`
  ADD PRIMARY KEY (`IdPersona`),
  ADD KEY `rolid` (`Rol_IdRol`);

--
-- Indices de la tabla `TblProducto`
--
ALTER TABLE `TblProducto`
  ADD PRIMARY KEY (`IdProducto`),
  ADD KEY `categoriaid` (`Cat_IdCategoria`);

--
-- Indices de la tabla `TblRol`
--
ALTER TABLE `TblRol`
  ADD PRIMARY KEY (`IdRol`);

--
-- Indices de la tabla `TblSuscripciones`
--
ALTER TABLE `TblSuscripciones`
  ADD PRIMARY KEY (`IdSuscripcion`);

--
-- Indices de la tabla `TblTipopago`
--
ALTER TABLE `TblTipopago`
  ADD PRIMARY KEY (`IdTipopago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `TblCategoria`
--
ALTER TABLE `TblCategoria`
  MODIFY `IdCategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `TblCliente`
--
ALTER TABLE `TblCliente`
  MODIFY `idcliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `TblContacto`
--
ALTER TABLE `TblContacto`
  MODIFY `IdContacto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `TblDetalle_pedido`
--
ALTER TABLE `TblDetalle_pedido`
  MODIFY `IdDetallePed` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `TblDetalle_temp`
--
ALTER TABLE `TblDetalle_temp`
  MODIFY `IdDetalleTemp` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TblDevolucion`
--
ALTER TABLE `TblDevolucion`
  MODIFY `IdDevolucion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TblEstado`
--
ALTER TABLE `TblEstado`
  MODIFY `IdEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `TblImagen`
--
ALTER TABLE `TblImagen`
  MODIFY `IdImagen` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `TblModulo`
--
ALTER TABLE `TblModulo`
  MODIFY `IdModulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `TblPagina`
--
ALTER TABLE `TblPagina`
  MODIFY `IdPagina` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `TblParametro`
--
ALTER TABLE `TblParametro`
  MODIFY `IdParametro` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `TblPedido`
--
ALTER TABLE `TblPedido`
  MODIFY `IdPedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `TblPermisos`
--
ALTER TABLE `TblPermisos`
  MODIFY `IdPermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `TblPersona`
--
ALTER TABLE `TblPersona`
  MODIFY `IdPersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `TblProducto`
--
ALTER TABLE `TblProducto`
  MODIFY `IdProducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `TblRol`
--
ALTER TABLE `TblRol`
  MODIFY `IdRol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `TblSuscripciones`
--
ALTER TABLE `TblSuscripciones`
  MODIFY `IdSuscripcion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `TblTipopago`
--
ALTER TABLE `TblTipopago`
  MODIFY `IdTipopago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `TblDetalle_pedido`
--
ALTER TABLE `TblDetalle_pedido`
  ADD CONSTRAINT `tbldetalle_pedido_ibfk_1` FOREIGN KEY (`Ped_IdPedido`) REFERENCES `tblpedido` (`IdPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbldetalle_pedido_ibfk_2` FOREIGN KEY (`Prod_IdProducto`) REFERENCES `tblproducto` (`IdProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `TblDetalle_temp`
--
ALTER TABLE `TblDetalle_temp`
  ADD CONSTRAINT `tbldetalle_temp_ibfk_1` FOREIGN KEY (`Prod_IdProducto`) REFERENCES `tblproducto` (`IdProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `TblDevolucion`
--
ALTER TABLE `TblDevolucion`
  ADD CONSTRAINT `tbldevolucion_ibfk_1` FOREIGN KEY (`Ped_IdPedido`) REFERENCES `tblpedido` (`IdPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `TblImagen`
--
ALTER TABLE `TblImagen`
  ADD CONSTRAINT `tblimagen_ibfk_1` FOREIGN KEY (`Prod_IdProducto`) REFERENCES `tblproducto` (`IdProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `TblPedido`
--
ALTER TABLE `TblPedido`
  ADD CONSTRAINT `tblpedido_ibfk_1` FOREIGN KEY (`Per_IdPersona`) REFERENCES `tblpersona` (`IdPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpedido_ibfk_2` FOREIGN KEY (`Tpag_IdTipopago`) REFERENCES `tbltipopago` (`IdTipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `TblPermisos`
--
ALTER TABLE `TblPermisos`
  ADD CONSTRAINT `tblpermisos_ibfk_1` FOREIGN KEY (`Rol_IdRol`) REFERENCES `tblrol` (`IdRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblpermisos_ibfk_2` FOREIGN KEY (`Mod_IdModulo`) REFERENCES `tblmodulo` (`IdModulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `TblPersona`
--
ALTER TABLE `TblPersona`
  ADD CONSTRAINT `tblpersona_ibfk_1` FOREIGN KEY (`Rol_IdRol`) REFERENCES `tblrol` (`IdRol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `TblProducto`
--
ALTER TABLE `TblProducto`
  ADD CONSTRAINT `tblproducto_ibfk_1` FOREIGN KEY (`Cat_IdCategoria`) REFERENCES `tblcategoria` (`IdCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
