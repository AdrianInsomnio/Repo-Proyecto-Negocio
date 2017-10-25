-- DROP TABLE IF EXISTS  xxxxx;
-- CREATE TABLE  xxxxx(

-- PRIMARY KEY ()
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `Ivas`
--
USE APPSIS;
SET FOREIGN_KEY_CHECKS=0;


--
-- Table structure for table `ArticulosBarras`
--

DROP TABLE IF EXISTS `ArticulosBarras`;
CREATE TABLE `ArticulosBarras` (
  `codigoArticuloBarras` varchar(45) NOT NULL,
  `codigoArticuloInterno` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigoArticuloBarras`),
  KEY `fk_CodigoArticulo` (`codigoArticuloInterno`),
  CONSTRAINT `fk_CodigoArticulo` FOREIGN KEY (`codigoArticuloInterno`) REFERENCES `Articulos` (`codigoArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS Ivas;

CREATE TABLE Ivas (
  codigoIva int(10) unsigned NOT NULL,
  descripcionIva varchar(45) DEFAULT NULL,
  porcentajeIva decimal(45,2) unsigned DEFAULT NULL,
  factorMultiplicador decimal(45,2) unsigned DEFAULT NULL,
  PRIMARY KEY (codigoIva)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ivas`
--

  LOCK TABLES Ivas WRITE;

  INSERT INTO Ivas VALUES 
  (1,'Basico',22.00,1.22),
  (2,'Minimo',10.00,1.10),
  (3,'Exento',0.00,1.00);

  UNLOCK TABLES;

--
-- ESTRUCTURA DE CONFIGURACION
--

DROP TABLE IF EXISTS  configuracion;
CREATE TABLE Configuracion(
  id varchar(45) not null,
  valor varchar(45) not null,
  descripcion varchar(45) DEFAULT 's/d',
  primary key (id)
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- ESTRUCTURA DE BANCOS
--

DROP TABLE IF EXISTS Bancos;
CREATE TABLE Bancos (
  codigoBanco int(10) unsigned NOT NULL,
  descripcionBanco varchar(45) DEFAULT NULL,
  PRIMARY KEY (codigoBanco)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- ESTRUCTURA DE CUENTAS BANCARIAS
--

DROP TABLE IF EXISTS CuentaBancaria;
CREATE TABLE CuentaBancaria (
  numeroCuentaBancaria varchar(45) NOT NULL,
  codigoBanco int(10) unsigned NOT NULL,
  descripcionCuentaBancaria varchar(45) DEFAULT NULL,
  observaciones varchar(45) DEFAULT NULL,
  PRIMARY KEY (numeroCuentaBancaria,codigoBanco),
FOREIGN KEY (codigoBanco) REFERENCES Bancos (codigoBanco) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `Monedas`
--

DROP TABLE IF EXISTS Monedas;
CREATE TABLE Monedas (
  codigoMoneda int(10) unsigned NOT NULL,
  descripcionMoneda varchar(45) DEFAULT NULL,
  codigoISO3166 varchar(10) DEFAULT NULL,
  codigoISO4217 varchar(10) DEFAULT NULL,
  simboloMoneda varchar(10) DEFAULT NULL,
  cotizacionMoneda decimal(45,8) unsigned DEFAULT NULL,
  cotizacionMonedaOficial decimal(45,8) unsigned DEFAULT NULL,
  esMonedaReferenciaSistema char(1) DEFAULT '0',
  PRIMARY KEY (codigoMoneda)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `Monedas`
--

LOCK TABLES `Monedas` WRITE;
INSERT INTO `Monedas` VALUES 
(1,'Pesos','858','UYU','$',1.00000000,0.00000000,'1'),
(2,'Dolares','840','USD','U$S',22.00000000,0.00000000,'1');
UNLOCK TABLES;


--
-- Table structure for table `PerfilesUsuarios`
--

DROP TABLE IF EXISTS `PerfilesUsuarios`;
CREATE TABLE `PerfilesUsuarios` (
  `codigoPerfil` int(10) unsigned NOT NULL,
  `descripcionPerfil` varchar(45) DEFAULT NULL,
  `permiteUsarLiquidaciones` char(1) NOT NULL DEFAULT '0',
  `permiteUsarFacturacion` char(1) NOT NULL DEFAULT '0',
  `permiteUsarArticulos` char(1) NOT NULL DEFAULT '0',
  `permiteUsarListaPrecios` char(1) NOT NULL DEFAULT '0',
  `permiteUsarClientes` char(1) NOT NULL DEFAULT '0',
  `permiteUsarDocumentos` char(1) NOT NULL DEFAULT '0',
  `permiteUsarReportes` char(1) NOT NULL DEFAULT '0',
  `permiteUsarCuentaCorriente` char(1) NOT NULL DEFAULT '0',
  `permiteUsarMenuAvanzado` char(1) NOT NULL DEFAULT '0',
  `permiteExportarAPDF` char(1) NOT NULL DEFAULT '0',
  `permiteCrearLiquidaciones` char(1) NOT NULL DEFAULT '0',
  `permiteBorrarLiquidaciones` char(1) NOT NULL DEFAULT '0',
  `permiteCerrarLiquidaciones` char(1) NOT NULL DEFAULT '0',
  `permiteAutorizarCierreLiquidaciones` char(1) NOT NULL DEFAULT '0',
  `permiteCrearFacturas` char(1) NOT NULL DEFAULT '0',
  `permiteBorrarFacturas` char(1) NOT NULL DEFAULT '0',
  `permiteAnularFacturas` char(1) NOT NULL DEFAULT '0',
  `permiteReimprimirFacturas` char(1) NOT NULL DEFAULT '0',
  `permiteCrearClientes` char(1) NOT NULL DEFAULT '0',
  `permiteBorrarClientes` char(1) NOT NULL DEFAULT '0',
  `permiteCrearArticulos` char(1) NOT NULL DEFAULT '0',
  `permiteBorrarArticulos` char(1) NOT NULL DEFAULT '0',
  `permiteCrearListaDePrecios` char(1) NOT NULL DEFAULT '0',
  `permiteBorrarListaDePrecios` char(1) NOT NULL DEFAULT '0',
  `permiteCambioRapidoDePrecios` char(1) NOT NULL DEFAULT '0',
  `permiteAutorizarDescuentosArticulo` char(1) NOT NULL DEFAULT '0',
  `permiteAutorizarDescuentosTotal` char(1) NOT NULL DEFAULT '0',
  `permiteAutorizarAnulaciones` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigoPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PerfilesUsuarios`
--

LOCK TABLES `PerfilesUsuarios` WRITE;
/*!40000 ALTER TABLE `PerfilesUsuarios` DISABLE KEYS */;
INSERT INTO `PerfilesUsuarios` VALUES 
(1,'Administrador','1','1','1','1','1','1','1','0','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
(2,'Administracion-vendedor','1','1','1','1','1','1','1','0','1','1','1','1','0','0','1','1','1','1','1','1','1','1','1','1','0','1','1','1'),
(3,'Vendedores','1','1','1','1','1','1','0','0','0','0','1','0','0','0','1','1','0','1','1','1','1','1','1','1','1','1','1','0');
/*!40000 ALTER TABLE `PerfilesUsuarios` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS Pais;
CREATE TABLE Pais (
  codigoPais int(10) unsigned NOT NULL,
  descripcionPais varchar(45) DEFAULT NULL,
  PRIMARY KEY (codigoPais)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
INSERT INTO `Pais` VALUES 
(1,'Uruguay'),
(2,'Argentina'),
(3,'Brasil'),
(4,'Paraguay');
UNLOCK TABLES;


--
-- Table structure for table `TarjetasCredito`
--

DROP TABLE IF EXISTS `TarjetasCredito`;
CREATE TABLE `TarjetasCredito` (
  `codigoTarjetaCredito` int(10) unsigned NOT NULL,
  `descripcionTarjetaCredito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoTarjetaCredito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TarjetasCredito`
--

LOCK TABLES `TarjetasCredito` WRITE;
INSERT INTO `TarjetasCredito` VALUES 
  (1,'VISA'),
  (2,'OCA'),
  (3,'MASTER'),
  (4,'AMERICAN EXPRESS'),
  (5,'CABAL'),
  (6,'ANDA'),
  (7,'PASSCARD'),
  (8,'DINERS'),
  (9,'CREDITEL'),
  (10,'CREDITOS DIRECTOS');
  UNLOCK TABLES;


--
-- Table structure for table `TipoCheque`
--

DROP TABLE IF EXISTS `TipoCheque`;
CREATE TABLE `TipoCheque` (
  `codigoTipoCheque` int(10) unsigned NOT NULL,
  `descripcionTipoCheque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoTipoCheque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TipoCheque`
--

LOCK TABLES `TipoCheque` WRITE;
INSERT INTO `TipoCheque` VALUES 
(1,'Sin clasificación'),
(2,'Diferido'),
(3,'Al portador'),
(4,'Cruzado');
UNLOCK TABLES;


--
-- Table structure for table `TipoCliente`
--

DROP TABLE IF EXISTS `TipoCliente`;
CREATE TABLE `TipoCliente` (
  `codigoTipoCliente` int(11) NOT NULL,
  `descripcionTipoCliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoTipoCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TipoCliente`
--

LOCK TABLES `TipoCliente` WRITE;
INSERT INTO `TipoCliente` VALUES 
(1,'Cliente'),
(2,'Proveedor');
UNLOCK TABLES;

--
-- Table structure for table `TipoEstadoDocumento`
--

DROP TABLE IF EXISTS `TipoEstadoDocumento`;
CREATE TABLE `TipoEstadoDocumento` (
  `codigoEstadoDocumento` char(1) NOT NULL,
  `descripcionEstadoDocumento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoEstadoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TipoEstadoDocumento`
--

LOCK TABLES `TipoEstadoDocumento` WRITE;
INSERT INTO `TipoEstadoDocumento` VALUES
('A','En edición'),
('C','Anulado'),
('E','Emitido'),
('G','Guardado'),
('P','Pendiente');
UNLOCK TABLES;


--
-- Table structure for table `TipoEstadoLiquidacion`
--

DROP TABLE IF EXISTS `TipoEstadoLiquidacion`;
CREATE TABLE `TipoEstadoLiquidacion` (
  `codigoTipoEstadoLiquidacion` char(1) NOT NULL,
  `descripcionTipoEstadoLiquidacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoTipoEstadoLiquidacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TipoEstadoLiquidacion`
--

LOCK TABLES `TipoEstadoLiquidacion` WRITE;
INSERT INTO `TipoEstadoLiquidacion` VALUES ('A','Liquidación abierta'),
                                           ('C','Liquidación cerrada');
UNLOCK TABLES;


--
-- Table structure for table `Liquidaciones`
--

DROP TABLE IF EXISTS `Liquidaciones`;
CREATE TABLE `Liquidaciones` (
  `codigoLiquidacion` bigint(100) unsigned NOT NULL,
  `codigoVendedor` varchar(45) NOT NULL,
  `fechaDiaLiquidacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaLiquidacion` date NOT NULL DEFAULT '0000-00-00',
  `fechaCierreLiquidacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estadoLiquidacion` char(1) DEFAULT NULL,
  `usuarioAlta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoLiquidacion`,`codigoVendedor`),
  FOREIGN KEY (`estadoLiquidacion`) REFERENCES `TipoEstadoLiquidacion` (`codigoTipoEstadoLiquidacion`) 
--  FOREIGN KEY (`codigoVendedor`) REFERENCES `Usuarios` (`idUsuario`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `Departamentos`
--

DROP TABLE IF EXISTS `Departamentos`;
CREATE TABLE `Departamentos` (
  `codigoDepartamento` int(10) unsigned NOT NULL,
  `codigoPais` int(10) unsigned NOT NULL,
  `descripcionDepartamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (codigoDepartamento,codigoPais),
  FOREIGN KEY (codigoPais) REFERENCES Pais (codigoPais) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Departamentos`
--

LOCK TABLES `Departamentos` WRITE;
INSERT INTO `Departamentos` VALUES
 (1,1,'MONTEVIDEO'),
 (2,1,'CANELONES'),
 (3,1,'COLONIA'),
 (4,1,'MALDONADO'),
 (5,1,'TACUAREMBO'),
 (6,1,'SALTO'),
 (7,1,'FLORIDA'),
 (8,1,'RIVERA'),
 (9,1,'SAN JOSE'),
 (10,1,'DURAZNO'),
 (11,1,'ARTIGAS'),
 (12,1,'ROCHA'),
 (13,1,'LAVALLEJA'),
 (14,1,'CERRO LARGO'),
 (15,1,'TREINTA Y TRES'),
 (16,1,'SORIANO'),
 (17,1,'PAYSANDU');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Localidades`;
CREATE TABLE `Localidades` (
  `codigoLocalidad` int(10) unsigned NOT NULL,
  `codigoDepartamento` int(10) unsigned NOT NULL,
  `codigoPais` int(10) unsigned NOT NULL,
  `descripcionLocalidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoLocalidad`,`codigoDepartamento`,`codigoPais`),
  FOREIGN KEY (`codigoDepartamento`, `codigoPais`) REFERENCES `Departamentos` (`codigoDepartamento`, `codigoPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Localidades`
--

LOCK TABLES `Localidades` WRITE;
INSERT INTO `Localidades` VALUES 
  (1,1,1,'CENTRO'),
  (1,2,1,'CANELONES'),
  (1,3,1,'COLONIA DEL SACRAMENTO'),
  (1,4,1,'MALDONADO'),
  (1,5,1,'PASO DE LOS TOROS'),
  (1,6,1,'SALTO'),
  (1,7,1,'FLORIDA'),
  (1,8,1,'RIVERA'),
  (1,10,1,'DURAZNO'),
  (1,12,1,'ROCHA'),
  (1,14,1,'MELO'),
  (1,16,1,'MERCEDES'),
  (1,17,1,'PAYSANDU'),
  (2,1,1,'CURVA DE MAROÑAS'),
  (2,2,1,'SANTA LUCIA'),
  (2,3,1,'ROSARIO'),
  (2,4,1,'SAN CARLOS'),
  (2,7,1,'SARANDI GRANDE'),
  (3,1,1,'COLON'),
  (3,2,1,'LOS CERRILLOS'),
  (3,3,1,'CARMELO'),
  (3,4,1,'PIRIAPOLIS'),
  (4,1,1,'SAYAGO'),
  (4,2,1,'LAS PIEDRAS'),
  (4,4,1,'PAN DE AZUCAR'),
  (5,1,1,'CIUDAD VIEJA'),
  (5,2,1,'LA PAZ'),
  (5,4,1,'PUNTA DEL ESTE'),
  (6,1,1,'LA TEJA'),
  (6,2,1,'TALA'),
  (7,1,1,'POCITOS'),
  (7,2,1,'PANDO'),
  (8,1,1,'PUNTA CARRETAS'),
  (9,1,1,'CERRO'),
  (10,1,1,'CORDON'),
  (11,1,1,'COLON'),
  (12,1,1,'CERRITO'),
  (13,1,1,'UNION'),
  (14,1,1,'BELVEDERE'),
  (15,1,1,'LA COMERCIAL'),
  (16,1,1,'ARROYO SECO');
UNLOCK TABLES;



--
-- Table structure for table `TipoClasificacion`
--

DROP TABLE IF EXISTS `TipoClasificacion`;
CREATE TABLE `TipoClasificacion` (
  `codigoTipoClasificacion` int(10) unsigned NOT NULL,
  `descripcionTipoClasificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoTipoClasificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TipoClasificacion`
--

LOCK TABLES `TipoClasificacion` WRITE;
INSERT INTO `TipoClasificacion` VALUES (1,'Final'),
                                        (2,'Tecnico'),
                                        (3,'Casa de Informatica'),
                                        (4,'Mayorista'),
                                        (5,'Organismo público');
UNLOCK TABLES;

--
-- modulo Rubros
--
DROP TABLE IF EXISTS `Rubros`;
CREATE TABLE `Rubros` (
  `codigoRubro` int(10) unsigned NOT NULL,
  `descripcionRubro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoRubro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



LOCK TABLES `Rubros` WRITE;
INSERT INTO `Rubros` VALUES (1,'Sin clasificar');
UNLOCK TABLES;

--
-- Table structure for table `SubRubros`
--

DROP TABLE IF EXISTS `SubRubros`;
CREATE TABLE `SubRubros` (
  `codigoSubRubro` int(10) unsigned NOT NULL,
  `codigoRubro` int(10) unsigned NOT NULL,
  `descripcionSubRubro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoSubRubro`),
  FOREIGN KEY (`codigoRubro`) REFERENCES `Rubros` (`codigoRubro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SubRubros`
-- 

LOCK TABLES `SubRubros` WRITE;
INSERT INTO `SubRubros` VALUES (1,1,'Sin clasificar');
UNLOCK TABLES;


--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
CREATE TABLE `Clientes` (
  `codigoCliente` varchar(10) NOT NULL,
  `tipoCliente` int(10) unsigned NOT NULL DEFAULT '1',
  `nombreCliente` varchar(45) DEFAULT NULL,
  `razonSocial` varchar(45) DEFAULT NULL,
  `rut` varchar(45) DEFAULT NULL,
 -- `tipoClasificacion` int(10) NOT NULL DEFAULT '1',
  `direccion` varchar(45) DEFAULT NULL,
  `esquina` varchar(45) DEFAULT NULL,
  `numeroPuerta` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL,
  `codigoPostal` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sitioWeb` varchar(45) DEFAULT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  `horario` varchar(45) DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `fechaUltimaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaAlta` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usuarioAlta` varchar(45) DEFAULT NULL,
  `codigoPais` int(10) unsigned NOT NULL,
  `codigoDepartamento` int(10) unsigned NOT NULL,
  `codigoLocalidad` int(10) unsigned NOT NULL,
  `esClienteWeb` char(1) NOT NULL DEFAULT '0',
  `sincronizadoWeb` char(1) NOT NULL DEFAULT '0',
  `cantidadMinimaMercaderia` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigoCliente`,`tipoCliente`),
  FOREIGN KEY (codigoLocalidad) REFERENCES  Localidades (`codigoLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';



--
-- Table structure for table `Articulos`
--

DROP TABLE IF EXISTS `Articulos`;
CREATE TABLE `Articulos` (
  `codigoArticulo` varchar(10) NOT NULL,
  `descripcionArticulo` varchar(45) DEFAULT NULL,
  `descripcionExtendida` varchar(100) DEFAULT NULL,
  `codigoProveedor` varchar(10) NOT NULL,
  `tipoCliente` int(10) unsigned NOT NULL DEFAULT '2',
  `codigoIva` int(10) unsigned NOT NULL,
  `codigoMoneda` int(10) unsigned NOT NULL,
  `activo` char(1) NOT NULL DEFAULT '1',
  `usuarioAlta` varchar(45) DEFAULT NULL,
  `usuarioUltimaModificacion` varchar(45) DEFAULT NULL,
  `fechaAlta` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fechaUltimaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `codigoSubRubro` int(10) unsigned NOT NULL,
  `cantidadMinimaStock` bigint(10) NOT NULL DEFAULT '0',
  `sincronizadoWeb` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigoArticulo`),
  FOREIGN KEY (`codigoIva`) REFERENCES `Ivas` (`codigoIva`) ,
  FOREIGN KEY (`codigoMoneda`) REFERENCES `Monedas` (`codigoMoneda`) ,
  FOREIGN KEY (`codigoProveedor`, `tipoCliente`) REFERENCES `Clientes` (`codigoCliente`, `tipoCliente`) ,
  FOREIGN KEY (`codigoSubRubro`) REFERENCES `SubRubros` (`codigoSubRubro`) 
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
--

DROP TABLE IF EXISTS `TipoDocumento`;
CREATE TABLE `TipoDocumento` (
  `codigoTipoDocumento` int(10) unsigned NOT NULL,
  `descripcionTipoDocumento` varchar(45) DEFAULT NULL,

  `utilizaArticulos` char(1) NOT NULL DEFAULT '0',
  `utilizaCodigoBarrasADemanda` char(1) NOT NULL DEFAULT '0',
  
  `utilizaTotales` char(1) NOT NULL DEFAULT '0',
  `utilizaListaPrecio` char(1) NOT NULL DEFAULT '0',
  `utilizaMediosDePago` char(1) NOT NULL DEFAULT '0',
  `utilizaFechaPrecio` char(1) NOT NULL DEFAULT '0',
  `utilizaFechaDocumento` char(1) NOT NULL DEFAULT '0',
  `utilizaNumeroDocumento` char(1) NOT NULL DEFAULT '0',
  `utilizaSerieDocumento` char(1) NOT NULL DEFAULT '0',
  `serieDocumento` varchar(45) DEFAULT 'A',
  `utilizaVendedor` char(1) NOT NULL DEFAULT '0',
  `utilizaCliente` char(1) NOT NULL DEFAULT '0',
  `utilizaTipoCliente` char(1) NOT NULL DEFAULT '0',
  `utilizaSoloProveedores` char(1) NOT NULL DEFAULT '0',
  `afectaCuentaCorriente` int(11) NOT NULL DEFAULT '0',
  `afectaCuentaCorrienteMercaderia` int(11) NOT NULL DEFAULT '0',
  `afectaStock` int(11) NOT NULL DEFAULT '0',
  `afectaTotales` int(11) NOT NULL DEFAULT '0',
  `utilizaCantidades` char(1) NOT NULL DEFAULT '0',
  `utilizaPrecioManual` char(1) NOT NULL DEFAULT '0',
  `utilizaDescuentoArticulo` char(1) NOT NULL DEFAULT '0',
  `utilizaDescuentoTotal` char(1) NOT NULL DEFAULT '0',
  `emiteEnImpresora` char(1) NOT NULL DEFAULT '0',
  `codigoModeloImpresion` int(10) unsigned NOT NULL DEFAULT '0',
  `cantidadCopias` int(10) unsigned NOT NULL DEFAULT '0',
  `utilizaObservaciones` char(1) NOT NULL DEFAULT '0',
  `afectaCuentaBancaria` int(11) NOT NULL DEFAULT '0',
  `utilizaCuentaBancaria` char(1) NOT NULL DEFAULT '0',
  `utilizaPagoChequeDiferido` char(1) NOT NULL DEFAULT '0',
  `utilizaSoloMediosDePagoCheque` char(1) NOT NULL DEFAULT '0',
  `esDocumentoDeVenta` char(1) NOT NULL DEFAULT '0',
  `descripcionTipoDocumentoImpresora` varchar(45) NOT NULL DEFAULT 'CONTADO',
  `utilizaArticulosInactivos` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigoTipoDocumento`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `TipoDocumento` WRITE;
INSERT INTO `TipoDocumento` VALUES (1,'Factura CONTADO','1','1','1','1','1','1','1','1','0','A','1','1','1','0',0,0,-1,1,'0','0','0','0','1',1,1,'0',0,'0','0','0','1','CONTADO','0'),
                                   (2,'Factura CREDITO','1','1','1','1','1','1','1','1','0','A','1','1','1','0',1,0,-1,1,'0','0','0','0','1',1,1,'0',0,'0','0','0','1','CREDITO','0'),
                                   (3,'Factura DEVOLUCION CONTADO','1','1','1','1','1','1','1','1','0','A','1','1','1','0',0,0,1,-1,'0','0','0','0','1',1,1,'0',0,'0','0','0','1','DEVOLUCION','0'),
                                   (4,'Factura NOTA CREDITO','1','1','1','1','1','1','1','1','0','A','1','1','1','0',-1,0,1,-1,'0','0','0','0','1',1,1,'0',0,'0','0','0','1','DEVOLUCION','0'),
                                   (5,'Factura COMPRA PROVEEDOR','1','0','1','1','1','1','1','1','0','A','0','1','1','1',0,0,1,-1,'1','1','0','0','0',0,0,'0',0,'0','1','0','0','CONTADO','1'),
                                   (6,'Ajuste de Stock +','1','0','0','0','0','0','1','0','0','A','0','0','0','0',0,0,1,0,'1','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','1'),
                                   (7,'Ajuste de Stock -','1','0','0','0','0','0','1','0','0','A','0','0','0','0',0,0,-1,0,'1','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','1'),
                                   (8,'Ingreso Inventario Maestro','1','0','0','0','0','0','1','0','0','A','0','0','0','0',0,0,1,0,'1','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','1'),
                                   (9,'Recibo','0','0','0','0','1','0','1','1','0','A','0','1','1','0',-1,0,0,1,'0','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','0'),
                                   (10,'Ajuste Cuenta Corriente +','0','0','0','0','1','0','1','0','0','A','0','1','1','0',1,0,0,0,'0','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','0'),
                                   (11,'Ajuste Cuenta Corriente -','0','0','0','0','1','0','1','0','0','A','0','1','1','0',-1,0,0,0,'0','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','0'),
                                   (12,'Orden de Compra','1','0','1','1','1','1','1','1','0','A','0','1','1','0',0,0,1,-1,'0','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','0'),
                                   (13,'Ingreso de caja','0','0','0','0','1','0','1','0','0','A','0','0','0','0',0,0,0,1,'0','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','0'),
                                   (14,'Retiro de caja','0','0','0','0','1','0','1','0','0','A','0','0','0','0',0,0,0,-1,'0','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','0'),
                                   (15,'Cambio mercaderia','1','1','0','0','0','0','1','0','0','A','0','1','1','0',0,0,-1,0,'0','0','0','0','0',0,0,'1',0,'0','0','0','0','CONTADO','0'),
                                   (16,'Ingreso cheque a caja','0','0','0','0','1','0','1','0','0','A','0','0','0','0',0,0,0,1,'0','0','0','0','0',0,0,'1',0,'0','0','1','0','CONTADO','0'),
                                   (17,'Envio de valores de caja a banco','0','0','0','0','1','0','1','0','0','A','0','0','0','0',0,0,0,-1,'0','0','0','0','0',0,0,'1',1,'1','1','0','0','CONTADO','0'),
                                   (18,'Envio de valores de banco a caja','0','0','0','0','1','0','1','0','0','A','0','0','0','0',0,0,0,1,'0','0','0','0','0',0,0,'1',-1,'1','0','0','0','CONTADO','0'),
                                   (19,'Fondo de banco','0','0','0','0','1','0','1','0','0','A','0','0','0','0',0,0,0,0,'0','0','0','0','0',0,0,'1',1,'1','1','0','0','CONTADO','0'),
                                   (20,'Retiro de banco','0','0','0','0','1','0','1','0','0','A','0','0','0','0',0,0,0,0,'0','0','0','0','0',0,0,'1',-1,'1','0','0','0','CONTADO','0');
UNLOCK TABLES;


--
---




DROP TABLE IF EXISTS `Documentos`;
CREATE TABLE `Documentos` (
  `codigoDocumento` bigint(10) unsigned NOT NULL,
  `codigoTipoDocumento` int(10) unsigned NOT NULL,
  `serieDocumento` varchar(45) NOT NULL DEFAULT '',
  `codigoEstadoDocumento` char(1) NOT NULL DEFAULT '',
  `codigoCliente` varchar(10) NOT NULL DEFAULT '0',
  `tipoCliente` int(10) unsigned NOT NULL DEFAULT '0',
  `codigoMonedaDocumento` int(10) unsigned DEFAULT NULL,
  `cotizacionMoneda` decimal(45,8) unsigned NOT NULL DEFAULT '1.00000000',
  `fechaHoraGuardadoDocumentoSQL` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaUltimaModificacionDocumento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fechaEmisionDocumento` date NOT NULL DEFAULT '0000-00-00',
  `usuarioUltimaModificacion` varchar(45) DEFAULT NULL,
  `precioTotalVenta` decimal(45,2) NOT NULL DEFAULT '0.00',
  `precioSubTotalVenta` decimal(45,2) NOT NULL DEFAULT '0.00',
  `precioIvaVenta` decimal(45,2) NOT NULL DEFAULT '0.00',
  `codigoLiquidacion` bigint(100) unsigned NOT NULL,
  `codigoVendedorLiquidacion` varchar(45) NOT NULL,
  `codigoVendedorComisiona` varchar(45) NOT NULL,
  `totalIva1` decimal(45,2) NOT NULL DEFAULT '0.00',
  `totalIva2` decimal(45,2) NOT NULL DEFAULT '0.00',
  `totalIva3` decimal(45,2) NOT NULL DEFAULT '0.00',
  `usuarioAlta` varchar(45) NOT NULL,
  `tieneDescuentoAlTotal` char(1) NOT NULL DEFAULT '0',
  `montoDescuentoTotal` decimal(45,2) NOT NULL DEFAULT '0.00',
  `usuarioAutorizaDescuentoTotal` varchar(45) DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `numeroCuentaBancaria` varchar(45) NOT NULL DEFAULT '0',
  `codigoBanco` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigoDocumento`,`codigoTipoDocumento`),
  FOREIGN KEY (`codigoMonedaDocumento`) REFERENCES `Monedas` (`codigoMoneda`) ,
  FOREIGN KEY (`codigoTipoDocumento`) REFERENCES `TipoDocumento` (`codigoTipoDocumento`),
  FOREIGN KEY (`codigoEstadoDocumento`)  REFERENCES `TipoEstadoDocumento` (`codigoEstadoDocumento`) 

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Table structure for table `TipoUsuario`
--

DROP TABLE IF EXISTS `TipoUsuario`;
CREATE TABLE `TipoUsuario` (
  `codigoTipoUsuario` int(11) NOT NULL,
  `descripcionTipoUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE `Usuarios` (
  `idUsuario` varchar(45) NOT NULL,
  `claveUsuario` varchar(45) DEFAULT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `apellidoUsuario` varchar(45) NOT NULL,
  `tipoUsuario` int(11) NOT NULL DEFAULT '2',
  `esVendedor` char(1) NOT NULL DEFAULT '0',
  `codigoPerfil` int(10) unsigned NOT NULL DEFAULT '1',
  `baseDatosExterna` varchar(45) NOT NULL DEFAULT 'khitomer',
  `hostBaseDatosExterna` varchar(45) DEFAULT 'localhost',
  `codigoEntorno` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUsuario`),
  KEY `fk_CodigoPerfil` (`codigoPerfil`),
  CONSTRAINT `fk_CodigoPerfil` FOREIGN KEY (`codigoPerfil`) REFERENCES `PerfilesUsuarios` (`codigoPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
