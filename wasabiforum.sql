-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: foroprueba
-- ------------------------------------------------------
-- Server version	5.7.14-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academia`
--

DROP TABLE IF EXISTS `academia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academia` (
  `idAcademia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `idArea` int(3) DEFAULT NULL,
  `presidente` int(3) DEFAULT NULL,
  `Color` int(2) DEFAULT NULL,
  PRIMARY KEY (`idAcademia`),
  KEY `academia` (`idArea`),
  KEY `presidente` (`presidente`),
  KEY `Color` (`Color`),
  CONSTRAINT `academia_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `area` (`idArea`),
  CONSTRAINT `academia_ibfk_2` FOREIGN KEY (`presidente`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `academia_ibfk_3` FOREIGN KEY (`Color`) REFERENCES `catcolores` (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academia`
--

LOCK TABLES `academia` WRITE;
/*!40000 ALTER TABLE `academia` DISABLE KEYS */;
INSERT INTO `academia` VALUES (1,'Fisica',NULL,NULL,3),(2,'Quimica',NULL,NULL,2),(3,'Programacion',NULL,NULL,4);
/*!40000 ALTER TABLE `academia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `Boleta` varchar(20) NOT NULL,
  `idGrupo` int(3) DEFAULT NULL,
  `idUsuario` int(3) DEFAULT NULL,
  PRIMARY KEY (`Boleta`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `alumnos_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('1234567890',2,13),('2015090247',2,12),('2015090248',2,11),('2016090240',2,3),('2016090241',2,4),('2016090242',2,5),('2016090243',2,6),('2016090244',2,7),('2016090245',2,8),('2016090246',2,10);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `idArea` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `jefe` int(3) DEFAULT NULL,
  PRIMARY KEY (`idArea`),
  KEY `jefe` (`jefe`),
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`jefe`) REFERENCES `profesores` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catcolores`
--

DROP TABLE IF EXISTS `catcolores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catcolores` (
  `idColor` int(3) NOT NULL AUTO_INCREMENT,
  `color` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catcolores`
--

LOCK TABLES `catcolores` WRITE;
/*!40000 ALTER TABLE `catcolores` DISABLE KEYS */;
INSERT INTO `catcolores` VALUES (1,'#495370'),(2,'#FB8080'),(3,'#FFD95B'),(4,'#66EBCC');
/*!40000 ALTER TABLE `catcolores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `idcomentario` int(3) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(3) DEFAULT NULL,
  `idrespuesta` int(3) DEFAULT NULL,
  `fechaYHora` datetime DEFAULT NULL,
  `contenido` text,
  PRIMARY KEY (`idcomentario`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idrespuesta` (`idrespuesta`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`idrespuesta`) REFERENCES `respuestas` (`idRespuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escuela` (
  `idEscuela` int(3) NOT NULL AUTO_INCREMENT,
  `Subdirector` int(3) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idEscuela`),
  KEY `Subdirector` (`Subdirector`),
  CONSTRAINT `escuela_ibfk_1` FOREIGN KEY (`Subdirector`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idGrupo` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `idSemestre` int(3) DEFAULT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `idSemestre` (`idSemestre`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`idSemestre`) REFERENCES `semestre` (`idSemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (2,'4IM6',4);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `idAcademia` int(3) DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `idAcademia` (`idAcademia`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`idAcademia`) REFERENCES `academia` (`idAcademia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (4,'Fisica I',1),(5,'Fisica II',1),(6,'Fisica III',1),(7,'Quimica I',2),(8,'Quimica II',2),(9,'Quimica III',2),(10,'Programacion Orientada a Objetos',3),(11,'Programacion y Servicios Web',3),(12,'Bases de datos',3),(13,'Fisica IV',1);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `idNotificacion` int(3) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(3) DEFAULT NULL,
  `idRespuesta` int(3) DEFAULT NULL,
  `fechaYHora` datetime DEFAULT NULL,
  `contenido` text,
  PRIMARY KEY (`idNotificacion`),
  KEY `idRespuesta` (`idRespuesta`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`idRespuesta`) REFERENCES `respuestas` (`idRespuesta`),
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesores` (
  `NumeroEmpleado` varchar(30) DEFAULT NULL,
  `idAcademia` int(3) DEFAULT NULL,
  `idUsuario` int(3) DEFAULT NULL,
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES ('12345',NULL,14),('12346',NULL,15),('12347',NULL,16),('12344',NULL,17),('12341',NULL,18),('00001',NULL,19),('',NULL,20),('12245',NULL,21);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicacion` (
  `idPublicacion` int(11) NOT NULL AUTO_INCREMENT,
  `idMateria` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `contenido` text,
  `fechaYHora` datetime DEFAULT NULL,
  `idUsuario` int(3) DEFAULT NULL,
  PRIMARY KEY (`idPublicacion`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idMateria` (`idMateria`),
  CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `publicacion_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (1,12,'Â¿Hotel?','Necesito unas vacaciones','2017-04-13 19:43:38',NULL),(2,12,'Â¿Hotel?','Necesito unas vacaciones','2017-04-13 19:45:34',NULL),(3,11,'No me permite publicar mi programa','Â¡Ayuda!','2017-04-13 19:47:00',NULL),(4,10,'askdlfjasdfa','asdfasdfasdf','2017-04-13 21:10:57',NULL),(5,12,'¿Qué es la amistad?','Hola camaradas','2017-04-20 22:23:40',NULL),(6,12,'¿Qué es la amistad?','Hola camaradas','2017-04-20 22:23:40',NULL),(7,12,'¿Hola como estan?','Espero estén bien :)','2017-04-20 22:34:09',NULL),(8,12,'\'Hola','hola','2017-04-20 22:34:23',NULL),(9,8,'Qué es un enlace pi sigma pi??','No entendí bien el concepto en clase, ayuda!!','2017-04-21 22:04:25',NULL),(10,12,'Â¿QuÃ© es la amistad? URGENTE!!!','El profesor Margarito lo pregunta cada clase pero no tengo la respuesta a la pregunta Â¿Alguno de ustedes sabe que es la verdadera amistad?','2017-04-23 19:51:10',NULL),(11,12,'¿Qué?','Hola','2017-04-23 19:55:12',NULL),(12,12,'Hola mundo Â¿QUÃ©?','!!!??Â¿Â¿Â¿Â¡Â¡','2017-04-23 19:57:06',NULL),(13,12,'¿Qué?','','2017-04-23 19:57:44',NULL),(14,11,'Just Beat it???? <i class=\'fa fa-heart\' aria-hidden=\'true\'></i>','Wouwachu biri biri','2017-04-25 13:31:35',NULL),(15,10,'La maestra es una corazoanada <i class=\'fa fa-heart\' aria-hidden=\'true\'></i>','been','2017-04-25 14:42:19',NULL),(16,8,'¿Que <i class=\'fa fa-heart\' aria-hidden=\'true\'></i>?','','2017-04-25 14:48:24',NULL),(17,12,'<i class=\'em em-alien\'></i> Aliens atacan mi código!!!','Ayy lmao ','2017-04-26 21:50:52',NULL),(18,11,'hola em-libro','Esta es una prueba con emojis em-ayy-lmao','2017-04-26 22:14:45',NULL),(19,11,'em-ayy-lmao Aliens atacan mi código!!!','','2017-04-26 22:17:29',NULL),(20,7,'<i class=\'em em-alien\'></i>o Aliens atacan mi código!!!','','2017-04-26 22:19:34',NULL),(21,6,'<i class=\'em em-alien\'></i> Aliens atacan mi código!!!','','2017-04-26 22:20:50',NULL),(22,10,'Hola mundo soy Machorrin xd','Esta es una prueba, no colapses por favor','2017-04-28 19:30:15',10),(23,10,'Soy el Cachiporrin','No soy machorrin :)','2017-04-28 19:35:08',11),(24,13,'<i class=\'fa fa-heart\' aria-hidden=\'true\'></i>','Esta es una pergunta de muestra','2017-05-01 12:01:04',11),(25,5,'<i class=\'em em-closed_book\'></i> ¿Qué libros me recomiendan para estudiar la teoría de física? URGENTE!! <i class=\'em em-closed_book\'></i>','Necesito algunas fuentes para ayudarme en el siguiente examen de Margarito, si no voy a tronar la materia y no quiero hacer el extraordinario :\'v','2017-05-01 12:02:31',11),(26,7,'Por que no quiere funcionar el jsp?','Necesito ayuda','2017-05-07 14:25:14',12);
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relprofesormateria`
--

DROP TABLE IF EXISTS `relprofesormateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relprofesormateria` (
  `idRelProfesorMateria` int(3) NOT NULL AUTO_INCREMENT,
  `profesor` int(3) DEFAULT NULL,
  `idMateria` int(3) DEFAULT NULL,
  PRIMARY KEY (`idRelProfesorMateria`),
  KEY `profesor` (`profesor`),
  KEY `idMateria` (`idMateria`),
  CONSTRAINT `relprofesormateria_ibfk_1` FOREIGN KEY (`profesor`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `relprofesormateria_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relprofesormateria`
--

LOCK TABLES `relprofesormateria` WRITE;
/*!40000 ALTER TABLE `relprofesormateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `relprofesormateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relusuariorespuesta`
--

DROP TABLE IF EXISTS `relusuariorespuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relusuariorespuesta` (
  `idRelUsuRes` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idRespuesta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelUsuRes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relusuariorespuesta`
--

LOCK TABLES `relusuariorespuesta` WRITE;
/*!40000 ALTER TABLE `relusuariorespuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `relusuariorespuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `idRespuesta` int(3) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(3) DEFAULT NULL,
  `idPublicacion` int(3) DEFAULT NULL,
  `fechaYHora` datetime DEFAULT NULL,
  `votos` int(3) DEFAULT '0',
  `contenido` text,
  PRIMARY KEY (`idRespuesta`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idPublicacion` (`idPublicacion`),
  CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`idPublicacion`) REFERENCES `publicacion` (`idPublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,12,25,'2017-05-07 18:21:56',0,'No te preocupes, el Resnick es muy bueno ;)'),(2,12,25,'2017-05-07 18:22:05',0,'No te preocupes, el Resnick es muy bueno ;)'),(3,12,25,'2017-05-07 18:29:59',0,'Hola mundo, yo tambiÃ©n quiero saber de estos libros...');
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolusuario`
--

DROP TABLE IF EXISTS `rolusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolusuario` (
  `idRol` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolusuario`
--

LOCK TABLES `rolusuario` WRITE;
/*!40000 ALTER TABLE `rolusuario` DISABLE KEYS */;
INSERT INTO `rolusuario` VALUES (1,'Administrador'),(2,'Profesor'),(3,'Alumno'),(4,'Presidente de Academia'),(5,'Jefe de Area');
/*!40000 ALTER TABLE `rolusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
  `idSemestre` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idSemestre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES (1,'Primer'),(2,'Segundo'),(3,'Tercer'),(4,'Cuarto'),(5,'Quinto'),(6,'Sexto');
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `idRol` int(3) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idRol` (`idRol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rolusuario` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'usuario1','usuario1','carlos@gmail.com',3),(2,'usuario1','usuario1','carlos@gmail.com',3),(3,'usuario1','usuario1','carlos@gmail.com',3),(4,NULL,'holamundo','carlos2@gmail.com',3),(5,NULL,'holamundo','grados@gmail.com',3),(6,NULL,'holamundo','hellomen@hotmail.com',3),(7,NULL,'holamundo','holaamigosdeyou@gmail.com',3),(8,'Machorrin','holamundo','carlosg@gmail.com',3),(9,'Clark_Kent','holamundo','fregolex@gmail.com',3),(10,'Clark_Kent','holamundo','fregolex@gmail.com',3),(11,'Cachiporrin','holamundo','elrabano@live.com',3),(12,'frankUnderwood','holamundo','carlos2@gmail.com',3),(13,'guaporrimo','holamundo','fadsfad@gmail.com',3),(14,'NombreUsuario','holamundo',NULL,2),(15,'NombreUsuario','holaumndo',NULL,2),(16,'NombreUsuario','holamundo',NULL,2),(17,'NombreUsuario','holamundo',NULL,2),(18,'Iliana','holamundo',NULL,2),(19,'Iliana','holamundo',NULL,2),(20,'','',NULL,2),(21,'ubaldo','sasasaas',NULL,4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-09 13:29:42
