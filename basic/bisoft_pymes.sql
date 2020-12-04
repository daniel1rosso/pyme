-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2020 a las 20:32:08
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bisoft_pymes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `idAbono` int(11) NOT NULL,
  `idGenAbono` varchar(20) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL COMMENT 'Si es abono,mayorista, online, etc',
  `idSubcategoriaVenta` int(11) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVtoCobro` date NOT NULL,
  `tipoFactura` int(11) NOT NULL,
  `notaCliente` varchar(500) NOT NULL,
  `notaInterna` varchar(500) NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `descuentoCliente` double NOT NULL DEFAULT '0',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `fechaPrimerVenta` date NOT NULL,
  `fechaVencimientoCobro` date NOT NULL,
  `idAbonoModalidad` int(11) NOT NULL,
  `fechaInicioAbono` date NOT NULL,
  `fechaFinalizacion` date NOT NULL,
  `idEstado` int(11) NOT NULL,
  `ventasCreadas` int(11) NOT NULL,
  `fechaInicioServicio` date NOT NULL,
  `fechaFinServicio` date NOT NULL,
  `eliminado` int(1) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Cuando se activa'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abonos`
--

INSERT INTO `abonos` (`idAbono`, `idGenAbono`, `idCliente`, `idVendedor`, `idCategoria`, `idSubcategoriaVenta`, `fechaEmision`, `fechaVtoCobro`, `tipoFactura`, `notaCliente`, `notaInterna`, `descuentoGral`, `descuentoTotal`, `descuentoCliente`, `importeNetoNoGravado`, `ivaTotal`, `subTotalSinDescuento`, `subTotalConDescuento`, `total`, `fechaPrimerVenta`, `fechaVencimientoCobro`, `idAbonoModalidad`, `fechaInicioAbono`, `fechaFinalizacion`, `idEstado`, `ventasCreadas`, `fechaInicioServicio`, `fechaFinServicio`, `eliminado`, `fechaAlta`) VALUES
(1, 'af0da4db29620825d', 1, 1, 1, 1, '2020-04-17', '2020-07-17', 6, '', '', 0, 0, 0.51, 14.49, 0, 0, 0, 16.57, '2020-07-17', '2020-07-17', 1, '2020-03-16', '2020-12-17', 1, 5, '0000-00-00', '0000-00-00', 0, '2020-07-17 11:11:32'),
(2, '884c05e7d52775e5b', 1, 1, 1, 1, '2020-06-17', '2020-06-17', 6, '', '', 0, 0, 0.51, 4.49, 0, 0, 0, 5.13, '2020-07-16', '2020-06-17', 1, '2020-06-17', '2021-02-17', 1, 0, '0000-00-00', '0000-00-00', 1, '2020-07-17 11:15:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos_detalle`
--

CREATE TABLE `abonos_detalle` (
  `idDetalleAbono` int(11) NOT NULL,
  `idGenAbono` varchar(20) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `iva` float NOT NULL,
  `ivaText` varchar(255) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abonos_detalle`
--

INSERT INTO `abonos_detalle` (`idDetalleAbono`, `idGenAbono`, `idProducto`, `cantidad`, `precio`, `descuento`, `subTotal`, `iva`, `ivaText`, `eliminado`, `fechaAlta`) VALUES
(1, 'af0da4db29620825d', 1, 3, 5, 0, 15, 0.105, '10,5', 0, '2020-07-17 11:11:32'),
(2, '884c05e7d52775e5b', 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-17 11:15:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos_logs`
--

CREATE TABLE `abonos_logs` (
  `id` int(11) NOT NULL,
  `idGenAbono` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abonos_logs`
--

INSERT INTO `abonos_logs` (`id`, `idGenAbono`, `fecha`) VALUES
(1, '884c05e7d52775e5b', '2020-07-17 11:26:11'),
(2, 'af0da4db29620825d', '2020-07-17 11:28:48'),
(3, 'af0da4db29620825d', '2020-07-17 11:29:05'),
(4, 'af0da4db29620825d', '2020-07-17 11:30:08'),
(5, 'af0da4db29620825d', '2020-07-17 11:37:39'),
(6, 'af0da4db29620825d', '2020-07-17 11:55:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono_modalidades`
--

CREATE TABLE `abono_modalidades` (
  `idAbonoModalidad` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `numeroModalidad` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abono_modalidades`
--

INSERT INTO `abono_modalidades` (`idAbonoModalidad`, `descripcion`, `numeroModalidad`) VALUES
(1, 'Mensual', 1),
(2, 'Bimestral', 2),
(3, 'Trimestral', 3),
(4, 'Cuatrimestral', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arqueo_cajas`
--

CREATE TABLE `arqueo_cajas` (
  `idArqueoCajas` int(11) NOT NULL,
  `idGenArqueoCajas` varchar(150) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `fechaInicioTurno` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaFinTurno` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `montoInicial` double NOT NULL,
  `montoFinal` double NOT NULL,
  `montoEsperado` double NOT NULL,
  `deposito` int(11) NOT NULL,
  `pagosEfectivo` double NOT NULL,
  `pagosTarjeta` double NOT NULL,
  `motivo` varchar(1000) NOT NULL DEFAULT '',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `arqueo_cajas`
--

INSERT INTO `arqueo_cajas` (`idArqueoCajas`, `idGenArqueoCajas`, `idUsuario`, `fechaInicioTurno`, `fechaFinTurno`, `montoInicial`, `montoFinal`, `montoEsperado`, `deposito`, `pagosEfectivo`, `pagosTarjeta`, `motivo`, `fechaAlta`, `eliminado`) VALUES
(1, '5a75a27484f85f5fe', 1, '2020-07-16 13:29:08', '2020-07-16 13:30:56', 0, 9, 9, 0, 0, 0, '', '2020-07-16 13:29:08', 0),
(2, '94f6a98fbd53cba77', 7, '2020-07-16 13:30:04', '2020-07-16 13:30:21', 10, 8, 8, 2, 0, 0, '', '2020-07-16 13:29:08', 0),
(3, 'f588cda049c50b9a3', 1, '2020-07-16 13:31:26', '2020-07-16 13:31:54', 0, 10, 10, 0, 0, 0, '', '2020-07-16 13:31:26', 0),
(4, 'c784029b8d63f13a6', 7, '2020-07-16 13:31:26', '2020-07-16 13:31:40', 1, 1, 1, 0, 0, 0, '', '2020-07-16 13:31:26', 0),
(5, '8d493a2e2a1e81b19', 6, '2020-07-16 13:31:35', '2020-07-16 13:31:46', 2, 2, 2, 0, 0, 0, '', '2020-07-16 13:31:35', 0),
(6, '0d05c43c620029997', 1, '2020-07-31 18:23:10', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '2020-07-31 18:23:10', 0),
(7, '78945fcad1d06b3cb', 6, '2020-07-31 18:24:45', '2020-09-02 01:19:30', 1222, 10, 1210, 12, 0, 0, '', '2020-07-31 18:23:10', 0),
(8, '06587a474d9c7278f', 6, '2020-09-02 01:19:42', '0000-00-00 00:00:00', 12, 0, 12, 0, 0, 0, '', '2020-09-02 01:19:42', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arqueo_cajas_depositos`
--

CREATE TABLE `arqueo_cajas_depositos` (
  `idDeposito` int(11) NOT NULL,
  `idGenArqueoCajas` varchar(150) NOT NULL,
  `deposito` double NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `arqueo_cajas_depositos`
--

INSERT INTO `arqueo_cajas_depositos` (`idDeposito`, `idGenArqueoCajas`, `deposito`, `fechaAlta`) VALUES
(1, '94f6a98fbd53cba77', 2, '2020-07-16 13:30:04'),
(2, '78945fcad1d06b3cb', 12, '2020-07-31 18:24:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cadetes`
--

CREATE TABLE `cadetes` (
  `idCadete` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas_ingresos_egresos`
--

CREATE TABLE `cajas_ingresos_egresos` (
  `IdIngEgr` int(11) NOT NULL,
  `idGenIngEgGasto` varchar(50) NOT NULL,
  `ingreso` float NOT NULL,
  `egreso` float NOT NULL,
  `descripcion` varchar(600) NOT NULL,
  `fechaAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idCuenta` int(11) NOT NULL COMMENT 'Hace referencia a la ',
  `idGenMovimiento` varchar(50) NOT NULL COMMENT 'Si se produce un movimiento entre cuentas, se genera es id de transaccion',
  `idTipo` int(11) NOT NULL COMMENT 'Indica que tipo es, si gasto, venta, compra,apertura o cierre de caja',
  `saldoActual` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajas_ingresos_egresos`
--

INSERT INTO `cajas_ingresos_egresos` (`IdIngEgr`, `idGenIngEgGasto`, `ingreso`, `egreso`, `descripcion`, `fechaAlta`, `idCuenta`, `idGenMovimiento`, `idTipo`, `saldoActual`) VALUES
(1, '5b3ed527fa940ee11', 0.75, 0, '', '2020-07-15 13:25:05', 1, '0', 1, 0),
(2, '5b3ed527fa940ee11', 30, 0, '', '2020-07-15 13:25:27', 1, '0', 1, 0),
(3, 'a6b5fa32cc015bafc', 0.13, 0, '', '2020-07-15 13:39:37', 1, '0', 1, 0),
(4, '977f6b7b119d2f60c', 10.25, 0, '', '2020-07-16 12:21:17', 1, '0', 1, 0),
(5, '9237a27eb93b0aac618bd19cef7ea18a', 0, 1, '', '2020-07-16 13:08:54', 2, '0', 3, 0),
(6, '9237a27eb93b0aac618bd19cef7ea18a', 0, 99, '', '2020-07-16 13:09:23', 2, '0', 3, 0),
(7, '94f6a98fbd53cba77', 0, 10, 'Caja chica del usuario iniciada', '2020-07-16 13:29:08', 1, '0', 4, 0),
(8, '94f6a98fbd53cba77', 1, 0, 'Deposito', '2020-07-16 13:30:04', 30, '0', 4, 1),
(9, '94f6a98fbd53cba77', 8, 0, 'Caja chica del usuario cerrada', '2020-07-16 13:30:21', 30, '0', 4, 9),
(10, 'c784029b8d63f13a6', 0, 1, 'Caja chica del usuario iniciada', '2020-07-16 13:31:26', 1, '0', 4, 9),
(11, '8d493a2e2a1e81b19', 0, 2, 'Caja chica del usuario iniciada', '2020-07-16 13:31:35', 1, '0', 4, 7),
(12, 'c784029b8d63f13a6', 1, 0, 'Caja chica del usuario cerrada', '2020-07-16 13:31:40', 30, '0', 4, 8),
(13, '8d493a2e2a1e81b19', 2, 0, 'Caja chica del usuario cerrada', '2020-07-16 13:31:46', 29, '0', 4, 10),
(14, '78945fcad1d06b3cb', 0, 1222, 'Caja chica del usuario iniciada', '2020-07-31 18:23:10', 1, '0', 4, 10),
(15, '78945fcad1d06b3cb', 1, 0, 'Deposito', '2020-07-31 18:24:45', 29, '0', 4, 11),
(16, '78945fcad1d06b3cb', 10, 0, 'Caja chica del usuario cerrada', '2020-09-02 01:19:30', 29, '0', 4, 21),
(17, '06587a474d9c7278f', 0, 12, 'Caja chica del usuario iniciada', '2020-09-02 01:19:42', 1, '0', 4, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_compras`
--

CREATE TABLE `categorias_compras` (
  `idCategoriaCompras` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_compras`
--

INSERT INTO `categorias_compras` (`idCategoriaCompras`, `descripcion`, `fechaAlta`) VALUES
(1, 'Test', '2020-07-15 12:39:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_compra_detalle`
--

CREATE TABLE `categorias_compra_detalle` (
  `idCategoriaCompraDetalle` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_gastos_general`
--

CREATE TABLE `categorias_gastos_general` (
  `idCategoriaGastos` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_subcategorias_compra_detalle`
--

CREATE TABLE `categorias_subcategorias_compra_detalle` (
  `idSubcategoriaCompra` int(11) NOT NULL,
  `idCategoriaCompra` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_subcategorias_venta_detalle`
--

CREATE TABLE `categorias_subcategorias_venta_detalle` (
  `idSubcategoriaVenta` int(11) NOT NULL,
  `IdCategoriaVentaDetalle` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_subcategorias_venta_detalle`
--

INSERT INTO `categorias_subcategorias_venta_detalle` (`idSubcategoriaVenta`, `IdCategoriaVentaDetalle`, `descripcion`, `fechaAlta`) VALUES
(1, 1, 'Test 1', '2020-07-15 12:37:36'),
(2, 1, 'Test 2', '2020-07-15 12:37:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_ventas`
--

CREATE TABLE `categorias_ventas` (
  `idCategoriaVentas` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_ventas`
--

INSERT INTO `categorias_ventas` (`idCategoriaVentas`, `descripcion`, `fechaAlta`) VALUES
(1, 'Test', '2020-07-15 12:37:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenCliente` varchar(150) NOT NULL,
  `nombEmpresa` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `cel` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pagWeb` varchar(100) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `apodoMl` varchar(100) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `piso` varchar(15) NOT NULL,
  `dpto` varchar(15) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `nota` varchar(600) NOT NULL,
  `eliminado` int(2) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `idUsuario`, `idGenCliente`, `nombEmpresa`, `nombre`, `apellido`, `tel`, `cel`, `email`, `pagWeb`, `domicilio`, `apodoMl`, `idLocalidad`, `idProvincia`, `numero`, `piso`, `dpto`, `cp`, `nota`, `eliminado`, `fechaAlta`) VALUES
(1, 1, '0BNhnY0qBiOkjzs', 'Daniel', 'Daniel', 'Rosso', '123123123', '12312312', 'ferredani@hotmail.com', 'ferredani.com', 'General Paz', 'Ferreteria Dani', 897, 7, '221', '1', '18', '5900', '', 0, '2020-07-15 12:36:26'),
(2, 1, 'YHyFean7816HPxQ', 'Coso', 'So', 'Co', '', '', '', '', 'dddd', '', 286, 3, '2', '2', '2', '2222', '', 0, '2020-07-15 12:45:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_cuenta_corriente`
--

CREATE TABLE `clientes_cuenta_corriente` (
  `idCuentaCorriente` int(8) UNSIGNED ZEROFILL NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idGenIngreso` varchar(20) NOT NULL DEFAULT '0',
  `idGenNota` varchar(150) NOT NULL DEFAULT '0',
  `idGenComprobante` varchar(50) NOT NULL,
  `debito` float NOT NULL COMMENT 'Los movimientos que generan la deuda del cliente. Lo que le DEBE a la EMPRESA',
  `credito` float NOT NULL COMMENT 'Los movimientos que se ACREDITAN en la EMPRESA.Los pagos que realizan el cliente',
  `nombPdf` varchar(50) NOT NULL COMMENT 'id de comprobante que se genera por el pago realizado',
  `idMedioCobro` int(11) NOT NULL,
  `saldo` float NOT NULL,
  `descripcion` varchar(600) NOT NULL,
  `fechaCobro` datetime NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes_cuenta_corriente`
--

INSERT INTO `clientes_cuenta_corriente` (`idCuentaCorriente`, `idCliente`, `idGenIngreso`, `idGenNota`, `idGenComprobante`, `debito`, `credito`, `nombPdf`, `idMedioCobro`, `saldo`, `descripcion`, `fechaCobro`, `fechaAlta`, `eliminado`) VALUES
(00000001, 1, '5b3ed527fa940ee11', '0', '0', 25.63, 0, '', 0, 25.63, 'Ajuste al editar la venta', '2020-07-15 10:05:04', '2020-07-15 13:05:04', 0),
(00000002, 1, '6bc31478a78fcbea1', '0', '0', 25.63, 0, '', 0, 25.63, 'Primer ingreso', '2020-07-15 10:10:41', '2020-07-15 13:10:41', 1),
(00000003, 1, '5b3ed527fa940ee11', '0', '31b9fdb6ae50b722ec63b710dd440a37', 0, 0.75, '', 1, 24.88, '', '2020-07-15 00:00:00', '2020-07-15 13:25:05', 0),
(00000004, 1, '5b3ed527fa940ee11', '0', '217daf3e6c4be3f4c66f31712496c0ea', 0, 30, '', 1, -5.12, '', '2020-07-15 00:00:00', '2020-07-15 13:25:27', 0),
(00000005, 2, '98434320e5233c923', '0', '0', 10.25, 0, '', 1, 10.25, 'Ajuste al editar la venta', '2020-07-15 10:29:15', '2020-07-15 13:29:15', 0),
(00000006, 1, 'a6b5fa32cc015bafc', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-15 10:32:24', '2020-07-15 13:32:24', 0),
(00000007, 1, 'a6b5fa32cc015bafc', '9b0469b50a8e99b80', '0', 5.53, 0, '', 1, 5.53, 'Nota de Crédito', '2020-07-15 10:37:27', '2020-07-15 13:37:27', 0),
(00000008, 1, 'a6b5fa32cc015bafc', '0dd7c61ae0a871156', '0', 15.75, 0, '', 1, 15.75, 'Nota de Débito', '2020-07-15 10:38:21', '2020-07-15 13:38:21', 0),
(00000009, 1, 'a6b5fa32cc015bafc', '0', '4231fe57a1b9566f8d399a2cce1824b3', 0, 0.13, '', 1, 4.87, '', '2020-07-15 00:00:00', '2020-07-15 13:39:37', 0),
(00000010, 2, '2d117d0b4d03ee50d', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-15 11:19:29', '2020-07-15 14:19:29', 0),
(00000011, 2, '44b7941ca293f04ac', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-15 11:45:20', '2020-07-15 14:45:20', 0),
(00000012, 2, '035249a1f80676922', '0', '0', 10.25, 0, '', 1, 10.25, 'Ajuste al editar la venta', '2020-07-15 11:46:23', '2020-07-15 14:46:23', 0),
(00000013, 2, '51ecf2dbca2315b96', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-15 11:48:52', '2020-07-15 14:48:52', 0),
(00000014, 2, '40a0928fd93ce2aa9', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-15 11:49:08', '2020-07-15 14:49:08', 0),
(00000015, 1, 'b673c434d4ca8e0e5', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:25:04', '2020-07-16 11:25:04', 0),
(00000016, 1, '7635297f28bcff705', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:25:04', '2020-07-16 11:25:04', 0),
(00000017, 1, '4d086f9be593834ac', '0', '0', 41, 0, '', 0, 41, 'Venta generada cron', '2020-07-16 08:29:46', '2020-07-16 11:29:46', 0),
(00000018, 1, 'f4b3f8bbc5a8a9d5e', '0', '0', 25.63, 0, '', 0, 25.63, 'Venta generada cron', '2020-07-16 08:29:46', '2020-07-16 11:29:46', 0),
(00000019, 1, '9b94d6ebc793d20a1', '0', '0', 10.25, 0, '', 0, 10.25, 'Primer ingreso', '2020-07-16 08:47:45', '2020-07-16 11:47:45', 0),
(00000020, 1, '9f5078bb0ff4f4c25', '0', '0', 5.13, 0, '', 0, 5.13, 'Primer ingreso', '2020-07-16 08:47:45', '2020-07-16 11:47:45', 0),
(00000021, 1, 'ecf3aa3f44f57ba95', '0', '0', 10.25, 0, '', 0, 10.25, 'Venta generada cron', '2020-07-16 08:48:47', '2020-07-16 11:48:47', 0),
(00000022, 1, '82988aa29aad27cec', '0', '0', 5.13, 0, '', 0, 5.13, 'Venta generada cron', '2020-07-16 08:48:47', '2020-07-16 11:48:47', 0),
(00000023, 1, '3b0dddac896401ed9', '0', '0', 10.25, 0, '', 0, 10.25, 'Venta generada cron', '2020-07-16 08:57:14', '2020-07-16 11:57:14', 0),
(00000024, 1, '9873be787de5a25a3', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:57:14', '2020-07-16 11:57:14', 0),
(00000025, 1, 'e2f2e185283ffcf50', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:57:14', '2020-07-16 11:57:14', 0),
(00000026, 1, 'eab56f33ceffff8e4', '0', '0', 41, 0, '', 0, 41, 'Venta generada cron', '2020-07-16 08:57:14', '2020-07-16 11:57:14', 0),
(00000027, 1, '413db0488c8c852e7', '0', '0', 25.63, 0, '', 0, 25.63, 'Venta generada cron', '2020-07-16 08:57:14', '2020-07-16 11:57:14', 0),
(00000028, 1, '9d34770d4a0eb8bd6', '0', '0', 5.13, 0, '', 0, 5.13, 'Venta generada cron', '2020-07-16 08:57:14', '2020-07-16 11:57:14', 0),
(00000029, 1, 'c307791462a57b0ce', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:57:52', '2020-07-16 11:57:52', 0),
(00000030, 1, '53b763e539a5afc22', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:57:52', '2020-07-16 11:57:52', 0),
(00000031, 1, '6d7b5f8a862f917e7', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:58:07', '2020-07-16 11:58:07', 0),
(00000032, 1, '2559ce143997f4576', '0', '0', 20.5, 0, '', 0, 20.5, 'Primer ingreso', '2020-07-16 08:58:07', '2020-07-16 11:58:07', 0),
(00000033, 1, '0045ebf0d9fa79ce6', '0', '0', 10.25, 0, '', 0, 10.25, 'Venta generada cron', '2020-07-16 09:00:37', '2020-07-16 12:00:37', 0),
(00000034, 1, '977f6b7b119d2f60c', '0', '0', 10.25, 0, '', 0, 10.25, 'Venta generada cron', '2020-07-16 09:03:41', '2020-07-16 12:03:41', 0),
(00000035, 1, '977f6b7b119d2f60c', '0', '74d0945a1f693063299312c1213bdc21', 0, 10.25, '', 1, 0, '', '2020-07-16 00:00:00', '2020-07-16 12:21:17', 0),
(00000036, 1, 'da5999778fd5cb847', '0', '0', 10.25, 0, '', 0, 10.25, 'Venta generada cron', '2020-07-16 09:39:06', '2020-07-16 12:39:06', 0),
(00000037, 1, '193a224eb05464ff5', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-16 10:36:54', '2020-07-16 13:36:54', 0),
(00000038, 1, '1c74fcd41edf69518', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-16 10:38:38', '2020-07-16 13:38:38', 0),
(00000039, 1, '977f6b7b119d2f60c', 'a4ffcd389aab38257', '0', 0, 5.53, '', 1, 5.53, 'Nota de Crédito', '2020-07-16 10:44:26', '2020-07-16 13:44:26', 0),
(00000040, 1, 'ff949f1c5d66d2400', '0', '0', 5.53, 0, '', 1, 5.53, 'Primer ingreso', '2020-07-16 10:45:08', '2020-07-16 13:45:08', 0),
(00000041, 1, 'eb1e3d0785bca435f', '0', '0', 16.57, 0, '', 1, 16.57, 'Ajuste al editar la venta', '2020-07-16 11:23:07', '2020-07-16 14:23:07', 0),
(00000042, 1, 'a6b5fa32cc015bafc', 'fcd68d9ef8f51e6dc', '0', 5.25, 0, '', 1, 5.25, 'Nota de Débito', '2020-07-16 11:36:24', '2020-07-16 14:36:24', 0),
(00000043, 1, 'c307791462a57b0ce', 'afada0bb6a5baac6a', '0', 5, 0, '', 1, 5, 'Nota de Débito', '2020-07-16 11:52:20', '2020-07-16 14:52:20', 0),
(00000044, 1, '193a224eb05464ff5', 'bc5f73d5c33b7fc7a', '0', 5.53, 0, '', 1, 5.53, 'Nota de Débito', '2020-07-16 11:52:43', '2020-07-16 14:52:43', 0),
(00000045, 1, 'c307791462a57b0ce', '26b2fed394d7148df', '0', 0, 5.13, '', 1, 5.13, 'Nota de Crédito', '2020-07-16 11:57:26', '2020-07-16 14:57:26', 0),
(00000046, 1, '41e34845a7a7dda32', '0', '0', 5.13, 0, '', 0, 5.13, 'Primer ingreso', '2020-07-17 08:26:11', '2020-07-17 11:26:11', 0),
(00000047, 1, 'a32bb91158bf91b70', '0', '0', 5.13, 0, '', 0, 5.13, 'Primer ingreso', '2020-07-17 08:28:48', '2020-07-17 11:28:48', 0),
(00000048, 1, '254e3a7016b496133', '0', '0', 5.13, 0, '', 0, 5.13, 'Venta generada cron', '2020-07-17 08:29:05', '2020-07-17 11:29:05', 0),
(00000049, 1, 'b18404f19be7d53f1', '0', '0', 11.05, 0, '', 0, 11.05, 'Primer ingreso', '2020-07-17 08:30:08', '2020-07-17 11:30:08', 0),
(00000050, 1, '53c135cc81345fec4', '0', '0', 16.57, 0, '', 0, 16.57, 'Venta generada cron', '2020-07-17 08:37:39', '2020-07-17 11:37:39', 0),
(00000051, 1, 'de977edd846f2413a', '0', '0', 11.05, 0, '', 0, 11.05, 'Venta generada cron', '2020-07-17 08:55:29', '2020-07-17 11:55:29', 0),
(00000052, 1, '8906bed6953a2a497', '0', '0', 5.13, 0, '', 1, 5.13, 'Primer ingreso', '2020-07-17 09:11:38', '2020-07-17 12:11:38', 0),
(00000053, 2, '774d913f1c9fb85ed', '0', '0', 35.88, 0, '', 1, 35.88, 'Ajuste al editar la venta', '2020-07-17 09:26:42', '2020-07-17 12:26:42', 0),
(00000054, 2, '977f6b7b119d2f60c', '8f4450c43c90ee8e1', '0', 0, 12.1, '', 1, 12.1, 'Nota de Crédito', '2020-07-17 09:54:10', '2020-07-17 12:54:10', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_detalle_facturacion`
--

CREATE TABLE `clientes_detalle_facturacion` (
  `idDetalleFacturacion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenCliente` varchar(150) NOT NULL,
  `razonSocial` varchar(150) NOT NULL,
  `idTipoDoc` int(11) NOT NULL,
  `cuit` bigint(11) NOT NULL,
  `idCondIva` int(11) NOT NULL,
  `idComprobante` int(11) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `cel` varchar(30) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes_detalle_facturacion`
--

INSERT INTO `clientes_detalle_facturacion` (`idDetalleFacturacion`, `idUsuario`, `idGenCliente`, `razonSocial`, `idTipoDoc`, `cuit`, `idCondIva`, `idComprobante`, `tel`, `cel`, `domicilio`, `idLocalidad`, `idProvincia`, `cp`, `fechaAlta`) VALUES
(1, 1, '0BNhnY0qBiOkjzs', 'Ferreteria Dani', 8, 39022456, 5, 5, '213231231', '123123123', 'General Paz 221', 897, 7, '5900', '2020-07-15 12:36:26'),
(2, 1, 'YHyFean7816HPxQ', '', 0, 0, 0, 0, '', '', '', 0, 0, '', '2020-07-15 12:45:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_detalle_ventas`
--

CREATE TABLE `clientes_detalle_ventas` (
  `idDetalleVenta` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenCliente` varchar(150) NOT NULL,
  `idCategoriaVentas` int(11) NOT NULL,
  `idListaPrecios` int(11) NOT NULL,
  `dtoGeneral` varchar(10) NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes_detalle_ventas`
--

INSERT INTO `clientes_detalle_ventas` (`idDetalleVenta`, `idUsuario`, `idGenCliente`, `idCategoriaVentas`, `idListaPrecios`, `dtoGeneral`, `notaCliente`, `fechaAlta`) VALUES
(1, 1, '0BNhnY0qBiOkjzs', 1, 0, '10', '', '2020-07-15 12:36:26'),
(2, 1, 'YHyFean7816HPxQ', 0, 0, '', '', '2020-07-15 12:45:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes_tipos`
--

CREATE TABLE `comprobantes_tipos` (
  `idTipoComprobante` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comprobantes_tipos`
--

INSERT INTO `comprobantes_tipos` (`idTipoComprobante`, `descripcion`, `fechaAlta`) VALUES
(1, 'A', '2019-02-22 12:10:48'),
(2, 'B', '2019-02-22 12:10:48'),
(3, 'C', '2019-02-22 12:10:48'),
(4, 'M', '2019-02-22 12:10:48'),
(5, 'E', '2019-02-22 12:10:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_facturacion`
--

CREATE TABLE `condicion_facturacion` (
  `idCondicionFacturacion` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `condicion_facturacion`
--

INSERT INTO `condicion_facturacion` (`idCondicionFacturacion`, `descripcion`, `fechaAlta`) VALUES
(1, 'Productos', '2020-04-17 14:33:33'),
(2, 'Servicios', '2020-04-17 14:33:33'),
(3, 'Productos y Servicios', '2020-04-17 14:33:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones_ecommerce`
--

CREATE TABLE `configuraciones_ecommerce` (
  `idConfiguracionEcommerce` int(11) NOT NULL,
  `idGenConfiguracionEcommerce` varchar(150) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `logo` varchar(300) NOT NULL,
  `nombreEmpresa` varchar(150) NOT NULL,
  `whatsapp` varchar(150) NOT NULL,
  `facebook` varchar(250) NOT NULL,
  `twitter` varchar(250) NOT NULL,
  `colorEnlacePrincipal` varchar(50) NOT NULL,
  `colorSecundario` varchar(50) NOT NULL,
  `colorTexto` varchar(50) NOT NULL,
  `ecommerce` int(11) NOT NULL DEFAULT '1',
  `envioInternacional` int(11) NOT NULL DEFAULT '1',
  `tarifaInternacional` double NOT NULL DEFAULT '0',
  `envioNacional` int(11) NOT NULL DEFAULT '1',
  `tarifaNacional` double NOT NULL DEFAULT '0',
  `envioCadeteria` int(11) NOT NULL DEFAULT '1',
  `envioMercadoEnvio` int(11) NOT NULL DEFAULT '1',
  `tarifaMercadoEnvio` double NOT NULL DEFAULT '0',
  `pagosEfectivo` int(2) NOT NULL DEFAULT '1',
  `pagosEfecCEntrega` int(2) NOT NULL DEFAULT '1',
  `pagosMercadoPago` int(2) NOT NULL DEFAULT '1',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones_ecommerce_imagenes`
--

CREATE TABLE `configuraciones_ecommerce_imagenes` (
  `idImagenConfiguracionEcommer` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `idGenConfiguracionEcommerce` varchar(150) NOT NULL,
  `posicion` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_tipos`
--

CREATE TABLE `documentos_tipos` (
  `idTipoDocumento` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documentos_tipos`
--

INSERT INTO `documentos_tipos` (`idTipoDocumento`, `descripcion`, `fechaAlta`) VALUES
(1, 'Acta nacimiento', '2019-02-22 12:19:08'),
(2, 'CDI', '2019-02-22 12:19:08'),
(3, 'Certificado de Migración', '2019-02-22 12:19:08'),
(4, 'CI Bs. As. RNP', '2019-02-22 12:19:08'),
(5, 'CI Extranjera', '2019-02-22 12:19:08'),
(6, 'CUIL', '2019-02-22 12:19:08'),
(7, 'CUIT', '2019-02-22 12:19:08'),
(8, 'DNI', '2019-02-22 12:19:08'),
(9, 'En trámite', '2019-02-22 12:19:08'),
(10, 'LC', '2019-02-22 12:19:08'),
(11, 'LE', '2019-02-22 12:19:08'),
(12, 'Pasaporte', '2019-02-22 12:19:08'),
(13, 'Sin identificar/venta global diaria', '2019-02-22 12:19:08'),
(14, 'Usado por Anses para Padrón', '2019-02-22 12:19:08'),
(0, '-', '2020-03-09 13:47:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `idEgreso` int(11) NOT NULL,
  `idGenEgreso` varchar(20) NOT NULL,
  `idTipoEgreso` int(11) NOT NULL COMMENT 'Si es venta u otro tipo de ingreso',
  `idProveedor` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `idCategoriaGasto` int(11) NOT NULL COMMENT 'Si es abono,mayorista, online, etc',
  `fechaEmision` date NOT NULL,
  `fechaVtoPago` date NOT NULL,
  `tipoFactura` int(11) NOT NULL,
  `fechaServDesde` date NOT NULL,
  `fechaServHasta` date NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `descuentoProveedor` double NOT NULL DEFAULT '0',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `totalVenta` float NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `aPagar` float NOT NULL,
  `saldado` int(1) NOT NULL,
  `idRazonSocial` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`idEgreso`, `idGenEgreso`, `idTipoEgreso`, `idProveedor`, `idVendedor`, `idCategoriaGasto`, `fechaEmision`, `fechaVtoPago`, `tipoFactura`, `fechaServDesde`, `fechaServHasta`, `descuentoGral`, `descuentoTotal`, `descuentoProveedor`, `importeNetoNoGravado`, `ivaTotal`, `totalVenta`, `notaCliente`, `notaInterna`, `subTotalSinDescuento`, `subTotalConDescuento`, `total`, `aPagar`, `saldado`, `idRazonSocial`, `idEstado`, `eliminado`, `fechaAlta`) VALUES
(1, '83746feff7fe55dd8', 1, 1, 1, 1, '2020-07-17', '2020-06-17', 6, '0000-00-00', '0000-00-00', 0, 0, 0, 10, 2.1, 0, '', '', 0, 0, 12.1, 12.1, 0, 1, 1, 0, '2020-07-17 13:32:38'),
(2, 'f02b87d6e83f867b9', 1, 2, 1, 1, '2020-07-17', '2020-06-17', 2, '0000-00-00', '0000-00-00', 0, 0, 0, 50, 5.25, 0, '', '', 0, 0, 55.25, 55.25, 0, 1, 1, 0, '2020-07-17 14:41:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos_detalle`
--

CREATE TABLE `egresos_detalle` (
  `idDetalleEgreso` int(11) NOT NULL,
  `idGenEgreso` varchar(20) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL,
  `precioDescuento` float NOT NULL,
  `subTotal` float NOT NULL,
  `idIva` float NOT NULL,
  `ivaText` varchar(50) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `egresos_detalle`
--

INSERT INTO `egresos_detalle` (`idDetalleEgreso`, `idGenEgreso`, `idProducto`, `cantidad`, `precio`, `descuento`, `precioDescuento`, `subTotal`, `idIva`, `ivaText`, `eliminado`, `fechaAlta`) VALUES
(1, '83746feff7fe55dd8', 1, 2, 5, 0, 0, 10, 0.21, '21', 0, '2020-07-17 13:32:39'),
(2, 'f02b87d6e83f867b9', 1, 10, 5, 0, 0, 50, 0.105, '10,5', 0, '2020-07-17 14:41:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos_estados`
--

CREATE TABLE `egresos_estados` (
  `idEstado` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `egresos_estados`
--

INSERT INTO `egresos_estados` (`idEstado`, `descripcion`, `fechaAlta`) VALUES
(1, 'A pagar', '2019-05-24 16:03:05'),
(2, 'Pagado', '2019-05-24 16:03:05'),
(3, 'Vencido', '2019-05-24 16:03:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos_tipos`
--

CREATE TABLE `egresos_tipos` (
  `IdTipoEgreso` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `egresos_tipos`
--

INSERT INTO `egresos_tipos` (`IdTipoEgreso`, `descripcion`, `fechaAlta`) VALUES
(1, 'Compra', '2019-05-24 16:01:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `razonSocial` varchar(150) NOT NULL,
  `idTipoAnteAfip` int(11) NOT NULL COMMENT 'Si es Responsable inscripto o monotributista',
  `cuit` varchar(20) NOT NULL,
  `iibb` varchar(20) NOT NULL,
  `inicioActividad` date NOT NULL,
  `puntoVta` int(4) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `idPais` int(4) NOT NULL,
  `idProvincia` int(4) NOT NULL,
  `idLocalidad` int(4) NOT NULL,
  `localidad` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `idTipoMoneda` int(2) NOT NULL DEFAULT '1' COMMENT 'Tipo de moneda que opera el sistema',
  `idConceptoFactura` int(11) NOT NULL COMMENT '       /**         * Concepto de la factura         *         * Opciones:         *         * 1 = Productos         * 2 = Servicios         * 3 = Productos y Servicios         **/',
  `cel` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `nombreSistema` varchar(100) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `stock` int(2) NOT NULL DEFAULT '0',
  `arqueo` int(2) NOT NULL DEFAULT '0',
  `facturaElectronica` int(2) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL,
  `certificado` varchar(255) NOT NULL,
  `idGenCaja` varchar(140) NOT NULL,
  `fechaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios_costos`
--

CREATE TABLE `envios_costos` (
  `idEnvioCosto` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `costo` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_abonos`
--

CREATE TABLE `estados_abonos` (
  `idEstado` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados_abonos`
--

INSERT INTO `estados_abonos` (`idEstado`, `descripcion`, `fechaAlta`) VALUES
(1, 'Activo', '2019-04-11 12:18:23'),
(2, 'Terminado', '2019-04-11 12:18:23'),
(3, 'Pausado', '2019-04-11 12:18:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_ingresos`
--

CREATE TABLE `estados_ingresos` (
  `idEstadoIngresos` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados_ingresos`
--

INSERT INTO `estados_ingresos` (`idEstadoIngresos`, `nombre`, `fechaAlta`) VALUES
(1, 'A Cobrar', '2020-02-27 10:57:54'),
(2, 'Cobrado', '2020-02-27 10:57:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_ingresos_egresos`
--

CREATE TABLE `estados_ingresos_egresos` (
  `idEstado` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados_ingresos_egresos`
--

INSERT INTO `estados_ingresos_egresos` (`idEstado`, `descripcion`, `fechaAlta`) VALUES
(1, 'Cobrado', '2019-03-08 19:29:04'),
(2, 'A cobrar', '2019-03-08 19:29:04'),
(3, 'Vencido', '2019-03-08 19:29:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `idCivil` int(11) NOT NULL,
  `cod` varchar(5) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`idCivil`, `cod`, `estado`, `fechaAlta`) VALUES
(1, 'CA', 'Casado', '2019-02-22 01:38:27'),
(2, 'SO', 'Soltero', '2019-02-22 01:38:27'),
(3, 'VI', 'Viudo', '2019-02-22 01:38:27'),
(4, 'CO', 'Concubinato', '2019-02-22 01:38:27'),
(5, 'DI', 'Divorciado', '2019-02-22 01:38:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int(11) NOT NULL,
  `nroFactura` varchar(25) NOT NULL,
  `cae` varchar(100) NOT NULL,
  `fechaVtoCae` datetime NOT NULL,
  `idGenIngreso` varchar(20) NOT NULL,
  `puntoVtaFact` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `nroFactura`, `cae`, `fechaVtoCae`, `idGenIngreso`, `puntoVtaFact`, `fechaAlta`) VALUES
(1, '12', 'sdfgsdfgwe33dedwedewf3', '2020-07-23 00:00:00', '977f6b7b119d2f60c', 1, '2020-07-16 12:18:06'),
(2, '1', 'fasdfafewt45t45t45', '2020-07-31 00:00:00', '8906bed6953a2a497', 1, '2020-07-17 12:24:12'),
(3, '4', 'hbyjrtyurt7u', '2020-07-28 00:00:00', '774d913f1c9fb85ed', 1, '2020-07-17 12:28:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_tipos`
--

CREATE TABLE `factura_tipos` (
  `idTipoFactura` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura_tipos`
--

INSERT INTO `factura_tipos` (`idTipoFactura`, `descripcion`, `fechaAlta`) VALUES
(6, 'X', '2020-02-20 20:39:33'),
(1, 'A', '2020-06-05 11:14:53'),
(2, 'B', '2020-06-05 11:15:05'),
(4, 'C', '2020-06-05 12:38:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `idGasto` int(11) NOT NULL,
  `idGenGasto` varchar(50) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `fechaGasto` date NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idSubCategoria` int(11) NOT NULL,
  `montoGasto` float NOT NULL,
  `descripcionGasto` varchar(600) NOT NULL,
  `idMedioPago` int(11) NOT NULL,
  `idTipoFactura` int(2) NOT NULL,
  `nombreImg` varchar(200) NOT NULL,
  `fechaVtoGasto` date NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUsuario` int(11) NOT NULL COMMENT 'Usuario que ejecuto la accion',
  `eliminado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`idGasto`, `idGenGasto`, `idEstado`, `fechaGasto`, `idCategoria`, `idSubCategoria`, `montoGasto`, `descripcionGasto`, `idMedioPago`, `idTipoFactura`, `nombreImg`, `fechaVtoGasto`, `fechaAlta`, `idUsuario`, `eliminado`) VALUES
(1, '9237a27eb93b0aac618bd19cef7ea18a', 2, '2020-07-16', 1, 1, 100, '', 2, 6, '', '2020-07-23', '2020-07-16 10:06:06', 1, 0),
(2, '1c25ff9e0455138a12f17b8f77a1a469', 1, '2020-07-16', 1, 2, 20, '', 16, 2, '', '2020-07-05', '2020-07-16 10:10:06', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_categorias`
--

CREATE TABLE `gastos_categorias` (
  `idCategoriaGasto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos_categorias`
--

INSERT INTO `gastos_categorias` (`idCategoriaGasto`, `descripcion`, `fechaAlta`) VALUES
(1, 'Test', '2020-07-15 12:38:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_estados`
--

CREATE TABLE `gastos_estados` (
  `idEstado` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos_estados`
--

INSERT INTO `gastos_estados` (`idEstado`, `descripcion`, `fechaAlta`) VALUES
(1, 'Pendiente', '2019-05-22 18:06:25'),
(2, 'Pagado', '2019-05-22 18:06:25'),
(3, 'Vencido', '2019-05-24 19:19:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_subcategorias`
--

CREATE TABLE `gastos_subcategorias` (
  `idSubCatGasto` int(11) NOT NULL,
  `idCategoriaGasto` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos_subcategorias`
--

INSERT INTO `gastos_subcategorias` (`idSubCatGasto`, `idCategoriaGasto`, `descripcion`, `fechaAlta`) VALUES
(1, 1, 'Test 1', '2020-07-15 12:38:31'),
(2, 1, 'Test 2', '2020-07-15 12:38:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico`
--

CREATE TABLE `historico` (
  `idHistorico` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idAccion` varchar(150) NOT NULL,
  `tipoAccion` varchar(150) NOT NULL,
  `tipoOperacion` int(11) NOT NULL,
  `detalle` varchar(150) NOT NULL,
  `total` float NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historico`
--

INSERT INTO `historico` (`idHistorico`, `idUsuario`, `idAccion`, `tipoAccion`, `tipoOperacion`, `detalle`, `total`, `fechaAlta`) VALUES
(1, 1, '', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-07-15 12:17:54'),
(2, 1, '', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-07-15 12:18:08'),
(3, 1, '', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-07-15 12:18:16'),
(4, 1, '1', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-07-15 12:20:41'),
(5, 1, '', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-07-15 12:27:49'),
(6, 1, '', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-07-15 12:29:46'),
(7, 1, '', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-07-15 12:31:12'),
(8, 1, '0BNhnY0qBiOkjzs', '1', 3, 'Se agregó el cliente Ferreteria Dani', 0, '2020-07-15 12:36:26'),
(9, 1, '1', '1', 10, 'Se agregó una categoría detalle de venta', 0, '2020-07-15 12:37:36'),
(10, 1, '3', '1', 12, 'Se agregó una nueva subcategoría de venta', 0, '2020-07-15 12:37:52'),
(11, 1, '1', '2', 10, 'Se modificó una categoría de venta', 0, '2020-07-15 12:38:07'),
(12, 1, '1', '1', 15, 'Se agregó una categoría de gastos', 0, '2020-07-15 12:38:31'),
(13, 1, '3', '1', 16, 'Se agregó una subcategoria de gasto', 0, '2020-07-15 12:38:42'),
(14, 1, '1', '2', 15, 'Se modificó una categoría de gasto', 0, '2020-07-15 12:38:53'),
(15, 1, '1', '1', 17, '', 0, '2020-07-15 12:39:02'),
(16, 1, '1', '2', 17, '', 0, '2020-07-15 12:40:02'),
(17, 1, '1', '2', 17, '', 0, '2020-07-15 12:41:06'),
(18, 1, '0BNhnY0qBiOkjzs', '2', 3, 'Se agregó el cliente Ferreteria Dani', 0, '2020-07-15 12:44:26'),
(19, 1, 'YHyFean7816HPxQ', '1', 3, 'Se agregó el cliente ', 0, '2020-07-15 12:45:04'),
(20, 1, 'euUkTfU2Dc0ww6I', '1', 4, 'Se agregó el proveedor ', 0, '2020-07-15 12:46:55'),
(21, 1, 'ux3OVBPAMv4LOAZ', '1', 4, 'Se agregó el proveedor Ros', 0, '2020-07-15 12:49:19'),
(22, 1, 'UmiVwXkVGK6zKoE', '1', 5, 'Se agregó un nuevo producto llamado Tornillo Auto 1/4', 0, '2020-07-15 12:51:04'),
(23, 1, 'UmiVwXkVGK6zKoE', '2', 5, 'Se modificó el producto Tornillo Auto 1/4', 0, '2020-07-15 12:52:39'),
(24, 1, 'ab8a1d1f2dc8c2186', '1', 26, 'Se agregó un nuevo abono a 1', 10.25, '2020-07-15 12:54:54'),
(25, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-15 12:55:41'),
(26, 1, 'ab8a1d1f2dc8c2186', '7', 26, 'Se pauso el abono', 0, '2020-07-15 12:56:22'),
(27, 1, 'ab8a1d1f2dc8c2186', '8', 26, 'Se pauso el abono', 0, '2020-07-15 12:56:27'),
(28, 1, 'ab8a1d1f2dc8c2186', '9', 26, 'Se pauso el abono', 0, '2020-07-15 12:56:31'),
(29, 1, '4782daec948bf26d7', '1', 26, 'Se agregó un nuevo abono a 1', 25.63, '2020-07-15 13:10:41'),
(30, 1, '5b3ed527fa940ee11', '2', 2, 'Se modificó una venta a 1', 35.88, '2020-07-15 13:12:43'),
(31, 1, '5b3ed527fa940ee11', '2', 2, 'Se modificó una venta a 1', 30.75, '2020-07-15 13:13:51'),
(32, 1, '5b3ed527fa940ee11', '1', 1, 'Se agregó un cobro a 1', 0.75, '2020-07-15 13:25:05'),
(33, 1, '5b3ed527fa940ee11', '1', 1, 'Se agregó un cobro a 1', 30, '2020-07-15 13:25:27'),
(34, 1, '2', '3', 2, 'Se elimino una venta', 0, '2020-07-15 13:26:15'),
(35, 1, '98434320e5233c923', '1', 2, 'Se agregó una venta a 2', 10.25, '2020-07-15 13:29:15'),
(36, 1, 'a6b5fa32cc015bafc', '1', 2, 'Se agregó una venta a 1', 5.13, '2020-07-15 13:32:24'),
(37, 1, '5b3ed527fa940ee11', '2', 2, 'Se modificó una venta a 1', 25.63, '2020-07-15 13:34:19'),
(38, 1, '9b0469b50a8e99b80', '1', 19, '1', 5, '2020-07-15 13:37:27'),
(39, 1, '0dd7c61ae0a871156', '1', 18, '1', 5, '2020-07-15 13:38:21'),
(40, 1, 'a6b5fa32cc015bafc', '1', 1, 'Se agregó un cobro a 1', 0.13, '2020-07-15 13:39:37'),
(41, 1, '98434320e5233c923', '2', 2, 'Se modificó una venta a 2', 10.25, '2020-07-15 13:57:31'),
(42, 1, '2d117d0b4d03ee50d', '1', 2, 'Se agregó una venta a 2', 5.13, '2020-07-15 14:19:29'),
(43, 1, '44b7941ca293f04ac', '1', 2, 'Se agregó una venta a 2', 5.13, '2020-07-15 14:45:20'),
(44, 1, '035249a1f80676922', '1', 2, 'Se agregó una venta a 2', 5.13, '2020-07-15 14:46:23'),
(45, 1, '51ecf2dbca2315b96', '1', 2, 'Se agregó una venta a 2', 5.13, '2020-07-15 14:48:52'),
(46, 1, '40a0928fd93ce2aa9', '1', 2, 'Se agregó una venta a 2', 5.13, '2020-07-15 14:49:08'),
(47, 1, '035249a1f80676922', '2', 2, 'Se modificó una venta a 2', 10.25, '2020-07-15 14:49:56'),
(48, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 11:36:19'),
(49, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 11:39:14'),
(50, 1, '5c23bb689e990583c', '1', 26, 'Se agregó un nuevo abono a 1', 5.13, '2020-07-16 11:40:33'),
(51, 1, '5c23bb689e990583c', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-16 11:42:14'),
(52, 1, '5c23bb689e990583c', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-16 11:42:57'),
(53, 1, '5c23bb689e990583c', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-16 11:45:14'),
(54, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 11:45:36'),
(55, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 11:47:04'),
(56, 1, 'eb4e5e0152ffe9ed3', '1', 26, 'Se agregó un nuevo abono a 2', 5.13, '2020-07-16 11:51:04'),
(57, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:00:34'),
(58, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:03:29'),
(59, 1, '977f6b7b119d2f60c', '1', 1, 'Se agregó un cobro a 1', 10.25, '2020-07-16 12:21:17'),
(60, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:38:45'),
(61, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:39:56'),
(62, 1, 'ab8a1d1f2dc8c2186', '7', 26, 'Se pauso el abono', 0, '2020-07-16 12:40:06'),
(63, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:40:28'),
(64, 1, 'ab8a1d1f2dc8c2186', '7', 26, 'Se pauso el abono', 0, '2020-07-16 12:40:48'),
(65, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:43:02'),
(66, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:46:25'),
(67, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:47:32'),
(68, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:49:03'),
(69, 1, 'ab8a1d1f2dc8c2186', '2', 26, 'Se modificó un nuevo abono a 1', 10.25, '2020-07-16 12:49:31'),
(70, 1, '1368207bacb0c0971', '7', 26, 'Se pauso el abono', 0, '2020-07-16 12:49:50'),
(71, 1, '1368207bacb0c0971', '2', 26, 'Se modificó un nuevo abono a 1', 41, '2020-07-16 12:50:02'),
(72, 1, 'eebf04446b9ea6729', '1', 25, 'Se agregó un presupuesto a 1', 5, '2020-07-16 12:51:36'),
(73, 1, 'fc295ef7c793706d4', '1', 25, 'Se agregó un presupuesto a 2', 5, '2020-07-16 12:51:55'),
(74, 1, 'fc295ef7c793706d4', '10', 25, 'Se envio el presupuesto', 0, '2020-07-16 12:52:16'),
(75, 1, 'fc295ef7c793706d4', '11', 25, 'Se rechazó el presupuesto', 0, '2020-07-16 12:52:20'),
(76, 1, 'fc295ef7c793706d4', '13', 25, 'El presupuesto esta en pendiente', 0, '2020-07-16 12:52:28'),
(77, 1, 'fc295ef7c793706d4', '12', 25, 'Se acepto el presupuesto', 0, '2020-07-16 12:52:33'),
(78, 1, 'fc295ef7c793706d4', '3', 25, 'Se eliminó un presupuesto', 0, '2020-07-16 12:52:42'),
(79, 1, '9237a27eb93b0aac618bd19cef7ea18a', '1', 8, 'Se agregó un gasto con la descripción ', 50, '2020-07-16 13:06:06'),
(80, 1, '9237a27eb93b0aac618bd19cef7ea18a', '2', 8, 'Se modifico un gasto con una descripcion Se modificó un gasto de 50 a 20', 20, '2020-07-16 13:07:08'),
(81, 1, '9237a27eb93b0aac618bd19cef7ea18a', '2', 8, 'Se modifico un gasto con una descripcion Se modificó un gasto de 20 a 100', 100, '2020-07-16 13:08:01'),
(82, 1, '1c25ff9e0455138a12f17b8f77a1a469', '1', 8, 'Se agregó un gasto con la descripción ', 20, '2020-07-16 13:10:06'),
(83, 1, '7', '4', 24, 'Se abrío un turno ', 10, '2020-07-16 13:29:08'),
(84, 1, '7', '6', 24, 'Se realizò un deposito', 1, '2020-07-16 13:30:04'),
(85, 1, '7', '5', 24, 'Se cerró un turno', 8, '2020-07-16 13:30:21'),
(86, 1, '1', '5', 24, 'Se cerró la caja con 9 y su valor de apertura fue de 1', 9, '2020-07-16 13:30:56'),
(87, 1, '7', '4', 24, 'Se abrío un turno ', 1, '2020-07-16 13:31:26'),
(88, 1, '6', '4', 24, 'Se abrío un turno ', 2, '2020-07-16 13:31:35'),
(89, 1, '7', '5', 24, 'Se cerró un turno', 1, '2020-07-16 13:31:40'),
(90, 1, '6', '5', 24, 'Se cerró un turno', 2, '2020-07-16 13:31:46'),
(91, 1, '1', '5', 24, 'Se cerró la caja con 10 y su valor de apertura fue de 1', 10, '2020-07-16 13:31:54'),
(92, 1, '193a224eb05464ff5', '1', 2, 'Se agregó una venta a 1', 5.13, '2020-07-16 13:36:54'),
(93, 1, '0BNhnY0qBiOkjzs', '2', 3, 'Se agregó el cliente Ferreteria Dani', 0, '2020-07-16 13:38:04'),
(94, 1, '1c74fcd41edf69518', '1', 2, 'Se agregó una venta a 1', 5.13, '2020-07-16 13:38:38'),
(95, 1, 'a4ffcd389aab38257', '1', 19, '1', 5.53, '2020-07-16 13:44:26'),
(96, 1, 'ff949f1c5d66d2400', '1', 2, 'Se agregó una venta a 1', 5.53, '2020-07-16 13:45:08'),
(97, 1, 'eb1e3d0785bca435f', '1', 2, 'Se agregó una venta a 1', 15.38, '2020-07-16 14:23:07'),
(98, 1, 'eb1e3d0785bca435f', '2', 2, 'Se modificó una venta a 1', 16.57, '2020-07-16 14:28:23'),
(99, 1, 'fcd68d9ef8f51e6dc', '1', 18, '1', 5.25, '2020-07-16 14:36:24'),
(100, 1, '0dd7c61ae0a871156', '2', 18, '1', 10.5, '2020-07-16 14:46:53'),
(101, 1, 'afada0bb6a5baac6a', '1', 18, '1', 5, '2020-07-16 14:52:20'),
(102, 1, 'bc5f73d5c33b7fc7a', '1', 18, '1', 5.53, '2020-07-16 14:52:43'),
(103, 1, '0dd7c61ae0a871156', '2', 18, '1', 10.5, '2020-07-16 14:54:35'),
(104, 1, '0dd7c61ae0a871156', '2', 18, '1', 15.75, '2020-07-16 14:54:49'),
(105, 1, '0dd7c61ae0a871156', '2', 18, '1', 15.75, '2020-07-16 14:55:19'),
(106, 1, '0dd7c61ae0a871156', '2', 18, '1', 15.75, '2020-07-16 14:55:48'),
(107, 1, '9b0469b50a8e99b80', '2', 19, '1', 5.53, '2020-07-16 14:57:03'),
(108, 1, '26b2fed394d7148df', '1', 19, '1', 5.13, '2020-07-16 14:57:26'),
(109, 1, 'af0da4db29620825d', '1', 26, 'Se agregó un nuevo abono a 1', 5.13, '2020-07-17 11:11:32'),
(110, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:12:23'),
(111, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:13:19'),
(112, 1, '884c05e7d52775e5b', '1', 26, 'Se agregó un nuevo abono a 1', 5.13, '2020-07-17 11:15:23'),
(113, 1, '884c05e7d52775e5b', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:15:57'),
(114, 1, '884c05e7d52775e5b', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:16:28'),
(115, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:24:29'),
(116, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:24:41'),
(117, 1, '884c05e7d52775e5b', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:26:11'),
(118, 1, '884c05e7d52775e5b', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:27:50'),
(119, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:28:38'),
(120, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 5.13, '2020-07-17 11:28:48'),
(121, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 11.05, '2020-07-17 11:30:08'),
(122, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 11.05, '2020-07-17 11:36:07'),
(123, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 16.57, '2020-07-17 11:36:44'),
(124, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 16.57, '2020-07-17 11:37:12'),
(125, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 16.57, '2020-07-17 11:37:30'),
(126, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 22.1, '2020-07-17 11:44:14'),
(127, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 16.57, '2020-07-17 11:45:57'),
(128, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 22.1, '2020-07-17 11:47:46'),
(129, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 16.57, '2020-07-17 11:49:06'),
(130, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 22.1, '2020-07-17 11:52:12'),
(131, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 11.05, '2020-07-17 11:54:27'),
(132, 1, '8906bed6953a2a497', '1', 2, 'Se agregó una venta a 1', 5.13, '2020-07-17 12:11:38'),
(133, 1, 'af0da4db29620825d', '2', 26, 'Se modificó un nuevo abono a 1', 16.57, '2020-07-17 12:21:37'),
(134, 1, '774d913f1c9fb85ed', '1', 2, 'Se agregó una venta a 2', 35.88, '2020-07-17 12:26:42'),
(135, 1, '774d913f1c9fb85ed', '2', 2, 'Se modificó una venta a 2', 35.88, '2020-07-17 12:27:22'),
(136, 1, '8f4450c43c90ee8e1', '1', 19, '2', 12.1, '2020-07-17 12:54:10'),
(137, 1, '83746feff7fe55dd8', '2', 2, 'Se modificó la compra de 1', 50, '2020-07-17 14:27:38'),
(138, 1, '83746feff7fe55dd8', '2', 2, 'Se modificó la compra de 1', 18.15, '2020-07-17 14:40:08'),
(139, 1, 'f02b87d6e83f867b9', '2', 2, 'Se modificó la compra de 2', 51.25, '2020-07-17 14:50:12'),
(140, 1, 'f02b87d6e83f867b9', '2', 2, 'Se modificó la compra de 2', 51.25, '2020-07-17 14:52:04'),
(141, 1, '83746feff7fe55dd8', '2', 2, 'Se modificó la compra de 1', 12.1, '2020-07-17 14:58:22'),
(142, 1, 'f02b87d6e83f867b9', '2', 2, 'Se modificó la compra de 2', 55.25, '2020-07-17 15:01:53'),
(143, 1, '6', '4', 24, 'Se abrío un turno ', 1222, '2020-07-31 18:23:10'),
(144, 1, '6', '6', 24, 'Se realizò un deposito', 1, '2020-07-31 18:24:45'),
(145, 1, '6', '5', 24, 'Se cerró un turno', 10, '2020-09-02 01:19:30'),
(146, 1, '6', '4', 24, 'Se abrío un turno ', 12, '2020-09-02 01:19:42'),
(147, 1, '', '2', 23, 'Se modificó la configuracion del sistema', 0, '2020-10-30 19:31:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_operacion`
--

CREATE TABLE `historico_operacion` (
  `idOperacion` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historico_operacion`
--

INSERT INTO `historico_operacion` (`idOperacion`, `descripcion`, `fechaAlta`) VALUES
(1, 'Cobro', '2019-03-07 02:09:19'),
(2, 'Venta', '2019-03-07 02:09:19'),
(3, 'Cliente', '2019-03-07 02:09:19'),
(4, 'Proveedor', '2019-03-07 02:09:19'),
(5, 'Producto', '2019-03-07 02:09:19'),
(6, 'Usuario', '2019-03-07 02:09:19'),
(7, 'Cuenta Tesoreria', '2019-03-13 14:19:24'),
(8, 'Gasto', '2019-06-09 18:44:26'),
(9, 'Pago', '2019-07-15 21:26:28'),
(10, 'Categoria Venta', '2019-07-15 21:34:03'),
(12, 'Subacategoria venta detalle', '2019-07-15 21:34:03'),
(13, 'Movimiento caja salida', '2019-07-15 21:56:14'),
(14, 'Movimiento caja entrada', '2019-07-15 21:59:08'),
(15, 'Categoria Gasto', '2019-07-15 22:03:54'),
(16, 'Subcategoria Gasto', '2019-07-15 22:03:54'),
(17, 'Categoria compra', '2019-07-15 22:03:54'),
(18, 'Nota Débito', '2020-05-04 13:58:23'),
(19, 'Nota Crédito', '2020-05-04 13:58:23'),
(20, 'Nota Débito Proveedor', '2020-05-12 13:23:28'),
(21, 'Nota Crédito Proveedor', '2020-05-12 13:23:28'),
(22, 'Configuracon E-Commerce', '2020-05-19 13:39:13'),
(23, 'Configuración del sistema', '2020-05-19 13:43:17'),
(24, 'Turno', '2020-06-08 13:40:02'),
(25, 'Presupuesto', '2020-06-09 14:33:58'),
(26, 'Abono', '2020-06-09 14:35:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_precio`
--

CREATE TABLE `historico_precio` (
  `idHistoricoPrecio` int(11) NOT NULL,
  `idGenProducto` varchar(150) NOT NULL,
  `montoActual` int(11) NOT NULL,
  `porcentajeDescuento` int(11) NOT NULL DEFAULT '0',
  `eliminado` int(2) NOT NULL DEFAULT '0',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historico_precio`
--

INSERT INTO `historico_precio` (`idHistoricoPrecio`, `idGenProducto`, `montoActual`, `porcentajeDescuento`, `eliminado`, `fechaAlta`) VALUES
(1, 'eQP63L85VnXQvX6', 1500, 5, 0, '2020-05-28 12:33:58'),
(2, 'LN4lSUxuJBdxqfw', 20, 10, 0, '2020-05-28 12:35:00'),
(3, 'woqec1nXU7AAqcT', 1500, 0, 0, '2020-06-11 12:14:20'),
(4, 'BT95eJAvPicCn7D', 123, 0, 0, '2020-06-11 13:10:15'),
(5, '6Lv1zilk1GNul5h', 25, 0, 0, '2020-06-12 12:10:49'),
(6, 'LsO349URNJgCFBl', 35, 0, 0, '2020-06-12 12:14:05'),
(7, '6oRyJCcUpQIF76X', 2112, 2, 1, '2020-07-07 12:31:15'),
(8, '6oRyJCcUpQIF76X', 2112, 2, 1, '2020-07-07 12:31:28'),
(9, '0Ay3miBqpmoOd4m', 111, 0, 1, '2020-07-07 12:32:45'),
(10, '0Ay3miBqpmoOd4m', 111, 0, 1, '2020-07-07 12:32:59'),
(11, 'vRAppUXzCEE1xPP', 1111, 0, 1, '2020-07-07 12:36:16'),
(12, 'vRAppUXzCEE1xPP', 111111, 0, 1, '2020-07-07 12:36:46'),
(13, 'Fs7zIhUfZZUor3J', 22, 0, 1, '2020-07-07 12:37:14'),
(14, 'Fs7zIhUfZZUor3J', 223, 0, 1, '2020-07-07 12:37:25'),
(15, 'BT95eJAvPicCn7D', 120, 0, 0, '2020-07-14 00:31:38'),
(16, 'KlWZRnCAQtuOhmn', 1, 0, 0, '2020-07-14 00:34:15'),
(17, 'UmiVwXkVGK6zKoE', 1000, 10, 0, '2020-07-15 12:51:04'),
(18, 'UmiVwXkVGK6zKoE', 1018, 10, 0, '2020-07-15 12:52:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_tipo`
--

CREATE TABLE `historico_tipo` (
  `idTipo` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historico_tipo`
--

INSERT INTO `historico_tipo` (`idTipo`, `descripcion`, `fechaAlta`) VALUES
(1, 'Creó', '2019-03-06 23:07:12'),
(2, 'Modificó', '2019-03-06 23:07:12'),
(3, 'Eliminó', '2019-03-06 23:07:26'),
(4, 'Abrió', '2020-06-08 10:40:48'),
(5, 'Cerró', '2020-06-08 10:40:48'),
(6, 'Depósito', '2020-06-08 10:42:35'),
(7, 'Pausó', '2020-06-09 11:36:55'),
(8, 'Terminó', '2020-06-09 11:36:55'),
(9, 'Activó', '2020-06-09 11:37:14'),
(10, 'Enviado', '2020-06-09 11:49:50'),
(11, 'Aceptado', '2020-06-09 11:49:50'),
(12, 'Rechazado', '2020-06-09 11:49:59'),
(13, 'Pendiente', '2020-06-09 11:55:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `idIngrediente` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `unidadMedida` varchar(100) NOT NULL COMMENT 'Que unidad de meda, Kg, gr, etc',
  `fechaAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `idIngreso` int(11) NOT NULL,
  `idGenIngreso` varchar(20) NOT NULL,
  `idGenPedido` varchar(50) NOT NULL,
  `idTipoIngreso` int(11) NOT NULL COMMENT 'Si es venta u otro tipo de ingreso',
  `idGenAbono` varchar(20) NOT NULL,
  `idGenPresupuesto` varchar(150) NOT NULL DEFAULT '0',
  `idCliente` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL COMMENT 'Si es abono,mayorista, online, etc',
  `idSubcategoriaVenta` int(11) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVtoCobro` date NOT NULL,
  `tipoFactura` int(11) NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `descuentoCliente` double NOT NULL DEFAULT '0',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `idRazonSocial` int(11) NOT NULL,
  `aCobrar` float NOT NULL,
  `saldado` int(1) NOT NULL COMMENT 'Si fue cobrado o no	',
  `idEstado` int(11) NOT NULL COMMENT 'Saber en que estado se encuentra, Cobrado, vencido y A cobrar',
  `fechaInicioServicio` date DEFAULT NULL,
  `fechaFinServicio` date DEFAULT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`idIngreso`, `idGenIngreso`, `idGenPedido`, `idTipoIngreso`, `idGenAbono`, `idGenPresupuesto`, `idCliente`, `idVendedor`, `idCategoria`, `idSubcategoriaVenta`, `fechaEmision`, `fechaVtoCobro`, `tipoFactura`, `descuentoGral`, `descuentoTotal`, `descuentoCliente`, `importeNetoNoGravado`, `ivaTotal`, `notaCliente`, `notaInterna`, `subTotalSinDescuento`, `subTotalConDescuento`, `total`, `idRazonSocial`, `aCobrar`, `saldado`, `idEstado`, `fechaInicioServicio`, `fechaFinServicio`, `eliminado`, `fechaAlta`) VALUES
(1, '5b3ed527fa940ee11', '', 6, '1368207bacb0c0971', '0', 1, 1, 1, 0, '2020-06-17', '2021-01-20', 6, 0, 41, 4, 6, 0, '', '', 0, 0, 35.9, 0, 1, 41, 0, '0000-00-00', '0000-00-00', 0, '2020-07-15 13:05:04'),
(2, '6bc31478a78fcbea1', '', 2, '4782daec948bf26d7', '0', 1, 1, 1, 1, '2020-06-11', '2021-03-08', 6, 0, 0, 2.56, 22.44, 0, '', '', 0, 0, 25.63, 0, 25.63, 0, 2, '2020-06-04', '2021-01-12', 1, '2020-07-15 13:10:41'),
(3, '98434320e5233c923', '', 1, '0', '0', 2, 1, 1, 2, '2020-07-15', '2020-07-15', 6, 0, 0, 0, 10, 0, 'Nota para el cliente', 'Nota interna', 0, 0, 10.25, 0, 10.25, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-15 13:29:15'),
(4, 'a6b5fa32cc015bafc', '', 1, '0', '0', 1, 1, 1, 1, '2020-07-15', '2020-07-15', 6, 0, 0, 0.51, 4.49, 0, '', '', 0, 0, 5.13, 0, 4.87, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-15 13:32:24'),
(5, '2d117d0b4d03ee50d', '', 1, '0', '', 2, 1, 1, 2, '2020-07-15', '2020-07-15', 6, 0, 0, 0, 5, 0, '', '', 0, 0, 5.13, 0, 5.13, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-15 14:19:29'),
(6, '44b7941ca293f04ac', '', 1, '0', '', 2, 1, 1, 1, '2020-07-15', '2020-07-15', 6, 0, 0, 0, 5, 0, '', '', 0, 0, 5.13, 0, 5.13, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-15 14:45:20'),
(7, '035249a1f80676922', '', 1, '0', '', 2, 1, 1, 2, '2020-07-15', '2020-07-15', 1, 0, 0, 0, 10, 0, 'Nota para el cliente', 'Nota interna', 0, 0, 10.25, 1, 10.25, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-15 14:46:23'),
(8, '51ecf2dbca2315b96', '', 1, '0', '', 2, 1, 1, 1, '2020-07-15', '2020-07-15', 6, 0, 0, 0, 5, 0, '', '', 0, 0, 5.13, 0, 5.13, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-15 14:48:52'),
(9, '40a0928fd93ce2aa9', '', 1, '0', '', 2, 1, 1, 1, '2020-07-15', '2020-07-15', 6, 0, 0, 0, 5, 0, '', '', 0, 0, 5.13, 0, 5.13, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-15 14:49:08'),
(10, 'b673c434d4ca8e0e5', '', 2, 'b59f6b6e27de8247d', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 0, 2, NULL, '2021-02-24', 0, '2020-07-16 11:25:04'),
(11, '7635297f28bcff705', '', 2, '45886d32023c3db8d', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 0, 2, NULL, '2021-02-24', 0, '2020-07-16 11:25:04'),
(12, '4d086f9be593834ac', '', 6, '1368207bacb0c0971', '', 1, 20, 1, 0, '2020-06-17', '2021-01-20', 6, 0, 41, 4.1, 6, 0, '', '', 0, 0, 35.9, 0, 1, 41, 0, NULL, '2021-03-09', 0, '2020-07-16 11:29:46'),
(13, 'f4b3f8bbc5a8a9d5e', '', 2, '4782daec948bf26d7', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.56, 22.44, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 25.63, 0, 25.63, 0, 2, NULL, '2021-01-12', 0, '2020-07-16 11:29:46'),
(14, '9b94d6ebc793d20a1', '', 6, 'ab8a1d1f2dc8c2186', '', 1, 20, 1, 0, '2020-07-10', '2020-07-15', 6, 0, 10.25, 1.03, 6, 0, '', '', 0, 0, 8.97, 0, 1, 10, 0, NULL, '0000-00-00', 0, '2020-07-16 11:47:45'),
(15, '9f5078bb0ff4f4c25', '', 2, '5c23bb689e990583c', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 0.51, 4.49, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 5.13, 0, 5.13, 0, 2, NULL, '0000-00-00', 0, '2020-07-16 11:47:45'),
(16, 'ecf3aa3f44f57ba95', '', 6, 'ab8a1d1f2dc8c2186', '', 1, 20, 1, 0, '2020-07-10', '2020-07-15', 6, 0, 10.25, 1.03, 6, 0, '', '', 0, 0, 8.97, 0, 1, 10, 0, NULL, '0000-00-00', 0, '2020-07-16 11:48:47'),
(17, '82988aa29aad27cec', '', 2, '5c23bb689e990583c', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 0.51, 4.49, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 5.13, 0, 5.13, 0, 2, NULL, '0000-00-00', 0, '2020-07-16 11:48:47'),
(18, '3b0dddac896401ed9', '', 6, 'ab8a1d1f2dc8c2186', '', 1, 20, 1, 0, '2020-07-10', '2020-07-15', 6, 0, 10.25, 1.03, 6, 0, '', '', 0, 0, 8.97, 0, 1, 10, 0, NULL, '0000-00-00', 0, '2020-07-16 11:57:14'),
(19, '9873be787de5a25a3', '', 2, 'b59f6b6e27de8247d', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 0, 2, NULL, '2021-02-24', 0, '2020-07-16 11:57:14'),
(20, 'e2f2e185283ffcf50', '', 2, '45886d32023c3db8d', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 0, 2, NULL, '2021-02-24', 0, '2020-07-16 11:57:14'),
(21, 'eab56f33ceffff8e4', '', 6, '1368207bacb0c0971', '', 1, 20, 1, 0, '2020-06-17', '2021-01-20', 6, 0, 41, 4.1, 6, 0, '', '', 0, 0, 35.9, 0, 1, 41, 0, NULL, '2021-03-09', 0, '2020-07-16 11:57:14'),
(31, '193a224eb05464ff5', '', 1, '0', '', 1, 1, 1, 1, '2020-07-16', '2020-07-16', 1, 0, 0, 0.51, 4.49, 0, '', '', 0, 0, 5.13, 0, 5.13, 2, 2, '0000-00-00', '0000-00-00', 0, '2020-07-16 13:36:54'),
(22, '413db0488c8c852e7', '', 2, '4782daec948bf26d7', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.56, 22.44, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 25.63, 0, 25.63, 2, 2, NULL, '2021-01-12', 0, '2020-07-16 11:57:14'),
(23, '9d34770d4a0eb8bd6', '', 2, '5c23bb689e990583c', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 0.51, 4.49, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 5.13, 0, 5.13, 2, 2, NULL, '0000-00-00', 0, '2020-07-16 11:57:14'),
(24, 'c307791462a57b0ce', '', 2, 'b59f6b6e27de8247d', '', 1, 1, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 2, 2, NULL, '2021-02-24', 0, '2020-07-16 11:57:52'),
(25, '53b763e539a5afc22', '', 2, '45886d32023c3db8d', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 0, 2, NULL, '2021-02-24', 0, '2020-07-16 11:57:52'),
(26, '6d7b5f8a862f917e7', '', 2, 'b59f6b6e27de8247d', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 0, 2, NULL, '2021-02-24', 0, '2020-07-16 11:58:07'),
(27, '2559ce143997f4576', '', 2, '45886d32023c3db8d', '', 1, 20, 1, 1, '2020-07-16', '2020-07-16', 6, 0, 0, 2.05, 17.95, 0, 'Abono generado por Cron', 'Abono generado por Cron', 0, 0, 20.5, 0, 20.5, 0, 2, NULL, '2021-02-24', 0, '2020-07-16 11:58:07'),
(28, '0045ebf0d9fa79ce6', '', 6, 'ab8a1d1f2dc8c2186', '', 1, 20, 1, 0, '2020-07-10', '2020-07-15', 6, 0, 10.25, 1.03, 6, 0, '', '', 0, 0, 8.97, 0, 1, 10, 0, NULL, '0000-00-00', 0, '2020-07-16 12:00:37'),
(29, '977f6b7b119d2f60c', '', 6, 'ab8a1d1f2dc8c2186', '', 1, 1, 1, 0, '2020-07-10', '2020-07-15', 6, 0, 10.25, 1.03, 6, 0, '', '', 0, 0, 8.97, 0, 1, 10, 0, '0000-00-00', '0000-00-00', 0, '2020-07-16 12:03:41'),
(30, 'da5999778fd5cb847', '', 6, 'ab8a1d1f2dc8c2186', '', 1, 1, 1, 0, '2020-07-10', '2020-07-15', 6, 0, 10.25, 1.03, 6, 0, '', '', 0, 0, 8.97, 0, 1, 10, 0, '0000-00-00', '0000-00-00', 0, '2020-07-16 12:39:06'),
(32, '1c74fcd41edf69518', '', 1, '0', '', 1, 1, 1, 1, '2020-07-16', '2020-07-16', 1, 0, 0, 0.51, 4.49, 0, '', '', 0, 0, 5.13, 0, 5.13, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-16 13:38:38'),
(33, 'ff949f1c5d66d2400', '', 1, '0', '', 1, 1, 1, 1, '2020-07-16', '2020-07-16', 2, 0, 0, 0.55, 4.45, 0, '', '', 0, 0, 5.53, 1, 5.53, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-16 13:45:08'),
(35, '41e34845a7a7dda32', '', 2, '884c05e7d52775e5b', '0', 1, 1, 1, 1, '2020-05-17', '2020-06-17', 6, 0, 0, 0.51, 4.49, 0, '', '', 0, 0, 5.13, 0, 5.13, 0, 2, '0000-00-00', '0000-00-00', 1, '2020-07-17 11:26:11'),
(34, 'eb1e3d0785bca435f', '', 1, '0', '', 1, 1, 1, 1, '2020-07-16', '2020-07-16', 1, 0, 0, 1, 14, 1.575, 'Nota para el cliente', 'Nota interna', 0, 0, 16.57, 0, 16.57, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-16 14:23:07'),
(36, 'a32bb91158bf91b70', '', 6, 'af0da4db29620825d', '0', 1, 1, 1, 2, '2020-04-17', '2020-07-17', 6, 0, 16.57, 0.51, 6, 0, '', '', 0, 0, 14.49, 0, 1, 17, 2, '0000-00-00', '0000-00-00', 0, '2020-07-17 11:28:48'),
(37, '254e3a7016b496133', '', 6, 'af0da4db29620825d', '', 1, 1, 1, 2, '2020-04-17', '2020-07-17', 6, 0, 16.57, 0.51, 6, 0, '', '', 0, 0, 14.49, 0, 1, 17, 2, '0000-00-00', '0000-00-00', 0, '2020-07-17 11:29:05'),
(38, 'b18404f19be7d53f1', '', 6, 'af0da4db29620825d', '0', 1, 1, 1, 2, '2020-04-17', '2020-07-17', 6, 0, 16.57, 0.51, 6, 0, '', '', 0, 0, 14.49, 0, 1, 17, 3, '0000-00-00', '0000-00-00', 0, '2020-07-17 11:30:08'),
(39, '53c135cc81345fec4', '', 6, 'af0da4db29620825d', '', 1, 1, 1, 2, '2020-04-17', '2020-07-17', 6, 0, 16.57, 0.51, 6, 0, '', '', 0, 0, 14.49, 0, 1, 17, 2, '0000-00-00', '0000-00-00', 0, '2020-07-17 11:37:39'),
(40, 'de977edd846f2413a', '', 6, 'af0da4db29620825d', '', 1, 1, 1, 2, '2020-04-17', '2020-07-17', 6, 0, 16.57, 0.51, 6, 0, '', '', 0, 0, 14.49, 0, 1, 17, 2, '0000-00-00', '0000-00-00', 0, '2020-07-17 11:55:29'),
(41, '8906bed6953a2a497', '', 1, '0', '', 1, 1, 1, 1, '2020-07-17', '2020-07-17', 1, 0, 0, 0.51, 4.49, 0.125, '', '', 0, 0, 5.13, 1, 5.13, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-17 12:11:38'),
(42, '774d913f1c9fb85ed', '', 1, '0', '', 2, 1, 1, 1, '2020-07-17', '2020-07-17', 1, 0, 0, 0, 35, 0.875, 'Nota para el cliente', 'Nota interna', 0, 0, 35.88, 0, 35.88, 0, 2, '0000-00-00', '0000-00-00', 0, '2020-07-17 12:26:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos_detalle`
--

CREATE TABLE `ingresos_detalle` (
  `idDetalleIngreso` int(11) NOT NULL,
  `idGenIngresoAbono` varchar(20) NOT NULL,
  `idTipoProducto` int(1) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `iva` float NOT NULL,
  `ivaText` varchar(10) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingresos_detalle`
--

INSERT INTO `ingresos_detalle` (`idDetalleIngreso`, `idGenIngresoAbono`, `idTipoProducto`, `idProducto`, `cantidad`, `precio`, `descuento`, `subTotal`, `iva`, `ivaText`, `eliminado`, `fechaAlta`) VALUES
(1, '5b3ed527fa940ee11', 0, 1, 8, 5, 0, 40, 0.025, '2,5', 0, '2020-07-15 13:05:04'),
(2, '6bc31478a78fcbea1', 0, 1, 5, 5, 0, 25, 0.025, '2,5', 1, '2020-07-15 13:10:41'),
(3, '98434320e5233c923', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-15 13:29:15'),
(4, 'a6b5fa32cc015bafc', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-15 13:32:24'),
(5, '2d117d0b4d03ee50d', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-15 14:19:29'),
(6, '44b7941ca293f04ac', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-15 14:45:20'),
(7, '035249a1f80676922', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-15 14:46:23'),
(8, '51ecf2dbca2315b96', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-15 14:48:52'),
(9, '40a0928fd93ce2aa9', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-15 14:49:08'),
(10, 'b673c434d4ca8e0e5', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:25:04'),
(11, '7635297f28bcff705', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:25:04'),
(12, '4d086f9be593834ac', 0, 1, 8, 5, 0, 40, 0.025, '2,5', 0, '2020-07-16 11:29:46'),
(13, 'f4b3f8bbc5a8a9d5e', 0, 1, 5, 5, 0, 25, 0.025, '2,5', 0, '2020-07-16 11:29:46'),
(14, '9b94d6ebc793d20a1', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-16 11:47:45'),
(15, '9f5078bb0ff4f4c25', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-16 11:47:45'),
(16, 'ecf3aa3f44f57ba95', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-16 11:48:47'),
(17, '82988aa29aad27cec', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-16 11:48:47'),
(18, '3b0dddac896401ed9', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-16 11:57:14'),
(19, '9873be787de5a25a3', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:57:14'),
(20, 'e2f2e185283ffcf50', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:57:14'),
(21, 'eab56f33ceffff8e4', 0, 1, 8, 5, 0, 40, 0.025, '2,5', 0, '2020-07-16 11:57:14'),
(22, '413db0488c8c852e7', 0, 1, 5, 5, 0, 25, 0.025, '2,5', 0, '2020-07-16 11:57:14'),
(23, '9d34770d4a0eb8bd6', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-16 11:57:14'),
(24, 'c307791462a57b0ce', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:57:52'),
(25, '53b763e539a5afc22', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:57:52'),
(26, '6d7b5f8a862f917e7', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:58:07'),
(27, '2559ce143997f4576', 0, 1, 4, 5, 0, 20, 0.025, '2,5', 0, '2020-07-16 11:58:07'),
(28, '0045ebf0d9fa79ce6', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-16 12:00:37'),
(29, '977f6b7b119d2f60c', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-16 12:03:42'),
(30, 'da5999778fd5cb847', 0, 1, 2, 5, 0, 10, 0.025, '2,5', 0, '2020-07-16 12:39:06'),
(31, '193a224eb05464ff5', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-16 13:36:54'),
(32, '1c74fcd41edf69518', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-16 13:38:38'),
(33, 'ff949f1c5d66d2400', 0, 1, 1, 5, 0, 5, 0.105, '10,5', 0, '2020-07-16 13:45:08'),
(34, 'eb1e3d0785bca435f', 0, 1, 3, 5, 0, 15, 0.105, '10,5', 0, '2020-07-16 14:23:07'),
(35, '41e34845a7a7dda32', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 1, '2020-07-17 11:26:11'),
(36, 'a32bb91158bf91b70', 0, 1, 3, 5, 0, 15, 0.105, '10,5', 0, '2020-07-17 11:28:48'),
(37, '254e3a7016b496133', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-17 11:29:05'),
(38, 'b18404f19be7d53f1', 0, 1, 2, 5, 0, 10, 0.105, '10,5', 0, '2020-07-17 11:30:08'),
(39, '53c135cc81345fec4', 0, 1, 3, 5, 0, 15, 0.105, '10,5', 0, '2020-07-17 11:37:39'),
(40, 'de977edd846f2413a', 0, 1, 2, 5, 0, 10, 0.105, '10,5', 0, '2020-07-17 11:55:29'),
(41, '8906bed6953a2a497', 0, 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-17 12:11:38'),
(42, '774d913f1c9fb85ed', 0, 1, 7, 5, 0, 35, 0.025, '2,5', 0, '2020-07-17 12:26:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva_condiciones`
--

CREATE TABLE `iva_condiciones` (
  `idCondicionIva` int(11) NOT NULL,
  `codIva` varchar(2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `iva_condiciones`
--

INSERT INTO `iva_condiciones` (`idCondicionIva`, `codIva`, `descripcion`, `fechaAlta`) VALUES
(1, '05', 'Consumidor Final', '2019-02-22 01:40:58'),
(2, '04', 'Exento', '2019-02-22 01:40:58'),
(3, '07', 'Monotributista', '2019-02-22 01:40:58'),
(4, '03', 'No Responsable', '2019-02-22 01:40:58'),
(5, '01', 'Responsable Inscripto', '2019-02-22 01:40:58'),
(6, '08', 'No Categorizado', '2019-02-22 01:40:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva_tipos`
--

CREATE TABLE `iva_tipos` (
  `idIva` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `valorIva` float NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `iva_tipos`
--

INSERT INTO `iva_tipos` (`idIva`, `descripcion`, `valorIva`, `fechaAlta`) VALUES
(1, '2,5', 0.025, '2019-03-04 22:08:09'),
(2, '5', 0.05, '2019-03-04 22:08:09'),
(3, '10,5', 0.105, '2019-03-04 22:08:09'),
(4, '21', 0.21, '2019-03-04 22:08:09'),
(5, 'Exento', 0, '2019-03-04 22:08:09'),
(6, 'No Gravado', 0, '2019-03-04 22:08:09'),
(0, 'IVA', 0, '2020-03-09 13:41:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `idLocalidad` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `localidad` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idLocalidad`, `idProvincia`, `localidad`) VALUES
(1, 1, '25 de Mayo'),
(2, 1, '3 de febrero'),
(3, 1, 'A. Alsina'),
(4, 1, 'A. Gonzáles Cháves'),
(5, 1, 'Aguas Verdes'),
(6, 1, 'Alberti'),
(7, 1, 'Arrecifes'),
(8, 1, 'Ayacucho'),
(9, 1, 'Azul'),
(10, 1, 'Bahía Blanca'),
(11, 1, 'Balcarce'),
(12, 1, 'Baradero'),
(13, 1, 'Benito Juárez'),
(14, 1, 'Berisso'),
(15, 1, 'Bolívar'),
(16, 1, 'Bragado'),
(17, 1, 'Brandsen'),
(18, 1, 'Campana'),
(19, 1, 'Cañuelas'),
(20, 1, 'Capilla del Señor'),
(21, 1, 'Capitán Sarmiento'),
(22, 1, 'Carapachay'),
(23, 1, 'Carhue'),
(24, 1, 'Cariló'),
(25, 1, 'Carlos Casares'),
(26, 1, 'Carlos Tejedor'),
(27, 1, 'Carmen de Areco'),
(28, 1, 'Carmen de Patagones'),
(29, 1, 'Castelli'),
(30, 1, 'Chacabuco'),
(31, 1, 'Chascomús'),
(32, 1, 'Chivilcoy'),
(33, 1, 'Colón'),
(34, 1, 'Coronel Dorrego'),
(35, 1, 'Coronel Pringles'),
(36, 1, 'Coronel Rosales'),
(37, 1, 'Coronel Suarez'),
(38, 1, 'Costa Azul'),
(39, 1, 'Costa Chica'),
(40, 1, 'Costa del Este'),
(41, 1, 'Costa Esmeralda'),
(42, 1, 'Daireaux'),
(43, 1, 'Darregueira'),
(44, 1, 'Del Viso'),
(45, 1, 'Dolores'),
(46, 1, 'Don Torcuato'),
(47, 1, 'Ensenada'),
(48, 1, 'Escobar'),
(49, 1, 'Exaltación de la Cruz'),
(50, 1, 'Florentino Ameghino'),
(51, 1, 'Garín'),
(52, 1, 'Gral. Alvarado'),
(53, 1, 'Gral. Alvear'),
(54, 1, 'Gral. Arenales'),
(55, 1, 'Gral. Belgrano'),
(56, 1, 'Gral. Guido'),
(57, 1, 'Gral. Lamadrid'),
(58, 1, 'Gral. Las Heras'),
(59, 1, 'Gral. Lavalle'),
(60, 1, 'Gral. Madariaga'),
(61, 1, 'Gral. Pacheco'),
(62, 1, 'Gral. Paz'),
(63, 1, 'Gral. Pinto'),
(64, 1, 'Gral. Pueyrredón'),
(65, 1, 'Gral. Rodríguez'),
(66, 1, 'Gral. Viamonte'),
(67, 1, 'Gral. Villegas'),
(68, 1, 'Guaminí'),
(69, 1, 'Guernica'),
(70, 1, 'Hipólito Yrigoyen'),
(71, 1, 'Ing. Maschwitz'),
(72, 1, 'Junín'),
(73, 1, 'La Plata'),
(74, 1, 'Laprida'),
(75, 1, 'Las Flores'),
(76, 1, 'Las Toninas'),
(77, 1, 'Leandro N. Alem'),
(78, 1, 'Lincoln'),
(79, 1, 'Loberia'),
(80, 1, 'Lobos'),
(81, 1, 'Los Cardales'),
(82, 1, 'Los Toldos'),
(83, 1, 'Lucila del Mar'),
(84, 1, 'Luján'),
(85, 1, 'Magdalena'),
(86, 1, 'Maipú'),
(87, 1, 'Mar Chiquita'),
(88, 1, 'Mar de Ajó'),
(89, 1, 'Mar de las Pampas'),
(90, 1, 'Mar del Plata'),
(91, 1, 'Mar del Tuyú'),
(92, 1, 'Marcos Paz'),
(93, 1, 'Mercedes'),
(94, 1, 'Miramar'),
(95, 1, 'Monte'),
(96, 1, 'Monte Hermoso'),
(97, 1, 'Munro'),
(98, 1, 'Navarro'),
(99, 1, 'Necochea'),
(100, 1, 'Olavarría'),
(101, 1, 'Partido de la Costa'),
(102, 1, 'Pehuajó'),
(103, 1, 'Pellegrini'),
(104, 1, 'Pergamino'),
(105, 1, 'Pigüé'),
(106, 1, 'Pila'),
(107, 1, 'Pilar'),
(108, 1, 'Pinamar'),
(109, 1, 'Pinar del Sol'),
(110, 1, 'Polvorines'),
(111, 1, 'Pte. Perón'),
(112, 1, 'Puán'),
(113, 1, 'Punta Indio'),
(114, 1, 'Ramallo'),
(115, 1, 'Rauch'),
(116, 1, 'Rivadavia'),
(117, 1, 'Rojas'),
(118, 1, 'Roque Pérez'),
(119, 1, 'Saavedra'),
(120, 1, 'Saladillo'),
(121, 1, 'Salliqueló'),
(122, 1, 'Salto'),
(123, 1, 'San Andrés de Giles'),
(124, 1, 'San Antonio de Areco'),
(125, 1, 'San Antonio de Padua'),
(126, 1, 'San Bernardo'),
(127, 1, 'San Cayetano'),
(128, 1, 'San Clemente del Tuyú'),
(129, 1, 'San Nicolás'),
(130, 1, 'San Pedro'),
(131, 1, 'San Vicente'),
(132, 1, 'Santa Teresita'),
(133, 1, 'Suipacha'),
(134, 1, 'Tandil'),
(135, 1, 'Tapalqué'),
(136, 1, 'Tordillo'),
(137, 1, 'Tornquist'),
(138, 1, 'Trenque Lauquen'),
(139, 1, 'Tres Lomas'),
(140, 1, 'Villa Gesell'),
(141, 1, 'Villarino'),
(142, 1, 'Zárate'),
(143, 2, '11 de Septiembre'),
(144, 2, '20 de Junio'),
(145, 2, '25 de Mayo'),
(146, 2, 'Acassuso'),
(147, 2, 'Adrogué'),
(148, 2, 'Aldo Bonzi'),
(149, 2, 'Área Reserva Cinturón Ecológico'),
(150, 2, 'Avellaneda'),
(151, 2, 'Banfield'),
(152, 2, 'Barrio Parque'),
(153, 2, 'Barrio Santa Teresita'),
(154, 2, 'Beccar'),
(155, 2, 'Bella Vista'),
(156, 2, 'Berazategui'),
(157, 2, 'Bernal Este'),
(158, 2, 'Bernal Oeste'),
(159, 2, 'Billinghurst'),
(160, 2, 'Boulogne'),
(161, 2, 'Burzaco'),
(162, 2, 'Carapachay'),
(163, 2, 'Caseros'),
(164, 2, 'Castelar'),
(165, 2, 'Churruca'),
(166, 2, 'Ciudad Evita'),
(167, 2, 'Ciudad Madero'),
(168, 2, 'Ciudadela'),
(169, 2, 'Claypole'),
(170, 2, 'Crucecita'),
(171, 2, 'Dock Sud'),
(172, 2, 'Don Bosco'),
(173, 2, 'Don Orione'),
(174, 2, 'El Jagüel'),
(175, 2, 'El Libertador'),
(176, 2, 'El Palomar'),
(177, 2, 'El Tala'),
(178, 2, 'El Trébol'),
(179, 2, 'Ezeiza'),
(180, 2, 'Ezpeleta'),
(181, 2, 'Florencio Varela'),
(182, 2, 'Florida'),
(183, 2, 'Francisco Álvarez'),
(184, 2, 'Gerli'),
(185, 2, 'Glew'),
(186, 2, 'González Catán'),
(187, 2, 'Gral. Lamadrid'),
(188, 2, 'Grand Bourg'),
(189, 2, 'Gregorio de Laferrere'),
(190, 2, 'Guillermo Enrique Hudson'),
(191, 2, 'Haedo'),
(192, 2, 'Hurlingham'),
(193, 2, 'Ing. Sourdeaux'),
(194, 2, 'Isidro Casanova'),
(195, 2, 'Ituzaingó'),
(196, 2, 'José C. Paz'),
(197, 2, 'José Ingenieros'),
(198, 2, 'José Marmol'),
(199, 2, 'La Lucila'),
(200, 2, 'La Reja'),
(201, 2, 'La Tablada'),
(202, 2, 'Lanús'),
(203, 2, 'Llavallol'),
(204, 2, 'Loma Hermosa'),
(205, 2, 'Lomas de Zamora'),
(206, 2, 'Lomas del Millón'),
(207, 2, 'Lomas del Mirador'),
(208, 2, 'Longchamps'),
(209, 2, 'Los Polvorines'),
(210, 2, 'Luis Guillón'),
(211, 2, 'Malvinas Argentinas'),
(212, 2, 'Martín Coronado'),
(213, 2, 'Martínez'),
(214, 2, 'Merlo'),
(215, 2, 'Ministro Rivadavia'),
(216, 2, 'Monte Chingolo'),
(217, 2, 'Monte Grande'),
(218, 2, 'Moreno'),
(219, 2, 'Morón'),
(220, 2, 'Muñiz'),
(221, 2, 'Olivos'),
(222, 2, 'Pablo Nogués'),
(223, 2, 'Pablo Podestá'),
(224, 2, 'Paso del Rey'),
(225, 2, 'Pereyra'),
(226, 2, 'Piñeiro'),
(227, 2, 'Plátanos'),
(228, 2, 'Pontevedra'),
(229, 2, 'Quilmes'),
(230, 2, 'Rafael Calzada'),
(231, 2, 'Rafael Castillo'),
(232, 2, 'Ramos Mejía'),
(233, 2, 'Ranelagh'),
(234, 2, 'Remedios de Escalada'),
(235, 2, 'Sáenz Peña'),
(236, 2, 'San Antonio de Padua'),
(237, 2, 'San Fernando'),
(238, 2, 'San Francisco Solano'),
(239, 2, 'San Isidro'),
(240, 2, 'San José'),
(241, 2, 'San Justo'),
(242, 2, 'San Martín'),
(243, 2, 'San Miguel'),
(244, 2, 'Santos Lugares'),
(245, 2, 'Sarandí'),
(246, 2, 'Sourigues'),
(247, 2, 'Tapiales'),
(248, 2, 'Temperley'),
(249, 2, 'Tigre'),
(250, 2, 'Tortuguitas'),
(251, 2, 'Tristán Suárez'),
(252, 2, 'Trujui'),
(253, 2, 'Turdera'),
(254, 2, 'Valentín Alsina'),
(255, 2, 'Vicente López'),
(256, 2, 'Villa Adelina'),
(257, 2, 'Villa Ballester'),
(258, 2, 'Villa Bosch'),
(259, 2, 'Villa Caraza'),
(260, 2, 'Villa Celina'),
(261, 2, 'Villa Centenario'),
(262, 2, 'Villa de Mayo'),
(263, 2, 'Villa Diamante'),
(264, 2, 'Villa Domínico'),
(265, 2, 'Villa España'),
(266, 2, 'Villa Fiorito'),
(267, 2, 'Villa Guillermina'),
(268, 2, 'Villa Insuperable'),
(269, 2, 'Villa José León Suárez'),
(270, 2, 'Villa La Florida'),
(271, 2, 'Villa Luzuriaga'),
(272, 2, 'Villa Martelli'),
(273, 2, 'Villa Obrera'),
(274, 2, 'Villa Progreso'),
(275, 2, 'Villa Raffo'),
(276, 2, 'Villa Sarmiento'),
(277, 2, 'Villa Tesei'),
(278, 2, 'Villa Udaondo'),
(279, 2, 'Virrey del Pino'),
(280, 2, 'Wilde'),
(281, 2, 'William Morris'),
(282, 3, 'Agronomía'),
(283, 3, 'Almagro'),
(284, 3, 'Balvanera'),
(285, 3, 'Barracas'),
(286, 3, 'Belgrano'),
(287, 3, 'Boca'),
(288, 3, 'Boedo'),
(289, 3, 'Caballito'),
(290, 3, 'Chacarita'),
(291, 3, 'Coghlan'),
(292, 3, 'Colegiales'),
(293, 3, 'Constitución'),
(294, 3, 'Flores'),
(295, 3, 'Floresta'),
(296, 3, 'La Paternal'),
(297, 3, 'Liniers'),
(298, 3, 'Mataderos'),
(299, 3, 'Monserrat'),
(300, 3, 'Monte Castro'),
(301, 3, 'Nueva Pompeya'),
(302, 3, 'Núñez'),
(303, 3, 'Palermo'),
(304, 3, 'Parque Avellaneda'),
(305, 3, 'Parque Chacabuco'),
(306, 3, 'Parque Chas'),
(307, 3, 'Parque Patricios'),
(308, 3, 'Puerto Madero'),
(309, 3, 'Recoleta'),
(310, 3, 'Retiro'),
(311, 3, 'Saavedra'),
(312, 3, 'San Cristóbal'),
(313, 3, 'San Nicolás'),
(314, 3, 'San Telmo'),
(315, 3, 'Vélez Sársfield'),
(316, 3, 'Versalles'),
(317, 3, 'Villa Crespo'),
(318, 3, 'Villa del Parque'),
(319, 3, 'Villa Devoto'),
(320, 3, 'Villa Gral. Mitre'),
(321, 3, 'Villa Lugano'),
(322, 3, 'Villa Luro'),
(323, 3, 'Villa Ortúzar'),
(324, 3, 'Villa Pueyrredón'),
(325, 3, 'Villa Real'),
(326, 3, 'Villa Riachuelo'),
(327, 3, 'Villa Santa Rita'),
(328, 3, 'Villa Soldati'),
(329, 3, 'Villa Urquiza'),
(330, 4, 'Aconquija'),
(331, 4, 'Ancasti'),
(332, 4, 'Andalgalá'),
(333, 4, 'Antofagasta'),
(334, 4, 'Belén'),
(335, 4, 'Capayán'),
(336, 4, 'Capital'),
(337, 4, '4'),
(338, 4, 'Corral Quemado'),
(339, 4, 'El Alto'),
(340, 4, 'El Rodeo'),
(341, 4, 'F.Mamerto Esquiú'),
(342, 4, 'Fiambalá'),
(343, 4, 'Hualfín'),
(344, 4, 'Huillapima'),
(345, 4, 'Icaño'),
(346, 4, 'La Puerta'),
(347, 4, 'Las Juntas'),
(348, 4, 'Londres'),
(349, 4, 'Los Altos'),
(350, 4, 'Los Varela'),
(351, 4, 'Mutquín'),
(352, 4, 'Paclín'),
(353, 4, 'Poman'),
(354, 4, 'Pozo de La Piedra'),
(355, 4, 'Puerta de Corral'),
(356, 4, 'Puerta San José'),
(357, 4, 'Recreo'),
(358, 4, 'S.F.V de 4'),
(359, 4, 'San Fernando'),
(360, 4, 'San Fernando del Valle'),
(361, 4, 'San José'),
(362, 4, 'Santa María'),
(363, 4, 'Santa Rosa'),
(364, 4, 'Saujil'),
(365, 4, 'Tapso'),
(366, 4, 'Tinogasta'),
(367, 4, 'Valle Viejo'),
(368, 4, 'Villa Vil'),
(369, 5, 'Aviá Teraí'),
(370, 5, 'Barranqueras'),
(371, 5, 'Basail'),
(372, 5, 'Campo Largo'),
(373, 5, 'Capital'),
(374, 5, 'Capitán Solari'),
(375, 5, 'Charadai'),
(376, 5, 'Charata'),
(377, 5, 'Chorotis'),
(378, 5, 'Ciervo Petiso'),
(379, 5, 'Cnel. Du Graty'),
(380, 5, 'Col. Benítez'),
(381, 5, 'Col. Elisa'),
(382, 5, 'Col. Popular'),
(383, 5, 'Colonias Unidas'),
(384, 5, 'Concepción'),
(385, 5, 'Corzuela'),
(386, 5, 'Cote Lai'),
(387, 5, 'El Sauzalito'),
(388, 5, 'Enrique Urien'),
(389, 5, 'Fontana'),
(390, 5, 'Fte. Esperanza'),
(391, 5, 'Gancedo'),
(392, 5, 'Gral. Capdevila'),
(393, 5, 'Gral. Pinero'),
(394, 5, 'Gral. San Martín'),
(395, 5, 'Gral. Vedia'),
(396, 5, 'Hermoso Campo'),
(397, 5, 'I. del Cerrito'),
(398, 5, 'J.J. Castelli'),
(399, 5, 'La Clotilde'),
(400, 5, 'La Eduvigis'),
(401, 5, 'La Escondida'),
(402, 5, 'La Leonesa'),
(403, 5, 'La Tigra'),
(404, 5, 'La Verde'),
(405, 5, 'Laguna Blanca'),
(406, 5, 'Laguna Limpia'),
(407, 5, 'Lapachito'),
(408, 5, 'Las Breñas'),
(409, 5, 'Las Garcitas'),
(410, 5, 'Las Palmas'),
(411, 5, 'Los Frentones'),
(412, 5, 'Machagai'),
(413, 5, 'Makallé'),
(414, 5, 'Margarita Belén'),
(415, 5, 'Miraflores'),
(416, 5, 'Misión N. Pompeya'),
(417, 5, 'Napenay'),
(418, 5, 'Pampa Almirón'),
(419, 5, 'Pampa del Indio'),
(420, 5, 'Pampa del Infierno'),
(421, 5, 'Pdcia. de La Plaza'),
(422, 5, 'Pdcia. Roca'),
(423, 5, 'Pdcia. Roque Sáenz Peña'),
(424, 5, 'Pto. Bermejo'),
(425, 5, 'Pto. Eva Perón'),
(426, 5, 'Puero Tirol'),
(427, 5, 'Puerto Vilelas'),
(428, 5, 'Quitilipi'),
(429, 5, 'Resistencia'),
(430, 5, 'Sáenz Peña'),
(431, 5, 'Samuhú'),
(432, 5, 'San Bernardo'),
(433, 5, 'Santa Sylvina'),
(434, 5, 'Taco Pozo'),
(435, 5, 'Tres Isletas'),
(436, 5, 'Villa Ángela'),
(437, 5, 'Villa Berthet'),
(438, 5, 'Villa R. Bermejito'),
(439, 6, 'Aldea Apeleg'),
(440, 6, 'Aldea Beleiro'),
(441, 6, 'Aldea Epulef'),
(442, 6, 'Alto Río Sengerr'),
(443, 6, 'Buen Pasto'),
(444, 6, 'Camarones'),
(445, 6, 'Carrenleufú'),
(446, 6, 'Cholila'),
(447, 6, 'Co. Centinela'),
(448, 6, 'Colan Conhué'),
(449, 6, 'Comodoro Rivadavia'),
(450, 6, 'Corcovado'),
(451, 6, 'Cushamen'),
(452, 6, 'Dique F. Ameghino'),
(453, 6, 'Dolavón'),
(454, 6, 'Dr. R. Rojas'),
(455, 6, 'El Hoyo'),
(456, 6, 'El Maitén'),
(457, 6, 'Epuyén'),
(458, 6, 'Esquel'),
(459, 6, 'Facundo'),
(460, 6, 'Gaimán'),
(461, 6, 'Gan Gan'),
(462, 6, 'Gastre'),
(463, 6, 'Gdor. Costa'),
(464, 6, 'Gualjaina'),
(465, 6, 'J. de San Martín'),
(466, 6, 'Lago Blanco'),
(467, 6, 'Lago Puelo'),
(468, 6, 'Lagunita Salada'),
(469, 6, 'Las Plumas'),
(470, 6, 'Los Altares'),
(471, 6, 'Paso de los Indios'),
(472, 6, 'Paso del Sapo'),
(473, 6, 'Pto. Madryn'),
(474, 6, 'Pto. Pirámides'),
(475, 6, 'Rada Tilly'),
(476, 6, 'Rawson'),
(477, 6, 'Río Mayo'),
(478, 6, 'Río Pico'),
(479, 6, 'Sarmiento'),
(480, 6, 'Tecka'),
(481, 6, 'Telsen'),
(482, 6, 'Trelew'),
(483, 6, 'Trevelin'),
(484, 6, 'Veintiocho de Julio'),
(485, 7, 'Achiras'),
(486, 7, 'Adelia Maria'),
(487, 7, 'Agua de Oro'),
(488, 7, 'Alcira Gigena'),
(489, 7, 'Aldea Santa Maria'),
(490, 7, 'Alejandro Roca'),
(491, 7, 'Alejo Ledesma'),
(492, 7, 'Alicia'),
(493, 7, 'Almafuerte'),
(494, 7, 'Alpa Corral'),
(495, 7, 'Alta Gracia'),
(496, 7, 'Alto Alegre'),
(497, 7, 'Alto de Los Quebrachos'),
(498, 7, 'Altos de Chipion'),
(499, 7, 'Amboy'),
(500, 7, 'Ambul'),
(501, 7, 'Ana Zumaran'),
(502, 7, 'Anisacate'),
(503, 7, 'Arguello'),
(504, 7, 'Arias'),
(505, 7, 'Arroyito'),
(506, 7, 'Arroyo Algodon'),
(507, 7, 'Arroyo Cabral'),
(508, 7, 'Arroyo Los Patos'),
(509, 7, 'Assunta'),
(510, 7, 'Atahona'),
(511, 7, 'Ausonia'),
(512, 7, 'Avellaneda'),
(513, 7, 'Ballesteros'),
(514, 7, 'Ballesteros Sud'),
(515, 7, 'Balnearia'),
(516, 7, 'Bañado de Soto'),
(517, 7, 'Bell Ville'),
(518, 7, 'Bengolea'),
(519, 7, 'Benjamin Gould'),
(520, 7, 'Berrotaran'),
(521, 7, 'Bialet Masse'),
(522, 7, 'Bouwer'),
(523, 7, 'Brinkmann'),
(524, 7, 'Buchardo'),
(525, 7, 'Bulnes'),
(526, 7, 'Cabalango'),
(527, 7, 'Calamuchita'),
(528, 7, 'Calchin'),
(529, 7, 'Calchin Oeste'),
(530, 7, 'Calmayo'),
(531, 7, 'Camilo Aldao'),
(532, 7, 'Caminiaga'),
(533, 7, 'Cañada de Luque'),
(534, 7, 'Cañada de Machado'),
(535, 7, 'Cañada de Rio Pinto'),
(536, 7, 'Cañada del Sauce'),
(537, 7, 'Canals'),
(538, 7, 'Candelaria Sud'),
(539, 7, 'Capilla de Remedios'),
(540, 7, 'Capilla de Siton'),
(541, 7, 'Capilla del Carmen'),
(542, 7, 'Capilla del Monte'),
(543, 7, 'Capital'),
(544, 7, 'Capitan Gral B. O´Higgins'),
(545, 7, 'Carnerillo'),
(546, 7, 'Carrilobo'),
(547, 7, 'Casa Grande'),
(548, 7, 'Cavanagh'),
(549, 7, 'Cerro Colorado'),
(550, 7, 'Chaján'),
(551, 7, 'Chalacea'),
(552, 7, 'Chañar Viejo'),
(553, 7, 'Chancaní'),
(554, 7, 'Charbonier'),
(555, 7, 'Charras'),
(556, 7, 'Chazón'),
(557, 7, 'Chilibroste'),
(558, 7, 'Chucul'),
(559, 7, 'Chuña'),
(560, 7, 'Chuña Huasi'),
(561, 7, 'Churqui Cañada'),
(562, 7, 'Cienaga Del Coro'),
(563, 7, 'Cintra'),
(564, 7, 'Col. Almada'),
(565, 7, 'Col. Anita'),
(566, 7, 'Col. Barge'),
(567, 7, 'Col. Bismark'),
(568, 7, 'Col. Bremen'),
(569, 7, 'Col. Caroya'),
(570, 7, 'Col. Italiana'),
(571, 7, 'Col. Iturraspe'),
(572, 7, 'Col. Las Cuatro Esquinas'),
(573, 7, 'Col. Las Pichanas'),
(574, 7, 'Col. Marina'),
(575, 7, 'Col. Prosperidad'),
(576, 7, 'Col. San Bartolome'),
(577, 7, 'Col. San Pedro'),
(578, 7, 'Col. Tirolesa'),
(579, 7, 'Col. Vicente Aguero'),
(580, 7, 'Col. Videla'),
(581, 7, 'Col. Vignaud'),
(582, 7, 'Col. Waltelina'),
(583, 7, 'Colazo'),
(584, 7, 'Comechingones'),
(585, 7, 'Conlara'),
(586, 7, 'Copacabana'),
(587, 7, '7'),
(588, 7, 'Coronel Baigorria'),
(589, 7, 'Coronel Moldes'),
(590, 7, 'Corral de Bustos'),
(591, 7, 'Corralito'),
(592, 7, 'Cosquín'),
(593, 7, 'Costa Sacate'),
(594, 7, 'Cruz Alta'),
(595, 7, 'Cruz de Caña'),
(596, 7, 'Cruz del Eje'),
(597, 7, 'Cuesta Blanca'),
(598, 7, 'Dean Funes'),
(599, 7, 'Del Campillo'),
(600, 7, 'Despeñaderos'),
(601, 7, 'Devoto'),
(602, 7, 'Diego de Rojas'),
(603, 7, 'Dique Chico'),
(604, 7, 'El Arañado'),
(605, 7, 'El Brete'),
(606, 7, 'El Chacho'),
(607, 7, 'El Crispín'),
(608, 7, 'El Fortín'),
(609, 7, 'El Manzano'),
(610, 7, 'El Rastreador'),
(611, 7, 'El Rodeo'),
(612, 7, 'El Tío'),
(613, 7, 'Elena'),
(614, 7, 'Embalse'),
(615, 7, 'Esquina'),
(616, 7, 'Estación Gral. Paz'),
(617, 7, 'Estación Juárez Celman'),
(618, 7, 'Estancia de Guadalupe'),
(619, 7, 'Estancia Vieja'),
(620, 7, 'Etruria'),
(621, 7, 'Eufrasio Loza'),
(622, 7, 'Falda del Carmen'),
(623, 7, 'Freyre'),
(624, 7, 'Gral. Baldissera'),
(625, 7, 'Gral. Cabrera'),
(626, 7, 'Gral. Deheza'),
(627, 7, 'Gral. Fotheringham'),
(628, 7, 'Gral. Levalle'),
(629, 7, 'Gral. Roca'),
(630, 7, 'Guanaco Muerto'),
(631, 7, 'Guasapampa'),
(632, 7, 'Guatimozin'),
(633, 7, 'Gutenberg'),
(634, 7, 'Hernando'),
(635, 7, 'Huanchillas'),
(636, 7, 'Huerta Grande'),
(637, 7, 'Huinca Renanco'),
(638, 7, 'Idiazabal'),
(639, 7, 'Impira'),
(640, 7, 'Inriville'),
(641, 7, 'Isla Verde'),
(642, 7, 'Italó'),
(643, 7, 'James Craik'),
(644, 7, 'Jesús María'),
(645, 7, 'Jovita'),
(646, 7, 'Justiniano Posse'),
(647, 7, 'Km 658'),
(648, 7, 'L. V. Mansilla'),
(649, 7, 'La Batea'),
(650, 7, 'La Calera'),
(651, 7, 'La Carlota'),
(652, 7, 'La Carolina'),
(653, 7, 'La Cautiva'),
(654, 7, 'La Cesira'),
(655, 7, 'La Cruz'),
(656, 7, 'La Cumbre'),
(657, 7, 'La Cumbrecita'),
(658, 7, 'La Falda'),
(659, 7, 'La Francia'),
(660, 7, 'La Granja'),
(661, 7, 'La Higuera'),
(662, 7, 'La Laguna'),
(663, 7, 'La Paisanita'),
(664, 7, 'La Palestina'),
(665, 7, '12'),
(666, 7, 'La Paquita'),
(667, 7, 'La Para'),
(668, 7, 'La Paz'),
(669, 7, 'La Playa'),
(670, 7, 'La Playosa'),
(671, 7, 'La Población'),
(672, 7, 'La Posta'),
(673, 7, 'La Puerta'),
(674, 7, 'La Quinta'),
(675, 7, 'La Rancherita'),
(676, 7, 'La Rinconada'),
(677, 7, 'La Serranita'),
(678, 7, 'La Tordilla'),
(679, 7, 'Laborde'),
(680, 7, 'Laboulaye'),
(681, 7, 'Laguna Larga'),
(682, 7, 'Las Acequias'),
(683, 7, 'Las Albahacas'),
(684, 7, 'Las Arrias'),
(685, 7, 'Las Bajadas'),
(686, 7, 'Las Caleras'),
(687, 7, 'Las Calles'),
(688, 7, 'Las Cañadas'),
(689, 7, 'Las Gramillas'),
(690, 7, 'Las Higueras'),
(691, 7, 'Las Isletillas'),
(692, 7, 'Las Junturas'),
(693, 7, 'Las Palmas'),
(694, 7, 'Las Peñas'),
(695, 7, 'Las Peñas Sud'),
(696, 7, 'Las Perdices'),
(697, 7, 'Las Playas'),
(698, 7, 'Las Rabonas'),
(699, 7, 'Las Saladas'),
(700, 7, 'Las Tapias'),
(701, 7, 'Las Varas'),
(702, 7, 'Las Varillas'),
(703, 7, 'Las Vertientes'),
(704, 7, 'Leguizamón'),
(705, 7, 'Leones'),
(706, 7, 'Los Cedros'),
(707, 7, 'Los Cerrillos'),
(708, 7, 'Los Chañaritos (C.E)'),
(709, 7, 'Los Chanaritos (R.S)'),
(710, 7, 'Los Cisnes'),
(711, 7, 'Los Cocos'),
(712, 7, 'Los Cóndores'),
(713, 7, 'Los Hornillos'),
(714, 7, 'Los Hoyos'),
(715, 7, 'Los Mistoles'),
(716, 7, 'Los Molinos'),
(717, 7, 'Los Pozos'),
(718, 7, 'Los Reartes'),
(719, 7, 'Los Surgentes'),
(720, 7, 'Los Talares'),
(721, 7, 'Los Zorros'),
(722, 7, 'Lozada'),
(723, 7, 'Luca'),
(724, 7, 'Luque'),
(725, 7, 'Luyaba'),
(726, 7, 'Malagueño'),
(727, 7, 'Malena'),
(728, 7, 'Malvinas Argentinas'),
(729, 7, 'Manfredi'),
(730, 7, 'Maquinista Gallini'),
(731, 7, 'Marcos Juárez'),
(732, 7, 'Marull'),
(733, 7, 'Matorrales'),
(734, 7, 'Mattaldi'),
(735, 7, 'Mayu Sumaj'),
(736, 7, 'Media Naranja'),
(737, 7, 'Melo'),
(738, 7, 'Mendiolaza'),
(739, 7, 'Mi Granja'),
(740, 7, 'Mina Clavero'),
(741, 7, 'Miramar'),
(742, 7, 'Morrison'),
(743, 7, 'Morteros'),
(744, 7, 'Mte. Buey'),
(745, 7, 'Mte. Cristo'),
(746, 7, 'Mte. De Los Gauchos'),
(747, 7, 'Mte. Leña'),
(748, 7, 'Mte. Maíz'),
(749, 7, 'Mte. Ralo'),
(750, 7, 'Nicolás Bruzone'),
(751, 7, 'Noetinger'),
(752, 7, 'Nono'),
(753, 7, 'Nueva 7'),
(754, 7, 'Obispo Trejo'),
(755, 7, 'Olaeta'),
(756, 7, 'Oliva'),
(757, 7, 'Olivares San Nicolás'),
(758, 7, 'Onagolty'),
(759, 7, 'Oncativo'),
(760, 7, 'Ordoñez'),
(761, 7, 'Pacheco De Melo'),
(762, 7, 'Pampayasta N.'),
(763, 7, 'Pampayasta S.'),
(764, 7, 'Panaholma'),
(765, 7, 'Pascanas'),
(766, 7, 'Pasco'),
(767, 7, 'Paso del Durazno'),
(768, 7, 'Paso Viejo'),
(769, 7, 'Pilar'),
(770, 7, 'Pincén'),
(771, 7, 'Piquillín'),
(772, 7, 'Plaza de Mercedes'),
(773, 7, 'Plaza Luxardo'),
(774, 7, 'Porteña'),
(775, 7, 'Potrero de Garay'),
(776, 7, 'Pozo del Molle'),
(777, 7, 'Pozo Nuevo'),
(778, 7, 'Pueblo Italiano'),
(779, 7, 'Puesto de Castro'),
(780, 7, 'Punta del Agua'),
(781, 7, 'Quebracho Herrado'),
(782, 7, 'Quilino'),
(783, 7, 'Rafael García'),
(784, 7, 'Ranqueles'),
(785, 7, 'Rayo Cortado'),
(786, 7, 'Reducción'),
(787, 7, 'Rincón'),
(788, 7, 'Río Bamba'),
(789, 7, 'Río Ceballos'),
(790, 7, 'Río Cuarto'),
(791, 7, 'Río de Los Sauces'),
(792, 7, 'Río Primero'),
(793, 7, 'Río Segundo'),
(794, 7, 'Río Tercero'),
(795, 7, 'Rosales'),
(796, 7, 'Rosario del Saladillo'),
(797, 7, 'Sacanta'),
(798, 7, 'Sagrada Familia'),
(799, 7, 'Saira'),
(800, 7, 'Saladillo'),
(801, 7, 'Saldán'),
(802, 7, 'Salsacate'),
(803, 7, 'Salsipuedes'),
(804, 7, 'Sampacho'),
(805, 7, 'San Agustín'),
(806, 7, 'San Antonio de Arredondo'),
(807, 7, 'San Antonio de Litín'),
(808, 7, 'San Basilio'),
(809, 7, 'San Carlos Minas'),
(810, 7, 'San Clemente'),
(811, 7, 'San Esteban'),
(812, 7, 'San Francisco'),
(813, 7, 'San Ignacio'),
(814, 7, 'San Javier'),
(815, 7, 'San Jerónimo'),
(816, 7, 'San Joaquín'),
(817, 7, 'San José de La Dormida'),
(818, 7, 'San José de Las Salinas'),
(819, 7, 'San Lorenzo'),
(820, 7, 'San Marcos Sierras'),
(821, 7, 'San Marcos Sud'),
(822, 7, 'San Pedro'),
(823, 7, 'San Pedro N.'),
(824, 7, 'San Roque'),
(825, 7, 'San Vicente'),
(826, 7, 'Santa Catalina'),
(827, 7, 'Santa Elena'),
(828, 7, 'Santa Eufemia'),
(829, 7, 'Santa Maria'),
(830, 7, 'Sarmiento'),
(831, 7, 'Saturnino M.Laspiur'),
(832, 7, 'Sauce Arriba'),
(833, 7, 'Sebastián Elcano'),
(834, 7, 'Seeber'),
(835, 7, 'Segunda Usina'),
(836, 7, 'Serrano'),
(837, 7, 'Serrezuela'),
(838, 7, 'Sgo. Temple'),
(839, 7, 'Silvio Pellico'),
(840, 7, 'Simbolar'),
(841, 7, 'Sinsacate'),
(842, 7, 'Sta. Rosa de Calamuchita'),
(843, 7, 'Sta. Rosa de Río Primero'),
(844, 7, 'Suco'),
(845, 7, 'Tala Cañada'),
(846, 7, 'Tala Huasi'),
(847, 7, 'Talaini'),
(848, 7, 'Tancacha'),
(849, 7, 'Tanti'),
(850, 7, 'Ticino'),
(851, 7, 'Tinoco'),
(852, 7, 'Tío Pujio'),
(853, 7, 'Toledo'),
(854, 7, 'Toro Pujio'),
(855, 7, 'Tosno'),
(856, 7, 'Tosquita'),
(857, 7, 'Tránsito'),
(858, 7, 'Tuclame'),
(859, 7, 'Tutti'),
(860, 7, 'Ucacha'),
(861, 7, 'Unquillo'),
(862, 7, 'Valle de Anisacate'),
(863, 7, 'Valle Hermoso'),
(864, 7, 'Vélez Sarfield'),
(865, 7, 'Viamonte'),
(866, 7, 'Vicuña Mackenna'),
(867, 7, 'Villa Allende'),
(868, 7, 'Villa Amancay'),
(869, 7, 'Villa Ascasubi'),
(870, 7, 'Villa Candelaria N.'),
(871, 7, 'Villa Carlos Paz'),
(872, 7, 'Villa Cerro Azul'),
(873, 7, 'Villa Ciudad de América'),
(874, 7, 'Villa Ciudad Pque Los Reartes'),
(875, 7, 'Villa Concepción del Tío'),
(876, 7, 'Villa Cura Brochero'),
(877, 7, 'Villa de Las Rosas'),
(878, 7, 'Villa de María'),
(879, 7, 'Villa de Pocho'),
(880, 7, 'Villa de Soto'),
(881, 7, 'Villa del Dique'),
(882, 7, 'Villa del Prado'),
(883, 7, 'Villa del Rosario'),
(884, 7, 'Villa del Totoral'),
(885, 7, 'Villa Dolores'),
(886, 7, 'Villa El Chancay'),
(887, 7, 'Villa Elisa'),
(888, 7, 'Villa Flor Serrana'),
(889, 7, 'Villa Fontana'),
(890, 7, 'Villa Giardino'),
(891, 7, 'Villa Gral. Belgrano'),
(892, 7, 'Villa Gutierrez'),
(893, 7, 'Villa Huidobro'),
(894, 7, 'Villa La Bolsa'),
(895, 7, 'Villa Los Aromos'),
(896, 7, 'Villa Los Patos'),
(897, 7, 'Villa María'),
(898, 7, 'Villa Nueva'),
(899, 7, 'Villa Pque. Santa Ana'),
(900, 7, 'Villa Pque. Siquiman'),
(901, 7, 'Villa Quillinzo'),
(902, 7, 'Villa Rossi'),
(903, 7, 'Villa Rumipal'),
(904, 7, 'Villa San Esteban'),
(905, 7, 'Villa San Isidro'),
(906, 7, 'Villa 21'),
(907, 7, 'Villa Sarmiento (G.R)'),
(908, 7, 'Villa Sarmiento (S.A)'),
(909, 7, 'Villa Tulumba'),
(910, 7, 'Villa Valeria'),
(911, 7, 'Villa Yacanto'),
(912, 7, 'Washington'),
(913, 7, 'Wenceslao Escalante'),
(914, 7, 'Ycho Cruz Sierras'),
(915, 8, 'Alvear'),
(916, 8, 'Bella Vista'),
(917, 8, 'Berón de Astrada'),
(918, 8, 'Bonpland'),
(919, 8, 'Caá Cati'),
(920, 8, 'Capital'),
(921, 8, 'Chavarría'),
(922, 8, 'Col. C. Pellegrini'),
(923, 8, 'Col. Libertad'),
(924, 8, 'Col. Liebig'),
(925, 8, 'Col. Sta Rosa'),
(926, 8, 'Concepción'),
(927, 8, 'Cruz de Los Milagros'),
(928, 8, 'Curuzú-Cuatiá'),
(929, 8, 'Empedrado'),
(930, 8, 'Esquina'),
(931, 8, 'Estación Torrent'),
(932, 8, 'Felipe Yofré'),
(933, 8, 'Garruchos'),
(934, 8, 'Gdor. Agrónomo'),
(935, 8, 'Gdor. Martínez'),
(936, 8, 'Goya'),
(937, 8, 'Guaviravi'),
(938, 8, 'Herlitzka'),
(939, 8, 'Ita-Ibate'),
(940, 8, 'Itatí'),
(941, 8, 'Ituzaingó'),
(942, 8, 'José Rafael Gómez'),
(943, 8, 'Juan Pujol'),
(944, 8, 'La Cruz'),
(945, 8, 'Lavalle'),
(946, 8, 'Lomas de Vallejos'),
(947, 8, 'Loreto'),
(948, 8, 'Mariano I. Loza'),
(949, 8, 'Mburucuyá'),
(950, 8, 'Mercedes'),
(951, 8, 'Mocoretá'),
(952, 8, 'Mte. Caseros'),
(953, 8, 'Nueve de Julio'),
(954, 8, 'Palmar Grande'),
(955, 8, 'Parada Pucheta'),
(956, 8, 'Paso de La Patria'),
(957, 8, 'Paso de Los Libres'),
(958, 8, 'Pedro R. Fernandez'),
(959, 8, 'Perugorría'),
(960, 8, 'Pueblo Libertador'),
(961, 8, 'Ramada Paso'),
(962, 8, 'Riachuelo'),
(963, 8, 'Saladas'),
(964, 8, 'San Antonio'),
(965, 8, 'San Carlos'),
(966, 8, 'San Cosme'),
(967, 8, 'San Lorenzo'),
(968, 8, '20 del Palmar'),
(969, 8, 'San Miguel'),
(970, 8, 'San Roque'),
(971, 8, 'Santa Ana'),
(972, 8, 'Santa Lucía'),
(973, 8, 'Santo Tomé'),
(974, 8, 'Sauce'),
(975, 8, 'Tabay'),
(976, 8, 'Tapebicuá'),
(977, 8, 'Tatacua'),
(978, 8, 'Virasoro'),
(979, 8, 'Yapeyú'),
(980, 8, 'Yataití Calle'),
(981, 9, 'Alarcón'),
(982, 9, 'Alcaraz'),
(983, 9, 'Alcaraz N.'),
(984, 9, 'Alcaraz S.'),
(985, 9, 'Aldea Asunción'),
(986, 9, 'Aldea Brasilera'),
(987, 9, 'Aldea Elgenfeld'),
(988, 9, 'Aldea Grapschental'),
(989, 9, 'Aldea Ma. Luisa'),
(990, 9, 'Aldea Protestante'),
(991, 9, 'Aldea Salto'),
(992, 9, 'Aldea San Antonio (G)'),
(993, 9, 'Aldea San Antonio (P)'),
(994, 9, 'Aldea 19'),
(995, 9, 'Aldea San Miguel'),
(996, 9, 'Aldea San Rafael'),
(997, 9, 'Aldea Spatzenkutter'),
(998, 9, 'Aldea Sta. María'),
(999, 9, 'Aldea Sta. Rosa'),
(1000, 9, 'Aldea Valle María'),
(1001, 9, 'Altamirano Sur'),
(1002, 9, 'Antelo'),
(1003, 9, 'Antonio Tomás'),
(1004, 9, 'Aranguren'),
(1005, 9, 'Arroyo Barú'),
(1006, 9, 'Arroyo Burgos'),
(1007, 9, 'Arroyo Clé'),
(1008, 9, 'Arroyo Corralito'),
(1009, 9, 'Arroyo del Medio'),
(1010, 9, 'Arroyo Maturrango'),
(1011, 9, 'Arroyo Palo Seco'),
(1012, 9, 'Banderas'),
(1013, 9, 'Basavilbaso'),
(1014, 9, 'Betbeder'),
(1015, 9, 'Bovril'),
(1016, 9, 'Caseros'),
(1017, 9, 'Ceibas'),
(1018, 9, 'Cerrito'),
(1019, 9, 'Chajarí'),
(1020, 9, 'Chilcas'),
(1021, 9, 'Clodomiro Ledesma'),
(1022, 9, 'Col. Alemana'),
(1023, 9, 'Col. Avellaneda'),
(1024, 9, 'Col. Avigdor'),
(1025, 9, 'Col. Ayuí'),
(1026, 9, 'Col. Baylina'),
(1027, 9, 'Col. Carrasco'),
(1028, 9, 'Col. Celina'),
(1029, 9, 'Col. Cerrito'),
(1030, 9, 'Col. Crespo'),
(1031, 9, 'Col. Elia'),
(1032, 9, 'Col. Ensayo'),
(1033, 9, 'Col. Gral. Roca'),
(1034, 9, 'Col. La Argentina'),
(1035, 9, 'Col. Merou'),
(1036, 9, 'Col. Oficial Nª3'),
(1037, 9, 'Col. Oficial Nº13'),
(1038, 9, 'Col. Oficial Nº14'),
(1039, 9, 'Col. Oficial Nº5'),
(1040, 9, 'Col. Reffino'),
(1041, 9, 'Col. Tunas'),
(1042, 9, 'Col. Viraró'),
(1043, 9, 'Colón'),
(1044, 9, 'Concepción del Uruguay'),
(1045, 9, 'Concordia'),
(1046, 9, 'Conscripto Bernardi'),
(1047, 9, 'Costa Grande'),
(1048, 9, 'Costa San Antonio'),
(1049, 9, 'Costa Uruguay N.'),
(1050, 9, 'Costa Uruguay S.'),
(1051, 9, 'Crespo'),
(1052, 9, 'Crucecitas 3ª'),
(1053, 9, 'Crucecitas 7ª'),
(1054, 9, 'Crucecitas 8ª'),
(1055, 9, 'Cuchilla Redonda'),
(1056, 9, 'Curtiembre'),
(1057, 9, 'Diamante'),
(1058, 9, 'Distrito 6º'),
(1059, 9, 'Distrito Chañar'),
(1060, 9, 'Distrito Chiqueros'),
(1061, 9, 'Distrito Cuarto'),
(1062, 9, 'Distrito Diego López'),
(1063, 9, 'Distrito Pajonal'),
(1064, 9, 'Distrito Sauce'),
(1065, 9, 'Distrito Tala'),
(1066, 9, 'Distrito Talitas'),
(1067, 9, 'Don Cristóbal 1ª Sección'),
(1068, 9, 'Don Cristóbal 2ª Sección'),
(1069, 9, 'Durazno'),
(1070, 9, 'El Cimarrón'),
(1071, 9, 'El Gramillal'),
(1072, 9, 'El Palenque'),
(1073, 9, 'El Pingo'),
(1074, 9, 'El Quebracho'),
(1075, 9, 'El Redomón'),
(1076, 9, 'El Solar'),
(1077, 9, 'Enrique Carbo'),
(1078, 9, '9'),
(1079, 9, 'Espinillo N.'),
(1080, 9, 'Estación Campos'),
(1081, 9, 'Estación Escriña'),
(1082, 9, 'Estación Lazo'),
(1083, 9, 'Estación Raíces'),
(1084, 9, 'Estación Yerúa'),
(1085, 9, 'Estancia Grande'),
(1086, 9, 'Estancia Líbaros'),
(1087, 9, 'Estancia Racedo'),
(1088, 9, 'Estancia Solá'),
(1089, 9, 'Estancia Yuquerí'),
(1090, 9, 'Estaquitas'),
(1091, 9, 'Faustino M. Parera'),
(1092, 9, 'Febre'),
(1093, 9, 'Federación'),
(1094, 9, 'Federal'),
(1095, 9, 'Gdor. Echagüe'),
(1096, 9, 'Gdor. Mansilla'),
(1097, 9, 'Gilbert'),
(1098, 9, 'González Calderón'),
(1099, 9, 'Gral. Almada'),
(1100, 9, 'Gral. Alvear'),
(1101, 9, 'Gral. Campos'),
(1102, 9, 'Gral. Galarza'),
(1103, 9, 'Gral. Ramírez'),
(1104, 9, 'Gualeguay'),
(1105, 9, 'Gualeguaychú'),
(1106, 9, 'Gualeguaycito'),
(1107, 9, 'Guardamonte'),
(1108, 9, 'Hambis'),
(1109, 9, 'Hasenkamp'),
(1110, 9, 'Hernandarias'),
(1111, 9, 'Hernández'),
(1112, 9, 'Herrera'),
(1113, 9, 'Hinojal'),
(1114, 9, 'Hocker'),
(1115, 9, 'Ing. Sajaroff'),
(1116, 9, 'Irazusta'),
(1117, 9, 'Isletas'),
(1118, 9, 'J.J De Urquiza'),
(1119, 9, 'Jubileo'),
(1120, 9, 'La Clarita'),
(1121, 9, 'La Criolla'),
(1122, 9, 'La Esmeralda'),
(1123, 9, 'La Florida'),
(1124, 9, 'La Fraternidad'),
(1125, 9, 'La Hierra'),
(1126, 9, 'La Ollita'),
(1127, 9, 'La Paz'),
(1128, 9, 'La Picada'),
(1129, 9, 'La Providencia'),
(1130, 9, 'La Verbena'),
(1131, 9, 'Laguna Benítez'),
(1132, 9, 'Larroque'),
(1133, 9, 'Las Cuevas'),
(1134, 9, 'Las Garzas'),
(1135, 9, 'Las Guachas'),
(1136, 9, 'Las Mercedes'),
(1137, 9, 'Las Moscas'),
(1138, 9, 'Las Mulitas'),
(1139, 9, 'Las Toscas'),
(1140, 9, 'Laurencena'),
(1141, 9, 'Libertador San Martín'),
(1142, 9, 'Loma Limpia'),
(1143, 9, 'Los Ceibos'),
(1144, 9, 'Los Charruas'),
(1145, 9, 'Los Conquistadores'),
(1146, 9, 'Lucas González'),
(1147, 9, 'Lucas N.'),
(1148, 9, 'Lucas S. 1ª'),
(1149, 9, 'Lucas S. 2ª'),
(1150, 9, 'Maciá'),
(1151, 9, 'María Grande'),
(1152, 9, 'María Grande 2ª'),
(1153, 9, 'Médanos'),
(1154, 9, 'Mojones N.'),
(1155, 9, 'Mojones S.'),
(1156, 9, 'Molino Doll'),
(1157, 9, 'Monte Redondo'),
(1158, 9, 'Montoya'),
(1159, 9, 'Mulas Grandes'),
(1160, 9, 'Ñancay'),
(1161, 9, 'Nogoyá'),
(1162, 9, 'Nueva Escocia'),
(1163, 9, 'Nueva Vizcaya'),
(1164, 9, 'Ombú'),
(1165, 9, 'Oro Verde'),
(1166, 9, 'Paraná'),
(1167, 9, 'Pasaje Guayaquil'),
(1168, 9, 'Pasaje Las Tunas'),
(1169, 9, 'Paso de La Arena'),
(1170, 9, 'Paso de La Laguna'),
(1171, 9, 'Paso de Las Piedras'),
(1172, 9, 'Paso Duarte'),
(1173, 9, 'Pastor Britos'),
(1174, 9, 'Pedernal'),
(1175, 9, 'Perdices'),
(1176, 9, 'Picada Berón'),
(1177, 9, 'Piedras Blancas'),
(1178, 9, 'Primer Distrito Cuchilla'),
(1179, 9, 'Primero de Mayo'),
(1180, 9, 'Pronunciamiento'),
(1181, 9, 'Pto. Algarrobo'),
(1182, 9, 'Pto. Ibicuy'),
(1183, 9, 'Pueblo Brugo'),
(1184, 9, 'Pueblo Cazes'),
(1185, 9, 'Pueblo Gral. Belgrano'),
(1186, 9, 'Pueblo Liebig'),
(1187, 9, 'Puerto Yeruá'),
(1188, 9, 'Punta del Monte'),
(1189, 9, 'Quebracho'),
(1190, 9, 'Quinto Distrito'),
(1191, 9, 'Raices Oeste'),
(1192, 9, 'Rincón de Nogoyá'),
(1193, 9, 'Rincón del Cinto'),
(1194, 9, 'Rincón del Doll'),
(1195, 9, 'Rincón del Gato'),
(1196, 9, 'Rocamora'),
(1197, 9, 'Rosario del Tala'),
(1198, 9, 'San Benito'),
(1199, 9, 'San Cipriano'),
(1200, 9, 'San Ernesto'),
(1201, 9, 'San Gustavo'),
(1202, 9, 'San Jaime'),
(1203, 9, 'San José'),
(1204, 9, 'San José de Feliciano'),
(1205, 9, 'San Justo'),
(1206, 9, 'San Marcial'),
(1207, 9, 'San Pedro'),
(1208, 9, 'San Ramírez'),
(1209, 9, 'San Ramón'),
(1210, 9, 'San Roque'),
(1211, 9, 'San Salvador'),
(1212, 9, 'San Víctor'),
(1213, 9, 'Santa Ana'),
(1214, 9, 'Santa Anita'),
(1215, 9, 'Santa Elena'),
(1216, 9, 'Santa Lucía'),
(1217, 9, 'Santa Luisa'),
(1218, 9, 'Sauce de Luna'),
(1219, 9, 'Sauce Montrull'),
(1220, 9, 'Sauce Pinto'),
(1221, 9, 'Sauce Sur'),
(1222, 9, 'Seguí'),
(1223, 9, 'Sir Leonard'),
(1224, 9, 'Sosa'),
(1225, 9, 'Tabossi'),
(1226, 9, 'Tezanos Pinto'),
(1227, 9, 'Ubajay'),
(1228, 9, 'Urdinarrain'),
(1229, 9, 'Veinte de Septiembre'),
(1230, 9, 'Viale'),
(1231, 9, 'Victoria'),
(1232, 9, 'Villa Clara'),
(1233, 9, 'Villa del Rosario'),
(1234, 9, 'Villa Domínguez'),
(1235, 9, 'Villa Elisa'),
(1236, 9, 'Villa Fontana'),
(1237, 9, 'Villa Gdor. Etchevehere'),
(1238, 9, 'Villa Mantero'),
(1239, 9, 'Villa Paranacito'),
(1240, 9, 'Villa Urquiza'),
(1241, 9, 'Villaguay'),
(1242, 9, 'Walter Moss'),
(1243, 9, 'Yacaré'),
(1244, 9, 'Yeso Oeste'),
(1245, 10, 'Buena Vista'),
(1246, 10, 'Clorinda'),
(1247, 10, 'Col. Pastoril'),
(1248, 10, 'Cte. Fontana'),
(1249, 10, 'El Colorado'),
(1250, 10, 'El Espinillo'),
(1251, 10, 'Estanislao Del Campo'),
(1252, 10, '10'),
(1253, 10, 'Fortín Lugones'),
(1254, 10, 'Gral. Lucio V. Mansilla'),
(1255, 10, 'Gral. Manuel Belgrano'),
(1256, 10, 'Gral. Mosconi'),
(1257, 10, 'Gran Guardia'),
(1258, 10, 'Herradura'),
(1259, 10, 'Ibarreta'),
(1260, 10, 'Ing. Juárez'),
(1261, 10, 'Laguna Blanca'),
(1262, 10, 'Laguna Naick Neck'),
(1263, 10, 'Laguna Yema'),
(1264, 10, 'Las Lomitas'),
(1265, 10, 'Los Chiriguanos'),
(1266, 10, 'Mayor V. Villafañe'),
(1267, 10, 'Misión San Fco.'),
(1268, 10, 'Palo Santo'),
(1269, 10, 'Pirané'),
(1270, 10, 'Pozo del Maza'),
(1271, 10, 'Riacho He-He'),
(1272, 10, 'San Hilario'),
(1273, 10, 'San Martín II'),
(1274, 10, 'Siete Palmas'),
(1275, 10, 'Subteniente Perín'),
(1276, 10, 'Tres Lagunas'),
(1277, 10, 'Villa Dos Trece'),
(1278, 10, 'Villa Escolar'),
(1279, 10, 'Villa Gral. Güemes'),
(1280, 11, 'Abdon Castro Tolay'),
(1281, 11, 'Abra Pampa'),
(1282, 11, 'Abralaite'),
(1283, 11, 'Aguas Calientes'),
(1284, 11, 'Arrayanal'),
(1285, 11, 'Barrios'),
(1286, 11, 'Caimancito'),
(1287, 11, 'Calilegua'),
(1288, 11, 'Cangrejillos'),
(1289, 11, 'Caspala'),
(1290, 11, 'Catuá'),
(1291, 11, 'Cieneguillas'),
(1292, 11, 'Coranzulli'),
(1293, 11, 'Cusi-Cusi'),
(1294, 11, 'El Aguilar'),
(1295, 11, 'El Carmen'),
(1296, 11, 'El Cóndor'),
(1297, 11, 'El Fuerte'),
(1298, 11, 'El Piquete'),
(1299, 11, 'El Talar'),
(1300, 11, 'Fraile Pintado'),
(1301, 11, 'Hipólito Yrigoyen'),
(1302, 11, 'Huacalera'),
(1303, 11, 'Humahuaca'),
(1304, 11, 'La Esperanza'),
(1305, 11, 'La Mendieta'),
(1306, 11, 'La Quiaca'),
(1307, 11, 'Ledesma'),
(1308, 11, 'Libertador Gral. San Martin'),
(1309, 11, 'Maimara'),
(1310, 11, 'Mina Pirquitas'),
(1311, 11, 'Monterrico'),
(1312, 11, 'Palma Sola'),
(1313, 11, 'Palpalá'),
(1314, 11, 'Pampa Blanca'),
(1315, 11, 'Pampichuela'),
(1316, 11, 'Perico'),
(1317, 11, 'Puesto del Marqués'),
(1318, 11, 'Puesto Viejo'),
(1319, 11, 'Pumahuasi'),
(1320, 11, 'Purmamarca'),
(1321, 11, 'Rinconada'),
(1322, 11, 'Rodeitos'),
(1323, 11, 'Rosario de Río Grande'),
(1324, 11, 'San Antonio'),
(1325, 11, 'San Francisco'),
(1326, 11, 'San Pedro'),
(1327, 11, 'San Rafael'),
(1328, 11, 'San Salvador'),
(1329, 11, 'Santa Ana'),
(1330, 11, 'Santa Catalina'),
(1331, 11, 'Santa Clara'),
(1332, 11, 'Susques'),
(1333, 11, 'Tilcara'),
(1334, 11, 'Tres Cruces'),
(1335, 11, 'Tumbaya'),
(1336, 11, 'Valle Grande'),
(1337, 11, 'Vinalito'),
(1338, 11, 'Volcán'),
(1339, 11, 'Yala'),
(1340, 11, 'Yaví'),
(1341, 11, 'Yuto'),
(1342, 12, 'Abramo'),
(1343, 12, 'Adolfo Van Praet'),
(1344, 12, 'Agustoni'),
(1345, 12, 'Algarrobo del Aguila'),
(1346, 12, 'Alpachiri'),
(1347, 12, 'Alta Italia'),
(1348, 12, 'Anguil'),
(1349, 12, 'Arata'),
(1350, 12, 'Ataliva Roca'),
(1351, 12, 'Bernardo Larroude'),
(1352, 12, 'Bernasconi'),
(1353, 12, 'Caleufú'),
(1354, 12, 'Carro Quemado'),
(1355, 12, 'Catriló'),
(1356, 12, 'Ceballos'),
(1357, 12, 'Chacharramendi'),
(1358, 12, 'Col. Barón'),
(1359, 12, 'Col. Santa María'),
(1360, 12, 'Conhelo'),
(1361, 12, 'Coronel Hilario Lagos'),
(1362, 12, 'Cuchillo-Có'),
(1363, 12, 'Doblas'),
(1364, 12, 'Dorila'),
(1365, 12, 'Eduardo Castex'),
(1366, 12, 'Embajador Martini'),
(1367, 12, 'Falucho'),
(1368, 12, 'Gral. Acha'),
(1369, 12, 'Gral. Manuel Campos'),
(1370, 12, 'Gral. Pico'),
(1371, 12, 'Guatraché'),
(1372, 12, 'Ing. Luiggi'),
(1373, 12, 'Intendente Alvear'),
(1374, 12, 'Jacinto Arauz'),
(1375, 12, 'La Adela'),
(1376, 12, 'La Humada'),
(1377, 12, 'La Maruja'),
(1378, 12, '12'),
(1379, 12, 'La Reforma'),
(1380, 12, 'Limay Mahuida'),
(1381, 12, 'Lonquimay'),
(1382, 12, 'Loventuel'),
(1383, 12, 'Luan Toro'),
(1384, 12, 'Macachín'),
(1385, 12, 'Maisonnave'),
(1386, 12, 'Mauricio Mayer'),
(1387, 12, 'Metileo'),
(1388, 12, 'Miguel Cané'),
(1389, 12, 'Miguel Riglos'),
(1390, 12, 'Monte Nievas'),
(1391, 12, 'Parera'),
(1392, 12, 'Perú'),
(1393, 12, 'Pichi-Huinca'),
(1394, 12, 'Puelches'),
(1395, 12, 'Puelén'),
(1396, 12, 'Quehue'),
(1397, 12, 'Quemú Quemú'),
(1398, 12, 'Quetrequén'),
(1399, 12, 'Rancul'),
(1400, 12, 'Realicó'),
(1401, 12, 'Relmo'),
(1402, 12, 'Rolón'),
(1403, 12, 'Rucanelo'),
(1404, 12, 'Sarah'),
(1405, 12, 'Speluzzi'),
(1406, 12, 'Sta. Isabel'),
(1407, 12, 'Sta. Rosa'),
(1408, 12, 'Sta. Teresa'),
(1409, 12, 'Telén'),
(1410, 12, 'Toay'),
(1411, 12, 'Tomas M. de Anchorena'),
(1412, 12, 'Trenel'),
(1413, 12, 'Unanue'),
(1414, 12, 'Uriburu'),
(1415, 12, 'Veinticinco de Mayo'),
(1416, 12, 'Vertiz'),
(1417, 12, 'Victorica'),
(1418, 12, 'Villa Mirasol'),
(1419, 12, 'Winifreda'),
(1420, 13, 'Arauco'),
(1421, 13, 'Capital'),
(1422, 13, 'Castro Barros'),
(1423, 13, 'Chamical'),
(1424, 13, 'Chilecito'),
(1425, 13, 'Coronel F. Varela'),
(1426, 13, 'Famatina'),
(1427, 13, 'Gral. A.V.Peñaloza'),
(1428, 13, 'Gral. Belgrano'),
(1429, 13, 'Gral. J.F. Quiroga'),
(1430, 13, 'Gral. Lamadrid'),
(1431, 13, 'Gral. Ocampo'),
(1432, 13, 'Gral. San Martín'),
(1433, 13, 'Independencia'),
(1434, 13, 'Rosario Penaloza'),
(1435, 13, 'San Blas de Los Sauces'),
(1436, 13, 'Sanagasta'),
(1437, 13, 'Vinchina'),
(1438, 14, 'Capital'),
(1439, 14, 'Chacras de Coria'),
(1440, 14, 'Dorrego'),
(1441, 14, 'Gllen'),
(1442, 14, 'Godoy Cruz'),
(1443, 14, 'Gral. Alvear'),
(1444, 14, 'Guaymallén'),
(1445, 14, 'Junín'),
(1446, 14, 'La Paz'),
(1447, 14, 'Las Heras'),
(1448, 14, 'Lavalle'),
(1449, 14, 'Luján'),
(1450, 14, 'Luján De Cuyo'),
(1451, 14, 'Maipú'),
(1452, 14, 'Malargüe'),
(1453, 14, 'Rivadavia'),
(1454, 14, 'San Carlos'),
(1455, 14, 'San Martín'),
(1456, 14, 'San Rafael'),
(1457, 14, 'Sta. Rosa'),
(1458, 14, 'Tunuyán'),
(1459, 14, 'Tupungato'),
(1460, 14, 'Villa Nueva'),
(1461, 15, 'Alba Posse'),
(1462, 15, 'Almafuerte'),
(1463, 15, 'Apóstoles'),
(1464, 15, 'Aristóbulo Del Valle'),
(1465, 15, 'Arroyo Del Medio'),
(1466, 15, 'Azara'),
(1467, 15, 'Bdo. De Irigoyen'),
(1468, 15, 'Bonpland'),
(1469, 15, 'Caá Yari'),
(1470, 15, 'Campo Grande'),
(1471, 15, 'Campo Ramón'),
(1472, 15, 'Campo Viera'),
(1473, 15, 'Candelaria'),
(1474, 15, 'Capioví'),
(1475, 15, 'Caraguatay'),
(1476, 15, 'Cdte. Guacurarí'),
(1477, 15, 'Cerro Azul'),
(1478, 15, 'Cerro Corá'),
(1479, 15, 'Col. Alberdi'),
(1480, 15, 'Col. Aurora'),
(1481, 15, 'Col. Delicia'),
(1482, 15, 'Col. Polana'),
(1483, 15, 'Col. Victoria'),
(1484, 15, 'Col. Wanda'),
(1485, 15, 'Concepción De La Sierra'),
(1486, 15, 'Corpus'),
(1487, 15, 'Dos Arroyos'),
(1488, 15, 'Dos de Mayo'),
(1489, 15, 'El Alcázar'),
(1490, 15, 'El Dorado'),
(1491, 15, 'El Soberbio'),
(1492, 15, 'Esperanza'),
(1493, 15, 'F. Ameghino'),
(1494, 15, 'Fachinal'),
(1495, 15, 'Garuhapé'),
(1496, 15, 'Garupá'),
(1497, 15, 'Gdor. López'),
(1498, 15, 'Gdor. Roca'),
(1499, 15, 'Gral. Alvear'),
(1500, 15, 'Gral. Urquiza'),
(1501, 15, 'Guaraní'),
(1502, 15, 'H. Yrigoyen'),
(1503, 15, 'Iguazú'),
(1504, 15, 'Itacaruaré'),
(1505, 15, 'Jardín América'),
(1506, 15, 'Leandro N. Alem'),
(1507, 15, 'Libertad'),
(1508, 15, 'Loreto'),
(1509, 15, 'Los Helechos'),
(1510, 15, 'Mártires'),
(1511, 15, '15'),
(1512, 15, 'Mojón Grande'),
(1513, 15, 'Montecarlo'),
(1514, 15, 'Nueve de Julio'),
(1515, 15, 'Oberá'),
(1516, 15, 'Olegario V. Andrade'),
(1517, 15, 'Panambí'),
(1518, 15, 'Posadas'),
(1519, 15, 'Profundidad'),
(1520, 15, 'Pto. Iguazú'),
(1521, 15, 'Pto. Leoni'),
(1522, 15, 'Pto. Piray'),
(1523, 15, 'Pto. Rico'),
(1524, 15, 'Ruiz de Montoya'),
(1525, 15, 'San Antonio'),
(1526, 15, 'San Ignacio'),
(1527, 15, 'San Javier'),
(1528, 15, 'San José'),
(1529, 15, 'San Martín'),
(1530, 15, 'San Pedro'),
(1531, 15, 'San Vicente'),
(1532, 15, 'Santiago De Liniers'),
(1533, 15, 'Santo Pipo'),
(1534, 15, 'Sta. Ana'),
(1535, 15, 'Sta. María'),
(1536, 15, 'Tres Capones'),
(1537, 15, 'Veinticinco de Mayo'),
(1538, 15, 'Wanda'),
(1539, 16, 'Aguada San Roque'),
(1540, 16, 'Aluminé'),
(1541, 16, 'Andacollo'),
(1542, 16, 'Añelo'),
(1543, 16, 'Bajada del Agrio'),
(1544, 16, 'Barrancas'),
(1545, 16, 'Buta Ranquil'),
(1546, 16, 'Capital'),
(1547, 16, 'Caviahué'),
(1548, 16, 'Centenario'),
(1549, 16, 'Chorriaca'),
(1550, 16, 'Chos Malal'),
(1551, 16, 'Cipolletti'),
(1552, 16, 'Covunco Abajo'),
(1553, 16, 'Coyuco Cochico'),
(1554, 16, 'Cutral Có'),
(1555, 16, 'El Cholar'),
(1556, 16, 'El Huecú'),
(1557, 16, 'El Sauce'),
(1558, 16, 'Guañacos'),
(1559, 16, 'Huinganco'),
(1560, 16, 'Las Coloradas'),
(1561, 16, 'Las Lajas'),
(1562, 16, 'Las Ovejas'),
(1563, 16, 'Loncopué'),
(1564, 16, 'Los Catutos'),
(1565, 16, 'Los Chihuidos'),
(1566, 16, 'Los Miches'),
(1567, 16, 'Manzano Amargo'),
(1568, 16, '16'),
(1569, 16, 'Octavio Pico'),
(1570, 16, 'Paso Aguerre'),
(1571, 16, 'Picún Leufú'),
(1572, 16, 'Piedra del Aguila'),
(1573, 16, 'Pilo Lil'),
(1574, 16, 'Plaza Huincul'),
(1575, 16, 'Plottier'),
(1576, 16, 'Quili Malal'),
(1577, 16, 'Ramón Castro'),
(1578, 16, 'Rincón de Los Sauces'),
(1579, 16, 'San Martín de Los Andes'),
(1580, 16, 'San Patricio del Chañar'),
(1581, 16, 'Santo Tomás'),
(1582, 16, 'Sauzal Bonito'),
(1583, 16, 'Senillosa'),
(1584, 16, 'Taquimilán'),
(1585, 16, 'Tricao Malal'),
(1586, 16, 'Varvarco'),
(1587, 16, 'Villa Curí Leuvu'),
(1588, 16, 'Villa del Nahueve'),
(1589, 16, 'Villa del Puente Picún Leuvú'),
(1590, 16, 'Villa El Chocón'),
(1591, 16, 'Villa La Angostura'),
(1592, 16, 'Villa Pehuenia'),
(1593, 16, 'Villa Traful'),
(1594, 16, 'Vista Alegre'),
(1595, 16, 'Zapala'),
(1596, 17, 'Aguada Cecilio'),
(1597, 17, 'Aguada de Guerra'),
(1598, 17, 'Allén'),
(1599, 17, 'Arroyo de La Ventana'),
(1600, 17, 'Arroyo Los Berros'),
(1601, 17, 'Bariloche'),
(1602, 17, 'Calte. Cordero'),
(1603, 17, 'Campo Grande'),
(1604, 17, 'Catriel'),
(1605, 17, 'Cerro Policía'),
(1606, 17, 'Cervantes'),
(1607, 17, 'Chelforo'),
(1608, 17, 'Chimpay'),
(1609, 17, 'Chinchinales'),
(1610, 17, 'Chipauquil'),
(1611, 17, 'Choele Choel'),
(1612, 17, 'Cinco Saltos'),
(1613, 17, 'Cipolletti'),
(1614, 17, 'Clemente Onelli'),
(1615, 17, 'Colán Conhue'),
(1616, 17, 'Comallo'),
(1617, 17, 'Comicó'),
(1618, 17, 'Cona Niyeu'),
(1619, 17, 'Coronel Belisle'),
(1620, 17, 'Cubanea'),
(1621, 17, 'Darwin'),
(1622, 17, 'Dina Huapi'),
(1623, 17, 'El Bolsón'),
(1624, 17, 'El Caín'),
(1625, 17, 'El Manso'),
(1626, 17, 'Gral. Conesa'),
(1627, 17, 'Gral. Enrique Godoy'),
(1628, 17, 'Gral. Fernandez Oro'),
(1629, 17, 'Gral. Roca'),
(1630, 17, 'Guardia Mitre'),
(1631, 17, 'Ing. Huergo'),
(1632, 17, 'Ing. Jacobacci'),
(1633, 17, 'Laguna Blanca'),
(1634, 17, 'Lamarque'),
(1635, 17, 'Las Grutas'),
(1636, 17, 'Los Menucos'),
(1637, 17, 'Luis Beltrán'),
(1638, 17, 'Mainqué'),
(1639, 17, 'Mamuel Choique'),
(1640, 17, 'Maquinchao'),
(1641, 17, 'Mencué'),
(1642, 17, 'Mtro. Ramos Mexia'),
(1643, 17, 'Nahuel Niyeu'),
(1644, 17, 'Naupa Huen'),
(1645, 17, 'Ñorquinco'),
(1646, 17, 'Ojos de Agua'),
(1647, 17, 'Paso de Agua'),
(1648, 17, 'Paso Flores'),
(1649, 17, 'Peñas Blancas'),
(1650, 17, 'Pichi Mahuida'),
(1651, 17, 'Pilcaniyeu'),
(1652, 17, 'Pomona'),
(1653, 17, 'Prahuaniyeu'),
(1654, 17, 'Rincón Treneta'),
(1655, 17, 'Río Chico'),
(1656, 17, 'Río Colorado'),
(1657, 17, 'Roca'),
(1658, 17, 'San Antonio Oeste'),
(1659, 17, 'San Javier'),
(1660, 17, 'Sierra Colorada'),
(1661, 17, 'Sierra Grande'),
(1662, 17, 'Sierra Pailemán'),
(1663, 17, 'Valcheta'),
(1664, 17, 'Valle Azul'),
(1665, 17, 'Viedma'),
(1666, 17, 'Villa Llanquín'),
(1667, 17, 'Villa Mascardi'),
(1668, 17, 'Villa Regina'),
(1669, 17, 'Yaminué'),
(1670, 18, 'A. Saravia'),
(1671, 18, 'Aguaray'),
(1672, 18, 'Angastaco'),
(1673, 18, 'Animaná'),
(1674, 18, 'Cachi'),
(1675, 18, 'Cafayate'),
(1676, 18, 'Campo Quijano'),
(1677, 18, 'Campo Santo'),
(1678, 18, 'Capital'),
(1679, 18, 'Cerrillos'),
(1680, 18, 'Chicoana'),
(1681, 18, 'Col. Sta. Rosa'),
(1682, 18, 'Coronel Moldes'),
(1683, 18, 'El Bordo'),
(1684, 18, 'El Carril'),
(1685, 18, 'El Galpón'),
(1686, 18, 'El Jardín'),
(1687, 18, 'El Potrero'),
(1688, 18, 'El Quebrachal'),
(1689, 18, 'El Tala'),
(1690, 18, 'Embarcación'),
(1691, 18, 'Gral. Ballivian'),
(1692, 18, 'Gral. Güemes'),
(1693, 18, 'Gral. Mosconi'),
(1694, 18, 'Gral. Pizarro'),
(1695, 18, 'Guachipas'),
(1696, 18, 'Hipólito Yrigoyen'),
(1697, 18, 'Iruyá'),
(1698, 18, 'Isla De Cañas'),
(1699, 18, 'J. V. Gonzalez'),
(1700, 18, 'La Caldera'),
(1701, 18, 'La Candelaria'),
(1702, 18, 'La Merced'),
(1703, 18, 'La Poma'),
(1704, 18, 'La Viña'),
(1705, 18, 'Las Lajitas'),
(1706, 18, 'Los Toldos'),
(1707, 18, 'Metán'),
(1708, 18, 'Molinos'),
(1709, 18, 'Nazareno'),
(1710, 18, 'Orán'),
(1711, 18, 'Payogasta'),
(1712, 18, 'Pichanal'),
(1713, 18, 'Prof. S. Mazza'),
(1714, 18, 'Río Piedras'),
(1715, 18, 'Rivadavia Banda Norte'),
(1716, 18, 'Rivadavia Banda Sur'),
(1717, 18, 'Rosario de La Frontera'),
(1718, 18, 'Rosario de Lerma'),
(1719, 18, 'Saclantás'),
(1720, 18, '18'),
(1721, 18, 'San Antonio'),
(1722, 18, 'San Carlos'),
(1723, 18, 'San José De Metán'),
(1724, 18, 'San Ramón'),
(1725, 18, 'Santa Victoria E.'),
(1726, 18, 'Santa Victoria O.'),
(1727, 18, 'Tartagal'),
(1728, 18, 'Tolar Grande'),
(1729, 18, 'Urundel'),
(1730, 18, 'Vaqueros'),
(1731, 18, 'Villa San Lorenzo'),
(1732, 19, 'Albardón'),
(1733, 19, 'Angaco'),
(1734, 19, 'Calingasta'),
(1735, 19, 'Capital'),
(1736, 19, 'Caucete'),
(1737, 19, 'Chimbas'),
(1738, 19, 'Iglesia'),
(1739, 19, 'Jachal'),
(1740, 19, 'Nueve de Julio'),
(1741, 19, 'Pocito'),
(1742, 19, 'Rawson'),
(1743, 19, 'Rivadavia'),
(1744, 19, '19'),
(1745, 19, 'San Martín'),
(1746, 19, 'Santa Lucía'),
(1747, 19, 'Sarmiento'),
(1748, 19, 'Ullum'),
(1749, 19, 'Valle Fértil'),
(1750, 19, 'Veinticinco de Mayo'),
(1751, 19, 'Zonda'),
(1752, 20, 'Alto Pelado'),
(1753, 20, 'Alto Pencoso'),
(1754, 20, 'Anchorena'),
(1755, 20, 'Arizona'),
(1756, 20, 'Bagual'),
(1757, 20, 'Balde'),
(1758, 20, 'Batavia'),
(1759, 20, 'Beazley'),
(1760, 20, 'Buena Esperanza'),
(1761, 20, 'Candelaria'),
(1762, 20, 'Capital'),
(1763, 20, 'Carolina'),
(1764, 20, 'Carpintería'),
(1765, 20, 'Concarán'),
(1766, 20, 'Cortaderas'),
(1767, 20, 'El Morro'),
(1768, 20, 'El Trapiche'),
(1769, 20, 'El Volcán'),
(1770, 20, 'Fortín El Patria'),
(1771, 20, 'Fortuna'),
(1772, 20, 'Fraga'),
(1773, 20, 'Juan Jorba'),
(1774, 20, 'Juan Llerena'),
(1775, 20, 'Juana Koslay'),
(1776, 20, 'Justo Daract'),
(1777, 20, 'La Calera'),
(1778, 20, 'La Florida'),
(1779, 20, 'La Punilla'),
(1780, 20, 'La Toma'),
(1781, 20, 'Lafinur'),
(1782, 20, 'Las Aguadas'),
(1783, 20, 'Las Chacras'),
(1784, 20, 'Las Lagunas'),
(1785, 20, 'Las Vertientes'),
(1786, 20, 'Lavaisse'),
(1787, 20, 'Leandro N. Alem'),
(1788, 20, 'Los Molles'),
(1789, 20, 'Luján'),
(1790, 20, 'Mercedes'),
(1791, 20, 'Merlo'),
(1792, 20, 'Naschel'),
(1793, 20, 'Navia'),
(1794, 20, 'Nogolí'),
(1795, 20, 'Nueva Galia'),
(1796, 20, 'Papagayos'),
(1797, 20, 'Paso Grande'),
(1798, 20, 'Potrero de Los Funes'),
(1799, 20, 'Quines'),
(1800, 20, 'Renca'),
(1801, 20, 'Saladillo'),
(1802, 20, 'San Francisco'),
(1803, 20, 'San Gerónimo'),
(1804, 20, 'San Martín'),
(1805, 20, 'San Pablo'),
(1806, 20, 'Santa Rosa de Conlara'),
(1807, 20, 'Talita'),
(1808, 20, 'Tilisarao'),
(1809, 20, 'Unión'),
(1810, 20, 'Villa de La Quebrada'),
(1811, 20, 'Villa de Praga'),
(1812, 20, 'Villa del Carmen'),
(1813, 20, 'Villa Gral. Roca'),
(1814, 20, 'Villa Larca'),
(1815, 20, 'Villa Mercedes'),
(1816, 20, 'Zanjitas'),
(1817, 21, 'Calafate'),
(1818, 21, 'Caleta Olivia'),
(1819, 21, 'Cañadón Seco'),
(1820, 21, 'Comandante Piedrabuena'),
(1821, 21, 'El Calafate'),
(1822, 21, 'El Chaltén'),
(1823, 21, 'Gdor. Gregores'),
(1824, 21, 'Hipólito Yrigoyen'),
(1825, 21, 'Jaramillo'),
(1826, 21, 'Koluel Kaike'),
(1827, 21, 'Las Heras'),
(1828, 21, 'Los Antiguos'),
(1829, 21, 'Perito Moreno'),
(1830, 21, 'Pico Truncado'),
(1831, 21, 'Pto. Deseado'),
(1832, 21, 'Pto. San Julián'),
(1833, 21, 'Pto. 21'),
(1834, 21, 'Río Cuarto'),
(1835, 21, 'Río Gallegos'),
(1836, 21, 'Río Turbio'),
(1837, 21, 'Tres Lagos'),
(1838, 21, 'Veintiocho De Noviembre'),
(1839, 22, 'Aarón Castellanos'),
(1840, 22, 'Acebal'),
(1841, 22, 'Aguará Grande'),
(1842, 22, 'Albarellos'),
(1843, 22, 'Alcorta'),
(1844, 22, 'Aldao'),
(1845, 22, 'Alejandra'),
(1846, 22, 'Álvarez'),
(1847, 22, 'Ambrosetti'),
(1848, 22, 'Amenábar'),
(1849, 22, 'Angélica'),
(1850, 22, 'Angeloni'),
(1851, 22, 'Arequito'),
(1852, 22, 'Arminda'),
(1853, 22, 'Armstrong'),
(1854, 22, 'Arocena'),
(1855, 22, 'Arroyo Aguiar'),
(1856, 22, 'Arroyo Ceibal'),
(1857, 22, 'Arroyo Leyes'),
(1858, 22, 'Arroyo Seco'),
(1859, 22, 'Arrufó'),
(1860, 22, 'Arteaga'),
(1861, 22, 'Ataliva'),
(1862, 22, 'Aurelia'),
(1863, 22, 'Avellaneda'),
(1864, 22, 'Barrancas'),
(1865, 22, 'Bauer Y Sigel'),
(1866, 22, 'Bella Italia'),
(1867, 22, 'Berabevú'),
(1868, 22, 'Berna'),
(1869, 22, 'Bernardo de Irigoyen'),
(1870, 22, 'Bigand'),
(1871, 22, 'Bombal'),
(1872, 22, 'Bouquet'),
(1873, 22, 'Bustinza'),
(1874, 22, 'Cabal'),
(1875, 22, 'Cacique Ariacaiquin'),
(1876, 22, 'Cafferata'),
(1877, 22, 'Calchaquí'),
(1878, 22, 'Campo Andino'),
(1879, 22, 'Campo Piaggio'),
(1880, 22, 'Cañada de Gómez'),
(1881, 22, 'Cañada del Ucle'),
(1882, 22, 'Cañada Rica'),
(1883, 22, 'Cañada Rosquín'),
(1884, 22, 'Candioti'),
(1885, 22, 'Capital'),
(1886, 22, 'Capitán Bermúdez'),
(1887, 22, 'Capivara'),
(1888, 22, 'Carcarañá'),
(1889, 22, 'Carlos Pellegrini'),
(1890, 22, 'Carmen'),
(1891, 22, 'Carmen Del Sauce'),
(1892, 22, 'Carreras'),
(1893, 22, 'Carrizales'),
(1894, 22, 'Casalegno'),
(1895, 22, 'Casas'),
(1896, 22, 'Casilda'),
(1897, 22, 'Castelar'),
(1898, 22, 'Castellanos'),
(1899, 22, 'Cayastá'),
(1900, 22, 'Cayastacito'),
(1901, 22, 'Centeno'),
(1902, 22, 'Cepeda'),
(1903, 22, 'Ceres'),
(1904, 22, 'Chabás'),
(1905, 22, 'Chañar Ladeado'),
(1906, 22, 'Chapuy'),
(1907, 22, 'Chovet'),
(1908, 22, 'Christophersen'),
(1909, 22, 'Classon'),
(1910, 22, 'Cnel. Arnold'),
(1911, 22, 'Cnel. Bogado'),
(1912, 22, 'Cnel. Dominguez'),
(1913, 22, 'Cnel. Fraga'),
(1914, 22, 'Col. Aldao'),
(1915, 22, 'Col. Ana'),
(1916, 22, 'Col. Belgrano'),
(1917, 22, 'Col. Bicha'),
(1918, 22, 'Col. Bigand'),
(1919, 22, 'Col. Bossi'),
(1920, 22, 'Col. Cavour'),
(1921, 22, 'Col. Cello'),
(1922, 22, 'Col. Dolores'),
(1923, 22, 'Col. Dos Rosas'),
(1924, 22, 'Col. Durán'),
(1925, 22, 'Col. Iturraspe'),
(1926, 22, 'Col. Margarita'),
(1927, 22, 'Col. Mascias'),
(1928, 22, 'Col. Raquel'),
(1929, 22, 'Col. Rosa'),
(1930, 22, 'Col. San José'),
(1931, 22, 'Constanza'),
(1932, 22, 'Coronda'),
(1933, 22, 'Correa'),
(1934, 22, 'Crispi'),
(1935, 22, 'Cululú'),
(1936, 22, 'Curupayti'),
(1937, 22, 'Desvio Arijón'),
(1938, 22, 'Diaz'),
(1939, 22, 'Diego de Alvear'),
(1940, 22, 'Egusquiza'),
(1941, 22, 'El Arazá'),
(1942, 22, 'El Rabón'),
(1943, 22, 'El Sombrerito'),
(1944, 22, 'El Trébol'),
(1945, 22, 'Elisa'),
(1946, 22, 'Elortondo'),
(1947, 22, 'Emilia'),
(1948, 22, 'Empalme San Carlos'),
(1949, 22, 'Empalme Villa Constitucion'),
(1950, 22, 'Esmeralda'),
(1951, 22, 'Esperanza'),
(1952, 22, 'Estación Alvear'),
(1953, 22, 'Estacion Clucellas'),
(1954, 22, 'Esteban Rams'),
(1955, 22, 'Esther'),
(1956, 22, 'Esustolia'),
(1957, 22, 'Eusebia'),
(1958, 22, 'Felicia'),
(1959, 22, 'Fidela'),
(1960, 22, 'Fighiera'),
(1961, 22, 'Firmat'),
(1962, 22, 'Florencia'),
(1963, 22, 'Fortín Olmos'),
(1964, 22, 'Franck'),
(1965, 22, 'Fray Luis Beltrán'),
(1966, 22, 'Frontera'),
(1967, 22, 'Fuentes'),
(1968, 22, 'Funes'),
(1969, 22, 'Gaboto'),
(1970, 22, 'Galisteo'),
(1971, 22, 'Gálvez'),
(1972, 22, 'Garabalto'),
(1973, 22, 'Garibaldi'),
(1974, 22, 'Gato Colorado'),
(1975, 22, 'Gdor. Crespo'),
(1976, 22, 'Gessler'),
(1977, 22, 'Godoy'),
(1978, 22, 'Golondrina'),
(1979, 22, 'Gral. Gelly'),
(1980, 22, 'Gral. Lagos'),
(1981, 22, 'Granadero Baigorria'),
(1982, 22, 'Gregoria Perez De Denis'),
(1983, 22, 'Grutly'),
(1984, 22, 'Guadalupe N.'),
(1985, 22, 'Gödeken'),
(1986, 22, 'Helvecia'),
(1987, 22, 'Hersilia'),
(1988, 22, 'Hipatía'),
(1989, 22, 'Huanqueros'),
(1990, 22, 'Hugentobler'),
(1991, 22, 'Hughes'),
(1992, 22, 'Humberto 1º'),
(1993, 22, 'Humboldt'),
(1994, 22, 'Ibarlucea'),
(1995, 22, 'Ing. Chanourdie'),
(1996, 22, 'Intiyaco'),
(1997, 22, 'Ituzaingó'),
(1998, 22, 'Jacinto L. Aráuz'),
(1999, 22, 'Josefina'),
(2000, 22, 'Juan B. Molina'),
(2001, 22, 'Juan de Garay'),
(2002, 22, 'Juncal'),
(2003, 22, 'La Brava'),
(2004, 22, 'La Cabral'),
(2005, 22, 'La Camila'),
(2006, 22, 'La Chispa'),
(2007, 22, 'La Clara'),
(2008, 22, 'La Criolla'),
(2009, 22, 'La Gallareta'),
(2010, 22, 'La Lucila'),
(2011, 22, 'La Pelada'),
(2012, 22, 'La Penca'),
(2013, 22, 'La Rubia'),
(2014, 22, 'La Sarita'),
(2015, 22, 'La Vanguardia'),
(2016, 22, 'Labordeboy'),
(2017, 22, 'Laguna Paiva'),
(2018, 22, 'Landeta'),
(2019, 22, 'Lanteri'),
(2020, 22, 'Larrechea'),
(2021, 22, 'Las Avispas'),
(2022, 22, 'Las Bandurrias'),
(2023, 22, 'Las Garzas'),
(2024, 22, 'Las Palmeras'),
(2025, 22, 'Las Parejas'),
(2026, 22, 'Las Petacas'),
(2027, 22, 'Las Rosas'),
(2028, 22, 'Las Toscas'),
(2029, 22, 'Las Tunas'),
(2030, 22, 'Lazzarino'),
(2031, 22, 'Lehmann'),
(2032, 22, 'Llambi Campbell'),
(2033, 22, 'Logroño'),
(2034, 22, 'Loma Alta'),
(2035, 22, 'López'),
(2036, 22, 'Los Amores'),
(2037, 22, 'Los Cardos'),
(2038, 22, 'Los Laureles'),
(2039, 22, 'Los Molinos'),
(2040, 22, 'Los Quirquinchos'),
(2041, 22, 'Lucio V. Lopez'),
(2042, 22, 'Luis Palacios'),
(2043, 22, 'Ma. Juana'),
(2044, 22, 'Ma. Luisa'),
(2045, 22, 'Ma. Susana'),
(2046, 22, 'Ma. Teresa'),
(2047, 22, 'Maciel'),
(2048, 22, 'Maggiolo'),
(2049, 22, 'Malabrigo'),
(2050, 22, 'Marcelino Escalada'),
(2051, 22, 'Margarita'),
(2052, 22, 'Matilde'),
(2053, 22, 'Mauá'),
(2054, 22, 'Máximo Paz'),
(2055, 22, 'Melincué'),
(2056, 22, 'Miguel Torres'),
(2057, 22, 'Moisés Ville'),
(2058, 22, 'Monigotes'),
(2059, 22, 'Monje'),
(2060, 22, 'Monte Obscuridad'),
(2061, 22, 'Monte Vera'),
(2062, 22, 'Montefiore'),
(2063, 22, 'Montes de Oca'),
(2064, 22, 'Murphy'),
(2065, 22, 'Ñanducita'),
(2066, 22, 'Naré'),
(2067, 22, 'Nelson'),
(2068, 22, 'Nicanor E. Molinas'),
(2069, 22, 'Nuevo Torino'),
(2070, 22, 'Oliveros'),
(2071, 22, 'Palacios'),
(2072, 22, 'Pavón'),
(2073, 22, 'Pavón Arriba'),
(2074, 22, 'Pedro Gómez Cello'),
(2075, 22, 'Pérez'),
(2076, 22, 'Peyrano'),
(2077, 22, 'Piamonte'),
(2078, 22, 'Pilar'),
(2079, 22, 'Piñero'),
(2080, 22, 'Plaza Clucellas'),
(2081, 22, 'Portugalete'),
(2082, 22, 'Pozo Borrado'),
(2083, 22, 'Progreso'),
(2084, 22, 'Providencia'),
(2085, 22, 'Pte. Roca'),
(2086, 22, 'Pueblo Andino'),
(2087, 22, 'Pueblo Esther'),
(2088, 22, 'Pueblo Gral. San Martín'),
(2089, 22, 'Pueblo Irigoyen'),
(2090, 22, 'Pueblo Marini'),
(2091, 22, 'Pueblo Muñoz'),
(2092, 22, 'Pueblo Uranga'),
(2093, 22, 'Pujato');
INSERT INTO `localidades` (`idLocalidad`, `idProvincia`, `localidad`) VALUES
(2094, 22, 'Pujato N.'),
(2095, 22, 'Rafaela'),
(2096, 22, 'Ramayón'),
(2097, 22, 'Ramona'),
(2098, 22, 'Reconquista'),
(2099, 22, 'Recreo'),
(2100, 22, 'Ricardone'),
(2101, 22, 'Rivadavia'),
(2102, 22, 'Roldán'),
(2103, 22, 'Romang'),
(2104, 22, 'Rosario'),
(2105, 22, 'Rueda'),
(2106, 22, 'Rufino'),
(2107, 22, 'Sa Pereira'),
(2108, 22, 'Saguier'),
(2109, 22, 'Saladero M. Cabal'),
(2110, 22, 'Salto Grande'),
(2111, 22, 'San Agustín'),
(2112, 22, 'San Antonio de Obligado'),
(2113, 22, 'San Bernardo (N.J.)'),
(2114, 22, 'San Bernardo (S.J.)'),
(2115, 22, 'San Carlos Centro'),
(2116, 22, 'San Carlos N.'),
(2117, 22, 'San Carlos S.'),
(2118, 22, 'San Cristóbal'),
(2119, 22, 'San Eduardo'),
(2120, 22, 'San Eugenio'),
(2121, 22, 'San Fabián'),
(2122, 22, 'San Fco. de Santa Fé'),
(2123, 22, 'San Genaro'),
(2124, 22, 'San Genaro N.'),
(2125, 22, 'San Gregorio'),
(2126, 22, 'San Guillermo'),
(2127, 22, 'San Javier'),
(2128, 22, 'San Jerónimo del Sauce'),
(2129, 22, 'San Jerónimo N.'),
(2130, 22, 'San Jerónimo S.'),
(2131, 22, 'San Jorge'),
(2132, 22, 'San José de La Esquina'),
(2133, 22, 'San José del Rincón'),
(2134, 22, 'San Justo'),
(2135, 22, 'San Lorenzo'),
(2136, 22, 'San Mariano'),
(2137, 22, 'San Martín de Las Escobas'),
(2138, 22, 'San Martín N.'),
(2139, 22, 'San Vicente'),
(2140, 22, 'Sancti Spititu'),
(2141, 22, 'Sanford'),
(2142, 22, 'Santo Domingo'),
(2143, 22, 'Santo Tomé'),
(2144, 22, 'Santurce'),
(2145, 22, 'Sargento Cabral'),
(2146, 22, 'Sarmiento'),
(2147, 22, 'Sastre'),
(2148, 22, 'Sauce Viejo'),
(2149, 22, 'Serodino'),
(2150, 22, 'Silva'),
(2151, 22, 'Soldini'),
(2152, 22, 'Soledad'),
(2153, 22, 'Soutomayor'),
(2154, 22, 'Sta. Clara de Buena Vista'),
(2155, 22, 'Sta. Clara de Saguier'),
(2156, 22, 'Sta. Isabel'),
(2157, 22, 'Sta. Margarita'),
(2158, 22, 'Sta. Maria Centro'),
(2159, 22, 'Sta. María N.'),
(2160, 22, 'Sta. Rosa'),
(2161, 22, 'Sta. Teresa'),
(2162, 22, 'Suardi'),
(2163, 22, 'Sunchales'),
(2164, 22, 'Susana'),
(2165, 22, 'Tacuarendí'),
(2166, 22, 'Tacural'),
(2167, 22, 'Tartagal'),
(2168, 22, 'Teodelina'),
(2169, 22, 'Theobald'),
(2170, 22, 'Timbúes'),
(2171, 22, 'Toba'),
(2172, 22, 'Tortugas'),
(2173, 22, 'Tostado'),
(2174, 22, 'Totoras'),
(2175, 22, 'Traill'),
(2176, 22, 'Venado Tuerto'),
(2177, 22, 'Vera'),
(2178, 22, 'Vera y Pintado'),
(2179, 22, 'Videla'),
(2180, 22, 'Vila'),
(2181, 22, 'Villa Amelia'),
(2182, 22, 'Villa Ana'),
(2183, 22, 'Villa Cañas'),
(2184, 22, 'Villa Constitución'),
(2185, 22, 'Villa Eloísa'),
(2186, 22, 'Villa Gdor. Gálvez'),
(2187, 22, 'Villa Guillermina'),
(2188, 22, 'Villa Minetti'),
(2189, 22, 'Villa Mugueta'),
(2190, 22, 'Villa Ocampo'),
(2191, 22, 'Villa San José'),
(2192, 22, 'Villa Saralegui'),
(2193, 22, 'Villa Trinidad'),
(2194, 22, 'Villada'),
(2195, 22, 'Virginia'),
(2196, 22, 'Wheelwright'),
(2197, 22, 'Zavalla'),
(2198, 22, 'Zenón Pereira'),
(2199, 23, 'Añatuya'),
(2200, 23, 'Árraga'),
(2201, 23, 'Bandera'),
(2202, 23, 'Bandera Bajada'),
(2203, 23, 'Beltrán'),
(2204, 23, 'Brea Pozo'),
(2205, 23, 'Campo Gallo'),
(2206, 23, 'Capital'),
(2207, 23, 'Chilca Juliana'),
(2208, 23, 'Choya'),
(2209, 23, 'Clodomira'),
(2210, 23, 'Col. Alpina'),
(2211, 23, 'Col. Dora'),
(2212, 23, 'Col. El Simbolar Robles'),
(2213, 23, 'El Bobadal'),
(2214, 23, 'El Charco'),
(2215, 23, 'El Mojón'),
(2216, 23, 'Estación Atamisqui'),
(2217, 23, 'Estación Simbolar'),
(2218, 23, 'Fernández'),
(2219, 23, 'Fortín Inca'),
(2220, 23, 'Frías'),
(2221, 23, 'Garza'),
(2222, 23, 'Gramilla'),
(2223, 23, 'Guardia Escolta'),
(2224, 23, 'Herrera'),
(2225, 23, 'Icaño'),
(2226, 23, 'Ing. Forres'),
(2227, 23, 'La Banda'),
(2228, 23, 'La Cañada'),
(2229, 23, 'Laprida'),
(2230, 23, 'Lavalle'),
(2231, 23, 'Loreto'),
(2232, 23, 'Los Juríes'),
(2233, 23, 'Los Núñez'),
(2234, 23, 'Los Pirpintos'),
(2235, 23, 'Los Quiroga'),
(2236, 23, 'Los Telares'),
(2237, 23, 'Lugones'),
(2238, 23, 'Malbrán'),
(2239, 23, 'Matara'),
(2240, 23, 'Medellín'),
(2241, 23, 'Monte Quemado'),
(2242, 23, 'Nueva Esperanza'),
(2243, 23, 'Nueva Francia'),
(2244, 23, 'Palo Negro'),
(2245, 23, 'Pampa de Los Guanacos'),
(2246, 23, 'Pinto'),
(2247, 23, 'Pozo Hondo'),
(2248, 23, 'Quimilí'),
(2249, 23, 'Real Sayana'),
(2250, 23, 'Sachayoj'),
(2251, 23, 'San Pedro de Guasayán'),
(2252, 23, 'Selva'),
(2253, 23, 'Sol de Julio'),
(2254, 23, 'Sumampa'),
(2255, 23, 'Suncho Corral'),
(2256, 23, 'Taboada'),
(2257, 23, 'Tapso'),
(2258, 23, 'Termas de Rio Hondo'),
(2259, 23, 'Tintina'),
(2260, 23, 'Tomas Young'),
(2261, 23, 'Vilelas'),
(2262, 23, 'Villa Atamisqui'),
(2263, 23, 'Villa La Punta'),
(2264, 23, 'Villa Ojo de Agua'),
(2265, 23, 'Villa Río Hondo'),
(2266, 23, 'Villa Salavina'),
(2267, 23, 'Villa Unión'),
(2268, 23, 'Vilmer'),
(2269, 23, 'Weisburd'),
(2270, 24, 'Río Grande'),
(2271, 24, 'Tolhuin'),
(2272, 24, 'Ushuaia'),
(2273, 25, 'Acheral'),
(2274, 25, 'Agua Dulce'),
(2275, 25, 'Aguilares'),
(2276, 25, 'Alderetes'),
(2277, 25, 'Alpachiri'),
(2278, 25, 'Alto Verde'),
(2279, 25, 'Amaicha del Valle'),
(2280, 25, 'Amberes'),
(2281, 25, 'Ancajuli'),
(2282, 25, 'Arcadia'),
(2283, 25, 'Atahona'),
(2284, 25, 'Banda del Río Sali'),
(2285, 25, 'Bella Vista'),
(2286, 25, 'Buena Vista'),
(2287, 25, 'Burruyacú'),
(2288, 25, 'Capitán Cáceres'),
(2289, 25, 'Cevil Redondo'),
(2290, 25, 'Choromoro'),
(2291, 25, 'Ciudacita'),
(2292, 25, 'Colalao del Valle'),
(2293, 25, 'Colombres'),
(2294, 25, 'Concepción'),
(2295, 25, 'Delfín Gallo'),
(2296, 25, 'El Bracho'),
(2297, 25, 'El Cadillal'),
(2298, 25, 'El Cercado'),
(2299, 25, 'El Chañar'),
(2300, 25, 'El Manantial'),
(2301, 25, 'El Mojón'),
(2302, 25, 'El Mollar'),
(2303, 25, 'El Naranjito'),
(2304, 25, 'El Naranjo'),
(2305, 25, 'El Polear'),
(2306, 25, 'El Puestito'),
(2307, 25, 'El Sacrificio'),
(2308, 25, 'El Timbó'),
(2309, 25, 'Escaba'),
(2310, 25, 'Esquina'),
(2311, 25, 'Estación Aráoz'),
(2312, 25, 'Famaillá'),
(2313, 25, 'Gastone'),
(2314, 25, 'Gdor. Garmendia'),
(2315, 25, 'Gdor. Piedrabuena'),
(2316, 25, 'Graneros'),
(2317, 25, 'Huasa Pampa'),
(2318, 25, 'J. B. Alberdi'),
(2319, 25, 'La Cocha'),
(2320, 25, 'La Esperanza'),
(2321, 25, 'La Florida'),
(2322, 25, 'La Ramada'),
(2323, 25, 'La Trinidad'),
(2324, 25, 'Lamadrid'),
(2325, 25, 'Las Cejas'),
(2326, 25, 'Las Talas'),
(2327, 25, 'Las Talitas'),
(2328, 25, 'Los Bulacio'),
(2329, 25, 'Los Gómez'),
(2330, 25, 'Los Nogales'),
(2331, 25, 'Los Pereyra'),
(2332, 25, 'Los Pérez'),
(2333, 25, 'Los Puestos'),
(2334, 25, 'Los Ralos'),
(2335, 25, 'Los Sarmientos'),
(2336, 25, 'Los Sosa'),
(2337, 25, 'Lules'),
(2338, 25, 'M. García Fernández'),
(2339, 25, 'Manuela Pedraza'),
(2340, 25, 'Medinas'),
(2341, 25, 'Monte Bello'),
(2342, 25, 'Monteagudo'),
(2343, 25, 'Monteros'),
(2344, 25, 'Padre Monti'),
(2345, 25, 'Pampa Mayo'),
(2346, 25, 'Quilmes'),
(2347, 25, 'Raco'),
(2348, 25, 'Ranchillos'),
(2349, 25, 'Río Chico'),
(2350, 25, 'Río Colorado'),
(2351, 25, 'Río Seco'),
(2352, 25, 'Rumi Punco'),
(2353, 25, 'San Andrés'),
(2354, 25, 'San Felipe'),
(2355, 25, 'San Ignacio'),
(2356, 25, 'San Javier'),
(2357, 25, 'San José'),
(2358, 25, 'San Miguel de 25'),
(2359, 25, 'San Pedro'),
(2360, 25, 'San Pedro de Colalao'),
(2361, 25, 'Santa Rosa de Leales'),
(2362, 25, 'Sgto. Moya'),
(2363, 25, 'Siete de Abril'),
(2364, 25, 'Simoca'),
(2365, 25, 'Soldado Maldonado'),
(2366, 25, 'Sta. Ana'),
(2367, 25, 'Sta. Cruz'),
(2368, 25, 'Sta. Lucía'),
(2369, 25, 'Taco Ralo'),
(2370, 25, 'Tafí del Valle'),
(2371, 25, 'Tafí Viejo'),
(2372, 25, 'Tapia'),
(2373, 25, 'Teniente Berdina'),
(2374, 25, 'Trancas'),
(2375, 25, 'Villa Belgrano'),
(2376, 25, 'Villa Benjamín Araoz'),
(2377, 25, 'Villa Chiligasta'),
(2378, 25, 'Villa de Leales'),
(2379, 25, 'Villa Quinteros'),
(2380, 25, 'Yánima'),
(2381, 25, 'Yerba Buena'),
(2382, 25, 'Yerba Buena (S)'),
(2383, 1, 'Buenos Aires-GBA'),
(2384, 1, 'Capital Federal'),
(2385, 22, 'Santa Fe Capital');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medios_pagos`
--

CREATE TABLE `medios_pagos` (
  `idMedioPago` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medios_pagos`
--

INSERT INTO `medios_pagos` (`idMedioPago`, `descripcion`) VALUES
(1, 'Efectivo'),
(2, 'Transferencia Bancaria'),
(3, 'Tarjeta'),
(4, 'Cheque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `idTipoInterna` int(11) NOT NULL,
  `idSubItem` int(11) NOT NULL,
  `posicion` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL,
  `icono` varchar(150) NOT NULL,
  `color` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `idUsuarioAdmin` int(11) NOT NULL DEFAULT '1',
  `idNivelGen` varchar(50) NOT NULL,
  `fechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idMenu`, `idTipoInterna`, `idSubItem`, `posicion`, `nombre`, `icono`, `color`, `link`, `idUsuarioAdmin`, `idNivelGen`, `fechaCreacion`, `eliminado`) VALUES
(1, 1, 0, 0, 'Menu Principal', 'fas fa-desktop', '#000000', 'dashboard', 25, 'p1C3EHfxKfG6nao', '2019-08-06 21:58:30', 1),
(2, 2, 4, 4, 'Clientes', '#', '#000000', 'clientes/listar_clientes', 1, 'FrXHRzo7fdCiTy6', '2019-08-06 22:08:10', 0),
(3, 2, 4, 4, 'Proveedores', '#', '#000000', 'proveedores/listar_proveedores', 1, '8lM2WwrcneqnvXy', '2019-08-06 22:20:37', 0),
(4, 1, 0, 3, 'Productos', 'fas fa-boxes', '#000000', 'productos/listar_productos', 25, 'gqwuvrFObK8dDz1', '2019-08-06 22:21:28', 0),
(5, 2, 0, 1, 'Ingresos', '.', '#000000', '#', 1, 'Q3GmGHgy85Y5u9O', '2019-08-06 22:22:28', 0),
(6, 3, 1, 1, 'Ventas', '.', '#000000', 'ventas/listar_ventas', 1, 'zQQ5LERwjwMqQLf', '2019-08-06 22:23:29', 0),
(7, 3, 1, 1, 'Abonos', '.', '#000000', 'abonos/listar_abonos', 1, 'qFvYbY1vMtQF7LW', '2019-08-06 22:26:06', 0),
(8, 2, 0, 2, 'Egresos', '.', '#000000', '#', 1, 'yo6ZAxD28jQZNpP', '2019-08-06 22:28:29', 0),
(9, 3, 2, 2, 'Gastos', '.', '#000000', 'gastos/listar_gastos', 1, '4ygAzn0V5jg4JpW', '2019-08-06 22:29:14', 0),
(10, 3, 2, 2, 'Compras', '.', '#000000', 'compras/listar_compras', 1, 'MGOCDpx65mRPdUe', '2019-08-06 22:29:55', 0),
(11, 2, 8, 10, 'Categorías de Transacciones', '#', '#000000', '#', 1, 'NPYhrdayFJ2jAfY', '2019-08-06 22:31:09', 0),
(12, 3, 10, 11, 'Ventas', '#', '#000000', '#', 1, 'jwWTOl0GH0WXlAd', '2019-08-06 22:31:56', 0),
(13, 3, 11, 12, 'Categorías', 'fas fa-layer-group', '#000000', 'ventas/listar_categorias', 25, 'uU84BFGsHOtflCQ', '2019-08-06 22:32:35', 1),
(14, 4, 11, 11, 'Categorías', 'fas fa-layer-group', '#000000', 'ventas/listar_categorias_detalle', 1, 'NOrCF6jHVVvWU9J', '2019-08-06 22:41:53', 0),
(15, 4, 11, 11, 'Subcategorías', 'fas fa-layer-group', '#000000', 'ventas/listar_subcategorias', 1, 'wOIXlFQ0OqqT9Jc', '2019-08-06 22:42:25', 0),
(16, 3, 10, 12, 'Gastos', '#', '#000000', '#', 1, 'SIEo0uOXPz2UQgI', '2019-08-06 22:44:02', 0),
(17, 4, 12, 12, 'Categorías', 'fas fa-layer-group', '#000000', 'gastos/listar_categorias', 1, 'zUfgzwlR7yuvYJe', '2019-08-06 22:45:04', 0),
(18, 4, 12, 12, 'Subcategorías', 'fas fa-layer-group', '#000000', 'gastos/listar_subcategorias', 1, 'whO5MViHyVB3pEt', '2019-08-06 23:10:44', 0),
(19, 1, 0, 7, 'Informes', 'fas fa-layer-group', '#000000', '#', 1, '0ZgcELRoowH2XXW', '2019-08-06 23:13:15', 0),
(20, 2, 7, 7, 'Cuenta Corriente Clientes', '#', '#000000', 'informes/listar_cte_clientes', 1, 'dD0HuzBmmm9SGPk', '2019-08-06 23:19:12', 0),
(21, 1, 0, 6, 'Finanzas', 'fas fa-hand-holding-usd', '#000000', '#', 1, '4wxFJl6ekaWYMG8', '2019-08-06 23:21:42', 0),
(22, 2, 6, 6, 'Saldos', '#', '#000000', 'tesoreria/listar_saldos', 1, 'rIbMLnBNBPQs6VJ', '2019-08-06 23:23:43', 0),
(23, 2, 6, 6, 'Cuentas', '#', '#000000', 'tesoreria/listar_cuentas', 1, 'obA47pc9ynoYvxb', '2019-08-06 23:24:38', 0),
(24, 2, 7, 7, 'Historial Operaciones', '#', '#000000', 'historial/listar_operaciones', 1, 'OwHR9ZRzqJMBm37', '2019-08-06 23:25:31', 0),
(25, 2, 4, 4, 'Personal', '.', '#000000', 'usuarios/listar_usuarios', 1, 'Lj5VYNnbqzGeFZg', '2019-08-06 23:26:38', 0),
(26, 2, 8, 8, 'Permisos de usuario', '#', '#000000', 'menu_admin/listar_menu_admin/', 1, 'Zr7t3yJ6ENMGQhX', '2019-08-06 23:27:35', 0),
(27, 3, 10, 13, 'Compras', 'fas fa-layer-group', '#000000', 'compras/listar_categorias', 1, 'qdmaW0F4TszvTKf', '2019-08-06 23:33:18', 0),
(28, 3, 1, 1, 'Presupuesto', '.', '#000000', 'presupuesto/listar_presupuesto', 1, '7vLr7HbbFYniDZS', '2020-01-08 14:07:15', 0),
(29, 2, 7, 7, 'Ventas', '-', '#000000', 'ventas/listar_ventas_informe', 1, 'cdQ5RSLnJZFhFcB', '2020-02-27 11:56:09', 0),
(30, 2, 7, 7, 'Compras', '-', '#000000', 'compras/listar_compras_informe', 1, '0Ek8k3djVA0Iw8T', '2020-02-27 14:42:24', 0),
(31, 2, 7, 7, 'Gastos', '.', '#000000', 'gastos/listar_gastos_informe', 1, 'd5D24SgsdLVWBDl', '2020-03-02 11:37:31', 0),
(32, 2, 7, 7, 'Abonos', '.', '#000000', 'abonos/listar_abonos_informe', 1, 'YOtbZbLjQH0ikKH', '2020-03-02 13:22:55', 0),
(33, 2, 7, 7, 'Cuenta Corriente Proveedores', '.', '#000000', 'informes/listar_cte_proveedores', 1, 'W6rchHJeGSuKbsM', '2020-03-10 13:25:22', 0),
(34, 1, 0, 5, 'Turnos', 'far fa-calendar', '#000000', '.', 1, '2yHDHivKaojN5bk', '2020-04-03 11:46:00', 0),
(35, 2, 5, 5, 'Control de Turnos', '.', '#000000', 'finanzas/listar_turnos_cajas', 1, 'SxEVQaGg13QgFGO', '2020-04-03 11:49:54', 0),
(36, 2, 5, 5, 'Arqueo de cajas', '.', '#000000', 'finanzas/listar_arqueo_cajas', 1, 'BtJ4Up4CBC2xYWB', '2020-04-03 12:35:33', 0),
(37, 2, 8, 8, 'General', '#', '#000000', 'configuracion_sistema/listar_configuracion_sistema', 1, 'KwIQ1BEFC75BzDz', '2020-04-17 11:58:03', 0),
(38, 2, 8, 9, 'Importar', '#', '#000000', '#', 1, 'eiXSF4hHPNkmn6m', '2020-04-24 11:31:14', 0),
(39, 3, 9, 9, 'Clientes', '-', '#000000', 'importarxls/clientes', 1, 'TmFyHXGudSj3sp3', '2020-04-24 11:33:54', 0),
(40, 3, 9, 9, 'Proveedores', '-', '#000000', 'importarxls/proveedores', 1, 'NEm1VMutLJoQk0p', '2020-04-24 11:37:42', 0),
(41, 3, 9, 9, 'Productos', '-', '#000000', 'importarxls/productos', 1, 'JP2zLxQfQVll20H', '2020-04-24 11:38:26', 0),
(42, 1, 0, 8, 'Notas', 'fas fa-wallet', '#000000', '#', 1, 'VB9fnn65dlMdJmv', '2020-04-29 13:28:08', 1),
(43, 3, 1, 1, 'Notas Crédito', '.', '#000000', 'notas_credito_debito/listar_nota_credito', 1, 'bLKI4YKDPwWh229', '2020-04-30 13:19:59', 0),
(44, 3, 1, 1, 'Notas Débito', '.', '#000000', 'notas_credito_debito/listar_nota_debito', 1, 'TfXkMEZ8xW0LOnI', '2020-04-30 13:21:25', 0),
(45, 3, 2, 2, 'Notas Crédito', '.', '#000000', 'notas_credito_debito_proveedor/listar_nota_credito_proveedor', 1, 'yZrpqEot0Mxis9p', '2020-04-30 13:19:59', 0),
(46, 3, 2, 2, 'Notas Débito', '.', '#000000', 'notas_credito_debito_proveedor/listar_nota_debito_proveedor', 1, 'hh3p4bkQxl8SUPK', '2020-04-30 13:21:25', 0),
(47, 1, 0, 23, 'Libros', 'fas fa-book', '#000000', '#', 1, '4GYMLCg6zwA5Ezv', '2020-05-15 11:25:05', 1),
(48, 2, 6, 6, 'Libro de IVA Ventas', '#', '#000000', 'libros/listar_libro_iva_ventas', 1, 'R9K9NQAGX6Vgfsj', '2020-05-15 11:35:41', 0),
(49, 2, 6, 6, 'Libro de IVA Compra', '#', '#000000', 'libros/listar_libro_iva_compras', 1, 'pBQJNUArv0vWyRo', '2020-05-15 11:36:22', 0),
(50, 2, 8, 8, 'Configuración E-Commerce', '#', '#000000', 'configuracion_ecommerce/listar_configuracion_ecommerce', 1, 'G2Vp6Nflpk3MfZE', '2020-05-18 13:32:32', 0),
(52, 2, 7, 7, 'Movimientos Inventario', '#', '#000000', 'movimientos_inventario/listar_movimientos_inventario', 1, 'ayFiuEXDPCOejVN', '2020-06-11 13:25:51', 0),
(53, 1, 1, 0, 'Operaciones', 'fas fa-file-contract', '#000000', '#', 1, 'oodNCGC8gq4Mj8d', '2020-07-03 13:43:26', 0),
(54, 1, 0, 4, 'Usuarios', 'fas fa-users', '#000000', '#', 1, 'RRtUnlSuSBB74XC', '2020-07-03 13:55:25', 0),
(55, 1, 0, 8, 'Configuración', 'fas fa-cog fa-spin', '#000000', '#', 1, 'XkVdSBjotBL4KW2', '2020-07-03 14:10:47', 0),
(56, 1, 0, 33, 'TTTTEEEESSS gg', 'asd', '#000000', 'asd', 1, 'zuXNNefMEkDTQxV', '2020-07-06 11:29:14', 1),
(57, 2, 5, 5, 'Arqueo de Cajas', '#', '#000000', 'finanzas/listar_arqueo_cajas', 1, 'Wbd6yCwKJd2a2JQ', '2020-07-14 11:09:25', 1),
(58, 1, 2, 1111, 'e', 'e', '#000000', 'e', 1, 'r2utD5BeXUxJhvK', '2020-07-14 13:37:44', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_nivel`
--

CREATE TABLE `menu_nivel` (
  `idMenuNivel` int(11) NOT NULL,
  `idGenMenuNivel` varchar(50) NOT NULL,
  `idNivel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu_nivel`
--

INSERT INTO `menu_nivel` (`idMenuNivel`, `idGenMenuNivel`, `idNivel`) VALUES
(19, 'p1C3EHfxKfG6nao', 6),
(18, 'p1C3EHfxKfG6nao', 5),
(17, 'p1C3EHfxKfG6nao', 4),
(16, 'p1C3EHfxKfG6nao', 3),
(15, 'p1C3EHfxKfG6nao', 2),
(14, 'p1C3EHfxKfG6nao', 1),
(1338, 'FrXHRzo7fdCiTy6', 6),
(1337, 'FrXHRzo7fdCiTy6', 5),
(1336, 'FrXHRzo7fdCiTy6', 4),
(1335, 'FrXHRzo7fdCiTy6', 3),
(1334, 'FrXHRzo7fdCiTy6', 2),
(1333, 'FrXHRzo7fdCiTy6', 1),
(1344, '8lM2WwrcneqnvXy', 6),
(1343, '8lM2WwrcneqnvXy', 5),
(1342, '8lM2WwrcneqnvXy', 4),
(1341, '8lM2WwrcneqnvXy', 3),
(1340, '8lM2WwrcneqnvXy', 2),
(1339, '8lM2WwrcneqnvXy', 1),
(34, 'gqwuvrFObK8dDz1', 0),
(35, 'gqwuvrFObK8dDz1', 1),
(36, 'gqwuvrFObK8dDz1', 2),
(37, 'gqwuvrFObK8dDz1', 3),
(38, 'gqwuvrFObK8dDz1', 4),
(39, 'gqwuvrFObK8dDz1', 5),
(40, 'gqwuvrFObK8dDz1', 6),
(1322, 'RRtUnlSuSBB74XC', 2),
(1187, 'Q3GmGHgy85Y5u9O', 6),
(1186, 'Q3GmGHgy85Y5u9O', 5),
(1185, 'Q3GmGHgy85Y5u9O', 4),
(1184, 'Q3GmGHgy85Y5u9O', 3),
(1183, 'Q3GmGHgy85Y5u9O', 2),
(1182, 'Q3GmGHgy85Y5u9O', 1),
(1249, 'zQQ5LERwjwMqQLf', 6),
(1248, 'zQQ5LERwjwMqQLf', 5),
(1247, 'zQQ5LERwjwMqQLf', 4),
(1246, 'zQQ5LERwjwMqQLf', 3),
(1245, 'zQQ5LERwjwMqQLf', 2),
(1244, 'zQQ5LERwjwMqQLf', 1),
(1255, 'qFvYbY1vMtQF7LW', 6),
(1254, 'qFvYbY1vMtQF7LW', 5),
(1253, 'qFvYbY1vMtQF7LW', 4),
(1252, 'qFvYbY1vMtQF7LW', 3),
(1251, 'qFvYbY1vMtQF7LW', 2),
(1250, 'qFvYbY1vMtQF7LW', 1),
(1287, 'yo6ZAxD28jQZNpP', 6),
(1286, 'yo6ZAxD28jQZNpP', 5),
(1285, 'yo6ZAxD28jQZNpP', 4),
(1284, 'yo6ZAxD28jQZNpP', 3),
(1283, 'yo6ZAxD28jQZNpP', 2),
(1282, 'yo6ZAxD28jQZNpP', 1),
(546, '4GYMLCg6zwA5Ezv', 0),
(1293, '4ygAzn0V5jg4JpW', 6),
(1292, '4ygAzn0V5jg4JpW', 5),
(1291, '4ygAzn0V5jg4JpW', 4),
(1290, '4ygAzn0V5jg4JpW', 3),
(1289, '4ygAzn0V5jg4JpW', 2),
(1288, '4ygAzn0V5jg4JpW', 1),
(1321, 'RRtUnlSuSBB74XC', 1),
(1299, 'MGOCDpx65mRPdUe', 6),
(1298, 'MGOCDpx65mRPdUe', 5),
(1297, 'MGOCDpx65mRPdUe', 4),
(1296, 'MGOCDpx65mRPdUe', 3),
(1295, 'MGOCDpx65mRPdUe', 2),
(1294, 'MGOCDpx65mRPdUe', 1),
(1696, 'NPYhrdayFJ2jAfY', 10),
(1605, 'jwWTOl0GH0WXlAd', 4),
(1604, 'jwWTOl0GH0WXlAd', 1),
(106, 'uU84BFGsHOtflCQ', 4),
(105, 'uU84BFGsHOtflCQ', 1),
(1619, 'NOrCF6jHVVvWU9J', 4),
(1618, 'NOrCF6jHVVvWU9J', 1),
(1621, 'wOIXlFQ0OqqT9Jc', 4),
(1620, 'wOIXlFQ0OqqT9Jc', 1),
(1609, 'SIEo0uOXPz2UQgI', 4),
(1608, 'SIEo0uOXPz2UQgI', 1),
(1623, 'zUfgzwlR7yuvYJe', 4),
(1622, 'zUfgzwlR7yuvYJe', 1),
(1625, 'whO5MViHyVB3pEt', 4),
(1624, 'whO5MViHyVB3pEt', 1),
(1408, '0ZgcELRoowH2XXW', 6),
(1407, '0ZgcELRoowH2XXW', 5),
(1406, '0ZgcELRoowH2XXW', 4),
(1405, '0ZgcELRoowH2XXW', 3),
(1404, '0ZgcELRoowH2XXW', 2),
(1403, '0ZgcELRoowH2XXW', 1),
(1444, 'dD0HuzBmmm9SGPk', 2),
(1443, 'dD0HuzBmmm9SGPk', 1),
(1374, '4wxFJl6ekaWYMG8', 6),
(1373, '4wxFJl6ekaWYMG8', 5),
(1372, '4wxFJl6ekaWYMG8', 4),
(1371, '4wxFJl6ekaWYMG8', 3),
(1370, '4wxFJl6ekaWYMG8', 2),
(1369, '4wxFJl6ekaWYMG8', 1),
(1447, 'dD0HuzBmmm9SGPk', 5),
(1380, 'rIbMLnBNBPQs6VJ', 6),
(1379, 'rIbMLnBNBPQs6VJ', 5),
(1378, 'rIbMLnBNBPQs6VJ', 4),
(1377, 'rIbMLnBNBPQs6VJ', 3),
(1376, 'rIbMLnBNBPQs6VJ', 2),
(1375, 'rIbMLnBNBPQs6VJ', 1),
(1382, 'obA47pc9ynoYvxb', 4),
(1381, 'obA47pc9ynoYvxb', 1),
(1487, 'OwHR9ZRzqJMBm37', 1),
(1486, 'OwHR9ZRzqJMBm37', 0),
(1332, 'Lj5VYNnbqzGeFZg', 4),
(1331, 'Lj5VYNnbqzGeFZg', 1),
(1629, 'Zr7t3yJ6ENMGQhX', 1),
(1628, 'Zr7t3yJ6ENMGQhX', 0),
(1627, 'qdmaW0F4TszvTKf', 4),
(1626, 'qdmaW0F4TszvTKf', 1),
(1442, 'dD0HuzBmmm9SGPk', 0),
(1281, '7vLr7HbbFYniDZS', 6),
(1280, '7vLr7HbbFYniDZS', 5),
(1279, '7vLr7HbbFYniDZS', 4),
(1278, '7vLr7HbbFYniDZS', 3),
(1277, '7vLr7HbbFYniDZS', 2),
(1276, '7vLr7HbbFYniDZS', 1),
(1480, 'cdQ5RSLnJZFhFcB', 5),
(1479, 'cdQ5RSLnJZFhFcB', 4),
(1478, 'cdQ5RSLnJZFhFcB', 3),
(1477, 'cdQ5RSLnJZFhFcB', 2),
(1476, 'cdQ5RSLnJZFhFcB', 1),
(1475, 'cdQ5RSLnJZFhFcB', 0),
(1458, '0Ek8k3djVA0Iw8T', 5),
(1457, '0Ek8k3djVA0Iw8T', 4),
(1456, '0Ek8k3djVA0Iw8T', 3),
(1455, '0Ek8k3djVA0Iw8T', 2),
(1454, '0Ek8k3djVA0Iw8T', 1),
(1453, '0Ek8k3djVA0Iw8T', 0),
(1426, 'd5D24SgsdLVWBDl', 6),
(1425, 'd5D24SgsdLVWBDl', 5),
(1424, 'd5D24SgsdLVWBDl', 4),
(1423, 'd5D24SgsdLVWBDl', 3),
(1422, 'd5D24SgsdLVWBDl', 2),
(1421, 'd5D24SgsdLVWBDl', 1),
(1445, 'dD0HuzBmmm9SGPk', 3),
(1469, 'YOtbZbLjQH0ikKH', 5),
(1468, 'YOtbZbLjQH0ikKH', 4),
(1467, 'YOtbZbLjQH0ikKH', 3),
(1466, 'YOtbZbLjQH0ikKH', 2),
(1465, 'YOtbZbLjQH0ikKH', 1),
(1464, 'YOtbZbLjQH0ikKH', 0),
(1438, 'W6rchHJeGSuKbsM', 6),
(1437, 'W6rchHJeGSuKbsM', 5),
(1436, 'W6rchHJeGSuKbsM', 4),
(1435, 'W6rchHJeGSuKbsM', 3),
(1434, 'W6rchHJeGSuKbsM', 2),
(1433, 'W6rchHJeGSuKbsM', 1),
(1350, '2yHDHivKaojN5bk', 6),
(1349, '2yHDHivKaojN5bk', 5),
(1348, '2yHDHivKaojN5bk', 4),
(1347, '2yHDHivKaojN5bk', 3),
(1346, '2yHDHivKaojN5bk', 2),
(1345, '2yHDHivKaojN5bk', 1),
(1676, 'SxEVQaGg13QgFGO', 6),
(1675, 'SxEVQaGg13QgFGO', 5),
(1674, 'SxEVQaGg13QgFGO', 4),
(1673, 'SxEVQaGg13QgFGO', 3),
(1672, 'SxEVQaGg13QgFGO', 2),
(1671, 'SxEVQaGg13QgFGO', 1),
(1362, 'BtJ4Up4CBC2xYWB', 6),
(1361, 'BtJ4Up4CBC2xYWB', 5),
(1360, 'BtJ4Up4CBC2xYWB', 4),
(1359, 'BtJ4Up4CBC2xYWB', 3),
(1358, 'BtJ4Up4CBC2xYWB', 2),
(1357, 'BtJ4Up4CBC2xYWB', 1),
(1528, 'KwIQ1BEFC75BzDz', 10),
(1527, 'KwIQ1BEFC75BzDz', 9),
(1526, 'KwIQ1BEFC75BzDz', 8),
(1525, 'KwIQ1BEFC75BzDz', 7),
(1524, 'KwIQ1BEFC75BzDz', 6),
(1523, 'KwIQ1BEFC75BzDz', 5),
(1522, 'KwIQ1BEFC75BzDz', 4),
(1521, 'KwIQ1BEFC75BzDz', 3),
(1520, 'KwIQ1BEFC75BzDz', 2),
(1519, 'KwIQ1BEFC75BzDz', 1),
(1550, 'eiXSF4hHPNkmn6m', 10),
(1549, 'eiXSF4hHPNkmn6m', 9),
(1548, 'eiXSF4hHPNkmn6m', 8),
(1547, 'eiXSF4hHPNkmn6m', 7),
(1546, 'eiXSF4hHPNkmn6m', 6),
(1545, 'eiXSF4hHPNkmn6m', 5),
(1544, 'eiXSF4hHPNkmn6m', 4),
(1543, 'eiXSF4hHPNkmn6m', 3),
(1542, 'eiXSF4hHPNkmn6m', 2),
(1541, 'eiXSF4hHPNkmn6m', 1),
(1560, 'TmFyHXGudSj3sp3', 10),
(1559, 'TmFyHXGudSj3sp3', 9),
(1558, 'TmFyHXGudSj3sp3', 8),
(1557, 'TmFyHXGudSj3sp3', 7),
(1556, 'TmFyHXGudSj3sp3', 6),
(1555, 'TmFyHXGudSj3sp3', 5),
(1554, 'TmFyHXGudSj3sp3', 4),
(1553, 'TmFyHXGudSj3sp3', 3),
(1552, 'TmFyHXGudSj3sp3', 2),
(1551, 'TmFyHXGudSj3sp3', 1),
(1570, 'NEm1VMutLJoQk0p', 10),
(1569, 'NEm1VMutLJoQk0p', 9),
(1568, 'NEm1VMutLJoQk0p', 8),
(1567, 'NEm1VMutLJoQk0p', 7),
(1566, 'NEm1VMutLJoQk0p', 6),
(1565, 'NEm1VMutLJoQk0p', 5),
(1564, 'NEm1VMutLJoQk0p', 4),
(1563, 'NEm1VMutLJoQk0p', 3),
(1562, 'NEm1VMutLJoQk0p', 2),
(1561, 'NEm1VMutLJoQk0p', 1),
(1695, 'NPYhrdayFJ2jAfY', 9),
(1580, 'JP2zLxQfQVll20H', 10),
(1579, 'JP2zLxQfQVll20H', 9),
(1578, 'JP2zLxQfQVll20H', 8),
(1577, 'JP2zLxQfQVll20H', 7),
(1576, 'JP2zLxQfQVll20H', 6),
(1575, 'JP2zLxQfQVll20H', 5),
(1574, 'JP2zLxQfQVll20H', 4),
(1573, 'JP2zLxQfQVll20H', 3),
(1572, 'JP2zLxQfQVll20H', 2),
(1571, 'JP2zLxQfQVll20H', 1),
(1275, 'bLKI4YKDPwWh229', 10),
(485, 'VB9fnn65dlMdJmv', 10),
(484, 'VB9fnn65dlMdJmv', 9),
(483, 'VB9fnn65dlMdJmv', 8),
(482, 'VB9fnn65dlMdJmv', 7),
(481, 'VB9fnn65dlMdJmv', 6),
(480, 'VB9fnn65dlMdJmv', 5),
(479, 'VB9fnn65dlMdJmv', 4),
(478, 'VB9fnn65dlMdJmv', 3),
(477, 'VB9fnn65dlMdJmv', 2),
(476, 'VB9fnn65dlMdJmv', 1),
(1274, 'bLKI4YKDPwWh229', 9),
(1273, 'bLKI4YKDPwWh229', 8),
(1272, 'bLKI4YKDPwWh229', 7),
(1271, 'bLKI4YKDPwWh229', 6),
(1270, 'bLKI4YKDPwWh229', 5),
(1269, 'bLKI4YKDPwWh229', 4),
(1268, 'bLKI4YKDPwWh229', 3),
(1267, 'bLKI4YKDPwWh229', 2),
(1266, 'bLKI4YKDPwWh229', 1),
(1265, 'TfXkMEZ8xW0LOnI', 10),
(1264, 'TfXkMEZ8xW0LOnI', 9),
(1263, 'TfXkMEZ8xW0LOnI', 8),
(1262, 'TfXkMEZ8xW0LOnI', 7),
(1261, 'TfXkMEZ8xW0LOnI', 6),
(1260, 'TfXkMEZ8xW0LOnI', 5),
(1259, 'TfXkMEZ8xW0LOnI', 4),
(1258, 'TfXkMEZ8xW0LOnI', 3),
(1257, 'TfXkMEZ8xW0LOnI', 2),
(1256, 'TfXkMEZ8xW0LOnI', 1),
(547, '4GYMLCg6zwA5Ezv', 1),
(548, '4GYMLCg6zwA5Ezv', 2),
(549, '4GYMLCg6zwA5Ezv', 3),
(550, '4GYMLCg6zwA5Ezv', 4),
(551, '4GYMLCg6zwA5Ezv', 5),
(552, '4GYMLCg6zwA5Ezv', 6),
(553, '4GYMLCg6zwA5Ezv', 7),
(554, '4GYMLCg6zwA5Ezv', 8),
(555, '4GYMLCg6zwA5Ezv', 9),
(556, '4GYMLCg6zwA5Ezv', 10),
(1392, 'R9K9NQAGX6Vgfsj', 10),
(1391, 'R9K9NQAGX6Vgfsj', 9),
(1390, 'R9K9NQAGX6Vgfsj', 8),
(1389, 'R9K9NQAGX6Vgfsj', 7),
(1388, 'R9K9NQAGX6Vgfsj', 6),
(1387, 'R9K9NQAGX6Vgfsj', 5),
(1386, 'R9K9NQAGX6Vgfsj', 4),
(1385, 'R9K9NQAGX6Vgfsj', 3),
(1384, 'R9K9NQAGX6Vgfsj', 2),
(1383, 'R9K9NQAGX6Vgfsj', 1),
(1446, 'dD0HuzBmmm9SGPk', 4),
(1402, 'pBQJNUArv0vWyRo', 10),
(1401, 'pBQJNUArv0vWyRo', 9),
(1400, 'pBQJNUArv0vWyRo', 8),
(1399, 'pBQJNUArv0vWyRo', 7),
(1398, 'pBQJNUArv0vWyRo', 6),
(1397, 'pBQJNUArv0vWyRo', 5),
(1396, 'pBQJNUArv0vWyRo', 4),
(1395, 'pBQJNUArv0vWyRo', 3),
(1394, 'pBQJNUArv0vWyRo', 2),
(1393, 'pBQJNUArv0vWyRo', 1),
(1507, 'ayFiuEXDPCOejVN', 10),
(1538, 'G2Vp6Nflpk3MfZE', 10),
(1537, 'G2Vp6Nflpk3MfZE', 9),
(1536, 'G2Vp6Nflpk3MfZE', 8),
(1535, 'G2Vp6Nflpk3MfZE', 7),
(1534, 'G2Vp6Nflpk3MfZE', 6),
(1533, 'G2Vp6Nflpk3MfZE', 5),
(1532, 'G2Vp6Nflpk3MfZE', 4),
(1531, 'G2Vp6Nflpk3MfZE', 3),
(1530, 'G2Vp6Nflpk3MfZE', 2),
(1529, 'G2Vp6Nflpk3MfZE', 1),
(611, 'nhtN1fGwUEVrZ6j', 0),
(610, 'CBkASbUY0RiCvfO', 10),
(609, 'CBkASbUY0RiCvfO', 9),
(608, 'CBkASbUY0RiCvfO', 8),
(607, 'CBkASbUY0RiCvfO', 7),
(606, 'CBkASbUY0RiCvfO', 6),
(605, 'CBkASbUY0RiCvfO', 5),
(604, 'CBkASbUY0RiCvfO', 4),
(603, 'CBkASbUY0RiCvfO', 3),
(602, 'CBkASbUY0RiCvfO', 2),
(601, 'CBkASbUY0RiCvfO', 1),
(612, 'nhtN1fGwUEVrZ6j', 1),
(613, 'nhtN1fGwUEVrZ6j', 2),
(614, 'nhtN1fGwUEVrZ6j', 3),
(615, 'nhtN1fGwUEVrZ6j', 4),
(616, 'nhtN1fGwUEVrZ6j', 5),
(617, 'nhtN1fGwUEVrZ6j', 6),
(618, 'nhtN1fGwUEVrZ6j', 7),
(619, 'nhtN1fGwUEVrZ6j', 8),
(620, 'nhtN1fGwUEVrZ6j', 9),
(621, 'nhtN1fGwUEVrZ6j', 10),
(622, 'qb2TKFzdSG27S4d', 0),
(623, 'qb2TKFzdSG27S4d', 1),
(624, 'qb2TKFzdSG27S4d', 2),
(625, 'qb2TKFzdSG27S4d', 3),
(626, 'qb2TKFzdSG27S4d', 4),
(627, 'qb2TKFzdSG27S4d', 5),
(628, 'qb2TKFzdSG27S4d', 6),
(629, 'qb2TKFzdSG27S4d', 7),
(630, 'qb2TKFzdSG27S4d', 8),
(631, 'qb2TKFzdSG27S4d', 9),
(632, 'qb2TKFzdSG27S4d', 10),
(633, '5L2U7Hp3JQDT71r', 0),
(634, '5L2U7Hp3JQDT71r', 1),
(635, '5L2U7Hp3JQDT71r', 2),
(636, '5L2U7Hp3JQDT71r', 3),
(637, '5L2U7Hp3JQDT71r', 4),
(638, '5L2U7Hp3JQDT71r', 5),
(639, '5L2U7Hp3JQDT71r', 6),
(640, '5L2U7Hp3JQDT71r', 7),
(641, '5L2U7Hp3JQDT71r', 8),
(642, '5L2U7Hp3JQDT71r', 9),
(643, '5L2U7Hp3JQDT71r', 10),
(644, 'Uvy76tFqcqK2xXt', 0),
(645, 'Uvy76tFqcqK2xXt', 1),
(646, 'Uvy76tFqcqK2xXt', 2),
(647, 'Uvy76tFqcqK2xXt', 3),
(648, 'Uvy76tFqcqK2xXt', 4),
(649, 'Uvy76tFqcqK2xXt', 5),
(650, 'Uvy76tFqcqK2xXt', 6),
(651, 'Uvy76tFqcqK2xXt', 7),
(652, 'Uvy76tFqcqK2xXt', 8),
(653, 'Uvy76tFqcqK2xXt', 9),
(654, 'Uvy76tFqcqK2xXt', 10),
(655, 'UMjg9aQ552s7KEZ', 0),
(656, 'UMjg9aQ552s7KEZ', 1),
(657, 'UMjg9aQ552s7KEZ', 2),
(658, 'UMjg9aQ552s7KEZ', 3),
(659, 'UMjg9aQ552s7KEZ', 4),
(660, 'UMjg9aQ552s7KEZ', 5),
(661, 'UMjg9aQ552s7KEZ', 6),
(662, 'UMjg9aQ552s7KEZ', 7),
(663, 'UMjg9aQ552s7KEZ', 8),
(664, 'UMjg9aQ552s7KEZ', 9),
(665, 'UMjg9aQ552s7KEZ', 10),
(666, 'Lr4SqlDXQ4gJyGR', 0),
(667, 'Lr4SqlDXQ4gJyGR', 1),
(668, 'Lr4SqlDXQ4gJyGR', 2),
(669, 'Lr4SqlDXQ4gJyGR', 3),
(670, 'Lr4SqlDXQ4gJyGR', 4),
(671, 'Lr4SqlDXQ4gJyGR', 5),
(672, 'Lr4SqlDXQ4gJyGR', 6),
(673, 'Lr4SqlDXQ4gJyGR', 7),
(674, 'Lr4SqlDXQ4gJyGR', 8),
(675, 'Lr4SqlDXQ4gJyGR', 9),
(676, 'Lr4SqlDXQ4gJyGR', 10),
(912, 'mhk3xDUuV64yX0J', 1),
(890, 'EshZHSYefv3TtOr', 10),
(889, 'EshZHSYefv3TtOr', 9),
(888, 'EshZHSYefv3TtOr', 8),
(887, 'EshZHSYefv3TtOr', 7),
(886, 'EshZHSYefv3TtOr', 6),
(885, 'EshZHSYefv3TtOr', 5),
(884, 'EshZHSYefv3TtOr', 4),
(883, 'EshZHSYefv3TtOr', 3),
(882, 'EshZHSYefv3TtOr', 2),
(881, 'EshZHSYefv3TtOr', 1),
(688, '43WcNvtOfQmfT1N', 0),
(689, '43WcNvtOfQmfT1N', 1),
(690, '43WcNvtOfQmfT1N', 2),
(691, '43WcNvtOfQmfT1N', 3),
(692, '43WcNvtOfQmfT1N', 4),
(693, '43WcNvtOfQmfT1N', 5),
(694, '43WcNvtOfQmfT1N', 6),
(695, '43WcNvtOfQmfT1N', 7),
(696, '43WcNvtOfQmfT1N', 8),
(697, '43WcNvtOfQmfT1N', 9),
(698, '43WcNvtOfQmfT1N', 10),
(699, '5DAxaLDqSYNgrJv', 0),
(700, '5DAxaLDqSYNgrJv', 1),
(701, '5DAxaLDqSYNgrJv', 2),
(702, '5DAxaLDqSYNgrJv', 3),
(703, '5DAxaLDqSYNgrJv', 4),
(704, '5DAxaLDqSYNgrJv', 5),
(705, '5DAxaLDqSYNgrJv', 6),
(706, '5DAxaLDqSYNgrJv', 7),
(707, '5DAxaLDqSYNgrJv', 8),
(708, '5DAxaLDqSYNgrJv', 9),
(709, '5DAxaLDqSYNgrJv', 10),
(710, 'NcZaWJ2MaZiqlfk', 0),
(711, 'NcZaWJ2MaZiqlfk', 1),
(712, 'NcZaWJ2MaZiqlfk', 2),
(713, 'NcZaWJ2MaZiqlfk', 3),
(714, 'NcZaWJ2MaZiqlfk', 4),
(715, 'NcZaWJ2MaZiqlfk', 5),
(716, 'NcZaWJ2MaZiqlfk', 6),
(717, 'NcZaWJ2MaZiqlfk', 7),
(718, 'NcZaWJ2MaZiqlfk', 8),
(719, 'NcZaWJ2MaZiqlfk', 9),
(720, 'NcZaWJ2MaZiqlfk', 10),
(1120, 'V8Bdu5XkHHxz3ra', 10),
(1119, 'V8Bdu5XkHHxz3ra', 9),
(1118, 'V8Bdu5XkHHxz3ra', 8),
(1117, 'V8Bdu5XkHHxz3ra', 7),
(1116, 'V8Bdu5XkHHxz3ra', 6),
(1115, 'V8Bdu5XkHHxz3ra', 5),
(1114, 'V8Bdu5XkHHxz3ra', 3),
(1113, 'V8Bdu5XkHHxz3ra', 2),
(1112, 'V8Bdu5XkHHxz3ra', 1),
(1309, 'yZrpqEot0Mxis9p', 10),
(1111, 'wzpvakCRFPCxtw2', 10),
(1110, 'wzpvakCRFPCxtw2', 9),
(1109, 'wzpvakCRFPCxtw2', 8),
(1108, 'wzpvakCRFPCxtw2', 7),
(1107, 'wzpvakCRFPCxtw2', 6),
(1106, 'wzpvakCRFPCxtw2', 5),
(1105, 'wzpvakCRFPCxtw2', 3),
(1104, 'wzpvakCRFPCxtw2', 2),
(1103, 'wzpvakCRFPCxtw2', 1),
(743, '21IQGGtwS49DdkI', 0),
(744, '21IQGGtwS49DdkI', 1),
(745, '21IQGGtwS49DdkI', 2),
(746, '21IQGGtwS49DdkI', 3),
(747, '21IQGGtwS49DdkI', 4),
(748, '21IQGGtwS49DdkI', 5),
(749, '21IQGGtwS49DdkI', 6),
(750, '21IQGGtwS49DdkI', 7),
(751, '21IQGGtwS49DdkI', 8),
(752, '21IQGGtwS49DdkI', 9),
(753, '21IQGGtwS49DdkI', 10),
(754, 'LInjQO4qiJYOK47', 0),
(755, 'LInjQO4qiJYOK47', 1),
(756, 'LInjQO4qiJYOK47', 2),
(757, 'LInjQO4qiJYOK47', 3),
(758, 'LInjQO4qiJYOK47', 4),
(759, 'LInjQO4qiJYOK47', 5),
(760, 'LInjQO4qiJYOK47', 6),
(761, 'LInjQO4qiJYOK47', 7),
(762, 'LInjQO4qiJYOK47', 8),
(763, 'LInjQO4qiJYOK47', 9),
(764, 'LInjQO4qiJYOK47', 10),
(765, 'h3uKjnNJ1uPbhxu', 0),
(766, 'h3uKjnNJ1uPbhxu', 1),
(767, 'h3uKjnNJ1uPbhxu', 2),
(768, 'h3uKjnNJ1uPbhxu', 3),
(769, 'h3uKjnNJ1uPbhxu', 4),
(770, 'h3uKjnNJ1uPbhxu', 5),
(771, 'h3uKjnNJ1uPbhxu', 6),
(772, 'h3uKjnNJ1uPbhxu', 7),
(773, 'h3uKjnNJ1uPbhxu', 8),
(774, 'h3uKjnNJ1uPbhxu', 9),
(775, 'h3uKjnNJ1uPbhxu', 10),
(911, 'mhk3xDUuV64yX0J', 0),
(910, 'yc7IZqe3zibKpJB', 10),
(909, 'yc7IZqe3zibKpJB', 9),
(908, 'yc7IZqe3zibKpJB', 8),
(907, 'yc7IZqe3zibKpJB', 7),
(906, 'yc7IZqe3zibKpJB', 6),
(905, 'yc7IZqe3zibKpJB', 5),
(904, 'yc7IZqe3zibKpJB', 4),
(903, 'yc7IZqe3zibKpJB', 3),
(902, 'yc7IZqe3zibKpJB', 2),
(901, 'yc7IZqe3zibKpJB', 1),
(787, 'XZajkqB6mAgVoQv', 0),
(788, 'XZajkqB6mAgVoQv', 1),
(789, 'XZajkqB6mAgVoQv', 2),
(790, 'XZajkqB6mAgVoQv', 3),
(791, 'XZajkqB6mAgVoQv', 4),
(792, 'XZajkqB6mAgVoQv', 5),
(793, 'XZajkqB6mAgVoQv', 6),
(794, 'XZajkqB6mAgVoQv', 7),
(795, 'XZajkqB6mAgVoQv', 8),
(796, 'XZajkqB6mAgVoQv', 9),
(797, 'XZajkqB6mAgVoQv', 10),
(798, 'tLZrakPEn6XK7Tc', 0),
(799, 'tLZrakPEn6XK7Tc', 1),
(800, 'tLZrakPEn6XK7Tc', 2),
(801, 'tLZrakPEn6XK7Tc', 3),
(802, 'tLZrakPEn6XK7Tc', 4),
(803, 'tLZrakPEn6XK7Tc', 5),
(804, 'tLZrakPEn6XK7Tc', 6),
(805, 'tLZrakPEn6XK7Tc', 7),
(806, 'tLZrakPEn6XK7Tc', 8),
(807, 'tLZrakPEn6XK7Tc', 9),
(808, 'tLZrakPEn6XK7Tc', 10),
(809, 'kHMtDYKFIRI7GTG', 0),
(810, 'kHMtDYKFIRI7GTG', 1),
(811, 'kHMtDYKFIRI7GTG', 2),
(812, 'kHMtDYKFIRI7GTG', 3),
(813, 'kHMtDYKFIRI7GTG', 4),
(814, 'kHMtDYKFIRI7GTG', 5),
(815, 'kHMtDYKFIRI7GTG', 6),
(816, 'kHMtDYKFIRI7GTG', 7),
(817, 'kHMtDYKFIRI7GTG', 8),
(818, 'kHMtDYKFIRI7GTG', 9),
(819, 'kHMtDYKFIRI7GTG', 10),
(820, 'kGpYKy7bcgXQart', 0),
(821, 'kGpYKy7bcgXQart', 1),
(822, 'kGpYKy7bcgXQart', 2),
(823, 'kGpYKy7bcgXQart', 3),
(824, 'kGpYKy7bcgXQart', 4),
(825, 'kGpYKy7bcgXQart', 5),
(826, 'kGpYKy7bcgXQart', 6),
(827, 'kGpYKy7bcgXQart', 7),
(828, 'kGpYKy7bcgXQart', 8),
(829, 'kGpYKy7bcgXQart', 9),
(830, 'kGpYKy7bcgXQart', 10),
(913, 'mhk3xDUuV64yX0J', 2),
(914, 'mhk3xDUuV64yX0J', 3),
(915, 'mhk3xDUuV64yX0J', 4),
(916, 'mhk3xDUuV64yX0J', 5),
(917, 'mhk3xDUuV64yX0J', 6),
(918, 'mhk3xDUuV64yX0J', 7),
(919, 'mhk3xDUuV64yX0J', 8),
(920, 'mhk3xDUuV64yX0J', 9),
(921, 'mhk3xDUuV64yX0J', 10),
(1506, 'ayFiuEXDPCOejVN', 9),
(942, 'H8Y1AlIx2Zhm5Z6', 10),
(941, 'H8Y1AlIx2Zhm5Z6', 9),
(940, 'H8Y1AlIx2Zhm5Z6', 8),
(939, 'H8Y1AlIx2Zhm5Z6', 7),
(938, 'H8Y1AlIx2Zhm5Z6', 6),
(937, 'H8Y1AlIx2Zhm5Z6', 5),
(936, 'H8Y1AlIx2Zhm5Z6', 4),
(935, 'H8Y1AlIx2Zhm5Z6', 3),
(934, 'H8Y1AlIx2Zhm5Z6', 2),
(933, 'H8Y1AlIx2Zhm5Z6', 1),
(963, 'pbPX5LfpqwdJztt', 10),
(962, 'pbPX5LfpqwdJztt', 9),
(961, 'pbPX5LfpqwdJztt', 8),
(960, 'pbPX5LfpqwdJztt', 7),
(959, 'pbPX5LfpqwdJztt', 6),
(958, 'pbPX5LfpqwdJztt', 5),
(957, 'pbPX5LfpqwdJztt', 4),
(956, 'pbPX5LfpqwdJztt', 3),
(955, 'pbPX5LfpqwdJztt', 2),
(954, 'pbPX5LfpqwdJztt', 1),
(1505, 'ayFiuEXDPCOejVN', 8),
(1504, 'ayFiuEXDPCOejVN', 7),
(1503, 'ayFiuEXDPCOejVN', 6),
(1502, 'ayFiuEXDPCOejVN', 5),
(1501, 'ayFiuEXDPCOejVN', 4),
(1500, 'ayFiuEXDPCOejVN', 3),
(1499, 'ayFiuEXDPCOejVN', 2),
(1498, 'ayFiuEXDPCOejVN', 1),
(1497, 'ayFiuEXDPCOejVN', 0),
(1320, 'RRtUnlSuSBB74XC', 0),
(1308, 'yZrpqEot0Mxis9p', 9),
(1307, 'yZrpqEot0Mxis9p', 8),
(1306, 'yZrpqEot0Mxis9p', 7),
(1305, 'yZrpqEot0Mxis9p', 6),
(1304, 'yZrpqEot0Mxis9p', 5),
(1303, 'yZrpqEot0Mxis9p', 4),
(1302, 'yZrpqEot0Mxis9p', 3),
(1301, 'yZrpqEot0Mxis9p', 2),
(1300, 'yZrpqEot0Mxis9p', 1),
(1319, 'hh3p4bkQxl8SUPK', 10),
(1318, 'hh3p4bkQxl8SUPK', 9),
(1317, 'hh3p4bkQxl8SUPK', 8),
(1316, 'hh3p4bkQxl8SUPK', 7),
(1315, 'hh3p4bkQxl8SUPK', 6),
(1314, 'hh3p4bkQxl8SUPK', 5),
(1313, 'hh3p4bkQxl8SUPK', 4),
(1312, 'hh3p4bkQxl8SUPK', 3),
(1311, 'hh3p4bkQxl8SUPK', 2),
(1310, 'hh3p4bkQxl8SUPK', 1),
(1165, 'oodNCGC8gq4Mj8d', 0),
(1166, 'oodNCGC8gq4Mj8d', 1),
(1167, 'oodNCGC8gq4Mj8d', 2),
(1168, 'oodNCGC8gq4Mj8d', 3),
(1169, 'oodNCGC8gq4Mj8d', 4),
(1170, 'oodNCGC8gq4Mj8d', 5),
(1171, 'oodNCGC8gq4Mj8d', 6),
(1172, 'oodNCGC8gq4Mj8d', 7),
(1173, 'oodNCGC8gq4Mj8d', 8),
(1174, 'oodNCGC8gq4Mj8d', 9),
(1175, 'oodNCGC8gq4Mj8d', 10),
(1323, 'RRtUnlSuSBB74XC', 3),
(1324, 'RRtUnlSuSBB74XC', 4),
(1325, 'RRtUnlSuSBB74XC', 5),
(1326, 'RRtUnlSuSBB74XC', 6),
(1327, 'RRtUnlSuSBB74XC', 7),
(1328, 'RRtUnlSuSBB74XC', 8),
(1329, 'RRtUnlSuSBB74XC', 9),
(1330, 'RRtUnlSuSBB74XC', 10),
(1448, 'dD0HuzBmmm9SGPk', 6),
(1449, 'dD0HuzBmmm9SGPk', 7),
(1450, 'dD0HuzBmmm9SGPk', 8),
(1451, 'dD0HuzBmmm9SGPk', 9),
(1452, 'dD0HuzBmmm9SGPk', 10),
(1459, '0Ek8k3djVA0Iw8T', 6),
(1460, '0Ek8k3djVA0Iw8T', 7),
(1461, '0Ek8k3djVA0Iw8T', 8),
(1462, '0Ek8k3djVA0Iw8T', 9),
(1463, '0Ek8k3djVA0Iw8T', 10),
(1470, 'YOtbZbLjQH0ikKH', 6),
(1471, 'YOtbZbLjQH0ikKH', 7),
(1472, 'YOtbZbLjQH0ikKH', 8),
(1473, 'YOtbZbLjQH0ikKH', 9),
(1474, 'YOtbZbLjQH0ikKH', 10),
(1481, 'cdQ5RSLnJZFhFcB', 6),
(1482, 'cdQ5RSLnJZFhFcB', 7),
(1483, 'cdQ5RSLnJZFhFcB', 8),
(1484, 'cdQ5RSLnJZFhFcB', 9),
(1485, 'cdQ5RSLnJZFhFcB', 10),
(1488, 'OwHR9ZRzqJMBm37', 2),
(1489, 'OwHR9ZRzqJMBm37', 3),
(1490, 'OwHR9ZRzqJMBm37', 4),
(1491, 'OwHR9ZRzqJMBm37', 5),
(1492, 'OwHR9ZRzqJMBm37', 6),
(1493, 'OwHR9ZRzqJMBm37', 7),
(1494, 'OwHR9ZRzqJMBm37', 8),
(1495, 'OwHR9ZRzqJMBm37', 9),
(1496, 'OwHR9ZRzqJMBm37', 10),
(1508, 'XkVdSBjotBL4KW2', 0),
(1509, 'XkVdSBjotBL4KW2', 1),
(1510, 'XkVdSBjotBL4KW2', 2),
(1511, 'XkVdSBjotBL4KW2', 3),
(1512, 'XkVdSBjotBL4KW2', 4),
(1513, 'XkVdSBjotBL4KW2', 5),
(1514, 'XkVdSBjotBL4KW2', 6),
(1515, 'XkVdSBjotBL4KW2', 7),
(1516, 'XkVdSBjotBL4KW2', 8),
(1517, 'XkVdSBjotBL4KW2', 9),
(1518, 'XkVdSBjotBL4KW2', 10),
(1694, 'NPYhrdayFJ2jAfY', 8),
(1693, 'NPYhrdayFJ2jAfY', 7),
(1692, 'NPYhrdayFJ2jAfY', 6),
(1691, 'NPYhrdayFJ2jAfY', 5),
(1690, 'NPYhrdayFJ2jAfY', 4),
(1689, 'NPYhrdayFJ2jAfY', 3),
(1688, 'NPYhrdayFJ2jAfY', 2),
(1687, 'NPYhrdayFJ2jAfY', 1),
(1630, 'Zr7t3yJ6ENMGQhX', 2),
(1631, 'Zr7t3yJ6ENMGQhX', 3),
(1632, 'Zr7t3yJ6ENMGQhX', 4),
(1633, 'Zr7t3yJ6ENMGQhX', 5),
(1634, 'Zr7t3yJ6ENMGQhX', 6),
(1635, 'Zr7t3yJ6ENMGQhX', 7),
(1636, 'Zr7t3yJ6ENMGQhX', 8),
(1637, 'Zr7t3yJ6ENMGQhX', 9),
(1638, 'Zr7t3yJ6ENMGQhX', 10),
(1659, 'zuXNNefMEkDTQxV', 10),
(1658, 'zuXNNefMEkDTQxV', 9),
(1657, 'zuXNNefMEkDTQxV', 8),
(1656, 'zuXNNefMEkDTQxV', 7),
(1655, 'zuXNNefMEkDTQxV', 6),
(1654, 'zuXNNefMEkDTQxV', 5),
(1653, 'zuXNNefMEkDTQxV', 4),
(1652, 'zuXNNefMEkDTQxV', 3),
(1651, 'zuXNNefMEkDTQxV', 2),
(1650, 'zuXNNefMEkDTQxV', 1),
(1660, 'Wbd6yCwKJd2a2JQ', 0),
(1661, 'Wbd6yCwKJd2a2JQ', 1),
(1662, 'Wbd6yCwKJd2a2JQ', 2),
(1663, 'Wbd6yCwKJd2a2JQ', 3),
(1664, 'Wbd6yCwKJd2a2JQ', 4),
(1665, 'Wbd6yCwKJd2a2JQ', 5),
(1666, 'Wbd6yCwKJd2a2JQ', 6),
(1667, 'Wbd6yCwKJd2a2JQ', 7),
(1668, 'Wbd6yCwKJd2a2JQ', 8),
(1669, 'Wbd6yCwKJd2a2JQ', 9),
(1670, 'Wbd6yCwKJd2a2JQ', 10),
(1717, 'r2utD5BeXUxJhvK', 10),
(1716, 'r2utD5BeXUxJhvK', 9),
(1715, 'r2utD5BeXUxJhvK', 8),
(1714, 'r2utD5BeXUxJhvK', 7),
(1713, 'r2utD5BeXUxJhvK', 6),
(1712, 'r2utD5BeXUxJhvK', 5),
(1711, 'r2utD5BeXUxJhvK', 4),
(1710, 'r2utD5BeXUxJhvK', 3),
(1709, 'r2utD5BeXUxJhvK', 2),
(1708, 'r2utD5BeXUxJhvK', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `idGenMesa` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `idEstadoMesa` int(2) NOT NULL DEFAULT '1',
  `cantidadPersonas` int(2) NOT NULL DEFAULT '1',
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idPedido` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `eliminado` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas_estado`
--

CREATE TABLE `mesas_estado` (
  `idEstadoMesa` int(11) NOT NULL,
  `estadoMesa` varchar(255) CHARACTER SET latin1 NOT NULL,
  `color` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombreColor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombreColorBtn` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `mesas_estado`
--

INSERT INTO `mesas_estado` (`idEstadoMesa`, `estadoMesa`, `color`, `nombreColor`, `nombreColorBtn`, `fecha`) VALUES
(1, 'Libre', '66CD00', 'no-gradient', 'gradient-btn', '2019-07-23 12:04:55'),
(2, 'Ocupada', 'DA003E', 'gradient', 'no-gradient-btn', '2019-07-23 12:05:10'),
(3, 'Pendiente de Pago', '7AC5CD', 'warning', '', '2019-09-17 14:00:26'),
(4, 'Reservado', 'DAA520', 'tertiary', '', '2019-09-18 12:40:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `idMovimiento` int(11) NOT NULL,
  `idIngreso` int(11) NOT NULL,
  `idMedioCobro` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `fechaAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_stock`
--

CREATE TABLE `movimientos_stock` (
  `idMovimientoStock` int(11) NOT NULL,
  `idGenProducto` varchar(150) NOT NULL,
  `idGenTransaccion` varchar(150) NOT NULL,
  `idTipoMovimiento` int(3) NOT NULL DEFAULT '0',
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `descripcion` varchar(255) NOT NULL,
  `aumento` int(2) NOT NULL DEFAULT '0',
  `idUsuario` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `eliminado` int(2) NOT NULL DEFAULT '0',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos_stock`
--

INSERT INTO `movimientos_stock` (`idMovimientoStock`, `idGenProducto`, `idGenTransaccion`, `idTipoMovimiento`, `cantidad`, `descripcion`, `aumento`, `idUsuario`, `fecha`, `eliminado`, `fechaAlta`) VALUES
(1, 'UmiVwXkVGK6zKoE', 'UmiVwXkVGK6zKoE', 1, 1, 'Se actualizo el producto', 1, 1, '0000-00-00', 0, '2020-07-15 12:51:04'),
(2, 'UmiVwXkVGK6zKoE', 'UmiVwXkVGK6zKoE', 1, 1, 'Se actualizo el producto', 1, 1, '0000-00-00', 0, '2020-07-15 12:51:34'),
(3, 'UmiVwXkVGK6zKoE', 'UmiVwXkVGK6zKoE', 1, 1, 'Se actualizo el producto', 1, 1, '0000-00-00', 0, '2020-07-15 12:51:58'),
(4, 'UmiVwXkVGK6zKoE', '6bc31478a78fcbea1', 2, 5, 'Se realizo el abono', 0, 1, '0000-00-00', 0, '2020-07-15 13:10:41'),
(5, 'UmiVwXkVGK6zKoE', '98434320e5233c923', 2, 2, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-15 13:29:15'),
(6, 'UmiVwXkVGK6zKoE', 'a6b5fa32cc015bafc', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-15 13:32:24'),
(7, 'UmiVwXkVGK6zKoE', '2d117d0b4d03ee50d', 0, 3, 'Se agregaron producto al abono', 914, 1, '0000-00-00', 0, '2020-07-15 14:19:29'),
(8, 'UmiVwXkVGK6zKoE', '44b7941ca293f04ac', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-15 14:45:20'),
(9, 'UmiVwXkVGK6zKoE', '035249a1f80676922', 2, 1, 'Se agregaron producto a una venta', 0, 1, '0000-00-00', 0, '2020-07-15 14:46:23'),
(10, 'UmiVwXkVGK6zKoE', '51ecf2dbca2315b96', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-15 14:48:52'),
(11, 'UmiVwXkVGK6zKoE', '40a0928fd93ce2aa9', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-15 14:49:08'),
(12, 'UmiVwXkVGK6zKoE', '193a224eb05464ff5', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-16 13:36:54'),
(13, 'UmiVwXkVGK6zKoE', '1c74fcd41edf69518', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-16 13:38:38'),
(14, 'UmiVwXkVGK6zKoE', 'ff949f1c5d66d2400', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-16 13:45:08'),
(15, 'UmiVwXkVGK6zKoE', 'eb1e3d0785bca435f', 2, 3, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-16 14:23:07'),
(16, 'UmiVwXkVGK6zKoE', '41e34845a7a7dda32', 2, 1, 'Se realizo el abono', 0, 1, '0000-00-00', 0, '2020-07-17 11:26:11'),
(17, 'UmiVwXkVGK6zKoE', 'a32bb91158bf91b70', 2, 2, 'Se agregaron producto al abono', 918, 1, '0000-00-00', 0, '2020-07-17 11:28:48'),
(18, 'UmiVwXkVGK6zKoE', 'b18404f19be7d53f1', 2, 2, 'Se realizo el abono', 0, 1, '0000-00-00', 0, '2020-07-17 11:30:08'),
(19, 'UmiVwXkVGK6zKoE', '8906bed6953a2a497', 2, 1, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-17 12:11:38'),
(20, 'UmiVwXkVGK6zKoE', '774d913f1c9fb85ed', 2, 7, 'Se realizo la venta', 0, 1, '0000-00-00', 0, '2020-07-17 12:26:42'),
(21, 'UmiVwXkVGK6zKoE', '83746feff7fe55dd8', 3, 1, 'Se quitaron productos a la compra', 1, 1, '0000-00-00', 0, '2020-07-17 13:32:39'),
(22, 'UmiVwXkVGK6zKoE', 'f02b87d6e83f867b9', 3, 10, 'Se agregaron productos a la compra', 0, 1, '0000-00-00', 0, '2020-07-17 14:41:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_stock_tipo`
--

CREATE TABLE `movimientos_stock_tipo` (
  `idMovimientoStockTipo` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos_stock_tipo`
--

INSERT INTO `movimientos_stock_tipo` (`idMovimientoStockTipo`, `descripcion`, `fechaAlta`) VALUES
(1, 'Producto', '2020-06-11 11:19:07'),
(2, 'Venta', '2020-06-11 11:19:07'),
(3, 'Compra', '2020-06-11 11:19:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `idNivel` int(11) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`idNivel`, `nivel`, `eliminado`, `fechaAlta`) VALUES
(1, 'Super Admin', 0, '2019-02-22 01:42:49'),
(2, 'Admin', 0, '2019-02-22 01:42:49'),
(3, 'Moderador', 0, '2019-02-22 01:42:49'),
(4, 'SysOp', 0, '2019-02-22 01:42:49'),
(5, 'Admin Avanzado', 0, '2019-02-22 01:42:49'),
(6, 'Usuario', 0, '2019-02-22 01:42:49'),
(7, 'Dueño', 0, '2020-04-03 13:04:31'),
(8, 'Gerente', 0, '2020-04-03 13:04:31'),
(9, 'Vendedor', 0, '2020-04-03 13:04:31'),
(10, 'Mozo', 0, '2020-04-03 13:04:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito`
--

CREATE TABLE `notas_credito` (
  `idNotaCredito` int(11) NOT NULL,
  `idGenNotaCredito` varchar(20) NOT NULL,
  `idGenIngreso` varchar(20) NOT NULL,
  `idTipoNota` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `idEstado` int(11) NOT NULL COMMENT 'Saber en que estado se encuentra, Cobrado, vencido y A cobrar',
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas_credito`
--

INSERT INTO `notas_credito` (`idNotaCredito`, `idGenNotaCredito`, `idGenIngreso`, `idTipoNota`, `idCliente`, `idVendedor`, `fechaEmision`, `fechaVencimiento`, `descuentoGral`, `descuentoTotal`, `importeNetoNoGravado`, `ivaTotal`, `notaCliente`, `notaInterna`, `subTotalSinDescuento`, `subTotalConDescuento`, `total`, `idEstado`, `eliminado`, `fechaAlta`) VALUES
(1, '9b0469b50a8e99b80', 'a6b5fa32cc015bafc', 1, 1, 1, '2020-07-15', '2020-07-15', 0, 0, 5, 0.525, '', '', 5.53, 5.53, 5.53, 1, 0, '2020-07-15 13:37:27'),
(2, 'a4ffcd389aab38257', '977f6b7b119d2f60c', 1, 1, 1, '2020-07-16', '2020-07-16', 0, 0, 5, 0, '', '', 5.53, 5.53, 5.53, 1, 0, '2020-07-16 13:44:26'),
(3, '26b2fed394d7148df', 'c307791462a57b0ce', 1, 1, 1, '2020-07-16', '2020-07-16', 0, 0, 5, 0.125, '', '', 5.13, 5.13, 5.13, 1, 0, '2020-07-16 14:57:26'),
(4, '8f4450c43c90ee8e1', '977f6b7b119d2f60c', 1, 2, 1, '2020-07-17', '2020-07-17', 0, 0, 10, 2.1, '', '', 12.1, 12.1, 12.1, 1, 0, '2020-07-17 12:54:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito_afip`
--

CREATE TABLE `notas_credito_afip` (
  `idNotaCreditoAfip` int(11) NOT NULL,
  `idTipoNota` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `numFactura` varchar(25) NOT NULL,
  `cae` varchar(100) NOT NULL,
  `fechaVtoCae` datetime DEFAULT NULL,
  `puntoVenta` int(11) NOT NULL,
  `idGenNotaCredito` varchar(30) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito_detalle`
--

CREATE TABLE `notas_credito_detalle` (
  `idDetalleNotaCredito` int(11) NOT NULL,
  `idGenNotaCredito` varchar(20) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `iva` float NOT NULL,
  `ivaText` varchar(10) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas_credito_detalle`
--

INSERT INTO `notas_credito_detalle` (`idDetalleNotaCredito`, `idGenNotaCredito`, `idProducto`, `cantidad`, `precio`, `descuento`, `subTotal`, `iva`, `ivaText`, `eliminado`, `fechaAlta`) VALUES
(1, '9b0469b50a8e99b80', 1, 1, 5, 0, 5, 0.105, '10,5', 0, '2020-07-15 13:37:27'),
(2, 'a4ffcd389aab38257', 1, 1, 5, 0, 5, 0.105, '10,5', 0, '2020-07-16 13:44:26'),
(3, '26b2fed394d7148df', 1, 1, 5, 0, 5, 0.025, '2,5', 0, '2020-07-16 14:57:26'),
(4, '8f4450c43c90ee8e1', 1, 2, 5, 0, 10, 0.21, '21', 0, '2020-07-17 12:54:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito_estado`
--

CREATE TABLE `notas_credito_estado` (
  `idEstadoNotaDebito` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito_proveedores`
--

CREATE TABLE `notas_credito_proveedores` (
  `idNotaCredito` int(11) NOT NULL,
  `idGenNotaCredito` varchar(20) NOT NULL,
  `idGenEgreso` varchar(20) NOT NULL,
  `idTipoNota` int(11) NOT NULL DEFAULT '1',
  `idProveedor` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `idEstado` int(11) NOT NULL COMMENT 'Saber en que estado se encuentra, Cobrado, vencido y A cobrar',
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito_proveedores_afip`
--

CREATE TABLE `notas_credito_proveedores_afip` (
  `idNotaCreditoAfip` int(11) NOT NULL,
  `idTipoNota` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `numFactura` varchar(25) NOT NULL,
  `cae` varchar(100) NOT NULL,
  `fechaVtoCae` datetime DEFAULT NULL,
  `puntoVenta` int(11) NOT NULL,
  `idGenNotaCredito` varchar(30) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito_proveedores_detalle`
--

CREATE TABLE `notas_credito_proveedores_detalle` (
  `idDetalleNotaCredito` int(11) NOT NULL,
  `idGenNotaCredito` varchar(20) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `iva` float NOT NULL,
  `ivaText` varchar(10) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_credito_proveedores_estado`
--

CREATE TABLE `notas_credito_proveedores_estado` (
  `idEstadoNotaDebito` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito`
--

CREATE TABLE `notas_debito` (
  `idNotaDebito` int(11) NOT NULL,
  `idGenNotaDebito` varchar(20) NOT NULL,
  `idGenIngreso` varchar(20) NOT NULL,
  `idTipoNota` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `idEstado` int(11) NOT NULL COMMENT 'Saber en que estado se encuentra, Cobrado, vencido y A cobrar',
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas_debito`
--

INSERT INTO `notas_debito` (`idNotaDebito`, `idGenNotaDebito`, `idGenIngreso`, `idTipoNota`, `idCliente`, `idVendedor`, `fechaEmision`, `fechaVencimiento`, `descuentoGral`, `descuentoTotal`, `importeNetoNoGravado`, `ivaTotal`, `notaCliente`, `notaInterna`, `subTotalSinDescuento`, `subTotalConDescuento`, `total`, `idEstado`, `eliminado`, `fechaAlta`) VALUES
(1, '0dd7c61ae0a871156', 'a6b5fa32cc015bafc', 2, 1, 1, '2020-07-15', '2020-07-15', 0, 0, 15, 0.75, '', '', 15.75, 15.75, 15.75, 1, 0, '2020-07-15 13:38:21'),
(2, 'fcd68d9ef8f51e6dc', 'a6b5fa32cc015bafc', 0, 1, 1, '2020-07-16', '2020-07-16', 0, 0, 5, 0.25, '', '', 5.25, 5.25, 5.25, 1, 0, '2020-07-16 14:36:24'),
(3, 'afada0bb6a5baac6a', 'c307791462a57b0ce', 0, 1, 1, '2020-07-16', '2020-07-16', 0, 0, 5, 0, '', '', 5, 5, 5, 1, 0, '2020-07-16 14:52:20'),
(4, 'bc5f73d5c33b7fc7a', '193a224eb05464ff5', 0, 1, 1, '2020-07-16', '2020-07-16', 0, 0, 5, 0.525, '', '', 5.53, 5.53, 5.53, 1, 0, '2020-07-16 14:52:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito_afip`
--

CREATE TABLE `notas_debito_afip` (
  `idNotaDebitoAfip` int(11) NOT NULL,
  `idTipoNota` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `numFactura` varchar(25) NOT NULL,
  `cae` varchar(100) NOT NULL,
  `fechaVtoCae` datetime DEFAULT NULL,
  `puntoVenta` int(11) NOT NULL,
  `idGenNotaDebito` varchar(30) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito_detalle`
--

CREATE TABLE `notas_debito_detalle` (
  `idDetalleNotaDebito` int(11) NOT NULL,
  `idGenNotaDebito` varchar(20) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `iva` float NOT NULL,
  `ivaText` varchar(10) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas_debito_detalle`
--

INSERT INTO `notas_debito_detalle` (`idDetalleNotaDebito`, `idGenNotaDebito`, `idProducto`, `cantidad`, `precio`, `descuento`, `subTotal`, `iva`, `ivaText`, `eliminado`, `fechaAlta`) VALUES
(1, '0dd7c61ae0a871156', 1, 3, 5, 0, 15, 0.05, '5', 0, '2020-07-15 13:38:21'),
(2, 'fcd68d9ef8f51e6dc', 1, 1, 5, 0, 5, 0.05, '5', 0, '2020-07-16 14:36:24'),
(3, 'afada0bb6a5baac6a', 1, 1, 5, 0, 5, 0, 'IVA', 0, '2020-07-16 14:52:20'),
(4, 'bc5f73d5c33b7fc7a', 1, 1, 5, 0, 5, 0.105, '10,5', 0, '2020-07-16 14:52:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito_estado`
--

CREATE TABLE `notas_debito_estado` (
  `idEstadoNotaDebito` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito_proveedores`
--

CREATE TABLE `notas_debito_proveedores` (
  `idNotaDebito` int(11) NOT NULL,
  `idGenNotaDebito` varchar(20) NOT NULL,
  `idGenEgreso` varchar(20) NOT NULL,
  `idTipoNota` int(11) NOT NULL DEFAULT '2',
  `idProveedor` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `idEstado` int(11) NOT NULL COMMENT 'Saber en que estado se encuentra, Cobrado, vencido y A cobrar',
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito_proveedores_afip`
--

CREATE TABLE `notas_debito_proveedores_afip` (
  `idNotaDebitoAfip` int(11) NOT NULL,
  `idTipoNota` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `numFactura` varchar(25) NOT NULL,
  `cae` varchar(100) NOT NULL,
  `fechaVtoCae` datetime DEFAULT NULL,
  `puntoVenta` int(11) NOT NULL,
  `idGenNotaDebito` varchar(30) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito_proveedores_detalle`
--

CREATE TABLE `notas_debito_proveedores_detalle` (
  `idDetalleNotaDebito` int(11) NOT NULL,
  `idGenNotaDebito` varchar(20) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `iva` float NOT NULL,
  `ivaText` varchar(10) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_debito_proveedores_estado`
--

CREATE TABLE `notas_debito_proveedores_estado` (
  `idEstadoNotaDebito` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_tipos`
--

CREATE TABLE `notas_tipos` (
  `idTipoNota` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas_tipos`
--

INSERT INTO `notas_tipos` (`idTipoNota`, `descripcion`, `fechaAlta`) VALUES
(1, 'Nota Crédito', '2020-04-29 13:08:24'),
(2, 'Nota Débito', '2020-04-29 13:08:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_tipos_proveedores`
--

CREATE TABLE `notas_tipos_proveedores` (
  `idTipoNota` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones_egresos`
--

CREATE TABLE `notificaciones_egresos` (
  `idNotificacionEgreso` int(11) NOT NULL,
  `idGenEgreso` varchar(150) NOT NULL,
  `leido` int(11) NOT NULL DEFAULT '0',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones_gastos`
--

CREATE TABLE `notificaciones_gastos` (
  `idNotificacionGasto` int(11) NOT NULL,
  `idGenGasto` varchar(150) NOT NULL,
  `leido` int(2) NOT NULL DEFAULT '0',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `iso`, `nombre`) VALUES
(1, 'AF', 'Afganistán'),
(2, 'AX', 'Islas Gland'),
(3, 'AL', 'Albania'),
(4, 'DE', 'Alemania'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antártida'),
(9, 'AG', 'Antigua y Barbuda'),
(10, 'AN', 'Antillas Holandesas'),
(11, 'SA', 'Arabia Saudí'),
(12, 'DZ', 'Argelia'),
(13, 'AR', 'Argentina'),
(14, 'AM', 'Armenia'),
(15, 'AW', 'Aruba'),
(16, 'AU', 'Australia'),
(17, 'AT', 'Austria'),
(18, 'AZ', 'Azerbaiyán'),
(19, 'BS', 'Bahamas'),
(20, 'BH', 'Bahréin'),
(21, 'BD', 'Bangladesh'),
(22, 'BB', 'Barbados'),
(23, 'BY', 'Bielorrusia'),
(24, 'BE', 'Bélgica'),
(25, 'BZ', 'Belice'),
(26, 'BJ', 'Benin'),
(27, 'BM', 'Bermudas'),
(28, 'BT', 'Bhután'),
(29, 'BO', 'Bolivia'),
(30, 'BA', 'Bosnia y Herzegovina'),
(31, 'BW', 'Botsuana'),
(32, 'BV', 'Isla Bouvet'),
(33, 'BR', 'Brasil'),
(34, 'BN', 'Brunéi'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'CV', 'Cabo Verde'),
(39, 'KY', 'Islas Caimán'),
(40, 'KH', 'Camboya'),
(41, 'CM', 'Camerún'),
(42, 'CA', 'Canadá'),
(43, 'CF', 'República Centroafricana'),
(44, 'TD', 'Chad'),
(45, 'CZ', 'República Checa'),
(46, 'CL', 'Chile'),
(47, 'CN', 'China'),
(48, 'CY', 'Chipre'),
(49, 'CX', 'Isla de Navidad'),
(50, 'VA', 'Ciudad del Vaticano'),
(51, 'CC', 'Islas Cocos'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoras'),
(54, 'CD', 'República Democrática del Congo'),
(55, 'CG', 'Congo'),
(56, 'CK', 'Islas Cook'),
(57, 'KP', 'Corea del Norte'),
(58, 'KR', 'Corea del Sur'),
(59, 'CI', 'Costa de Marfil'),
(60, 'CR', 'Costa Rica'),
(61, 'HR', 'Croacia'),
(62, 'CU', 'Cuba'),
(63, 'DK', 'Dinamarca'),
(64, 'DM', 'Dominica'),
(65, 'DO', 'República Dominicana'),
(66, 'EC', 'Ecuador'),
(67, 'EG', 'Egipto'),
(68, 'SV', 'El Salvador'),
(69, 'AE', 'Emiratos Árabes Unidos'),
(70, 'ER', 'Eritrea'),
(71, 'SK', 'Eslovaquia'),
(72, 'SI', 'Eslovenia'),
(73, 'ES', 'España'),
(74, 'UM', 'Islas ultramarinas de Estados Unidos'),
(75, 'US', 'Estados Unidos'),
(76, 'EE', 'Estonia'),
(77, 'ET', 'Etiopía'),
(78, 'FO', 'Islas Feroe'),
(79, 'PH', 'Filipinas'),
(80, 'FI', 'Finlandia'),
(81, 'FJ', 'Fiyi'),
(82, 'FR', 'Francia'),
(83, 'GA', 'Gabón'),
(84, 'GM', 'Gambia'),
(85, 'GE', 'Georgia'),
(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur'),
(87, 'GH', 'Ghana'),
(88, 'GI', 'Gibraltar'),
(89, 'GD', 'Granada'),
(90, 'GR', 'Grecia'),
(91, 'GL', 'Groenlandia'),
(92, 'GP', 'Guadalupe'),
(93, 'GU', 'Guam'),
(94, 'GT', 'Guatemala'),
(95, 'GF', 'Guayana Francesa'),
(96, 'GN', 'Guinea'),
(97, 'GQ', 'Guinea Ecuatorial'),
(98, 'GW', 'Guinea-Bissau'),
(99, 'GY', 'Guyana'),
(100, 'HT', 'Haití'),
(101, 'HM', 'Islas Heard y McDonald'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong'),
(104, 'HU', 'Hungría'),
(105, 'IN', 'India'),
(106, 'ID', 'Indonesia'),
(107, 'IR', 'Irán'),
(108, 'IQ', 'Iraq'),
(109, 'IE', 'Irlanda'),
(110, 'IS', 'Islandia'),
(111, 'IL', 'Israel'),
(112, 'IT', 'Italia'),
(113, 'JM', 'Jamaica'),
(114, 'JP', 'Japón'),
(115, 'JO', 'Jordania'),
(116, 'KZ', 'Kazajstán'),
(117, 'KE', 'Kenia'),
(118, 'KG', 'Kirguistán'),
(119, 'KI', 'Kiribati'),
(120, 'KW', 'Kuwait'),
(121, 'LA', 'Laos'),
(122, 'LS', 'Lesotho'),
(123, 'LV', 'Letonia'),
(124, 'LB', 'Líbano'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libia'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lituania'),
(129, 'LU', 'Luxemburgo'),
(130, 'MO', 'Macao'),
(131, 'MK', 'ARY Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MY', 'Malasia'),
(134, 'MW', 'Malawi'),
(135, 'MV', 'Maldivas'),
(136, 'ML', 'Malí'),
(137, 'MT', 'Malta'),
(138, 'FK', 'Islas Malvinas'),
(139, 'MP', 'Islas Marianas del Norte'),
(140, 'MA', 'Marruecos'),
(141, 'MH', 'Islas Marshall'),
(142, 'MQ', 'Martinica'),
(143, 'MU', 'Mauricio'),
(144, 'MR', 'Mauritania'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'México'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldavia'),
(149, 'MC', 'Mónaco'),
(150, 'MN', 'Mongolia'),
(151, 'MS', 'Montserrat'),
(152, 'MZ', 'Mozambique'),
(153, 'MM', 'Myanmar'),
(154, 'NA', 'Namibia'),
(155, 'NR', 'Nauru'),
(156, 'NP', 'Nepal'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Níger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Isla Norfolk'),
(162, 'NO', 'Noruega'),
(163, 'NC', 'Nueva Caledonia'),
(164, 'NZ', 'Nueva Zelanda'),
(165, 'OM', 'Omán'),
(166, 'NL', 'Países Bajos'),
(167, 'PK', 'Pakistán'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestina'),
(170, 'PA', 'Panamá'),
(171, 'PG', 'Papúa Nueva Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Perú'),
(174, 'PN', 'Islas Pitcairn'),
(175, 'PF', 'Polinesia Francesa'),
(176, 'PL', 'Polonia'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'GB', 'Reino Unido'),
(181, 'RE', 'Reunión'),
(182, 'RW', 'Ruanda'),
(183, 'RO', 'Rumania'),
(184, 'RU', 'Rusia'),
(185, 'EH', 'Sahara Occidental'),
(186, 'SB', 'Islas Salomón'),
(187, 'WS', 'Samoa'),
(188, 'AS', 'Samoa Americana'),
(189, 'KN', 'San Cristóbal y Nevis'),
(190, 'SM', 'San Marino'),
(191, 'PM', 'San Pedro y Miquelón'),
(192, 'VC', 'San Vicente y las Granadinas'),
(193, 'SH', 'Santa Helena'),
(194, 'LC', 'Santa Lucía'),
(195, 'ST', 'Santo Tomé y Príncipe'),
(196, 'SN', 'Senegal'),
(197, 'CS', 'Serbia y Montenegro'),
(198, 'SC', 'Seychelles'),
(199, 'SL', 'Sierra Leona'),
(200, 'SG', 'Singapur'),
(201, 'SY', 'Siria'),
(202, 'SO', 'Somalia'),
(203, 'LK', 'Sri Lanka'),
(204, 'SZ', 'Suazilandia'),
(205, 'ZA', 'Sudáfrica'),
(206, 'SD', 'Sudán'),
(207, 'SE', 'Suecia'),
(208, 'CH', 'Suiza'),
(209, 'SR', 'Surinam'),
(210, 'SJ', 'Svalbard y Jan Mayen'),
(211, 'TH', 'Tailandia'),
(212, 'TW', 'Taiwán'),
(213, 'TZ', 'Tanzania'),
(214, 'TJ', 'Tayikistán'),
(215, 'IO', 'Territorio Británico del Océano Índico'),
(216, 'TF', 'Territorios Australes Franceses'),
(217, 'TL', 'Timor Oriental'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad y Tobago'),
(222, 'TN', 'Túnez'),
(223, 'TC', 'Islas Turcas y Caicos'),
(224, 'TM', 'Turkmenistán'),
(225, 'TR', 'Turquía'),
(226, 'TV', 'Tuvalu'),
(227, 'UA', 'Ucrania'),
(228, 'UG', 'Uganda'),
(229, 'UY', 'Uruguay'),
(230, 'UZ', 'Uzbekistán'),
(231, 'VU', 'Vanuatu'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Islas Vírgenes Británicas'),
(235, 'VI', 'Islas Vírgenes de los Estados Unidos'),
(236, 'WF', 'Wallis y Futuna'),
(237, 'YE', 'Yemen'),
(238, 'DJ', 'Yibuti'),
(239, 'ZM', 'Zambia'),
(240, 'ZW', 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `idGenPedido` varchar(20) NOT NULL,
  `idTab` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) NOT NULL COMMENT 'Para delivery',
  `direccion` varchar(150) NOT NULL COMMENT 'Para delivery',
  `telefono` varchar(50) NOT NULL COMMENT 'Para delivery',
  `observacion` varchar(500) NOT NULL COMMENT 'Para delivery',
  `idCadete` int(11) NOT NULL COMMENT 'Para delivery',
  `horarioEntrega` datetime NOT NULL COMMENT '	Para delivery',
  `idVendedor` int(11) NOT NULL DEFAULT '0',
  `fechaEmision` date NOT NULL,
  `tipoFactura` int(11) NOT NULL,
  `cantidadPersonas` int(11) NOT NULL,
  `idMozo` int(11) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `descuentoGral` float NOT NULL DEFAULT '0' COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL DEFAULT '0' COMMENT 'Sumatorias de descuentos por productos',
  `importeNetoNoGravado` float NOT NULL DEFAULT '0',
  `ivaTotal` float NOT NULL DEFAULT '0',
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL DEFAULT '0',
  `subTotalConDescuento` float NOT NULL DEFAULT '0',
  `total` float NOT NULL DEFAULT '0',
  `aCobrar` float NOT NULL DEFAULT '0',
  `saldado` int(1) NOT NULL DEFAULT '0' COMMENT 'Si fue cobrado o no	',
  `idEstado` int(11) NOT NULL DEFAULT '0' COMMENT 'Saber en que estado se encuentra, Cobrado, vencido y A cobrar',
  `idEstadoPedido` int(11) NOT NULL,
  `prioridadPedido` int(11) NOT NULL,
  `eliminado` int(11) NOT NULL DEFAULT '0',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaCierre` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_detalle`
--

CREATE TABLE `pedidos_detalle` (
  `id` int(11) NOT NULL,
  `idGenProducto` varchar(50) NOT NULL,
  `idPedido` varchar(50) NOT NULL,
  `numeroTicket` varchar(50) NOT NULL,
  `nroPedido` int(11) NOT NULL,
  `reset` int(1) NOT NULL,
  `idTipoProducto` int(1) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `comentario` varchar(1000) NOT NULL COMMENT 'Comentario para los pedidos',
  `iva` float NOT NULL,
  `ivaText` varchar(10) NOT NULL,
  `idEstadoDetalle` int(11) NOT NULL DEFAULT '0',
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaModif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_estado`
--

CREATE TABLE `pedidos_estado` (
  `idEstado` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_estado`
--

INSERT INTO `pedidos_estado` (`idEstado`, `estado`, `color`, `fecha`) VALUES
(1, 'En Proceso', '7AC5CD', '2019-10-31 16:15:41'),
(9, 'Enviado', '3732E4', '2020-03-27 19:31:25'),
(3, 'Entregado', 'FD573F', '2019-10-31 16:16:32'),
(4, 'Demorado', 'DA003E', '2019-10-31 16:16:32'),
(5, 'Abierto', '9DC7B9', '2020-02-22 02:10:12'),
(6, 'Cancelado', 'E01E5A', '2020-03-10 17:33:30'),
(7, 'Listo', '8ABF5A', '2020-03-10 17:37:08'),
(8, 'Cerrado', '3C4043', '2020-03-11 00:23:26'),
(10, 'Finalizado', 'FF5643', '2020-03-27 19:31:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_tabs`
--

CREATE TABLE `pedidos_tabs` (
  `idTab` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_tabs`
--

INSERT INTO `pedidos_tabs` (`idTab`, `descripcion`, `fechaAlta`) VALUES
(1, 'Mesas', '2020-02-21 20:07:31'),
(2, 'Mostrador', '2020-02-21 20:07:31'),
(3, 'Delivery', '2020-02-21 20:07:31'),
(4, 'Cocina', '2020-03-10 11:31:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

CREATE TABLE `presupuesto` (
  `idPresupuesto` int(11) NOT NULL,
  `idGenPresupuesto` varchar(20) NOT NULL,
  `idTipoPresupuesto` int(11) NOT NULL COMMENT 'Si es venta u otro tipo de ingreso',
  `idCliente` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL COMMENT 'Si es abono,mayorista, online, etc',
  `idSubcategoriaPresupuesto` int(11) NOT NULL,
  `fechaEmision` date NOT NULL,
  `fechaVtoPresupuesto` date NOT NULL,
  `fechaVigencia` date NOT NULL,
  `descuentoGral` float NOT NULL COMMENT 'descuento en porcentaje',
  `descuentoTotal` float NOT NULL COMMENT 'Sumatorias de descuentos por productos',
  `descuentoCliente` double NOT NULL DEFAULT '0',
  `importeNetoNoGravado` float NOT NULL,
  `ivaTotal` float NOT NULL,
  `notaCliente` varchar(600) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `subTotalSinDescuento` float NOT NULL,
  `subTotalConDescuento` float NOT NULL,
  `total` float NOT NULL,
  `idEstado` int(11) NOT NULL DEFAULT '1' COMMENT 'Saber en que estado se encuentra, Pendiente, Enviado, Rechazado, Aceptado',
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cobrado` int(11) NOT NULL,
  `facturado` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `presupuesto`
--

INSERT INTO `presupuesto` (`idPresupuesto`, `idGenPresupuesto`, `idTipoPresupuesto`, `idCliente`, `idVendedor`, `idCategoria`, `idSubcategoriaPresupuesto`, `fechaEmision`, `fechaVtoPresupuesto`, `fechaVigencia`, `descuentoGral`, `descuentoTotal`, `descuentoCliente`, `importeNetoNoGravado`, `ivaTotal`, `notaCliente`, `notaInterna`, `subTotalSinDescuento`, `subTotalConDescuento`, `total`, `idEstado`, `eliminado`, `fechaAlta`, `cobrado`, `facturado`) VALUES
(1, 'eebf04446b9ea6729', 0, 1, 1, 1, 1, '2020-07-16', '2020-07-16', '2020-06-16', 0, 0, 0.5, 4.5, 0, '', '', 0, 0, 5, 1, 0, '2020-07-16 12:51:36', 0, 0),
(2, 'fc295ef7c793706d4', 0, 2, 1, 1, 1, '2020-07-16', '2020-07-16', '2020-08-16', 0, 0, 0, 5, 0, '', '', 0, 0, 5, 4, 1, '2020-07-16 12:51:55', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto_detalle`
--

CREATE TABLE `presupuesto_detalle` (
  `idDetallePresupuesto` int(11) NOT NULL,
  `idGenPresupuesto` varchar(255) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float NOT NULL COMMENT 'Porcentaje de descuento',
  `subTotal` float NOT NULL,
  `iva` float NOT NULL,
  `ivaText` varchar(50) NOT NULL,
  `eliminado` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `presupuesto_detalle`
--

INSERT INTO `presupuesto_detalle` (`idDetallePresupuesto`, `idGenPresupuesto`, `idProducto`, `cantidad`, `precio`, `descuento`, `subTotal`, `iva`, `ivaText`, `eliminado`, `fechaAlta`) VALUES
(1, 'eebf04446b9ea6729', 1, 1, 5, 0, 5, 0, 'IVA', 0, '2020-07-16 12:51:36'),
(2, 'fc295ef7c793706d4', 1, 1, 5, 0, 5, 0, 'IVA', 0, '2020-07-16 12:51:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto_estado`
--

CREATE TABLE `presupuesto_estado` (
  `idEstadoPresupuesto` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `presupuesto_estado`
--

INSERT INTO `presupuesto_estado` (`idEstadoPresupuesto`, `nombre`, `fechaAlta`) VALUES
(1, 'Pendiente', '2020-03-19 14:35:41'),
(2, 'Enviado', '2020-03-19 14:35:41'),
(3, 'Rechazado', '2020-03-19 14:35:41'),
(4, 'Aceptado', '2020-03-19 14:35:41'),
(5, 'Vencido', '2020-03-20 14:56:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenProducto` varchar(20) NOT NULL,
  `idCategoriaProducto` int(11) NOT NULL,
  `xPeso` int(1) NOT NULL,
  `platillo` int(1) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `idTipoProducto` varchar(150) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(600) NOT NULL,
  `activo` int(11) NOT NULL,
  `precioVenta` float NOT NULL,
  `idIvaVta` int(11) NOT NULL,
  `precioCompra` float NOT NULL,
  `idIvaCompra` int(11) NOT NULL,
  `controlStock` int(2) NOT NULL COMMENT '0 controlas stock y 1 no controlas stock',
  `ecommerce` int(11) NOT NULL DEFAULT '1',
  `porcentajeDescuento` double NOT NULL DEFAULT '0',
  `eliminado` int(11) NOT NULL,
  `fechaAlta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `idUsuario`, `idGenProducto`, `idCategoriaProducto`, `xPeso`, `platillo`, `nombre`, `codigo`, `idTipoProducto`, `idProveedor`, `stock`, `descripcion`, `activo`, `precioVenta`, `idIvaVta`, `precioCompra`, `idIvaCompra`, `controlStock`, `ecommerce`, `porcentajeDescuento`, `eliminado`, `fechaAlta`) VALUES
(1, 1, 'UmiVwXkVGK6zKoE', 0, 0, 0, 'Tornillo Auto 1/4', 'TA1/4', '', 2, 915, 'Tornillo Autoperforante 1/4 pulgadas', 1, 5, 1, 2, 1, 0, 0, 10, 0, '2020-07-15 09:51:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_categorias`
--

CREATE TABLE `productos_categorias` (
  `idCategoriaProducto` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `icono` varchar(50) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_categorias`
--

INSERT INTO `productos_categorias` (`idCategoriaProducto`, `orden`, `descripcion`, `icono`, `fechaAlta`) VALUES
(1, 4, 'Bebidas', 'fas fa-wine-bottle', '2019-11-26 21:54:58'),
(2, 2, 'Papas', 'fas fa-bacon', '2019-11-26 21:54:58'),
(3, 3, 'Pizzas', 'fas fa-pizza-slice', '2019-11-26 21:54:58'),
(4, 5, 'Postres', 'fas fa-ice-cream', '2019-11-26 21:55:20'),
(5, 1, 'Cervezas', 'fas fa-beer', '2019-12-11 17:17:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_img`
--

CREATE TABLE `productos_img` (
  `idProductoImg` int(11) NOT NULL,
  `idGenProducto` varchar(150) NOT NULL,
  `nombreImg` varchar(50) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_ingredientes`
--

CREATE TABLE `productos_ingredientes` (
  `idProductoIngrediente` int(11) NOT NULL,
  `idGenProducto` varchar(50) NOT NULL,
  `idIngrediente` int(11) NOT NULL,
  `fechaAlta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_sub`
--

CREATE TABLE `productos_sub` (
  `idSubProducto` int(11) NOT NULL,
  `idGenProducto` varchar(50) NOT NULL,
  `idGenSubProducto` varchar(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `precioVenta` float NOT NULL,
  `precioCompra` float NOT NULL,
  `idIvaVta` int(11) NOT NULL,
  `idIvaCompra` int(11) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_sub`
--

INSERT INTO `productos_sub` (`idSubProducto`, `idGenProducto`, `idGenSubProducto`, `nombre`, `descripcion`, `codigo`, `precioVenta`, `precioCompra`, `idIvaVta`, `idIvaCompra`, `fechaAlta`, `eliminado`, `activo`) VALUES
(2, 'k0hP5sNhptUgcAV', 'b93ceffd60f98d673', 'completa común', 'completa común', '', 325, 150, 0, 0, '2019-12-10 18:17:00', 0, 0),
(3, 'k0hP5sNhptUgcAV', '10b9436f8333d2254', 'media común', 'media común', '', 200, 100, 0, 0, '2019-12-10 18:17:00', 0, 0),
(4, 'kkrVUfUl2hSoX6S', '7f86ab16795e03869', 'completa argentina', 'completa argentina', '', 375, 200, 0, 0, '2019-12-10 18:24:22', 0, 0),
(5, 'kkrVUfUl2hSoX6S', 'a2d6f4d13ce76c20f', 'media argentina', 'media argentina', '', 200, 100, 0, 0, '2019-12-10 18:24:22', 0, 0),
(6, 'kkrVUfUl2hSoX6S', '223fb501125c2af60', 'mixta argentina', 'mixta argentina', '', 187.5, 100, 0, 0, '2019-12-10 18:24:22', 0, 0),
(7, 'k0hP5sNhptUgcAV', '9b19242151e56c0a2', 'mixta comun', 'mixta comun', '', 187.5, 100, 0, 0, '2019-12-10 19:14:53', 0, 0),
(8, '7VJqWuT7wZhXpbW', '8fb760e83980f7e15', 'completa ajo', 'completa ajo', '', 375, 200, 0, 0, '2019-12-10 19:16:22', 0, 0),
(9, '7VJqWuT7wZhXpbW', '39e937ee52a5e7b8a', 'media ajo', 'media ajo', '', 200, 100, 0, 0, '2019-12-10 19:16:22', 0, 0),
(10, '7VJqWuT7wZhXpbW', '8e3f5fa2cd441569e', 'mixta ajo', 'mixta ajo', '', 187.5, 100, 0, 0, '2019-12-10 19:16:22', 0, 0),
(11, 'yMFeCu7OOoZj05k', 'e5ec08dd4d6063b94', 'completa doble queso', 'completa doble queso', '', 375, 200, 0, 0, '2019-12-10 19:18:00', 0, 0),
(12, 'yMFeCu7OOoZj05k', 'a4459a8ebebe97827', 'media doble queso', 'media doble queso', '', 200, 100, 0, 0, '2019-12-10 19:18:00', 0, 0),
(13, 'yMFeCu7OOoZj05k', 'e626d0981d83ff6fd', 'mixta doble queso', 'mixta doble queso', '', 187.5, 100, 0, 0, '2019-12-10 19:18:00', 0, 0),
(14, 'XsabS0MXSm3KKTR', '7fb32e65441b4f623', 'completa albacaha', 'completa albacaha', '', 375, 200, 0, 0, '2019-12-10 19:19:22', 0, 0),
(15, 'XsabS0MXSm3KKTR', '6c40de9d5a5d4a3c0', 'media albacaha', 'media albacaha', '', 200, 100, 0, 0, '2019-12-10 19:19:22', 0, 0),
(16, 'XsabS0MXSm3KKTR', 'c7f05ea4fbd0f862d', 'mixta albacaha', 'mixta albacaha', '', 187.5, 100, 0, 0, '2019-12-10 19:19:22', 0, 0),
(17, 'QAY2jKfwar3foMC', '2b3e583ed30f813f1', 'completa rucula', 'completa rucula', '', 375, 200, 0, 0, '2019-12-10 19:24:30', 0, 0),
(18, 'QAY2jKfwar3foMC', '05d34de0b342e9f07', 'media rucula', 'media rucula', '', 200, 100, 0, 0, '2019-12-10 19:24:30', 0, 0),
(19, 'QAY2jKfwar3foMC', 'dcdd927fc24aca3fa', 'mixta rucula', 'mixta rucula', '', 187.5, 100, 0, 0, '2019-12-10 19:24:30', 0, 0),
(20, 'qqIa5IOnuKXeuuh', 'fd1e8d343cb781f19', 'completa napolitana', 'completa napolitana', '', 375, 200, 0, 0, '2019-12-10 19:26:01', 0, 0),
(21, 'qqIa5IOnuKXeuuh', 'bbce6e6c4a0fc9e37', 'media napolitana', 'media napolitana', '', 200, 100, 0, 0, '2019-12-10 19:26:01', 0, 0),
(22, 'qqIa5IOnuKXeuuh', '930547e9b2ad0ab4b', 'mixta napolitana', 'mixta napolitana', '', 187.5, 100, 0, 0, '2019-12-10 19:26:01', 0, 0),
(23, 'MGf64qRqx3ZnCsK', '596f80e828c1e31a1', 'completa panceta y huevo', 'completa panceta y huevo', '', 375, 200, 0, 0, '2019-12-10 19:27:21', 0, 0),
(24, 'MGf64qRqx3ZnCsK', '7b570df3228c4be64', 'media panceta y huevo ', 'media panceta y huevo', '', 200, 100, 0, 0, '2019-12-10 19:27:21', 0, 0),
(25, 'MGf64qRqx3ZnCsK', '9a0b2f451d60293aa', 'mixta panceta y huevo', 'mixta panceta y huevo', '', 187.5, 100, 0, 0, '2019-12-10 19:27:21', 0, 0),
(26, 'Z2orTHhinNJs5BZ', 'f78533f296dffbac2', 'completa panceta y verdeo', 'completa panceta y verdeo', '', 375, 200, 0, 0, '2019-12-10 19:28:52', 0, 0),
(27, 'Z2orTHhinNJs5BZ', '15dde829e25c60ffe', 'media panceta y verdeo', 'media panceta y verdeo', '', 200, 100, 0, 0, '2019-12-10 19:28:52', 0, 0),
(28, 'Z2orTHhinNJs5BZ', '115a8d0a623dabd14', 'mixta panceta y verdeo ', 'mixta panceta y verdeo', '', 187.5, 100, 0, 0, '2019-12-10 19:28:52', 0, 0),
(29, 'aCQvRfTKhz2CxTm', 'e73aa9220c7b3fb36', 'completa anchoas', 'completa anchoas', '', 375, 200, 0, 0, '2019-12-10 19:29:55', 0, 0),
(30, 'aCQvRfTKhz2CxTm', '88b6b143e320b6201', 'media anchoas', 'media anchoas', '', 200, 100, 0, 0, '2019-12-10 19:29:55', 0, 0),
(31, 'aCQvRfTKhz2CxTm', '8ded80c76440b9675', 'mixtas anchoas', 'mixtas anchoas', '', 187.5, 100, 0, 0, '2019-12-10 19:29:56', 0, 0),
(32, '9T2Q4dztAbjNCsV', '933bf8e130c5cda64', 'completa atun', 'completa atun', '', 375, 200, 0, 0, '2019-12-10 19:31:10', 0, 0),
(33, '9T2Q4dztAbjNCsV', '4fa9a6a27c05ce778', 'media atun', 'media atun', '', 200, 100, 0, 0, '2019-12-10 19:31:10', 0, 0),
(34, '9T2Q4dztAbjNCsV', 'b0991c39044f6f06e', 'mixta atun', 'mixta atun', '', 187.5, 100, 0, 0, '2019-12-10 19:31:10', 0, 0),
(35, 'TMwwBP9OXT9Q3h7', 'ea4d1041008a91352', 'completa cosenza', 'completa cosenza', '', 375, 200, 0, 0, '2019-12-10 19:33:00', 0, 0),
(36, 'TMwwBP9OXT9Q3h7', '8037bf911a5bafc32', 'media coseza', 'media cosenza', '', 200, 100, 0, 0, '2019-12-10 19:33:00', 0, 0),
(37, 'TMwwBP9OXT9Q3h7', '254735a7d704176eb', 'mixta cosenza', 'mixta cosenza', '', 187.5, 100, 0, 0, '2019-12-10 19:33:00', 0, 0),
(38, 'aF7ltmI9oKtL6SO', 'd9625ece59a89d303', 'completa jamon', 'completa jamon', '', 375, 200, 0, 0, '2019-12-10 19:34:37', 0, 0),
(39, 'aF7ltmI9oKtL6SO', '7d2db3632c6a1c71f', 'media jamon', 'media jamon', '', 200, 100, 0, 0, '2019-12-10 19:34:37', 0, 0),
(40, 'aF7ltmI9oKtL6SO', '252ef14714f663087', 'mixta jamon', 'mixta jamon', '', 187.5, 100, 0, 0, '2019-12-10 19:34:37', 0, 0),
(41, 'ANctIl0uRf0HG6y', '586c645f59c464e6f', 'completa puerro', 'completa puerro', '', 375, 200, 0, 0, '2019-12-10 19:35:44', 0, 0),
(42, 'ANctIl0uRf0HG6y', 'ee44bf6835ee9a336', 'media puerro', 'media puerro', '', 200, 100, 0, 0, '2019-12-10 19:35:44', 0, 0),
(43, 'ANctIl0uRf0HG6y', 'f404ccded0d6518f0', 'mixta puerro ', 'mixta puerro', '', 187.5, 100, 0, 0, '2019-12-10 19:35:45', 0, 0),
(44, 'QVQJvsUyalQuap7', 'cc06db4f3156399b0', 'completa especial', 'completa especial', '', 375, 200, 0, 0, '2019-12-10 19:36:45', 0, 0),
(45, 'QVQJvsUyalQuap7', '46940a1e0e72f21c9', 'media especial ', 'media especial', '', 200, 100, 0, 0, '2019-12-10 19:36:45', 0, 0),
(46, 'QVQJvsUyalQuap7', 'e1487b4b90bc6387b', 'mixta especial', 'mixta especial', '', 187.5, 100, 0, 0, '2019-12-10 19:36:45', 0, 0),
(47, 'GqJO2oTBU7GUoEC', '70d773c797c9aedc5', 'completa salchicha ', 'completa salchicha', '', 375, 200, 0, 0, '2019-12-10 19:37:52', 0, 0),
(48, 'GqJO2oTBU7GUoEC', '8a312fee7f70786fb', 'media salchicha', 'media salchicha', '', 200, 100, 0, 0, '2019-12-10 19:37:52', 0, 0),
(49, 'GqJO2oTBU7GUoEC', '849907f389d701c64', 'mixta salchicha', 'mixta salchicha', '', 187.5, 100, 0, 0, '2019-12-10 19:37:52', 0, 0),
(50, 'KmHb3c1K3wsA5Un', '4df92048391872177', 'completa calabresa', 'completa calabresa', '', 375, 200, 0, 0, '2019-12-10 19:43:13', 0, 0),
(51, 'KmHb3c1K3wsA5Un', '8c4fc45afd263d868', 'media calabresa', 'media calabresa', '', 200, 100, 0, 0, '2019-12-10 19:43:13', 0, 0),
(52, 'KmHb3c1K3wsA5Un', 'a1c003b7ed5c2e432', 'mixta calabresa', 'mixta calabresa', '', 187.5, 100, 0, 0, '2019-12-10 19:43:13', 0, 0),
(53, '7jTzh4CoNJpm7Zi', '1eec87bdc084caf02', 'completa hongos', 'completa hongos', '', 375, 200, 0, 0, '2019-12-10 19:46:35', 0, 0),
(54, '7jTzh4CoNJpm7Zi', 'd22c827ee0381e77b', 'media hongos', 'media hongos', '', 200, 100, 0, 0, '2019-12-10 19:46:35', 0, 0),
(55, '7jTzh4CoNJpm7Zi', '9401c7d8bbd29c770', 'mixta hongos', 'mixta hongos', '', 187.5, 100, 0, 0, '2019-12-10 19:46:35', 0, 0),
(56, 'tcFYXjc4z9lvKDO', '55014830cb06c98ca', 'completa imola', 'completa imola', '', 375, 200, 0, 0, '2019-12-10 19:49:22', 0, 0),
(57, 'tcFYXjc4z9lvKDO', '6df7d5783e9f7eccf', 'media imola', 'media imola', '', 200, 100, 0, 0, '2019-12-10 19:49:22', 0, 0),
(58, 'tcFYXjc4z9lvKDO', '3c791041675e3f53e', 'mixta imola', 'mixta imola', '', 187.5, 100, 0, 0, '2019-12-10 19:49:22', 0, 0),
(59, 'LpJD1ROnVmNjuyT', '20e502a3cc92f2fec', 'completa cuatro quesos', 'completa cuatro quesos', '', 375, 200, 0, 0, '2019-12-10 19:52:15', 0, 0),
(60, 'LpJD1ROnVmNjuyT', 'd48dbd23b0862876b', 'media cuatro quesos', 'media cuatro quesos', '', 200, 100, 0, 0, '2019-12-10 19:52:15', 0, 0),
(61, 'LpJD1ROnVmNjuyT', 'aef20e8bcd7730b9b', 'mixta cuatro quesos', 'mixta cuatro quesos', '', 187.5, 100, 0, 0, '2019-12-10 19:52:15', 0, 0),
(62, 'xCsBdGysANni8N1', '45d7906bfdbb2a6fa', 'completa provolone', 'completa provolone', '', 375, 200, 0, 0, '2019-12-10 19:59:17', 0, 0),
(63, 'xCsBdGysANni8N1', '6db89d0b82d070ed1', 'media provolone', 'media provolone', '', 200, 100, 0, 0, '2019-12-10 19:59:17', 0, 0),
(64, 'xCsBdGysANni8N1', 'f031b509254bb0e57', 'mixta provolone', 'mixta provolone', '', 187.5, 100, 0, 0, '2019-12-10 19:59:17', 0, 0),
(65, 'o6fE8tbuoqOiQDP', 'c1da352ddaf9931dc', 'completa roquefort', 'completa roquefort', '', 375, 200, 0, 0, '2019-12-10 20:01:00', 0, 0),
(66, 'o6fE8tbuoqOiQDP', 'a4aded25b08695fb8', 'media roquefort', 'media roquefort', '', 200, 100, 0, 0, '2019-12-10 20:01:00', 0, 0),
(67, 'o6fE8tbuoqOiQDP', '4cae681476a45a46c', 'mixta roquefort', 'mixta roquefort', '', 187.5, 100, 0, 0, '2019-12-10 20:01:00', 0, 0),
(68, 'K8jVJn3ClefhU1K', '4ab7fa188916bfd65', 'completa fugazzeta', 'completa fugazzeta', '', 375, 200, 0, 0, '2019-12-10 20:02:15', 0, 0),
(69, 'K8jVJn3ClefhU1K', 'a0a0df2eca81f88cc', 'media fugazzeta', 'media fugazzeta', '', 200, 100, 0, 0, '2019-12-10 20:02:15', 0, 0),
(70, 'K8jVJn3ClefhU1K', 'a23509964a6973c2b', 'mixta fugazzeta', 'mixta fugazzeta', '', 187.5, 100, 0, 0, '2019-12-10 20:02:15', 0, 0),
(71, 'ToefHjdRvNgmGjq', '2bc08ea05bcff8975', 'completa pisa', 'completa pisa', '', 375, 200, 0, 0, '2019-12-10 20:03:12', 0, 0),
(72, 'ToefHjdRvNgmGjq', 'f2c05b84eb498bef5', 'media pisa', 'media pisa', '', 200, 100, 0, 0, '2019-12-10 20:03:12', 0, 0),
(73, 'ToefHjdRvNgmGjq', '86cf8191cca313010', 'mixta pisa', 'mixta pisa', '', 187.5, 100, 0, 0, '2019-12-10 20:03:12', 0, 0),
(74, 'ONxJcxNnfszEF3X', '0166783016122eca5', 'completa palmitos', 'completa palmitos', '', 375, 200, 0, 0, '2019-12-10 20:07:34', 0, 0),
(75, 'ONxJcxNnfszEF3X', '8bd0e998845d89840', 'media palmitos', 'media palmitos', '', 200, 100, 0, 0, '2019-12-10 20:07:35', 0, 0),
(76, 'ONxJcxNnfszEF3X', '9819e5e633d822855', 'mixta palmitos', 'mixta palmitos', '', 187.5, 100, 0, 0, '2019-12-10 20:07:35', 0, 0),
(77, '4mD68EijJtmF4ra', 'ce4f4e89783e4a9cd', 'completa potenza', 'completa potenza', '', 375, 200, 0, 0, '2019-12-10 20:11:26', 0, 0),
(78, '4mD68EijJtmF4ra', '76177f04d91e08886', 'media potenza', 'media potenza', '', 200, 100, 0, 0, '2019-12-10 20:11:26', 0, 0),
(79, '4mD68EijJtmF4ra', '91adce61d0f1280a8', 'mixta potenza', 'mixta potenza', '', 187.5, 100, 0, 0, '2019-12-10 20:11:26', 0, 0),
(80, 'bHaeSxhv4JnUdt4', 'f192d1feb10b2e4d0', 'completa esparragos', 'completa esparragos', '', 375, 200, 0, 0, '2019-12-10 20:14:13', 0, 0),
(81, 'bHaeSxhv4JnUdt4', '9516a4e4c663548ba', 'media esparragos', 'media esparragos', '', 200, 100, 0, 0, '2019-12-10 20:14:13', 0, 0),
(82, 'bHaeSxhv4JnUdt4', '70500d8296858db64', 'mixta esparragos', 'mixta esparragos', '', 187.5, 100, 0, 0, '2019-12-10 20:14:13', 0, 0),
(83, 'uL56WJQ8b2sQw7T', '04a503e42376f2546', 'completa terni', 'completa terni', '', 375, 200, 0, 0, '2019-12-10 20:16:33', 0, 0),
(84, 'uL56WJQ8b2sQw7T', 'f28a8e410471b86f9', 'media terni', 'media terni', '', 200, 100, 0, 0, '2019-12-10 20:16:33', 0, 0),
(85, 'uL56WJQ8b2sQw7T', '11026e1a477eb657d', 'mixta terni', 'mixta terni', '', 187.5, 100, 0, 0, '2019-12-10 20:16:33', 0, 0),
(86, 'dRF5iEe1vIUnOgT', 'cb06b09ab86e92e04', 'pinta blonde', 'pinta blonde', '', 150, 75, 0, 0, '2019-12-10 20:28:12', 0, 0),
(87, 'dRF5iEe1vIUnOgT', 'ca1187fa671f06e25', 'media pinta blonde', 'media pinta blonde', '', 100, 50, 0, 0, '2019-12-10 20:28:12', 0, 0),
(88, 'jK9ad8ONhsXRXWv', '487b32dcd66814fc8', 'pinta honey', 'pinta honey', '', 150, 75, 0, 0, '2019-12-10 20:32:51', 0, 0),
(89, 'jK9ad8ONhsXRXWv', 'b0f0fa9f13f184e61', 'pinta honey', 'pinta honey', '', 150, 75, 0, 0, '2019-12-10 20:32:51', 0, 0),
(90, 'jK9ad8ONhsXRXWv', '232d7a96c0da6f90c', 'media pinta honey', 'media pinta honey', '', 100, 50, 0, 0, '2019-12-10 20:32:51', 0, 0),
(91, 'jK9ad8ONhsXRXWv', 'eb153c2d8dfa42ce5', 'media pinta honey', 'media pinta honey', '', 100, 50, 0, 0, '2019-12-10 20:32:51', 0, 0),
(92, 'XTeAr46jCPEqq99', 'db8bbac186cd61415', 'pinta apa', 'pinta apa', '', 150, 75, 0, 0, '2019-12-10 20:34:49', 0, 0),
(93, 'XTeAr46jCPEqq99', '2801efd0ccc7261ba', 'media pinta apa', 'media pinta apa', '', 100, 50, 0, 0, '2019-12-10 20:34:49', 0, 0),
(94, 'TIBkLcLfgaAvaX1', 'fe674d8468906dec4', 'pinta ipa', 'pinta ipa', '', 150, 75, 0, 0, '2019-12-10 20:35:35', 0, 0),
(95, 'TIBkLcLfgaAvaX1', '53f8949a19af18d17', 'media pinta ipa', 'media pinta ipa', '', 100, 50, 0, 0, '2019-12-10 20:35:36', 0, 0),
(96, 'aGKsF6DS0WmviMA', 'f879f1e65691c7a52', 'pinta trigo', 'pinta trigo', '', 150, 75, 0, 0, '2019-12-10 20:36:14', 0, 0),
(97, 'aGKsF6DS0WmviMA', '69477f2f68cc85962', 'media pinta trigo', 'media pinta trigo', '', 100, 50, 0, 0, '2019-12-10 20:36:14', 0, 0),
(98, 'vLJ7aHg0pFvzQTb', '36549a4cfdb5b6821', 'pinta red ale', 'pinta red ale', '', 150, 75, 0, 0, '2019-12-10 20:37:24', 0, 0),
(99, 'vLJ7aHg0pFvzQTb', '244bc5c53bde6912e', 'media pinta red ale', 'media pinta red ale', '', 100, 50, 0, 0, '2019-12-10 20:37:24', 0, 0),
(100, 'tTormXhAOhqAP71', '0aaa6a0dc02e5747a', 'pinta sweet porter', 'pinta sweet porter', '', 150, 75, 0, 0, '2019-12-10 20:38:26', 0, 0),
(101, 'tTormXhAOhqAP71', '3c47fcaa9c7865880', 'media pinta sweet porter', 'media pinta sweet porter', '', 100, 50, 0, 0, '2019-12-10 20:38:26', 0, 0),
(102, 'e4727b97ca7a72a2c', 'e06022ac3860ad363', 'brawnie con americana', 'brawnie con americana', '', 180, 90, 0, 0, '2019-12-10 21:17:51', 0, 0),
(103, 'e4727b97ca7a72a2c', '4c67ce24613938862', 'brawnie con mascarpone', 'brawnie con mascarpone', '', 180, 90, 0, 0, '2019-12-10 21:17:51', 0, 0),
(104, 'HV4iI8HWyTXa0Z2', 'b8c3ebd966888291d', 'papas porcion', 'papas porcion', '', 200, 100, 0, 0, '2019-12-11 01:58:32', 0, 0),
(105, 'HV4iI8HWyTXa0Z2', '6f8509449d267768a', 'papas media porcion', 'papas media porcion', '', 130, 65, 0, 0, '2019-12-11 01:58:32', 0, 0),
(106, 'JnxWspKLwX6xIPq', '87553f5bed2d62ae1', 'papas con chedar porcion', 'papas con chedar porcion', '', 230, 115, 0, 0, '2019-12-11 02:00:33', 0, 0),
(107, 'JnxWspKLwX6xIPq', '67029e27e28baebd1', 'papas con chedar media po', 'papas con chedar media po', '', 140, 70, 0, 0, '2019-12-11 02:00:33', 0, 0),
(108, 'Wi862QXmlWhOue4', '248b1025d54e9961f', 'papas con panceta porcion', 'papas con panceta porcion', '', 230, 115, 0, 0, '2019-12-11 02:01:31', 0, 0),
(109, 'Wi862QXmlWhOue4', 'f28f4c9b7efa216bc', 'papas con panceta media p', 'papas con panceta media p', '', 140, 70, 0, 0, '2019-12-11 02:01:31', 0, 0),
(110, '92d352d98f7bedb9c', 'dab06660f43021ac2', 'pizza libre mayor', 'pizza libre mayor', '', 250, 125, 0, 0, '2019-12-12 00:42:21', 0, 0),
(111, '92d352d98f7bedb9c', 'a95d3e5f15e35339a', 'pizza libre menor ', 'pizza libre menor', '', 125, 65, 0, 0, '2019-12-12 00:42:21', 0, 0),
(112, '783d49ecc9ebe0752', '89ab953577cefb72f', 'promo 1 mayores', 'promo 1 mayores', '', 330, 200, 0, 0, '2019-12-12 00:46:05', 0, 0),
(113, '783d49ecc9ebe0752', 'dd292021ea508d550', 'promo 1 menores ', 'promo 1 menores', '', 115, 60, 0, 0, '2019-12-12 00:46:05', 0, 0),
(114, 'ac0653dbec946a2d5', 'f71516c327c5a3ff9', 'promo 2 mayores', 'promo 2 mayores', '', 390, 250, 0, 0, '2019-12-12 00:48:12', 0, 0),
(115, 'ac0653dbec946a2d5', 'db335f54d1301de46', 'promo 2 menores', 'promo 2 menores', '', 195, 100, 0, 0, '2019-12-12 00:48:12', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenProveedor` varchar(150) NOT NULL,
  `nombEmpresa` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `cel` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pagWeb` varchar(100) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `piso` varchar(15) NOT NULL,
  `dpto` varchar(15) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `nota` varchar(600) NOT NULL,
  `eliminado` int(2) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `idUsuario`, `idGenProveedor`, `nombEmpresa`, `nombre`, `apellido`, `tel`, `cel`, `email`, `pagWeb`, `domicilio`, `idLocalidad`, `idProvincia`, `numero`, `piso`, `dpto`, `cp`, `nota`, `eliminado`, `fechaAlta`) VALUES
(1, 1, 'euUkTfU2Dc0ww6I', 'Metalurgia Acero Duro', 'Duro', 'Acero', '', '', '', '', '', 333, 4, '', '', '', '11111', '', 0, '2020-07-15 12:46:55'),
(2, 1, 'ux3OVBPAMv4LOAZ', 'Ros', 'Rosso', 'Daniel', '757648564', '268987628', 'danielrosso@ros.com', 'ros.com', 'la rioja', 371, 5, '21', '0', '0', '33333', '', 0, '2020-07-15 12:49:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_contactos`
--

CREATE TABLE `proveedores_contactos` (
  `idProvContacto` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenProveedor` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cel` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_cuenta_corriente`
--

CREATE TABLE `proveedores_cuenta_corriente` (
  `idCuentaCorriente` int(8) UNSIGNED ZEROFILL NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `idGenEgreso` varchar(20) NOT NULL,
  `idGenComprobante` varchar(50) NOT NULL,
  `idGenNota` varchar(150) NOT NULL,
  `aPagar` float NOT NULL COMMENT ' las deudas que vos tenes con tus proveedores son pasivos..',
  `pague` float NOT NULL COMMENT 'Los pagos que realizo a los proveedores',
  `nombPdf` varchar(50) NOT NULL,
  `idMedioPago` int(11) NOT NULL,
  `saldo` float NOT NULL,
  `descripcion` varchar(600) NOT NULL,
  `fechaPago` datetime NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores_cuenta_corriente`
--

INSERT INTO `proveedores_cuenta_corriente` (`idCuentaCorriente`, `idProveedor`, `idGenEgreso`, `idGenComprobante`, `idGenNota`, `aPagar`, `pague`, `nombPdf`, `idMedioPago`, `saldo`, `descripcion`, `fechaPago`, `fechaAlta`, `eliminado`) VALUES
(00000001, 1, '83746feff7fe55dd8', '0', '', 12.1, 0, '', 0, 12.1, 'Ajuste al editar la compra', '2020-07-17 10:32:39', '2020-07-17 13:32:39', 0),
(00000002, 2, 'f02b87d6e83f867b9', '0', '', 55.25, 0, '', 0, 55.25, 'Ajuste al editar la compra', '2020-07-17 11:41:10', '2020-07-17 14:41:10', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_detalle_compras`
--

CREATE TABLE `proveedores_detalle_compras` (
  `idDetalleVenta` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenProveedor` varchar(150) NOT NULL,
  `idCategoriaCompras` int(11) NOT NULL,
  `dtoGeneral` varchar(10) NOT NULL,
  `notaInterna` varchar(600) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores_detalle_compras`
--

INSERT INTO `proveedores_detalle_compras` (`idDetalleVenta`, `idUsuario`, `idGenProveedor`, `idCategoriaCompras`, `dtoGeneral`, `notaInterna`, `fechaAlta`) VALUES
(1, 1, 'euUkTfU2Dc0ww6I', 0, '', '', '2020-07-15 12:46:55'),
(2, 1, 'ux3OVBPAMv4LOAZ', 0, '', '', '2020-07-15 12:49:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_detalle_facturacion`
--

CREATE TABLE `proveedores_detalle_facturacion` (
  `idDetalleFacturacion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idGenProveedor` varchar(150) NOT NULL,
  `razonSocial` varchar(150) NOT NULL,
  `idTipoDoc` int(11) NOT NULL,
  `cuit` int(11) NOT NULL,
  `idCondIva` int(11) NOT NULL DEFAULT '1',
  `idComprobante` int(11) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `cel` varchar(30) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `idMedioPago` int(11) NOT NULL DEFAULT '1',
  `cbu` varchar(50) NOT NULL DEFAULT '0',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores_detalle_facturacion`
--

INSERT INTO `proveedores_detalle_facturacion` (`idDetalleFacturacion`, `idUsuario`, `idGenProveedor`, `razonSocial`, `idTipoDoc`, `cuit`, `idCondIva`, `idComprobante`, `tel`, `cel`, `domicilio`, `idLocalidad`, `idProvincia`, `cp`, `idMedioPago`, `cbu`, `fechaAlta`) VALUES
(1, 1, 'euUkTfU2Dc0ww6I', '', 0, 0, 0, 0, '', '', '', 0, 0, '', 1, '', '2020-07-15 12:46:55'),
(2, 1, 'ux3OVBPAMv4LOAZ', 'Ros', 3, 1212212122, 2, 4, '38392839', '21812812', 'La rioja 21', 370, 5, '33333', 1, '', '2020-07-15 12:49:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `idProvincia` int(10) NOT NULL,
  `provincia` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`idProvincia`, `provincia`) VALUES
(1, 'Buenos Aires'),
(2, 'Buenos Aires-GBA'),
(3, 'Capital Federal'),
(4, 'Catamarca'),
(5, 'Chaco'),
(6, 'Chubut'),
(7, 'Córdoba'),
(8, 'Corrientes'),
(9, 'Entre Ríos'),
(10, 'Formosa'),
(11, 'Jujuy'),
(12, 'La Pampa'),
(13, 'La Rioja'),
(14, 'Mendoza'),
(15, 'Misiones'),
(16, 'Neuquén'),
(17, 'Río Negro'),
(18, 'Salta'),
(19, 'San Juan'),
(20, 'San Luis'),
(21, 'Santa Cruz'),
(22, 'Santa Fe'),
(23, 'Santiago del Estero'),
(24, 'Tierra del Fuego'),
(25, 'Tucumán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_ventas`
--

CREATE TABLE `puntos_ventas` (
  `idPtoVenta` int(11) NOT NULL,
  `numeroPtoVta` int(4) UNSIGNED ZEROFILL NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntos_ventas`
--

INSERT INTO `puntos_ventas` (`idPtoVenta`, `numeroPtoVta`, `fechaAlta`) VALUES
(1, 0001, '2019-05-20 13:20:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razon_social`
--

CREATE TABLE `razon_social` (
  `idRazonSocial` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `razon_social`
--

INSERT INTO `razon_social` (`idRazonSocial`, `nombre`) VALUES
(1, 'SRL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos`
--

CREATE TABLE `remitos` (
  `idRemito` int(11) NOT NULL,
  `idGenRemito` varchar(150) NOT NULL,
  `idGenIngreso` varchar(150) NOT NULL,
  `nombreApellido` varchar(150) NOT NULL,
  `fechaEmision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idTipoRemito` int(2) NOT NULL,
  `direccionEntrega` varchar(300) NOT NULL,
  `idTransportista` int(3) NOT NULL,
  `notaCliente` varchar(300) NOT NULL,
  `cantidadBultos` int(3) NOT NULL,
  `montoAsegurado` double NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos_detalle`
--

CREATE TABLE `remitos_detalle` (
  `idDetalleRemito` int(11) NOT NULL,
  `idGenRemito` varchar(150) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `observacion` varchar(300) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `remitos_detalle`
--

INSERT INTO `remitos_detalle` (`idDetalleRemito`, `idGenRemito`, `idProducto`, `observacion`, `cantidad`, `fechaAlta`) VALUES
(1, 'da99a7333f5c752e2', 1, '', 5, '2020-06-29 12:09:22'),
(2, 'da99a7333f5c752e2', 3, 'hhh', 3, '2020-06-29 12:09:23'),
(3, '5a9ebf28f6dbfacda', 1, 'se lleva la bolsa', 5, '2020-06-29 12:10:59'),
(4, '5a9ebf28f6dbfacda', 3, '', 3, '2020-06-29 12:10:59'),
(5, 'a12496b7ea52e9cfa', 1, 'sd', 5, '2020-06-29 12:24:22'),
(6, 'a12496b7ea52e9cfa', 3, '', 3, '2020-06-29 12:24:22'),
(7, '52b31a47bd06ac1b6', 1, '', 5, '2020-06-29 12:27:23'),
(8, '52b31a47bd06ac1b6', 3, '', 3, '2020-06-29 12:27:23'),
(9, '18dc748ebe0e42c2b', 2, '', 1, '2020-06-29 12:39:06'),
(10, '0feddc29fd0994f7f', 2, '', 1, '2020-06-29 12:39:36'),
(11, '4f526345a7e206e9e', 1, '', 1, '2020-06-29 12:40:11'),
(12, 'aee27638717a4e7f0', 1, '', 1, '2020-06-29 12:41:36'),
(13, '3c775beaca1545a92', 1, '', 5, '2020-06-29 12:43:11'),
(14, '3c775beaca1545a92', 3, '', 3, '2020-06-29 12:43:11'),
(15, '83ca1ba69a53aae46', 1, '', 5, '2020-06-29 12:53:59'),
(16, '83ca1ba69a53aae46', 3, '', 3, '2020-06-29 12:53:59'),
(31, '555dc713e61a6e31e', 2, 'dd22', 1, '2020-06-30 14:04:36'),
(33, '301987d5596e7b304', 1, '', 5, '2020-06-30 14:44:50'),
(34, '301987d5596e7b304', 3, '', 3, '2020-06-30 14:44:50'),
(35, 'd0d0c5b11e6127012', 1, '', 5, '2020-06-30 14:48:01'),
(36, 'd0d0c5b11e6127012', 3, '', 3, '2020-06-30 14:48:01'),
(37, '7b488c005c8929763', 1, '', 5, '2020-06-30 14:48:38'),
(38, '7b488c005c8929763', 3, '', 3, '2020-06-30 14:48:38'),
(39, 'faff91482a32daf83', 1, '', 5, '2020-06-30 14:49:24'),
(40, 'faff91482a32daf83', 3, '', 3, '2020-06-30 14:49:24'),
(41, '6dca89c8f668e6a06', 1, '', 5, '2020-06-30 14:50:31'),
(42, '6dca89c8f668e6a06', 3, '', 3, '2020-06-30 14:50:31'),
(43, '1bf3036a638309d2e', 6, '', 5, '2020-06-30 15:00:16'),
(44, '1bf3036a638309d2e', 3, '', 3, '2020-06-30 15:00:16'),
(45, '498b0121c3d3c7ca3', 4, '', 5, '2020-06-30 15:01:03'),
(46, '498b0121c3d3c7ca3', 3, '', 3, '2020-06-30 15:01:03'),
(100, 'c2ba31911279e8dcd', 4, '', 7, '2020-06-30 17:48:00'),
(102, 'c2ba31911279e8dcd', 6, 'test', 2, '2020-06-30 17:48:55'),
(103, '5701404c8c66cdb0a', 1, '', 5, '2020-07-01 11:13:10'),
(104, '5701404c8c66cdb0a', 3, '', 3, '2020-07-01 11:13:10'),
(105, '35307e39dadfb2b68', 1, '', 5, '2020-07-01 11:13:30'),
(106, '35307e39dadfb2b68', 3, '', 3, '2020-07-01 11:13:30'),
(107, '67a9a294f43653c44', 1, '', 5, '2020-07-01 11:15:12'),
(108, '67a9a294f43653c44', 3, '', 3, '2020-07-01 11:15:12'),
(109, '2cb0cf6b7b9e580af', 1, '', 5, '2020-07-01 11:15:28'),
(110, '2cb0cf6b7b9e580af', 3, '', 3, '2020-07-01 11:15:28'),
(111, '3acdcf1071e8fbb45', 1, '', 5, '2020-07-01 11:16:00'),
(112, '3acdcf1071e8fbb45', 3, '', 3, '2020-07-01 11:16:00'),
(113, '37f67ee8ba33af8e3', 1, '', 5, '2020-07-01 11:16:14'),
(114, '37f67ee8ba33af8e3', 3, '', 3, '2020-07-01 11:16:14'),
(115, '62da90fd169655b40', 1, '', 5, '2020-07-01 11:16:40'),
(116, '62da90fd169655b40', 3, '', 3, '2020-07-01 11:16:40'),
(117, 'bfd5a2f8f804acc8b', 1, '', 5, '2020-07-01 11:16:56'),
(118, 'bfd5a2f8f804acc8b', 3, '', 3, '2020-07-01 11:16:56'),
(119, 'ded2953d7bcf6fe94', 1, '', 5, '2020-07-01 11:17:14'),
(120, 'ded2953d7bcf6fe94', 3, '', 3, '2020-07-01 11:17:14'),
(121, '33d7cef9e4979fe05', 1, '', 5, '2020-07-01 11:19:42'),
(122, '33d7cef9e4979fe05', 3, '', 3, '2020-07-01 11:19:42'),
(123, '30a3515c3636861e7', 1, '', 5, '2020-07-01 11:30:59'),
(124, '30a3515c3636861e7', 3, '', 3, '2020-07-01 11:30:59'),
(125, '8de94c49a5433ba68', 1, '', 5, '2020-07-01 11:31:08'),
(126, '8de94c49a5433ba68', 3, '', 3, '2020-07-01 11:31:08'),
(127, '79b610065d4cabba8', 1, '', 5, '2020-07-01 11:35:42'),
(128, '79b610065d4cabba8', 3, '', 3, '2020-07-01 11:35:42'),
(129, '4c498f24694a137ae', 1, '', 5, '2020-07-01 11:37:58'),
(130, '4c498f24694a137ae', 3, '', 3, '2020-07-01 11:37:58'),
(131, '964bc8660f7b14d31', 1, '', 5, '2020-07-01 11:38:13'),
(132, '964bc8660f7b14d31', 3, '', 3, '2020-07-01 11:38:13'),
(133, '46bdcf395b97f8316', 1, '', 5, '2020-07-01 11:38:29'),
(134, '46bdcf395b97f8316', 3, '', 3, '2020-07-01 11:38:29'),
(135, '81fd3a3a52602ae66', 1, '', 5, '2020-07-01 11:38:42'),
(136, '81fd3a3a52602ae66', 3, '', 3, '2020-07-01 11:38:42'),
(137, 'ae92a0021eaac848b', 1, '', 5, '2020-07-01 11:38:56'),
(138, 'ae92a0021eaac848b', 3, '', 3, '2020-07-01 11:38:56'),
(139, 'b9c6fce9420e5a7d9', 1, '', 5, '2020-07-01 11:39:41'),
(140, 'b9c6fce9420e5a7d9', 3, '', 3, '2020-07-01 11:39:41'),
(141, '15ebe41ed34dc3d9e', 1, '', 5, '2020-07-01 11:41:03'),
(142, '15ebe41ed34dc3d9e', 3, '', 3, '2020-07-01 11:41:03'),
(143, '09fd22e48e7e90531', 1, '', 5, '2020-07-01 11:41:06'),
(144, '09fd22e48e7e90531', 3, '', 3, '2020-07-01 11:41:06'),
(145, 'e287074cf77a810cc', 1, '', 5, '2020-07-01 11:41:34'),
(146, 'e287074cf77a810cc', 3, '', 3, '2020-07-01 11:41:34'),
(147, '562fd649e42f5f068', 1, '', 5, '2020-07-01 11:42:05'),
(148, '562fd649e42f5f068', 3, '', 3, '2020-07-01 11:42:05'),
(149, '5961898e3ffae08d0', 1, '', 5, '2020-07-01 11:47:03'),
(150, '5961898e3ffae08d0', 3, '', 3, '2020-07-01 11:47:03'),
(151, '4f066853224a2b729', 1, '', 5, '2020-07-01 11:47:29'),
(152, '4f066853224a2b729', 3, '', 3, '2020-07-01 11:47:29'),
(153, '9db081496737822e0', 1, '', 5, '2020-07-01 11:47:55'),
(154, '9db081496737822e0', 3, '', 3, '2020-07-01 11:47:55'),
(155, '5685d23cec7888aef', 1, '', 5, '2020-07-01 11:48:30'),
(156, '5685d23cec7888aef', 3, '', 3, '2020-07-01 11:48:30'),
(157, 'a1b1822feef1dc1ff', 1, '', 5, '2020-07-01 12:04:15'),
(158, 'a1b1822feef1dc1ff', 3, '', 3, '2020-07-01 12:04:15'),
(159, '31933814f65ea1dd9', 1, '', 5, '2020-07-01 12:05:14'),
(160, '31933814f65ea1dd9', 3, '', 3, '2020-07-01 12:05:14'),
(161, '708f291863796d1a1', 1, '', 5, '2020-07-01 12:07:25'),
(162, '708f291863796d1a1', 3, '', 3, '2020-07-01 12:07:25'),
(163, 'e10140e50ac856d76', 1, '', 5, '2020-07-01 12:08:30'),
(164, 'e10140e50ac856d76', 3, '', 3, '2020-07-01 12:08:30'),
(165, '52da6d22f9e854495', 1, '', 5, '2020-07-01 12:09:09'),
(166, '52da6d22f9e854495', 3, '', 3, '2020-07-01 12:09:09'),
(167, '5890e20228c842eed', 1, '', 5, '2020-07-01 12:13:58'),
(168, '5890e20228c842eed', 3, '', 3, '2020-07-01 12:13:58'),
(169, '91500fe8da31ecd21', 1, '', 5, '2020-07-01 12:14:09'),
(170, '91500fe8da31ecd21', 3, '', 3, '2020-07-01 12:14:09'),
(171, 'f79dcf2bc4dc133b4', 1, '', 5, '2020-07-01 12:14:41'),
(172, 'f79dcf2bc4dc133b4', 3, '', 3, '2020-07-01 12:14:41'),
(173, 'e14143f0367630a54', 1, '', 5, '2020-07-01 12:15:03'),
(174, 'e14143f0367630a54', 3, '', 3, '2020-07-01 12:15:03'),
(175, 'd3332a4c55521fb8d', 1, '', 5, '2020-07-01 12:16:50'),
(176, 'd3332a4c55521fb8d', 3, '', 3, '2020-07-01 12:16:50'),
(177, '8221ad7a58ef6b01a', 1, '', 5, '2020-07-01 12:24:53'),
(178, '8221ad7a58ef6b01a', 3, '', 3, '2020-07-01 12:24:53'),
(179, '6da1466919a21a24f', 1, '', 5, '2020-07-01 12:25:28'),
(180, '6da1466919a21a24f', 3, '', 3, '2020-07-01 12:25:28'),
(181, '5657d97f64badbdec', 1, '', 5, '2020-07-01 12:26:29'),
(182, '5657d97f64badbdec', 3, '', 3, '2020-07-01 12:26:29'),
(183, 'c9c03a125ab77963e', 1, '', 5, '2020-07-01 12:30:23'),
(184, 'c9c03a125ab77963e', 3, '', 3, '2020-07-01 12:30:23'),
(185, '855a17615636d69c2', 1, '', 5, '2020-07-01 12:30:48'),
(186, '855a17615636d69c2', 3, '', 3, '2020-07-01 12:30:48'),
(187, '87fddb539cab5e570', 1, '', 5, '2020-07-01 12:31:48'),
(188, '87fddb539cab5e570', 3, '', 3, '2020-07-01 12:31:48'),
(189, '08d944df2c04570cd', 1, '', 5, '2020-07-01 12:34:37'),
(190, '08d944df2c04570cd', 3, '', 3, '2020-07-01 12:34:37'),
(191, '4ffa57205704a6eb8', 1, '', 5, '2020-07-01 12:36:17'),
(192, '4ffa57205704a6eb8', 3, '', 3, '2020-07-01 12:36:17'),
(193, '7b66d394defb78501', 1, '', 5, '2020-07-01 12:36:50'),
(194, '7b66d394defb78501', 3, '', 3, '2020-07-01 12:36:50'),
(195, '0db04e7048dad2b4a', 1, '', 5, '2020-07-01 12:37:24'),
(196, '0db04e7048dad2b4a', 3, '', 3, '2020-07-01 12:37:24'),
(197, 'ec91b278c21f4a4c1', 1, '', 5, '2020-07-01 12:37:48'),
(198, 'ec91b278c21f4a4c1', 3, '', 3, '2020-07-01 12:37:48'),
(199, 'dd2eba9598ee18760', 1, '', 5, '2020-07-01 12:38:12'),
(200, 'dd2eba9598ee18760', 3, '', 3, '2020-07-01 12:38:12'),
(201, 'a3f188c7afaa3a520', 1, '', 5, '2020-07-01 12:38:36'),
(202, 'a3f188c7afaa3a520', 3, '', 3, '2020-07-01 12:38:36'),
(203, '5235a4a924b33710d', 1, '', 5, '2020-07-01 12:38:58'),
(204, '5235a4a924b33710d', 3, '', 3, '2020-07-01 12:38:58'),
(205, '3b6a1c15b6ec12070', 1, '', 5, '2020-07-01 12:41:02'),
(206, '3b6a1c15b6ec12070', 3, '', 3, '2020-07-01 12:41:02'),
(207, '714e9354c1b09a9d2', 1, '', 5, '2020-07-01 12:41:11'),
(208, '714e9354c1b09a9d2', 3, '', 3, '2020-07-01 12:41:11'),
(209, 'ce09ea48000be4fa1', 1, '', 5, '2020-07-01 12:41:26'),
(210, 'ce09ea48000be4fa1', 3, '', 3, '2020-07-01 12:41:26'),
(211, 'c9f2f461c91bb56c1', 1, '', 5, '2020-07-01 12:47:06'),
(212, 'c9f2f461c91bb56c1', 3, '', 3, '2020-07-01 12:47:06'),
(213, '0e5d5ce279ae4cca9', 1, '', 5, '2020-07-01 13:18:18'),
(214, '0e5d5ce279ae4cca9', 3, '', 3, '2020-07-01 13:18:18'),
(215, '9b40511d4a3ee690c', 1, '', 5, '2020-07-01 13:18:42'),
(216, '9b40511d4a3ee690c', 3, '', 3, '2020-07-01 13:18:42'),
(217, '15467f57cc395cb69', 1, '', 5, '2020-07-01 13:38:40'),
(218, '15467f57cc395cb69', 3, '', 3, '2020-07-01 13:38:40'),
(219, '3a1507404fa8501e9', 1, '', 5, '2020-07-01 13:39:20'),
(220, '3a1507404fa8501e9', 3, '', 3, '2020-07-01 13:39:20'),
(221, 'c0caadd2c1ea41a7e', 1, '', 5, '2020-07-01 13:39:43'),
(222, 'c0caadd2c1ea41a7e', 3, '', 3, '2020-07-01 13:39:43'),
(223, '74fbc09d33a03b811', 1, '', 5, '2020-07-01 13:40:17'),
(224, '74fbc09d33a03b811', 3, '', 3, '2020-07-01 13:40:17'),
(225, '9436d35390774c800', 1, '', 5, '2020-07-01 13:42:15'),
(226, '9436d35390774c800', 3, '', 3, '2020-07-01 13:42:15'),
(227, '6d685ae747ed72396', 1, '', 5, '2020-07-01 13:42:53'),
(228, '6d685ae747ed72396', 3, '', 3, '2020-07-01 13:42:53'),
(230, '519f1e0701967b825', 2, 'aLI', 2, '2020-07-01 13:46:44'),
(231, '519f1e0701967b825', 3, '', 4, '2020-07-01 13:46:58'),
(232, '133110f03647567c1', 1, '', 1, '2020-07-02 12:33:38'),
(233, '6164bdd54f593de36', 1, '', 6, '2020-07-07 12:06:57'),
(234, '6164bdd54f593de36', 3, '', 2, '2020-07-07 12:06:57'),
(235, '418d45cadab2153ef', 1, '', 6, '2020-07-07 12:07:19'),
(236, '418d45cadab2153ef', 3, '', 2, '2020-07-07 12:07:19'),
(237, '890980fa973499d2f', 1, '', 1, '2020-07-07 12:12:28'),
(238, '5576961653ba3a123', 1, '', 1, '2020-07-07 12:12:38'),
(239, '790ead43cd49b6210', 1, '', 1, '2020-07-07 12:15:15'),
(240, 'f467a962cb37235ce', 1, '', 1, '2020-07-07 12:26:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos_tipo`
--

CREATE TABLE `remitos_tipo` (
  `idTipoRemito` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `remitos_tipo`
--

INSERT INTO `remitos_tipo` (`idTipoRemito`, `nombre`, `fechaAlta`) VALUES
(1, 'X', '2020-06-25 13:10:00'),
(2, 'R', '2020-06-25 13:10:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `session_logs`
--

CREATE TABLE `session_logs` (
  `idLog` int(11) NOT NULL,
  `idUsuarioLog` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuarioLog` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idNivel` int(11) NOT NULL,
  `fechaIngresoLog` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `session_logs`
--

INSERT INTO `session_logs` (`idLog`, `idUsuarioLog`, `usuarioLog`, `idNivel`, `fechaIngresoLog`) VALUES
(1, '1', 'Damian Marrone', 4, '2020-05-29 10:53:57'),
(2, '1', 'Damian Marrone', 4, '2020-06-01 11:00:00'),
(3, '1', 'Damian Marrone', 4, '2020-06-02 10:51:16'),
(4, '1', 'Damian Marrone', 4, '2020-06-03 10:48:53'),
(5, '1', 'Damian Marrone', 4, '2020-06-03 12:44:31'),
(6, '1', 'Damian Marrone', 4, '2020-06-04 10:55:29'),
(7, '1', 'Damian Marrone', 4, '2020-06-05 10:51:54'),
(8, '1', 'Damian Marrone', 4, '2020-06-08 10:54:12'),
(9, '1', 'Damian Marrone', 4, '2020-06-09 10:49:02'),
(10, '1', 'Damian Marrone', 4, '2020-06-10 10:54:12'),
(11, '1', 'Damian Marrone', 4, '2020-06-11 11:01:24'),
(12, '1', 'Damian Marrone', 4, '2020-06-11 13:13:47'),
(13, '1', 'Damian Marrone', 4, '2020-06-12 11:01:04'),
(14, '7', 'Sergio Gomez', 10, '2020-06-12 11:51:14'),
(15, '6', 'Mateo Digliodo', 10, '2020-06-12 13:47:38'),
(16, '6', 'Mateo Digliodo', 10, '2020-06-12 14:32:43'),
(17, '1', 'Damian Marrone', 4, '2020-06-16 10:52:12'),
(18, '1', 'Damian Marrone', 4, '2020-06-16 13:08:30'),
(19, '1', 'Damian Marrone', 4, '2020-06-17 11:07:02'),
(20, '1', 'Damian Marrone', 4, '2020-06-18 10:58:24'),
(21, '1', 'Damian Marrone', 4, '2020-06-19 10:59:45'),
(22, '1', 'Damian Marrone', 4, '2020-06-22 10:57:58'),
(23, '1', 'Damian Marrone', 4, '2020-06-23 10:52:01'),
(24, '1', 'Damian Marrone', 4, '2020-06-23 12:48:55'),
(25, '1', 'Damian Marrone', 4, '2020-06-24 11:06:53'),
(26, '1', 'Damian Marrone', 4, '2020-06-24 22:16:52'),
(27, '1', 'Damian Marrone', 4, '2020-06-25 10:53:17'),
(28, '1', 'Damian Marrone', 4, '2020-06-26 10:55:05'),
(29, '1', 'Damian Marrone', 4, '2020-06-29 11:12:05'),
(30, '1', 'Damian Marrone', 4, '2020-06-30 11:09:32'),
(31, '1', 'Damian Marrone', 4, '2020-07-01 11:02:45'),
(32, '1', 'Damian Marrone', 4, '2020-07-01 15:01:45'),
(33, '1', 'Damian Marrone', 4, '2020-07-02 10:59:52'),
(34, '1', 'Damian Marrone', 4, '2020-07-03 10:52:53'),
(35, '1', 'Damian Marrone', 4, '2020-07-03 14:37:15'),
(36, '1', 'Damian Marrone', 4, '2020-07-06 10:56:37'),
(37, '1', 'Damian Marrone', 4, '2020-07-06 21:56:51'),
(38, '1', 'Damian Marrone', 4, '2020-07-07 10:54:17'),
(39, '1', 'Damian Marrone', 4, '2020-07-08 02:29:50'),
(40, '1', 'Damian Marrone', 4, '2020-07-08 10:51:01'),
(41, '1', 'Damian Marrone', 4, '2020-07-13 10:51:11'),
(42, '1', 'Damian Marrone', 4, '2020-07-14 00:31:19'),
(43, '1', 'Damian Marrone', 4, '2020-07-14 10:53:03'),
(44, '1', 'Damian Marrone', 4, '2020-07-15 11:05:32'),
(45, '1', 'Damian Marrone', 4, '2020-07-15 17:39:37'),
(46, '1', 'Damian Marrone', 4, '2020-07-16 10:54:13'),
(47, '1', 'Damian Marrone', 4, '2020-07-17 10:55:45'),
(48, '1', 'Damian Marrone', 4, '2020-07-20 10:54:57'),
(49, '1', 'Damian Marrone', 4, '2020-07-22 17:16:55'),
(50, '1', 'Damian Marrone', 4, '2020-07-23 10:54:06'),
(51, '1', 'Damian Marrone', 4, '2020-07-29 11:21:11'),
(52, '1', 'Damian Marrone', 4, '2020-07-31 18:21:16'),
(53, '1', 'Damian Marrone', 4, '2020-09-02 01:17:59'),
(54, '1', 'Damian Marrone', 4, '2020-09-02 20:57:58'),
(55, '1', 'Damian Marrone', 4, '2020-09-05 02:27:01'),
(56, '1', 'Damian Marrone', 4, '2020-09-20 20:19:21'),
(57, '1', 'Damian Marrone', 4, '2020-09-26 20:21:17'),
(58, '1', 'Damian Marrone', 4, '2020-09-26 20:29:40'),
(59, '2', 'Daniel Rosso', 1, '2020-09-26 20:30:29'),
(60, '1', 'Damian Marrone', 4, '2020-10-27 02:03:36'),
(61, '1', 'Damian Marrone', 4, '2020-10-30 19:24:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `idSexo` int(11) NOT NULL,
  `cod` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`idSexo`, `cod`, `tipo`, `fechaAlta`) VALUES
(1, 'F', 'Femenino', '2019-02-22 01:49:29'),
(2, 'M', 'Masculino', '2019-02-22 01:49:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tesoreria_cuentas`
--

CREATE TABLE `tesoreria_cuentas` (
  `idCuenta` int(11) NOT NULL,
  `idGenCuenta` varchar(150) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPtoVenta` int(11) NOT NULL,
  `idTipoCuenta` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tesoreria_cuentas`
--

INSERT INTO `tesoreria_cuentas` (`idCuenta`, `idGenCuenta`, `idUsuario`, `idPtoVenta`, `idTipoCuenta`, `descripcion`, `fechaAlta`) VALUES
(1, 'QmNWsMjhD5mut5h', 1, 1, 4, 'Caja del Local', '2019-03-14 23:41:26'),
(2, 'yswEFdjbZ93VIs0', 1, 1, 4, 'Caja General', '2019-03-14 23:41:34'),
(16, 'mrfLF6jBk7zR2fI', 26, 1, 4, 'Bar', '2019-08-27 00:00:20'),
(15, '0Of0SPHWmLlijMg', 26, 1, 4, 'Damfield', '2019-08-26 23:59:59'),
(5, 'kdGs1z9ShPUElUz', 1, 1, 3, 'Mercado Pago', '2019-03-14 23:41:55'),
(8, 'FPuLVIrPs2HUQq0', 1, 1, 1, 'Cheque de Terceros', '2019-03-14 23:42:14'),
(9, 'alSM9z4D8hQu2xj', 1, 1, 2, 'Cheque Propio', '2019-03-14 23:42:19'),
(10, 'HnOifu4ZuKb3NX5', 1, 1, 2, 'VISA Corporativa', '2019-03-14 23:42:25'),
(14, 'w9ncnhsXPDWXJFJ', 26, 1, 3, 'Banco Credicoop', '2019-08-26 23:58:43'),
(23, 'Cf3DOIs5tF6VSFO', 1, 0, 6, 'Visa', '2020-04-17 17:33:31'),
(25, 'O9MIUSdmFXt34uz', 1, 0, 6, 'Masterd card', '2020-04-17 17:34:04'),
(29, 'ITgMN5y3j4yq5tW', 6, 1, 4, 'marroned', '2020-06-02 19:04:51'),
(30, 's5T1hcSX7QB9qHU', 7, 1, 4, 'sgomez', '2020-06-12 17:28:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tesoreria_tipo_cuenta`
--

CREATE TABLE `tesoreria_tipo_cuenta` (
  `idTipoCuenta` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tesoreria_tipo_cuenta`
--

INSERT INTO `tesoreria_tipo_cuenta` (`idTipoCuenta`, `descripcion`, `fechaAlta`) VALUES
(1, 'A Cobrar', '2019-03-12 13:24:34'),
(2, 'A Pagar', '2019-03-12 13:24:34'),
(3, 'Banco', '2019-03-12 13:24:34'),
(4, 'Efectivo', '2019-03-12 13:24:34'),
(6, 'Tarjeta', '2020-04-17 11:31:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_interna`
--

CREATE TABLE `tipo_interna` (
  `idTipoInterna` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_interna`
--

INSERT INTO `tipo_interna` (`idTipoInterna`, `nombre`) VALUES
(1, 'Nivel 1'),
(2, 'Nivel 2'),
(3, 'Nivel 3'),
(4, 'Nivel 4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_moneda`
--

CREATE TABLE `tipo_moneda` (
  `idTipoMoneda` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_moneda`
--

INSERT INTO `tipo_moneda` (`idTipoMoneda`, `descripcion`, `fechaAlta`) VALUES
(1, 'Pesos', '2020-04-17 13:58:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportistas`
--

CREATE TABLE `transportistas` (
  `idTransportista` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `idGenUsuario` varchar(250) NOT NULL,
  `idGenComercio` varchar(150) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idNivel` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `imgPerfil` varchar(150) NOT NULL DEFAULT '300.png',
  `nombreCompleto` varchar(150) NOT NULL,
  `apellido` varchar(55) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idGeneradoUsuarioMenuAdmin` varchar(50) NOT NULL,
  `keyPassword` varchar(150) NOT NULL,
  `codigoActivacion` varchar(150) NOT NULL,
  `activado` int(11) NOT NULL DEFAULT '0',
  `biografia` longtext NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `turno` int(2) NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `status`, `idGenUsuario`, `idGenComercio`, `idArea`, `idNivel`, `idProvincia`, `idLocalidad`, `imgPerfil`, `nombreCompleto`, `apellido`, `usuario`, `password`, `idGeneradoUsuarioMenuAdmin`, `keyPassword`, `codigoActivacion`, `activado`, `biografia`, `email`, `telefono`, `turno`, `fecha`, `eliminado`) VALUES
(1, 0, '', '', 1, 4, 22, 1905, '', 'Damian', 'Marrone', 'marroned', '8644a14fbae2c748ada76e67f5fedd67', '', '', '', 1, 'Desarrollador', 'damianmarrone@telepathicsoft.com.ar', '3468512682', 1, '2017-03-08 19:28:09', 0),
(2, 0, '', '', 0, 1, 7, 897, '', 'Daniel', 'Rosso', 'drosso', '827ccb0eea8a706c4c34a16891f84e7b', 'NN73KgIIdgl9Xnx', '', '', 0, '', 'danielalbertorosso@hotmail.com', '3537512557', 1, '2020-05-29 12:59:06', 0),
(3, 0, '', '', 0, 1, 2, 144, '3c4267540492cabf8.PNG', 'asdf', 'asdf', 'marroned', '8644a14fbae2c748ada76e67f5fedd67', 'VTSfNXkhfJXeVcR', '', '', 0, '', 'dasfsadf@hoadf.com', '3232', 1, '2020-05-29 13:07:10', 1),
(4, 0, '', '', 0, 1, 4, 335, '', 'asdf433111224', 'asdf44ee', 'asd', '42732c2f940328b94da73b7e745f3340', 'Fn6P3z22h9QA7vI', '', '', 0, '', 'sdaf@asdf.com', '332', 1, '2020-05-29 13:10:08', 1),
(5, 0, '', '', 0, 4, 1, 3, '', 'asdf', 'asdf', 'asdfas', '5259ee4a034fdeddd1b65be92debe731', 'VTIJwqd8SwPjJtA', '', '', 0, '', 'asdf@ad.asd', '234asd', 1, '2020-05-29 13:44:10', 1),
(6, 0, '', '', 0, 10, 7, 897, '', 'Mateo', 'Digliodo', 'mdigliodo', '81dc9bdb52d04dc20036dbd8313ed055', 'QpTLk3wqGp5ooWU', '', '', 0, '', 'mateodigliodo@hotmail.com', '55511111', 0, '2020-06-02 13:04:51', 0),
(7, 0, '', '', 0, 10, 2, 3, '', 'Sergio', 'Gomez', 'sgomez', '81dc9bdb52d04dc20036dbd8313ed055', 'see8TIeinUg9oJr', '', '', 0, '', 'asdfsa@asdf.com', '123123', 1, '2020-06-12 11:26:18', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_menu_admin`
--

CREATE TABLE `usuario_menu_admin` (
  `idUsuarioMenuAdmin` int(11) NOT NULL,
  `fechaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idMenu` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_menu_admin`
--

INSERT INTO `usuario_menu_admin` (`idUsuarioMenuAdmin`, `fechaModificacion`, `idMenu`, `idUsuario`, `fechaCreacion`) VALUES
(1, '2019-08-06 23:57:12', 1, 28, '2019-08-06 23:57:12'),
(2, '2019-08-06 23:57:12', 2, 28, '2019-08-06 23:57:12'),
(3, '2019-08-06 23:57:12', 3, 28, '2019-08-06 23:57:12'),
(4, '2019-08-06 23:57:12', 4, 28, '2019-08-06 23:57:12'),
(5, '2019-08-06 23:57:12', 5, 28, '2019-08-06 23:57:12'),
(6, '2019-08-06 23:57:13', 6, 28, '2019-08-06 23:57:13'),
(7, '2019-08-06 23:57:13', 7, 28, '2019-08-06 23:57:13'),
(8, '2019-08-06 23:57:13', 8, 28, '2019-08-06 23:57:13'),
(9, '2019-08-06 23:57:13', 9, 28, '2019-08-06 23:57:13'),
(10, '2019-08-06 23:57:13', 10, 28, '2019-08-06 23:57:13'),
(11, '2019-08-06 23:57:13', 19, 28, '2019-08-06 23:57:13'),
(12, '2019-08-06 23:57:14', 21, 28, '2019-08-06 23:57:14'),
(13, '2019-08-06 23:57:14', 22, 28, '2019-08-06 23:57:14'),
(14, '2019-08-06 23:57:14', 23, 28, '2019-08-06 23:57:14'),
(15, '2019-08-08 00:55:19', 1, 29, '2019-08-08 00:55:19'),
(16, '2019-08-08 00:55:19', 2, 29, '2019-08-08 00:55:19'),
(17, '2019-08-08 00:55:19', 3, 29, '2019-08-08 00:55:19'),
(18, '2019-08-08 00:55:19', 4, 29, '2019-08-08 00:55:19'),
(19, '2019-08-08 00:55:20', 8, 29, '2019-08-08 00:55:20'),
(20, '2019-08-08 00:55:20', 9, 29, '2019-08-08 00:55:20'),
(21, '2019-08-08 00:55:20', 10, 29, '2019-08-08 00:55:20'),
(22, '2019-08-08 00:55:20', 19, 29, '2019-08-08 00:55:20'),
(23, '2019-08-08 00:55:20', 21, 29, '2019-08-08 00:55:20'),
(24, '2019-08-08 00:55:20', 22, 29, '2019-08-08 00:55:20'),
(25, '2019-08-12 16:27:16', 1, 30, '2019-08-12 16:27:16'),
(26, '2019-08-12 16:27:16', 2, 30, '2019-08-12 16:27:16'),
(27, '2019-08-12 16:27:16', 3, 30, '2019-08-12 16:27:16'),
(28, '2019-08-12 16:27:16', 4, 30, '2019-08-12 16:27:16'),
(29, '2019-08-12 16:27:16', 5, 30, '2019-08-12 16:27:16'),
(30, '2019-08-12 16:27:16', 6, 30, '2019-08-12 16:27:16'),
(31, '2019-08-12 16:27:16', 7, 30, '2019-08-12 16:27:16'),
(32, '2019-08-12 16:27:16', 8, 30, '2019-08-12 16:27:16'),
(33, '2019-08-12 16:27:16', 9, 30, '2019-08-12 16:27:16'),
(34, '2019-08-12 16:27:16', 10, 30, '2019-08-12 16:27:16'),
(35, '2019-08-12 16:27:16', 11, 30, '2019-08-12 16:27:16'),
(36, '2019-08-12 16:27:16', 12, 30, '2019-08-12 16:27:16'),
(37, '2019-08-12 16:27:16', 13, 30, '2019-08-12 16:27:16'),
(38, '2019-08-12 16:27:16', 14, 30, '2019-08-12 16:27:16'),
(39, '2019-08-12 16:27:16', 15, 30, '2019-08-12 16:27:16'),
(40, '2019-08-12 16:27:16', 16, 30, '2019-08-12 16:27:16'),
(41, '2019-08-12 16:27:16', 17, 30, '2019-08-12 16:27:16'),
(42, '2019-08-12 16:27:16', 18, 30, '2019-08-12 16:27:16'),
(43, '2019-08-12 16:27:16', 20, 30, '2019-08-12 16:27:16'),
(44, '2019-08-12 16:27:16', 19, 30, '2019-08-12 16:27:16'),
(45, '2019-08-12 16:27:16', 21, 30, '2019-08-12 16:27:16'),
(46, '2019-08-12 16:27:16', 22, 30, '2019-08-12 16:27:16'),
(47, '2019-08-12 16:27:16', 23, 30, '2019-08-12 16:27:16'),
(48, '2019-08-12 16:27:16', 24, 30, '2019-08-12 16:27:16'),
(49, '2019-08-12 16:27:16', 25, 30, '2019-08-12 16:27:16'),
(50, '2019-08-12 16:27:16', 26, 30, '2019-08-12 16:27:16'),
(51, '2019-08-12 16:27:16', 27, 30, '2019-08-12 16:27:16'),
(54, '2019-09-20 14:29:08', 19, 31, '2019-09-20 14:29:08'),
(55, '2020-05-22 23:33:20', 37, 46, '2020-05-22 23:33:20'),
(56, '2020-05-22 23:33:20', 38, 46, '2020-05-22 23:33:20'),
(57, '2020-05-22 23:33:20', 39, 46, '2020-05-22 23:33:20'),
(58, '2020-05-22 23:33:20', 40, 46, '2020-05-22 23:33:20'),
(59, '2020-05-22 23:33:20', 41, 46, '2020-05-22 23:33:20'),
(60, '2020-05-22 23:33:20', 42, 46, '2020-05-22 23:33:20'),
(61, '2020-05-22 23:33:20', 43, 46, '2020-05-22 23:33:20'),
(62, '2020-05-22 23:33:20', 44, 46, '2020-05-22 23:33:20'),
(63, '2020-05-22 23:33:20', 47, 46, '2020-05-22 23:33:20'),
(64, '2020-05-22 23:33:20', 48, 46, '2020-05-22 23:33:20'),
(65, '2020-05-22 23:33:20', 49, 46, '2020-05-22 23:33:20'),
(66, '2020-05-22 23:33:20', 50, 46, '2020-05-22 23:33:20'),
(210, '2020-05-29 13:07:10', 50, 3, '2020-05-29 13:07:10'),
(209, '2020-05-29 13:07:10', 49, 3, '2020-05-29 13:07:10'),
(208, '2020-05-29 13:07:10', 48, 3, '2020-05-29 13:07:10'),
(207, '2020-05-29 13:07:10', 47, 3, '2020-05-29 13:07:10'),
(206, '2020-05-29 13:07:10', 44, 3, '2020-05-29 13:07:10'),
(205, '2020-05-29 13:07:10', 43, 3, '2020-05-29 13:07:10'),
(204, '2020-05-29 13:07:10', 42, 3, '2020-05-29 13:07:10'),
(203, '2020-05-29 13:07:10', 41, 3, '2020-05-29 13:07:10'),
(202, '2020-05-29 13:07:10', 40, 3, '2020-05-29 13:07:10'),
(201, '2020-05-29 13:07:10', 39, 3, '2020-05-29 13:07:10'),
(200, '2020-05-29 13:07:10', 38, 3, '2020-05-29 13:07:10'),
(199, '2020-05-29 13:07:10', 37, 3, '2020-05-29 13:07:10'),
(198, '2020-05-29 13:07:10', 36, 3, '2020-05-29 13:07:10'),
(197, '2020-05-29 13:07:10', 35, 3, '2020-05-29 13:07:10'),
(196, '2020-05-29 13:07:10', 34, 3, '2020-05-29 13:07:10'),
(195, '2020-05-29 13:07:10', 33, 3, '2020-05-29 13:07:10'),
(194, '2020-05-29 13:07:10', 32, 3, '2020-05-29 13:07:10'),
(193, '2020-05-29 13:07:10', 31, 3, '2020-05-29 13:07:10'),
(192, '2020-05-29 13:07:10', 30, 3, '2020-05-29 13:07:10'),
(191, '2020-05-29 13:07:10', 29, 3, '2020-05-29 13:07:10'),
(190, '2020-05-29 13:07:10', 28, 3, '2020-05-29 13:07:10'),
(189, '2020-05-29 13:07:10', 27, 3, '2020-05-29 13:07:10'),
(188, '2020-05-29 13:07:10', 26, 3, '2020-05-29 13:07:10'),
(187, '2020-05-29 13:07:10', 25, 3, '2020-05-29 13:07:10'),
(186, '2020-05-29 13:07:10', 24, 3, '2020-05-29 13:07:10'),
(185, '2020-05-29 13:07:10', 23, 3, '2020-05-29 13:07:10'),
(184, '2020-05-29 13:07:10', 22, 3, '2020-05-29 13:07:10'),
(183, '2020-05-29 13:07:10', 21, 3, '2020-05-29 13:07:10'),
(182, '2020-05-29 13:07:10', 20, 3, '2020-05-29 13:07:10'),
(181, '2020-05-29 13:07:10', 19, 3, '2020-05-29 13:07:10'),
(180, '2020-05-29 13:07:10', 18, 3, '2020-05-29 13:07:10'),
(179, '2020-05-29 13:07:10', 17, 3, '2020-05-29 13:07:10'),
(178, '2020-05-29 13:07:10', 16, 3, '2020-05-29 13:07:10'),
(177, '2020-05-29 13:07:10', 15, 3, '2020-05-29 13:07:10'),
(176, '2020-05-29 13:07:10', 14, 3, '2020-05-29 13:07:10'),
(175, '2020-05-29 13:07:10', 13, 3, '2020-05-29 13:07:10'),
(174, '2020-05-29 13:07:10', 12, 3, '2020-05-29 13:07:10'),
(173, '2020-05-29 13:07:10', 11, 3, '2020-05-29 13:07:10'),
(172, '2020-05-29 13:07:10', 10, 3, '2020-05-29 13:07:10'),
(171, '2020-05-29 13:07:10', 9, 3, '2020-05-29 13:07:10'),
(170, '2020-05-29 13:07:10', 8, 3, '2020-05-29 13:07:10'),
(169, '2020-05-29 13:07:10', 7, 3, '2020-05-29 13:07:10'),
(168, '2020-05-29 13:07:10', 6, 3, '2020-05-29 13:07:10'),
(167, '2020-05-29 13:07:10', 5, 3, '2020-05-29 13:07:10'),
(166, '2020-05-29 13:07:10', 4, 3, '2020-05-29 13:07:10'),
(165, '2020-05-29 13:07:10', 3, 3, '2020-05-29 13:07:10'),
(164, '2020-05-29 13:07:10', 2, 3, '2020-05-29 13:07:10'),
(163, '2020-05-29 13:07:10', 1, 3, '2020-05-29 13:07:10'),
(514, '2020-06-04 14:10:19', 1, 8, '2020-06-04 14:10:19'),
(515, '2020-06-04 14:10:19', 2, 8, '2020-06-04 14:10:19'),
(516, '2020-06-04 14:10:19', 3, 8, '2020-06-04 14:10:19'),
(517, '2020-06-04 14:10:19', 4, 8, '2020-06-04 14:10:19'),
(518, '2020-06-04 14:10:19', 5, 8, '2020-06-04 14:10:19'),
(519, '2020-06-04 14:10:19', 6, 8, '2020-06-04 14:10:19'),
(520, '2020-06-04 14:10:19', 7, 8, '2020-06-04 14:10:19'),
(521, '2020-06-04 14:10:19', 8, 8, '2020-06-04 14:10:19'),
(522, '2020-06-04 14:10:19', 9, 8, '2020-06-04 14:10:19'),
(523, '2020-06-04 14:10:19', 10, 8, '2020-06-04 14:10:19'),
(524, '2020-06-04 14:10:19', 11, 8, '2020-06-04 14:10:19'),
(525, '2020-06-04 14:10:19', 12, 8, '2020-06-04 14:10:19'),
(526, '2020-06-04 14:10:19', 13, 8, '2020-06-04 14:10:19'),
(527, '2020-06-04 14:10:19', 14, 8, '2020-06-04 14:10:19'),
(528, '2020-06-04 14:10:19', 15, 8, '2020-06-04 14:10:19'),
(529, '2020-06-04 14:10:19', 16, 8, '2020-06-04 14:10:19'),
(530, '2020-06-04 14:10:19', 17, 8, '2020-06-04 14:10:19'),
(531, '2020-06-04 14:10:19', 18, 8, '2020-06-04 14:10:19'),
(532, '2020-06-04 14:10:19', 19, 8, '2020-06-04 14:10:19'),
(533, '2020-06-04 14:10:19', 20, 8, '2020-06-04 14:10:19'),
(534, '2020-06-04 14:10:19', 21, 8, '2020-06-04 14:10:19'),
(535, '2020-06-04 14:10:19', 22, 8, '2020-06-04 14:10:19'),
(536, '2020-06-04 14:10:19', 23, 8, '2020-06-04 14:10:19'),
(537, '2020-06-04 14:10:19', 24, 8, '2020-06-04 14:10:19'),
(538, '2020-06-04 14:10:19', 25, 8, '2020-06-04 14:10:19'),
(539, '2020-06-04 14:10:19', 26, 8, '2020-06-04 14:10:19'),
(540, '2020-06-04 14:10:19', 27, 8, '2020-06-04 14:10:19'),
(541, '2020-06-04 14:10:19', 28, 8, '2020-06-04 14:10:19'),
(542, '2020-06-04 14:10:19', 29, 8, '2020-06-04 14:10:19'),
(543, '2020-06-04 14:10:19', 30, 8, '2020-06-04 14:10:19'),
(544, '2020-06-04 14:10:19', 31, 8, '2020-06-04 14:10:19'),
(545, '2020-06-04 14:10:19', 32, 8, '2020-06-04 14:10:19'),
(546, '2020-06-04 14:10:19', 33, 8, '2020-06-04 14:10:19'),
(547, '2020-06-04 14:10:19', 34, 8, '2020-06-04 14:10:19'),
(548, '2020-06-04 14:10:19', 35, 8, '2020-06-04 14:10:19'),
(549, '2020-06-04 14:10:19', 36, 8, '2020-06-04 14:10:19'),
(550, '2020-06-04 14:10:19', 37, 8, '2020-06-04 14:10:19'),
(551, '2020-06-04 14:10:19', 38, 8, '2020-06-04 14:10:19'),
(552, '2020-06-04 14:10:19', 39, 8, '2020-06-04 14:10:19'),
(553, '2020-06-04 14:10:19', 40, 8, '2020-06-04 14:10:19'),
(554, '2020-06-04 14:10:19', 41, 8, '2020-06-04 14:10:19'),
(555, '2020-06-04 14:10:19', 42, 8, '2020-06-04 14:10:19'),
(556, '2020-06-04 14:10:19', 43, 8, '2020-06-04 14:10:19'),
(557, '2020-06-04 14:10:19', 44, 8, '2020-06-04 14:10:19'),
(558, '2020-06-04 14:10:19', 47, 8, '2020-06-04 14:10:19'),
(559, '2020-06-04 14:10:19', 48, 8, '2020-06-04 14:10:19'),
(560, '2020-06-04 14:10:19', 49, 8, '2020-06-04 14:10:19'),
(561, '2020-06-04 14:10:19', 50, 8, '2020-06-04 14:10:19'),
(562, '2020-06-04 14:11:58', 1, 9, '2020-06-04 14:11:58'),
(563, '2020-06-04 14:11:58', 2, 9, '2020-06-04 14:11:58'),
(564, '2020-06-04 14:11:58', 3, 9, '2020-06-04 14:11:58'),
(565, '2020-06-04 14:11:58', 4, 9, '2020-06-04 14:11:58'),
(566, '2020-06-04 14:11:58', 5, 9, '2020-06-04 14:11:58'),
(567, '2020-06-04 14:11:58', 6, 9, '2020-06-04 14:11:58'),
(568, '2020-06-04 14:11:58', 7, 9, '2020-06-04 14:11:58'),
(569, '2020-06-04 14:11:58', 8, 9, '2020-06-04 14:11:58'),
(570, '2020-06-04 14:11:58', 9, 9, '2020-06-04 14:11:58'),
(571, '2020-06-04 14:11:58', 10, 9, '2020-06-04 14:11:58'),
(572, '2020-06-04 14:11:58', 11, 9, '2020-06-04 14:11:58'),
(573, '2020-06-04 14:11:58', 12, 9, '2020-06-04 14:11:58'),
(574, '2020-06-04 14:11:58', 13, 9, '2020-06-04 14:11:58'),
(575, '2020-06-04 14:11:58', 14, 9, '2020-06-04 14:11:58'),
(576, '2020-06-04 14:11:58', 15, 9, '2020-06-04 14:11:58'),
(577, '2020-06-04 14:11:58', 16, 9, '2020-06-04 14:11:58'),
(578, '2020-06-04 14:11:58', 17, 9, '2020-06-04 14:11:58'),
(579, '2020-06-04 14:11:58', 18, 9, '2020-06-04 14:11:58'),
(580, '2020-06-04 14:11:58', 19, 9, '2020-06-04 14:11:58'),
(581, '2020-06-04 14:11:58', 21, 9, '2020-06-04 14:11:58'),
(582, '2020-06-04 14:11:58', 22, 9, '2020-06-04 14:11:58'),
(583, '2020-06-04 14:11:58', 23, 9, '2020-06-04 14:11:58'),
(584, '2020-06-04 14:11:58', 24, 9, '2020-06-04 14:11:58'),
(585, '2020-06-04 14:11:58', 25, 9, '2020-06-04 14:11:58'),
(586, '2020-06-04 14:11:58', 26, 9, '2020-06-04 14:11:58'),
(587, '2020-06-04 14:11:58', 27, 9, '2020-06-04 14:11:58'),
(588, '2020-06-04 14:11:58', 20, 9, '2020-06-04 14:11:58'),
(589, '2020-06-04 14:11:58', 28, 9, '2020-06-04 14:11:58'),
(590, '2020-06-04 14:11:58', 29, 9, '2020-06-04 14:11:58'),
(591, '2020-06-04 14:11:58', 30, 9, '2020-06-04 14:11:58'),
(592, '2020-06-04 14:11:58', 31, 9, '2020-06-04 14:11:58'),
(593, '2020-06-04 14:11:58', 32, 9, '2020-06-04 14:11:58'),
(594, '2020-06-04 14:11:58', 33, 9, '2020-06-04 14:11:58'),
(595, '2020-06-04 14:11:58', 34, 9, '2020-06-04 14:11:58'),
(596, '2020-06-04 14:11:58', 35, 9, '2020-06-04 14:11:58'),
(597, '2020-06-04 14:11:58', 36, 9, '2020-06-04 14:11:58'),
(598, '2020-06-04 14:11:58', 37, 9, '2020-06-04 14:11:58'),
(599, '2020-06-04 14:11:58', 38, 9, '2020-06-04 14:11:58'),
(600, '2020-06-04 14:11:58', 39, 9, '2020-06-04 14:11:58'),
(601, '2020-06-04 14:11:58', 40, 9, '2020-06-04 14:11:58'),
(602, '2020-06-04 14:11:58', 41, 9, '2020-06-04 14:11:58'),
(603, '2020-06-04 14:11:58', 42, 9, '2020-06-04 14:11:58'),
(604, '2020-06-04 14:11:58', 43, 9, '2020-06-04 14:11:58'),
(605, '2020-06-04 14:11:58', 44, 9, '2020-06-04 14:11:58'),
(606, '2020-06-04 14:11:58', 47, 9, '2020-06-04 14:11:58'),
(607, '2020-06-04 14:11:58', 48, 9, '2020-06-04 14:11:58'),
(608, '2020-06-04 14:11:58', 49, 9, '2020-06-04 14:11:58'),
(609, '2020-06-04 14:11:58', 50, 9, '2020-06-04 14:11:58'),
(610, '2020-06-04 14:13:08', 1, 10, '2020-06-04 14:13:08'),
(611, '2020-06-04 14:13:08', 2, 10, '2020-06-04 14:13:08'),
(612, '2020-06-04 14:13:08', 3, 10, '2020-06-04 14:13:08'),
(613, '2020-06-04 14:13:08', 4, 10, '2020-06-04 14:13:08'),
(614, '2020-06-04 14:13:08', 5, 10, '2020-06-04 14:13:08'),
(615, '2020-06-04 14:13:08', 6, 10, '2020-06-04 14:13:08'),
(616, '2020-06-04 14:13:08', 7, 10, '2020-06-04 14:13:08'),
(617, '2020-06-04 14:13:08', 8, 10, '2020-06-04 14:13:08'),
(618, '2020-06-04 14:13:08', 9, 10, '2020-06-04 14:13:08'),
(619, '2020-06-04 14:13:08', 10, 10, '2020-06-04 14:13:08'),
(620, '2020-06-04 14:13:08', 11, 10, '2020-06-04 14:13:08'),
(621, '2020-06-04 14:13:08', 12, 10, '2020-06-04 14:13:08'),
(622, '2020-06-04 14:13:08', 13, 10, '2020-06-04 14:13:08'),
(623, '2020-06-04 14:13:08', 14, 10, '2020-06-04 14:13:08'),
(624, '2020-06-04 14:13:08', 15, 10, '2020-06-04 14:13:08'),
(625, '2020-06-04 14:13:08', 16, 10, '2020-06-04 14:13:08'),
(626, '2020-06-04 14:13:08', 17, 10, '2020-06-04 14:13:08'),
(627, '2020-06-04 14:13:08', 18, 10, '2020-06-04 14:13:08'),
(628, '2020-06-04 14:13:08', 19, 10, '2020-06-04 14:13:08'),
(629, '2020-06-04 14:13:08', 20, 10, '2020-06-04 14:13:08'),
(630, '2020-06-04 14:13:08', 21, 10, '2020-06-04 14:13:08'),
(631, '2020-06-04 14:13:08', 22, 10, '2020-06-04 14:13:08'),
(632, '2020-06-04 14:13:08', 23, 10, '2020-06-04 14:13:08'),
(633, '2020-06-04 14:13:08', 24, 10, '2020-06-04 14:13:08'),
(634, '2020-06-04 14:13:08', 25, 10, '2020-06-04 14:13:08'),
(635, '2020-06-04 14:13:08', 26, 10, '2020-06-04 14:13:08'),
(636, '2020-06-04 14:13:08', 27, 10, '2020-06-04 14:13:08'),
(637, '2020-06-04 14:13:08', 28, 10, '2020-06-04 14:13:08'),
(638, '2020-06-04 14:13:08', 29, 10, '2020-06-04 14:13:08'),
(639, '2020-06-04 14:13:08', 30, 10, '2020-06-04 14:13:08'),
(640, '2020-06-04 14:13:08', 31, 10, '2020-06-04 14:13:08'),
(641, '2020-06-04 14:13:08', 32, 10, '2020-06-04 14:13:08'),
(642, '2020-06-04 14:13:08', 33, 10, '2020-06-04 14:13:08'),
(643, '2020-06-04 14:13:08', 34, 10, '2020-06-04 14:13:08'),
(644, '2020-06-04 14:13:08', 35, 10, '2020-06-04 14:13:08'),
(645, '2020-06-04 14:13:08', 36, 10, '2020-06-04 14:13:08'),
(646, '2020-06-04 14:13:08', 37, 10, '2020-06-04 14:13:08'),
(647, '2020-06-04 14:13:08', 38, 10, '2020-06-04 14:13:08'),
(648, '2020-06-04 14:13:08', 39, 10, '2020-06-04 14:13:08'),
(649, '2020-06-04 14:13:08', 40, 10, '2020-06-04 14:13:08'),
(650, '2020-06-04 14:13:08', 41, 10, '2020-06-04 14:13:08'),
(651, '2020-06-04 14:13:08', 42, 10, '2020-06-04 14:13:08'),
(652, '2020-06-04 14:13:08', 43, 10, '2020-06-04 14:13:08'),
(653, '2020-06-04 14:13:08', 44, 10, '2020-06-04 14:13:08'),
(654, '2020-06-04 14:13:08', 47, 10, '2020-06-04 14:13:08'),
(655, '2020-06-04 14:13:08', 48, 10, '2020-06-04 14:13:08'),
(656, '2020-06-04 14:13:08', 49, 10, '2020-06-04 14:13:08'),
(657, '2020-06-04 14:13:08', 50, 10, '2020-06-04 14:13:08'),
(658, '2020-06-04 14:14:16', 1, 11, '2020-06-04 14:14:16'),
(659, '2020-06-04 14:14:16', 2, 11, '2020-06-04 14:14:16'),
(660, '2020-06-04 14:14:16', 3, 11, '2020-06-04 14:14:16'),
(661, '2020-06-04 14:14:16', 4, 11, '2020-06-04 14:14:16'),
(662, '2020-06-04 14:14:16', 5, 11, '2020-06-04 14:14:16'),
(663, '2020-06-04 14:14:16', 6, 11, '2020-06-04 14:14:16'),
(664, '2020-06-04 14:14:16', 7, 11, '2020-06-04 14:14:16'),
(665, '2020-06-04 14:14:16', 8, 11, '2020-06-04 14:14:16'),
(666, '2020-06-04 14:14:16', 9, 11, '2020-06-04 14:14:16'),
(667, '2020-06-04 14:14:16', 10, 11, '2020-06-04 14:14:16'),
(668, '2020-06-04 14:14:16', 11, 11, '2020-06-04 14:14:16'),
(669, '2020-06-04 14:14:16', 12, 11, '2020-06-04 14:14:16'),
(670, '2020-06-04 14:14:16', 13, 11, '2020-06-04 14:14:16'),
(671, '2020-06-04 14:14:16', 14, 11, '2020-06-04 14:14:16'),
(672, '2020-06-04 14:14:16', 15, 11, '2020-06-04 14:14:16'),
(673, '2020-06-04 14:14:16', 16, 11, '2020-06-04 14:14:16'),
(674, '2020-06-04 14:14:16', 17, 11, '2020-06-04 14:14:16'),
(675, '2020-06-04 14:14:16', 18, 11, '2020-06-04 14:14:16'),
(676, '2020-06-04 14:14:16', 19, 11, '2020-06-04 14:14:16'),
(677, '2020-06-04 14:14:16', 20, 11, '2020-06-04 14:14:16'),
(678, '2020-06-04 14:14:16', 21, 11, '2020-06-04 14:14:16'),
(679, '2020-06-04 14:14:16', 22, 11, '2020-06-04 14:14:16'),
(680, '2020-06-04 14:14:16', 23, 11, '2020-06-04 14:14:16'),
(681, '2020-06-04 14:14:16', 24, 11, '2020-06-04 14:14:16'),
(682, '2020-06-04 14:14:16', 25, 11, '2020-06-04 14:14:16'),
(683, '2020-06-04 14:14:16', 26, 11, '2020-06-04 14:14:16'),
(684, '2020-06-04 14:14:16', 27, 11, '2020-06-04 14:14:16'),
(685, '2020-06-04 14:14:16', 28, 11, '2020-06-04 14:14:16'),
(686, '2020-06-04 14:14:16', 29, 11, '2020-06-04 14:14:16'),
(687, '2020-06-04 14:14:16', 30, 11, '2020-06-04 14:14:16'),
(688, '2020-06-04 14:14:16', 31, 11, '2020-06-04 14:14:16'),
(689, '2020-06-04 14:14:16', 32, 11, '2020-06-04 14:14:16'),
(690, '2020-06-04 14:14:16', 33, 11, '2020-06-04 14:14:16'),
(691, '2020-06-04 14:14:16', 34, 11, '2020-06-04 14:14:16'),
(692, '2020-06-04 14:14:16', 35, 11, '2020-06-04 14:14:16'),
(693, '2020-06-04 14:14:16', 36, 11, '2020-06-04 14:14:16'),
(694, '2020-06-04 14:14:16', 37, 11, '2020-06-04 14:14:16'),
(695, '2020-06-04 14:14:16', 38, 11, '2020-06-04 14:14:16'),
(696, '2020-06-04 14:14:16', 39, 11, '2020-06-04 14:14:16'),
(697, '2020-06-04 14:14:16', 40, 11, '2020-06-04 14:14:16'),
(698, '2020-06-04 14:14:16', 41, 11, '2020-06-04 14:14:16'),
(699, '2020-06-04 14:14:16', 42, 11, '2020-06-04 14:14:16'),
(700, '2020-06-04 14:14:16', 43, 11, '2020-06-04 14:14:16'),
(701, '2020-06-04 14:14:16', 44, 11, '2020-06-04 14:14:16'),
(702, '2020-06-04 14:14:16', 47, 11, '2020-06-04 14:14:16'),
(703, '2020-06-04 14:14:16', 48, 11, '2020-06-04 14:14:16'),
(704, '2020-06-04 14:14:16', 49, 11, '2020-06-04 14:14:16'),
(705, '2020-06-04 14:14:16', 50, 11, '2020-06-04 14:14:16'),
(706, '2020-06-04 14:15:16', 1, 12, '2020-06-04 14:15:16'),
(707, '2020-06-04 14:15:16', 2, 12, '2020-06-04 14:15:16'),
(708, '2020-06-04 14:15:16', 3, 12, '2020-06-04 14:15:16'),
(709, '2020-06-04 14:15:16', 4, 12, '2020-06-04 14:15:16'),
(710, '2020-06-04 14:15:16', 5, 12, '2020-06-04 14:15:16'),
(711, '2020-06-04 14:15:16', 6, 12, '2020-06-04 14:15:16'),
(712, '2020-06-04 14:15:16', 7, 12, '2020-06-04 14:15:16'),
(713, '2020-06-04 14:15:16', 8, 12, '2020-06-04 14:15:16'),
(714, '2020-06-04 14:15:16', 9, 12, '2020-06-04 14:15:16'),
(715, '2020-06-04 14:15:16', 10, 12, '2020-06-04 14:15:16'),
(716, '2020-06-04 14:15:16', 11, 12, '2020-06-04 14:15:16'),
(717, '2020-06-04 14:15:16', 12, 12, '2020-06-04 14:15:16'),
(718, '2020-06-04 14:15:16', 13, 12, '2020-06-04 14:15:16'),
(719, '2020-06-04 14:15:16', 14, 12, '2020-06-04 14:15:16'),
(720, '2020-06-04 14:15:16', 15, 12, '2020-06-04 14:15:16'),
(721, '2020-06-04 14:15:16', 16, 12, '2020-06-04 14:15:16'),
(722, '2020-06-04 14:15:16', 17, 12, '2020-06-04 14:15:16'),
(723, '2020-06-04 14:15:16', 18, 12, '2020-06-04 14:15:16'),
(724, '2020-06-04 14:15:16', 19, 12, '2020-06-04 14:15:16'),
(725, '2020-06-04 14:15:16', 20, 12, '2020-06-04 14:15:16'),
(726, '2020-06-04 14:15:16', 21, 12, '2020-06-04 14:15:16'),
(727, '2020-06-04 14:15:16', 22, 12, '2020-06-04 14:15:16'),
(728, '2020-06-04 14:15:16', 23, 12, '2020-06-04 14:15:16'),
(729, '2020-06-04 14:15:16', 24, 12, '2020-06-04 14:15:16'),
(730, '2020-06-04 14:15:16', 25, 12, '2020-06-04 14:15:16'),
(731, '2020-06-04 14:15:16', 26, 12, '2020-06-04 14:15:16'),
(732, '2020-06-04 14:15:16', 27, 12, '2020-06-04 14:15:16'),
(733, '2020-06-04 14:15:16', 28, 12, '2020-06-04 14:15:16'),
(734, '2020-06-04 14:15:16', 29, 12, '2020-06-04 14:15:16'),
(735, '2020-06-04 14:15:16', 30, 12, '2020-06-04 14:15:16'),
(736, '2020-06-04 14:15:16', 31, 12, '2020-06-04 14:15:16'),
(737, '2020-06-04 14:15:16', 32, 12, '2020-06-04 14:15:16'),
(738, '2020-06-04 14:15:16', 33, 12, '2020-06-04 14:15:16'),
(739, '2020-06-04 14:15:16', 34, 12, '2020-06-04 14:15:16'),
(740, '2020-06-04 14:15:16', 35, 12, '2020-06-04 14:15:16'),
(741, '2020-06-04 14:15:16', 36, 12, '2020-06-04 14:15:16'),
(742, '2020-06-04 14:15:16', 37, 12, '2020-06-04 14:15:16'),
(743, '2020-06-04 14:15:16', 38, 12, '2020-06-04 14:15:16'),
(744, '2020-06-04 14:15:16', 39, 12, '2020-06-04 14:15:16'),
(745, '2020-06-04 14:15:16', 40, 12, '2020-06-04 14:15:16'),
(746, '2020-06-04 14:15:16', 41, 12, '2020-06-04 14:15:16'),
(747, '2020-06-04 14:15:16', 42, 12, '2020-06-04 14:15:16'),
(748, '2020-06-04 14:15:16', 43, 12, '2020-06-04 14:15:16'),
(749, '2020-06-04 14:15:16', 44, 12, '2020-06-04 14:15:16'),
(750, '2020-06-04 14:15:16', 47, 12, '2020-06-04 14:15:16'),
(751, '2020-06-04 14:15:16', 48, 12, '2020-06-04 14:15:16'),
(752, '2020-06-04 14:15:16', 49, 12, '2020-06-04 14:15:16'),
(753, '2020-06-04 14:15:16', 50, 12, '2020-06-04 14:15:16'),
(754, '2020-06-04 14:17:37', 1, 13, '2020-06-04 14:17:37'),
(755, '2020-06-04 14:17:37', 2, 13, '2020-06-04 14:17:37'),
(756, '2020-06-04 14:17:37', 3, 13, '2020-06-04 14:17:37'),
(757, '2020-06-04 14:17:37', 4, 13, '2020-06-04 14:17:37'),
(758, '2020-06-04 14:17:37', 5, 13, '2020-06-04 14:17:37'),
(759, '2020-06-04 14:17:37', 6, 13, '2020-06-04 14:17:37'),
(760, '2020-06-04 14:17:37', 7, 13, '2020-06-04 14:17:37'),
(761, '2020-06-04 14:17:37', 8, 13, '2020-06-04 14:17:37'),
(762, '2020-06-04 14:17:37', 9, 13, '2020-06-04 14:17:37'),
(763, '2020-06-04 14:17:37', 10, 13, '2020-06-04 14:17:37'),
(764, '2020-06-04 14:17:37', 19, 13, '2020-06-04 14:17:37'),
(765, '2020-06-04 14:17:37', 21, 13, '2020-06-04 14:17:37'),
(766, '2020-06-04 14:17:37', 22, 13, '2020-06-04 14:17:37'),
(767, '2020-06-04 14:17:37', 28, 13, '2020-06-04 14:17:37'),
(768, '2020-06-04 14:17:37', 29, 13, '2020-06-04 14:17:37'),
(769, '2020-06-04 14:17:37', 30, 13, '2020-06-04 14:17:37'),
(770, '2020-06-04 14:17:37', 31, 13, '2020-06-04 14:17:37'),
(771, '2020-06-04 14:17:37', 32, 13, '2020-06-04 14:17:37'),
(772, '2020-06-04 14:17:37', 33, 13, '2020-06-04 14:17:37'),
(773, '2020-06-04 14:17:37', 34, 13, '2020-06-04 14:17:37'),
(774, '2020-06-04 14:17:37', 35, 13, '2020-06-04 14:17:37'),
(775, '2020-06-04 14:17:37', 36, 13, '2020-06-04 14:17:37'),
(776, '2020-06-04 14:17:37', 37, 13, '2020-06-04 14:17:37'),
(777, '2020-06-04 14:17:37', 38, 13, '2020-06-04 14:17:37'),
(778, '2020-06-04 14:17:37', 39, 13, '2020-06-04 14:17:37'),
(779, '2020-06-04 14:17:37', 40, 13, '2020-06-04 14:17:37'),
(780, '2020-06-04 14:17:37', 41, 13, '2020-06-04 14:17:37'),
(781, '2020-06-04 14:17:37', 42, 13, '2020-06-04 14:17:37'),
(782, '2020-06-04 14:17:37', 43, 13, '2020-06-04 14:17:37'),
(783, '2020-06-04 14:17:37', 44, 13, '2020-06-04 14:17:37'),
(784, '2020-06-04 14:17:37', 47, 13, '2020-06-04 14:17:37'),
(785, '2020-06-04 14:17:37', 48, 13, '2020-06-04 14:17:37'),
(786, '2020-06-04 14:17:37', 49, 13, '2020-06-04 14:17:37'),
(787, '2020-06-04 14:17:37', 50, 13, '2020-06-04 14:17:37'),
(918, '2020-09-26 20:30:18', 1, 2, '2020-09-26 20:30:18'),
(919, '2020-09-26 20:30:18', 2, 2, '2020-09-26 20:30:18'),
(920, '2020-09-26 20:30:18', 3, 2, '2020-09-26 20:30:18'),
(921, '2020-09-26 20:30:18', 4, 2, '2020-09-26 20:30:18'),
(922, '2020-09-26 20:30:18', 5, 2, '2020-09-26 20:30:18'),
(923, '2020-09-26 20:30:18', 6, 2, '2020-09-26 20:30:18'),
(924, '2020-09-26 20:30:18', 7, 2, '2020-09-26 20:30:18'),
(925, '2020-09-26 20:30:18', 8, 2, '2020-09-26 20:30:18'),
(926, '2020-09-26 20:30:18', 9, 2, '2020-09-26 20:30:18'),
(927, '2020-09-26 20:30:18', 54, 2, '2020-09-26 20:30:18'),
(928, '2020-09-26 20:30:18', 10, 2, '2020-09-26 20:30:18'),
(929, '2020-09-26 20:30:18', 12, 2, '2020-09-26 20:30:18'),
(930, '2020-09-26 20:30:18', 13, 2, '2020-09-26 20:30:18'),
(931, '2020-09-26 20:30:18', 14, 2, '2020-09-26 20:30:18'),
(932, '2020-09-26 20:30:18', 15, 2, '2020-09-26 20:30:18'),
(933, '2020-09-26 20:30:18', 16, 2, '2020-09-26 20:30:18'),
(934, '2020-09-26 20:30:18', 17, 2, '2020-09-26 20:30:18'),
(935, '2020-09-26 20:30:18', 18, 2, '2020-09-26 20:30:18'),
(936, '2020-09-26 20:30:18', 19, 2, '2020-09-26 20:30:18'),
(937, '2020-09-26 20:30:18', 20, 2, '2020-09-26 20:30:18'),
(938, '2020-09-26 20:30:18', 21, 2, '2020-09-26 20:30:18'),
(939, '2020-09-26 20:30:18', 22, 2, '2020-09-26 20:30:18'),
(940, '2020-09-26 20:30:18', 23, 2, '2020-09-26 20:30:18'),
(941, '2020-09-26 20:30:18', 24, 2, '2020-09-26 20:30:18'),
(942, '2020-09-26 20:30:18', 25, 2, '2020-09-26 20:30:18'),
(943, '2020-09-26 20:30:18', 26, 2, '2020-09-26 20:30:18'),
(944, '2020-09-26 20:30:18', 27, 2, '2020-09-26 20:30:18'),
(945, '2020-09-26 20:30:18', 28, 2, '2020-09-26 20:30:18'),
(946, '2020-09-26 20:30:18', 29, 2, '2020-09-26 20:30:18'),
(947, '2020-09-26 20:30:18', 30, 2, '2020-09-26 20:30:18'),
(948, '2020-09-26 20:30:18', 31, 2, '2020-09-26 20:30:18'),
(949, '2020-09-26 20:30:18', 32, 2, '2020-09-26 20:30:18'),
(950, '2020-09-26 20:30:18', 33, 2, '2020-09-26 20:30:18'),
(951, '2020-09-26 20:30:18', 34, 2, '2020-09-26 20:30:18'),
(952, '2020-09-26 20:30:18', 35, 2, '2020-09-26 20:30:18'),
(953, '2020-09-26 20:30:18', 36, 2, '2020-09-26 20:30:18'),
(954, '2020-09-26 20:30:18', 37, 2, '2020-09-26 20:30:18'),
(955, '2020-09-26 20:30:18', 38, 2, '2020-09-26 20:30:18'),
(956, '2020-09-26 20:30:18', 39, 2, '2020-09-26 20:30:18'),
(957, '2020-09-26 20:30:18', 40, 2, '2020-09-26 20:30:18'),
(958, '2020-09-26 20:30:18', 41, 2, '2020-09-26 20:30:18'),
(959, '2020-09-26 20:30:18', 42, 2, '2020-09-26 20:30:18'),
(960, '2020-09-26 20:30:18', 43, 2, '2020-09-26 20:30:18'),
(961, '2020-09-26 20:30:18', 44, 2, '2020-09-26 20:30:18'),
(962, '2020-09-26 20:30:18', 47, 2, '2020-09-26 20:30:18'),
(963, '2020-09-26 20:30:18', 48, 2, '2020-09-26 20:30:18'),
(964, '2020-09-26 20:30:18', 49, 2, '2020-09-26 20:30:18'),
(965, '2020-09-26 20:30:18', 50, 2, '2020-09-26 20:30:18'),
(966, '2020-09-26 20:30:18', 52, 2, '2020-09-26 20:30:18'),
(967, '2020-09-26 20:30:18', 45, 2, '2020-09-26 20:30:18'),
(968, '2020-09-26 20:30:18', 46, 2, '2020-09-26 20:30:18'),
(969, '2020-09-26 20:30:18', 53, 2, '2020-09-26 20:30:18'),
(970, '2020-09-26 20:30:18', 55, 2, '2020-09-26 20:30:18'),
(971, '2020-09-26 20:30:18', 11, 2, '2020-09-26 20:30:18'),
(972, '2020-09-26 20:30:18', 56, 2, '2020-09-26 20:30:18'),
(973, '2020-09-26 20:30:18', 57, 2, '2020-09-26 20:30:18'),
(974, '2020-09-26 20:30:18', 58, 2, '2020-09-26 20:30:18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`idAbono`);

--
-- Indices de la tabla `abonos_detalle`
--
ALTER TABLE `abonos_detalle`
  ADD PRIMARY KEY (`idDetalleAbono`);

--
-- Indices de la tabla `abonos_logs`
--
ALTER TABLE `abonos_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `abono_modalidades`
--
ALTER TABLE `abono_modalidades`
  ADD PRIMARY KEY (`idAbonoModalidad`);

--
-- Indices de la tabla `arqueo_cajas`
--
ALTER TABLE `arqueo_cajas`
  ADD PRIMARY KEY (`idArqueoCajas`);

--
-- Indices de la tabla `arqueo_cajas_depositos`
--
ALTER TABLE `arqueo_cajas_depositos`
  ADD PRIMARY KEY (`idDeposito`);

--
-- Indices de la tabla `cadetes`
--
ALTER TABLE `cadetes`
  ADD PRIMARY KEY (`idCadete`);

--
-- Indices de la tabla `cajas_ingresos_egresos`
--
ALTER TABLE `cajas_ingresos_egresos`
  ADD PRIMARY KEY (`IdIngEgr`);

--
-- Indices de la tabla `categorias_compras`
--
ALTER TABLE `categorias_compras`
  ADD PRIMARY KEY (`idCategoriaCompras`);

--
-- Indices de la tabla `categorias_compra_detalle`
--
ALTER TABLE `categorias_compra_detalle`
  ADD PRIMARY KEY (`idCategoriaCompraDetalle`);

--
-- Indices de la tabla `categorias_gastos_general`
--
ALTER TABLE `categorias_gastos_general`
  ADD PRIMARY KEY (`idCategoriaGastos`);

--
-- Indices de la tabla `categorias_subcategorias_compra_detalle`
--
ALTER TABLE `categorias_subcategorias_compra_detalle`
  ADD PRIMARY KEY (`idSubcategoriaCompra`);

--
-- Indices de la tabla `categorias_subcategorias_venta_detalle`
--
ALTER TABLE `categorias_subcategorias_venta_detalle`
  ADD PRIMARY KEY (`idSubcategoriaVenta`);

--
-- Indices de la tabla `categorias_ventas`
--
ALTER TABLE `categorias_ventas`
  ADD PRIMARY KEY (`idCategoriaVentas`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `clientes_cuenta_corriente`
--
ALTER TABLE `clientes_cuenta_corriente`
  ADD PRIMARY KEY (`idCuentaCorriente`);

--
-- Indices de la tabla `clientes_detalle_facturacion`
--
ALTER TABLE `clientes_detalle_facturacion`
  ADD PRIMARY KEY (`idDetalleFacturacion`);

--
-- Indices de la tabla `clientes_detalle_ventas`
--
ALTER TABLE `clientes_detalle_ventas`
  ADD PRIMARY KEY (`idDetalleVenta`);

--
-- Indices de la tabla `comprobantes_tipos`
--
ALTER TABLE `comprobantes_tipos`
  ADD PRIMARY KEY (`idTipoComprobante`);

--
-- Indices de la tabla `condicion_facturacion`
--
ALTER TABLE `condicion_facturacion`
  ADD PRIMARY KEY (`idCondicionFacturacion`);

--
-- Indices de la tabla `configuraciones_ecommerce`
--
ALTER TABLE `configuraciones_ecommerce`
  ADD PRIMARY KEY (`idConfiguracionEcommerce`);

--
-- Indices de la tabla `configuraciones_ecommerce_imagenes`
--
ALTER TABLE `configuraciones_ecommerce_imagenes`
  ADD PRIMARY KEY (`idImagenConfiguracionEcommer`);

--
-- Indices de la tabla `documentos_tipos`
--
ALTER TABLE `documentos_tipos`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`idEgreso`);

--
-- Indices de la tabla `egresos_detalle`
--
ALTER TABLE `egresos_detalle`
  ADD PRIMARY KEY (`idDetalleEgreso`);

--
-- Indices de la tabla `egresos_estados`
--
ALTER TABLE `egresos_estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `egresos_tipos`
--
ALTER TABLE `egresos_tipos`
  ADD PRIMARY KEY (`IdTipoEgreso`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `envios_costos`
--
ALTER TABLE `envios_costos`
  ADD PRIMARY KEY (`idEnvioCosto`);

--
-- Indices de la tabla `estados_abonos`
--
ALTER TABLE `estados_abonos`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `estados_ingresos`
--
ALTER TABLE `estados_ingresos`
  ADD PRIMARY KEY (`idEstadoIngresos`);

--
-- Indices de la tabla `estados_ingresos_egresos`
--
ALTER TABLE `estados_ingresos_egresos`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`idCivil`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `factura_tipos`
--
ALTER TABLE `factura_tipos`
  ADD PRIMARY KEY (`idTipoFactura`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`idGasto`);

--
-- Indices de la tabla `gastos_categorias`
--
ALTER TABLE `gastos_categorias`
  ADD PRIMARY KEY (`idCategoriaGasto`);

--
-- Indices de la tabla `gastos_estados`
--
ALTER TABLE `gastos_estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `gastos_subcategorias`
--
ALTER TABLE `gastos_subcategorias`
  ADD PRIMARY KEY (`idSubCatGasto`);

--
-- Indices de la tabla `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`idHistorico`);

--
-- Indices de la tabla `historico_operacion`
--
ALTER TABLE `historico_operacion`
  ADD PRIMARY KEY (`idOperacion`);

--
-- Indices de la tabla `historico_precio`
--
ALTER TABLE `historico_precio`
  ADD PRIMARY KEY (`idHistoricoPrecio`);

--
-- Indices de la tabla `historico_tipo`
--
ALTER TABLE `historico_tipo`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`idIngrediente`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`idIngreso`);

--
-- Indices de la tabla `ingresos_detalle`
--
ALTER TABLE `ingresos_detalle`
  ADD PRIMARY KEY (`idDetalleIngreso`);

--
-- Indices de la tabla `iva_condiciones`
--
ALTER TABLE `iva_condiciones`
  ADD PRIMARY KEY (`idCondicionIva`);

--
-- Indices de la tabla `iva_tipos`
--
ALTER TABLE `iva_tipos`
  ADD PRIMARY KEY (`idIva`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idLocalidad`);

--
-- Indices de la tabla `medios_pagos`
--
ALTER TABLE `medios_pagos`
  ADD PRIMARY KEY (`idMedioPago`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `menu_nivel`
--
ALTER TABLE `menu_nivel`
  ADD PRIMARY KEY (`idMenuNivel`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas_estado`
--
ALTER TABLE `mesas_estado`
  ADD PRIMARY KEY (`idEstadoMesa`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`idMovimiento`);

--
-- Indices de la tabla `movimientos_stock`
--
ALTER TABLE `movimientos_stock`
  ADD PRIMARY KEY (`idMovimientoStock`);

--
-- Indices de la tabla `movimientos_stock_tipo`
--
ALTER TABLE `movimientos_stock_tipo`
  ADD PRIMARY KEY (`idMovimientoStockTipo`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`idNivel`);

--
-- Indices de la tabla `notas_credito`
--
ALTER TABLE `notas_credito`
  ADD PRIMARY KEY (`idNotaCredito`);

--
-- Indices de la tabla `notas_credito_afip`
--
ALTER TABLE `notas_credito_afip`
  ADD PRIMARY KEY (`idNotaCreditoAfip`);

--
-- Indices de la tabla `notas_credito_detalle`
--
ALTER TABLE `notas_credito_detalle`
  ADD PRIMARY KEY (`idDetalleNotaCredito`);

--
-- Indices de la tabla `notas_credito_estado`
--
ALTER TABLE `notas_credito_estado`
  ADD PRIMARY KEY (`idEstadoNotaDebito`);

--
-- Indices de la tabla `notas_credito_proveedores`
--
ALTER TABLE `notas_credito_proveedores`
  ADD PRIMARY KEY (`idNotaCredito`);

--
-- Indices de la tabla `notas_credito_proveedores_afip`
--
ALTER TABLE `notas_credito_proveedores_afip`
  ADD PRIMARY KEY (`idNotaCreditoAfip`);

--
-- Indices de la tabla `notas_credito_proveedores_detalle`
--
ALTER TABLE `notas_credito_proveedores_detalle`
  ADD PRIMARY KEY (`idDetalleNotaCredito`);

--
-- Indices de la tabla `notas_credito_proveedores_estado`
--
ALTER TABLE `notas_credito_proveedores_estado`
  ADD PRIMARY KEY (`idEstadoNotaDebito`);

--
-- Indices de la tabla `notas_debito`
--
ALTER TABLE `notas_debito`
  ADD PRIMARY KEY (`idNotaDebito`);

--
-- Indices de la tabla `notas_debito_afip`
--
ALTER TABLE `notas_debito_afip`
  ADD PRIMARY KEY (`idNotaDebitoAfip`);

--
-- Indices de la tabla `notas_debito_detalle`
--
ALTER TABLE `notas_debito_detalle`
  ADD PRIMARY KEY (`idDetalleNotaDebito`);

--
-- Indices de la tabla `notas_debito_estado`
--
ALTER TABLE `notas_debito_estado`
  ADD PRIMARY KEY (`idEstadoNotaDebito`);

--
-- Indices de la tabla `notas_debito_proveedores`
--
ALTER TABLE `notas_debito_proveedores`
  ADD PRIMARY KEY (`idNotaDebito`);

--
-- Indices de la tabla `notas_debito_proveedores_afip`
--
ALTER TABLE `notas_debito_proveedores_afip`
  ADD PRIMARY KEY (`idNotaDebitoAfip`);

--
-- Indices de la tabla `notas_debito_proveedores_detalle`
--
ALTER TABLE `notas_debito_proveedores_detalle`
  ADD PRIMARY KEY (`idDetalleNotaDebito`);

--
-- Indices de la tabla `notas_debito_proveedores_estado`
--
ALTER TABLE `notas_debito_proveedores_estado`
  ADD PRIMARY KEY (`idEstadoNotaDebito`);

--
-- Indices de la tabla `notas_tipos`
--
ALTER TABLE `notas_tipos`
  ADD PRIMARY KEY (`idTipoNota`);

--
-- Indices de la tabla `notas_tipos_proveedores`
--
ALTER TABLE `notas_tipos_proveedores`
  ADD PRIMARY KEY (`idTipoNota`);

--
-- Indices de la tabla `notificaciones_egresos`
--
ALTER TABLE `notificaciones_egresos`
  ADD PRIMARY KEY (`idNotificacionEgreso`);

--
-- Indices de la tabla `notificaciones_gastos`
--
ALTER TABLE `notificaciones_gastos`
  ADD PRIMARY KEY (`idNotificacionGasto`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGenProducto` (`idGenProducto`,`idPedido`,`numeroTicket`);

--
-- Indices de la tabla `pedidos_estado`
--
ALTER TABLE `pedidos_estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `pedidos_tabs`
--
ALTER TABLE `pedidos_tabs`
  ADD PRIMARY KEY (`idTab`);

--
-- Indices de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`idPresupuesto`);

--
-- Indices de la tabla `presupuesto_detalle`
--
ALTER TABLE `presupuesto_detalle`
  ADD PRIMARY KEY (`idDetallePresupuesto`);

--
-- Indices de la tabla `presupuesto_estado`
--
ALTER TABLE `presupuesto_estado`
  ADD PRIMARY KEY (`idEstadoPresupuesto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `productos_categorias`
--
ALTER TABLE `productos_categorias`
  ADD PRIMARY KEY (`idCategoriaProducto`);

--
-- Indices de la tabla `productos_img`
--
ALTER TABLE `productos_img`
  ADD PRIMARY KEY (`idProductoImg`);

--
-- Indices de la tabla `productos_ingredientes`
--
ALTER TABLE `productos_ingredientes`
  ADD PRIMARY KEY (`idProductoIngrediente`);

--
-- Indices de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  ADD PRIMARY KEY (`idSubProducto`),
  ADD KEY `idGenProducto` (`idGenProducto`,`idGenSubProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `proveedores_contactos`
--
ALTER TABLE `proveedores_contactos`
  ADD PRIMARY KEY (`idProvContacto`);

--
-- Indices de la tabla `proveedores_cuenta_corriente`
--
ALTER TABLE `proveedores_cuenta_corriente`
  ADD PRIMARY KEY (`idCuentaCorriente`);

--
-- Indices de la tabla `proveedores_detalle_compras`
--
ALTER TABLE `proveedores_detalle_compras`
  ADD PRIMARY KEY (`idDetalleVenta`);

--
-- Indices de la tabla `proveedores_detalle_facturacion`
--
ALTER TABLE `proveedores_detalle_facturacion`
  ADD PRIMARY KEY (`idDetalleFacturacion`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idProvincia`);

--
-- Indices de la tabla `puntos_ventas`
--
ALTER TABLE `puntos_ventas`
  ADD PRIMARY KEY (`idPtoVenta`);

--
-- Indices de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  ADD PRIMARY KEY (`idRazonSocial`);

--
-- Indices de la tabla `remitos`
--
ALTER TABLE `remitos`
  ADD PRIMARY KEY (`idRemito`);

--
-- Indices de la tabla `remitos_detalle`
--
ALTER TABLE `remitos_detalle`
  ADD PRIMARY KEY (`idDetalleRemito`);

--
-- Indices de la tabla `remitos_tipo`
--
ALTER TABLE `remitos_tipo`
  ADD PRIMARY KEY (`idTipoRemito`);

--
-- Indices de la tabla `session_logs`
--
ALTER TABLE `session_logs`
  ADD PRIMARY KEY (`idLog`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`idSexo`);

--
-- Indices de la tabla `tesoreria_cuentas`
--
ALTER TABLE `tesoreria_cuentas`
  ADD PRIMARY KEY (`idCuenta`);

--
-- Indices de la tabla `tesoreria_tipo_cuenta`
--
ALTER TABLE `tesoreria_tipo_cuenta`
  ADD PRIMARY KEY (`idTipoCuenta`);

--
-- Indices de la tabla `tipo_interna`
--
ALTER TABLE `tipo_interna`
  ADD PRIMARY KEY (`idTipoInterna`);

--
-- Indices de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  ADD PRIMARY KEY (`idTipoMoneda`);

--
-- Indices de la tabla `transportistas`
--
ALTER TABLE `transportistas`
  ADD PRIMARY KEY (`idTransportista`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `usuario_menu_admin`
--
ALTER TABLE `usuario_menu_admin`
  ADD PRIMARY KEY (`idUsuarioMenuAdmin`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `idAbono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `abonos_detalle`
--
ALTER TABLE `abonos_detalle`
  MODIFY `idDetalleAbono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `abonos_logs`
--
ALTER TABLE `abonos_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `abono_modalidades`
--
ALTER TABLE `abono_modalidades`
  MODIFY `idAbonoModalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `arqueo_cajas`
--
ALTER TABLE `arqueo_cajas`
  MODIFY `idArqueoCajas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `arqueo_cajas_depositos`
--
ALTER TABLE `arqueo_cajas_depositos`
  MODIFY `idDeposito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cadetes`
--
ALTER TABLE `cadetes`
  MODIFY `idCadete` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajas_ingresos_egresos`
--
ALTER TABLE `cajas_ingresos_egresos`
  MODIFY `IdIngEgr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `categorias_compras`
--
ALTER TABLE `categorias_compras`
  MODIFY `idCategoriaCompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias_compra_detalle`
--
ALTER TABLE `categorias_compra_detalle`
  MODIFY `idCategoriaCompraDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_gastos_general`
--
ALTER TABLE `categorias_gastos_general`
  MODIFY `idCategoriaGastos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_subcategorias_compra_detalle`
--
ALTER TABLE `categorias_subcategorias_compra_detalle`
  MODIFY `idSubcategoriaCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_subcategorias_venta_detalle`
--
ALTER TABLE `categorias_subcategorias_venta_detalle`
  MODIFY `idSubcategoriaVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias_ventas`
--
ALTER TABLE `categorias_ventas`
  MODIFY `idCategoriaVentas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes_cuenta_corriente`
--
ALTER TABLE `clientes_cuenta_corriente`
  MODIFY `idCuentaCorriente` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `clientes_detalle_facturacion`
--
ALTER TABLE `clientes_detalle_facturacion`
  MODIFY `idDetalleFacturacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes_detalle_ventas`
--
ALTER TABLE `clientes_detalle_ventas`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comprobantes_tipos`
--
ALTER TABLE `comprobantes_tipos`
  MODIFY `idTipoComprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `condicion_facturacion`
--
ALTER TABLE `condicion_facturacion`
  MODIFY `idCondicionFacturacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuraciones_ecommerce`
--
ALTER TABLE `configuraciones_ecommerce`
  MODIFY `idConfiguracionEcommerce` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuraciones_ecommerce_imagenes`
--
ALTER TABLE `configuraciones_ecommerce_imagenes`
  MODIFY `idImagenConfiguracionEcommer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_tipos`
--
ALTER TABLE `documentos_tipos`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `idEgreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `egresos_detalle`
--
ALTER TABLE `egresos_detalle`
  MODIFY `idDetalleEgreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `egresos_estados`
--
ALTER TABLE `egresos_estados`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `egresos_tipos`
--
ALTER TABLE `egresos_tipos`
  MODIFY `IdTipoEgreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `envios_costos`
--
ALTER TABLE `envios_costos`
  MODIFY `idEnvioCosto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados_abonos`
--
ALTER TABLE `estados_abonos`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados_ingresos`
--
ALTER TABLE `estados_ingresos`
  MODIFY `idEstadoIngresos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados_ingresos_egresos`
--
ALTER TABLE `estados_ingresos_egresos`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `idCivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura_tipos`
--
ALTER TABLE `factura_tipos`
  MODIFY `idTipoFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `idGasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gastos_categorias`
--
ALTER TABLE `gastos_categorias`
  MODIFY `idCategoriaGasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gastos_estados`
--
ALTER TABLE `gastos_estados`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `gastos_subcategorias`
--
ALTER TABLE `gastos_subcategorias`
  MODIFY `idSubCatGasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historico`
--
ALTER TABLE `historico`
  MODIFY `idHistorico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `historico_operacion`
--
ALTER TABLE `historico_operacion`
  MODIFY `idOperacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `historico_precio`
--
ALTER TABLE `historico_precio`
  MODIFY `idHistoricoPrecio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `historico_tipo`
--
ALTER TABLE `historico_tipo`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `idIngrediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `idIngreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `ingresos_detalle`
--
ALTER TABLE `ingresos_detalle`
  MODIFY `idDetalleIngreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `iva_condiciones`
--
ALTER TABLE `iva_condiciones`
  MODIFY `idCondicionIva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `iva_tipos`
--
ALTER TABLE `iva_tipos`
  MODIFY `idIva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `idLocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2387;

--
-- AUTO_INCREMENT de la tabla `medios_pagos`
--
ALTER TABLE `medios_pagos`
  MODIFY `idMedioPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `menu_nivel`
--
ALTER TABLE `menu_nivel`
  MODIFY `idMenuNivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1718;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas_estado`
--
ALTER TABLE `mesas_estado`
  MODIFY `idEstadoMesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_stock`
--
ALTER TABLE `movimientos_stock`
  MODIFY `idMovimientoStock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `movimientos_stock_tipo`
--
ALTER TABLE `movimientos_stock_tipo`
  MODIFY `idMovimientoStockTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `idNivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `notas_credito`
--
ALTER TABLE `notas_credito`
  MODIFY `idNotaCredito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notas_credito_afip`
--
ALTER TABLE `notas_credito_afip`
  MODIFY `idNotaCreditoAfip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_credito_detalle`
--
ALTER TABLE `notas_credito_detalle`
  MODIFY `idDetalleNotaCredito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notas_credito_estado`
--
ALTER TABLE `notas_credito_estado`
  MODIFY `idEstadoNotaDebito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_credito_proveedores`
--
ALTER TABLE `notas_credito_proveedores`
  MODIFY `idNotaCredito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_credito_proveedores_afip`
--
ALTER TABLE `notas_credito_proveedores_afip`
  MODIFY `idNotaCreditoAfip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_credito_proveedores_detalle`
--
ALTER TABLE `notas_credito_proveedores_detalle`
  MODIFY `idDetalleNotaCredito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_credito_proveedores_estado`
--
ALTER TABLE `notas_credito_proveedores_estado`
  MODIFY `idEstadoNotaDebito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_debito`
--
ALTER TABLE `notas_debito`
  MODIFY `idNotaDebito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notas_debito_afip`
--
ALTER TABLE `notas_debito_afip`
  MODIFY `idNotaDebitoAfip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_debito_detalle`
--
ALTER TABLE `notas_debito_detalle`
  MODIFY `idDetalleNotaDebito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notas_debito_estado`
--
ALTER TABLE `notas_debito_estado`
  MODIFY `idEstadoNotaDebito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_debito_proveedores`
--
ALTER TABLE `notas_debito_proveedores`
  MODIFY `idNotaDebito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_debito_proveedores_afip`
--
ALTER TABLE `notas_debito_proveedores_afip`
  MODIFY `idNotaDebitoAfip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_debito_proveedores_detalle`
--
ALTER TABLE `notas_debito_proveedores_detalle`
  MODIFY `idDetalleNotaDebito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_debito_proveedores_estado`
--
ALTER TABLE `notas_debito_proveedores_estado`
  MODIFY `idEstadoNotaDebito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas_tipos`
--
ALTER TABLE `notas_tipos`
  MODIFY `idTipoNota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `notas_tipos_proveedores`
--
ALTER TABLE `notas_tipos_proveedores`
  MODIFY `idTipoNota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones_egresos`
--
ALTER TABLE `notificaciones_egresos`
  MODIFY `idNotificacionEgreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones_gastos`
--
ALTER TABLE `notificaciones_gastos`
  MODIFY `idNotificacionGasto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_estado`
--
ALTER TABLE `pedidos_estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidos_tabs`
--
ALTER TABLE `pedidos_tabs`
  MODIFY `idTab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  MODIFY `idPresupuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `presupuesto_detalle`
--
ALTER TABLE `presupuesto_detalle`
  MODIFY `idDetallePresupuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `presupuesto_estado`
--
ALTER TABLE `presupuesto_estado`
  MODIFY `idEstadoPresupuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos_categorias`
--
ALTER TABLE `productos_categorias`
  MODIFY `idCategoriaProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos_img`
--
ALTER TABLE `productos_img`
  MODIFY `idProductoImg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_ingredientes`
--
ALTER TABLE `productos_ingredientes`
  MODIFY `idProductoIngrediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  MODIFY `idSubProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores_contactos`
--
ALTER TABLE `proveedores_contactos`
  MODIFY `idProvContacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores_cuenta_corriente`
--
ALTER TABLE `proveedores_cuenta_corriente`
  MODIFY `idCuentaCorriente` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores_detalle_compras`
--
ALTER TABLE `proveedores_detalle_compras`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores_detalle_facturacion`
--
ALTER TABLE `proveedores_detalle_facturacion`
  MODIFY `idDetalleFacturacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idProvincia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `puntos_ventas`
--
ALTER TABLE `puntos_ventas`
  MODIFY `idPtoVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  MODIFY `idRazonSocial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `remitos`
--
ALTER TABLE `remitos`
  MODIFY `idRemito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `remitos_detalle`
--
ALTER TABLE `remitos_detalle`
  MODIFY `idDetalleRemito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `remitos_tipo`
--
ALTER TABLE `remitos_tipo`
  MODIFY `idTipoRemito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `session_logs`
--
ALTER TABLE `session_logs`
  MODIFY `idLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `idSexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tesoreria_cuentas`
--
ALTER TABLE `tesoreria_cuentas`
  MODIFY `idCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `tesoreria_tipo_cuenta`
--
ALTER TABLE `tesoreria_tipo_cuenta`
  MODIFY `idTipoCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_interna`
--
ALTER TABLE `tipo_interna`
  MODIFY `idTipoInterna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  MODIFY `idTipoMoneda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `transportistas`
--
ALTER TABLE `transportistas`
  MODIFY `idTransportista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario_menu_admin`
--
ALTER TABLE `usuario_menu_admin`
  MODIFY `idUsuarioMenuAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=975;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
