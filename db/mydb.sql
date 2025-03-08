-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2025 a las 01:14:50
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
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(45) NOT NULL,
  `descripcion_categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_categoria`, `nombre_categoria`, `descripcion_categoria`) VALUES
(0, 'Frutos secos ', 'Alimentos naturales y nutritivos, ricos en gr'),
(5008962, 'Mecatos ', 'Dulces');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_clientes` int(11) NOT NULL,
  `nombre_cliente` varchar(45) NOT NULL,
  `razonsocial_cliente` varchar(255) NOT NULL,
  `email_cliente` varchar(255) NOT NULL,
  `telefono_cliente` int(11) NOT NULL,
  `municipio_cliente` varchar(45) NOT NULL,
  `direccion_cliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `ID_compras` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `cantidad_compra` int(11) NOT NULL,
  `precio_unitario_compra` decimal(10,2) NOT NULL,
  `precio_total_compra` decimal(10,2) NOT NULL,
  `nota_compra` varchar(45) DEFAULT NULL,
  `estado_compra` enum('pendiente','completada','cancelada','en proceso','rechazada') NOT NULL,
  `ID_rol` int(11) NOT NULL,
  `ID_proveedores` int(11) NOT NULL,
  `ID_productos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `impuestos` decimal(10,2) NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  `metodo_de_pago` enum('Tarjeta','Efectivo') NOT NULL,
  `ID_ventas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_productos` int(11) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `descripcion_producto` varchar(45) NOT NULL,
  `inventario_producto` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `ID_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_productos`, `nombre_producto`, `descripcion_producto`, `inventario_producto`, `precio_venta`, `ID_categoria`) VALUES
(555, 'Avena', 'Bolsa 500G', 555, 5555, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_proveedores` int(11) NOT NULL,
  `nombre_proveedor` varchar(45) NOT NULL,
  `razonsocial_proveedor` varchar(255) NOT NULL,
  `telefono_proveedor` int(11) NOT NULL,
  `email_proveedor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_rol` int(11) NOT NULL,
  `nombre_rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_rol`, `nombre_rol`) VALUES
(1, 'ADMINISTRADOR'),
(6, 'JEFE DE VENTAS'),
(7, 'LOGISTICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `ID_rol` int(11) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_usuario`, `nombre_usuario`, `email_usuario`, `ID_rol`, `contraseña`, `telefono`) VALUES
(258476, 'Angema maria', 'kacaye3688@jomspar.com', 6, '123', 12354),
(1140852175, 'Matthew Eduardo Ramirez', 'matthew@hotmail.es', 1, '1234', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_ventas` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `cantidad_venta` int(11) NOT NULL,
  `precio_total_venta` decimal(10,2) NOT NULL,
  `nota_ventas` varchar(45) DEFAULT NULL,
  `estado_ventas` enum('pendiente','completada','cancelada','en proceso','rechazada') NOT NULL,
  `ID_rol` int(11) NOT NULL,
  `ID_clientes` int(11) NOT NULL,
  `ID_productos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_clientes`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`ID_compras`),
  ADD KEY `fk_compras_rol1` (`ID_rol`),
  ADD KEY `fk_compras_proveedores1` (`ID_proveedores`),
  ADD KEY `fk_compras_productos1` (`ID_productos`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_factura`),
  ADD KEY `fk_factura_ventas1` (`ID_ventas`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_productos`),
  ADD KEY `fk_productos_categoria1` (`ID_categoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_proveedores`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD KEY `ID_rol` (`ID_rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_ventas`),
  ADD KEY `fk_ventas_rol1` (`ID_rol`),
  ADD KEY `fk_ventas_clientes1` (`ID_clientes`),
  ADD KEY `fk_ventas_productos1` (`ID_productos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `ID_compras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_ventas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_compras_productos1` FOREIGN KEY (`ID_productos`) REFERENCES `productos` (`ID_productos`),
  ADD CONSTRAINT `fk_compras_proveedores1` FOREIGN KEY (`ID_proveedores`) REFERENCES `proveedores` (`ID_proveedores`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_compras_rol1` FOREIGN KEY (`ID_rol`) REFERENCES `rol` (`ID_rol`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_ventas1` FOREIGN KEY (`ID_ventas`) REFERENCES `ventas` (`ID_ventas`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria1` FOREIGN KEY (`ID_categoria`) REFERENCES `categoria` (`ID_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_rol`) REFERENCES `rol` (`ID_rol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_clientes1` FOREIGN KEY (`ID_clientes`) REFERENCES `clientes` (`ID_clientes`),
  ADD CONSTRAINT `fk_ventas_productos1` FOREIGN KEY (`ID_productos`) REFERENCES `productos` (`ID_productos`),
  ADD CONSTRAINT `fk_ventas_rol1` FOREIGN KEY (`ID_rol`) REFERENCES `rol` (`ID_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
