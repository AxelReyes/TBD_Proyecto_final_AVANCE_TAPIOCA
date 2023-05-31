CREATE DATABASE  IF NOT EXISTS `chip_dogs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chip_dogs`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: chip_dogs
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `especie` enum('Perro','Gato') NOT NULL,
  `raza` varchar(50) NOT NULL,
  `sexo` enum('Macho','hembra') NOT NULL,
  `edad` int NOT NULL,
  `color` varchar(50) NOT NULL,
  `tamaño` enum('Pequeño','Mediano','Grande') NOT NULL,
  `peso` decimal(4,2) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_propietario` int DEFAULT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `id_propietario` (`id_propietario`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (25,'Max','Perro','Labrador','Macho',3,'Negro','Grande',25.50,'2020-05-10',14),(26,'Luna','Gato','Siames','hembra',2,'Blanco','Pequeño',4.80,'2021-01-15',15),(27,'Rocky','Perro','Bulldog','Macho',4,'Marrón','Mediano',18.20,'2019-09-20',16),(28,'Mia','Gato','Persa','hembra',1,'Gris','Pequeño',3.20,'2022-03-05',17),(29,'Toby','Perro','Golden Retriever','Macho',2,'Dorado','Grande',28.10,'2021-06-12',18),(30,'Nala','Gato','Maine Coon','hembra',3,'Marrón','Grande',7.60,'2020-04-25',19),(31,'Karen','Perro','Bengal','hembra',5,'Naranja','Pequeño',5.90,'2021-02-10',20),(32,'Lola','Perro','Chihuahua','hembra',5,'Café','Pequeño',2.70,'2018-11-30',21),(33,'Zeus','Perro','Doberman','Macho',1,'Negro y Marrón','Grande',32.00,'2022-02-28',22),(34,'Milo','Gato','Ragdoll','Macho',4,'Blanco y Gris','Mediano',6.30,'2019-08-15',23),(35,'Coco','Perro','Pomerania','hembra',3,'Blanco','Pequeño',3.50,'2020-07-20',20),(36,'Oscar','Gato','Sphynx','Macho',2,'Sin Pelo','Pequeño',4.10,'2021-03-12',21),(38,'Luna','Gato','Scottish Fold','hembra',5,'Blanco y Gris','Mediano',8.50,'2018-12-10',15),(39,'Rocky','Perro','Rottweiler','Macho',2,'Negro y Marrón','Grande',35.70,'2021-05-18',17);
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `tipo_pago` enum('Tarjeta de Credito','Tarjeta de Debito','Transferencia Bancaria','Paypal') NOT NULL,
  `numero_cuenta` varchar(20) DEFAULT NULL,
  `fecha_vencimiento` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_metodo_pago`),
  KEY `id_propietario` (`id_propietario`),
  CONSTRAINT `metodos_pago_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (5,14,'Tarjeta de Credito','25263746886','24/01'),(6,15,'Tarjeta de Debito','257547457458','25/03'),(7,16,'Transferencia Bancaria','33574745745','24/01'),(8,17,'Paypal','645737437344','24/01'),(9,18,'Tarjeta de Credito','4445345344453','24/01'),(10,19,'Tarjeta de Debito','5769679','24/01'),(11,20,'Transferencia Bancaria','6686784457','24/01'),(12,21,'Paypal','34634346626','24/01'),(13,22,'Tarjeta de Credito','74748334624','24/01'),(14,23,'Tarjeta de Debito','846664646','24/01');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietarios` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_pat` varchar(50) DEFAULT NULL,
  `apellido_mat` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_propietario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `propietarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES (14,14,'Juan','Pérez','González','Calle 1','Ciudad 1','12125','61428852','2023-01-01'),(15,15,'María','González','Sánchez','Calle 2','Ciudad 2','2352','614975345','2023-01-02'),(16,16,'Carlos','Rodríguez','Martínez','Calle 3','Ciudad 3','46584','614790557','2023-01-03'),(17,17,'Laura','Martínez','García','Calle 4','Ciudad 4','7336','6142235764','2023-01-04'),(18,18,'Pedro','López','Hernández','Calle 5','Ciudad 5','2415','6140980024','2023-01-05'),(19,19,'Ana','Sánchez','Fernández','Calle 6','Ciudad 6','3535','614245837','2023-01-06'),(20,20,'Daniel','Fernández','Gómez','Calle 10','Ciudad 7','63447','614247474','2023-01-07'),(21,21,'Sofía','López','Vargas','Calle 8','Ciudad 8','55074','614464262','2023-01-08'),(22,22,'Alejandro','Gómez','Torres','Calle 9','Ciudad 9','33356','61428857','2023-01-09'),(23,23,'Lucía','Torres','López','Calle 10','Ciudad 10','3353','61433636','2023-01-10');
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `correo_electronico` varchar(100) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (14,'juan@gmail.com','contra1'),(15,'maria@gmail.com','contra2'),(16,'carlos@gmail.com','contra3'),(17,'laura@gmail.com','contra4'),(18,'pedro@gmail.com','contra5'),(19,'ana@gmail.com','contra6'),(20,'daniel@gmail.com','contra7'),(21,'sofia@gmail.com','contra8'),(22,'alejandro@gmail.com','contra9'),(23,'lucia@gmail.com','contra10');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'chip_dogs'
--

--
-- Dumping routines for database 'chip_dogs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30 22:42:53
