CREATE DATABASE  IF NOT EXISTS `autoshow` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `autoshow`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autoshow
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `addr_number`
--

DROP TABLE IF EXISTS `addr_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addr_number` (
  `ID_FILIAL` int NOT NULL,
  `A_ADDR` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `A_NUMBER` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_FILIAL`),
  CONSTRAINT `Номер филиала` FOREIGN KEY (`ID_FILIAL`) REFERENCES `filial` (`FILIAL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addr_number`
--

LOCK TABLES `addr_number` WRITE;
/*!40000 ALTER TABLE `addr_number` DISABLE KEYS */;
INSERT INTO `addr_number` VALUES (1,'Российская 278','89475683'),(2,'Красная 172','89573910'),(3,'Ростовское шоссе 287','89672137'),(4,'Олега Кошевого 55','89770364'),(5,'Димитрова 200','89868591'),(6,'Пушкина 13','89966818'),(7,'Рашпилевская 190','90065045'),(8,'Красная 478','90163272'),(9,'Мира 17','90261499'),(10,'Октябрьская 181','90359726');
/*!40000 ALTER TABLE `addr_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto` (
  `AUTO_ID` int NOT NULL,
  `AUTO_ORDER` int NOT NULL,
  `AUTO_V` decimal(2,1) NOT NULL,
  `AUTO_P` decimal(4,1) NOT NULL,
  `AUTO_FILIAL` int NOT NULL,
  `AUTO_COLOR` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `YEAR_AUTO` date NOT NULL,
  `AUTO_MODEL` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTO_ID`),
  KEY `Номер заказа_idx` (`AUTO_ORDER`),
  KEY `Номер филиала_idx` (`AUTO_FILIAL`),
  CONSTRAINT `Model` FOREIGN KEY (`AUTO_ID`) REFERENCES `marks` (`MARKS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Number_filial` FOREIGN KEY (`AUTO_FILIAL`) REFERENCES `filial` (`FILIAL_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Номер заказа` FOREIGN KEY (`AUTO_ORDER`) REFERENCES `order` (`ORDER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (2345,1,1.5,201.5,1,'Красный','2015-03-17','Opel'),(3456,2,2.0,105.0,2,'Белый','2001-05-13','Mazda'),(4567,3,1.5,105.0,3,'Белый','2017-03-12','Jeep'),(5678,4,1.5,105.1,4,'Белый','2017-03-12','Lada'),(6789,5,1.5,105.0,5,'Белый','2012-01-19','Lada'),(7900,6,1.5,105.1,6,'Черный','2014-11-12','Lada'),(9011,7,1.6,105.0,7,'Синий','2020-11-25','Audi'),(10122,8,5.5,415.6,8,'Красный','2019-03-11','Mercedes'),(11233,9,3.6,312.2,9,'Белый','2019-07-01','Chevrolet'),(12344,10,1.5,105.0,10,'Белый','2019-01-01','Lada');
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUST_ID` int NOT NULL,
  `CUST_FNAME` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `CUST_LNAME` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `PASSPORT_SaN` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `CUST_VIDAN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CUST_DATE` date NOT NULL,
  `CUST_PHONE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Иванов','Иван Алексеевич','4325678','УФМС по Кр. Краю','1987-12-12','89756483'),(2,'Смирнов','Артем Михайлович','5436789','УФМС по Кр. Краю','1988-01-13','80867593'),(3,'Кузнецов','Максим Евгеньевич','6547900','УФМС по Кр. Краю','1988-02-14','71978703'),(4,'Попов','Валерий Борисович','7659011','УФМС по Кр. Краю','1988-03-17','63089813'),(5,'Васильев','Андрей Александрович','8770122','УФМС по Кр. Краю','1988-05-20','54200923'),(6,'Петров','Сергей Ярославович','9881233','УФМС по Кр. Краю','2002-06-21','45312033'),(7,'Соколов','Николай Дмитриевич','992344','УФМС по Кр. Краю','2000-05-08','36423143'),(8,'Михайлов','Антон Дмитриевич','103455','УФМС по Кр. Краю','1999-08-24','27534253'),(9,'Новиков','Владислав Алексеевич','214566','УФМС по Кр. Краю','2001-08-13','18645363'),(10,'Фёдоров','Иван Иванов','325677','УФМС по Кр. Краю','1994-06-24','9756473');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `AUTO_EQUIPMENT` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `COMMENT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ID_SERVICE` int NOT NULL,
  `PRICE` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_SERVICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('Полная','GPS,ABS',1,'20512'),('Средняя','GPS,ABS',2,'13600'),('Полная','GPS,ABS',3,'14700'),('Полная','GPS,ABS',4,'15800'),('Полная','GPS,ABS',5,'18002'),('Полная','GPS,ABS',6,'21300'),('Средняя','GPS,ABS',7,'24200'),('Полная','GPS,ABS',8,'19100'),('Полная','GPS,ABS',9,'18192');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filial` (
  `FILIAL_ID` int NOT NULL AUTO_INCREMENT,
  `FILIAL_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FILIAL_ADNAME` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FILIAL_LADNAME` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILIAL_LOGIN` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FILIAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (1,'Авангард','Волосатов','Ярослав Сергеевич','djkp2345'),(2,'Аарон Авто','Нечепуренко','Екатерина Андреевна','54ugktuy'),(3,'Великан','Руденко','Николай Александрович','987ghvcm'),(4,'Германика','Ковальский','Сергей Андреевич','poghvn65'),(5,'Балттрейд','Федорук','Дмитрий Константинович','jgnvhf65'),(6,'Автотрейд','Харченко','Анна Владимировна','zncvkg90'),(7,'Автодом','Герцеп','Кирилл Андреевич','12erhgvn'),(8,'Фаворит','Ладейко','Алёна Сергеевна','mbvf5764'),(9,'Автоспец','Сидоренкова','Надежда Михайловна','pogvnd32'),(10,'Автопассаж','Наумова','Мария Игоревна','1234fgvb');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `ID_AUTO` int NOT NULL,
  `ID_SERVICE` int NOT NULL,
  KEY `Куз.номер_idx` (`ID_AUTO`),
  KEY `Услуга_idx` (`ID_SERVICE`),
  CONSTRAINT `Куз.номер` FOREIGN KEY (`ID_AUTO`) REFERENCES `auto` (`AUTO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Услуга` FOREIGN KEY (`ID_SERVICE`) REFERENCES `equipment` (`ID_SERVICE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manag`
--

DROP TABLE IF EXISTS `manag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manag` (
  `MANAG_ID` int NOT NULL,
  `MANAG_FMALE` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `MANAG_LNAME` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `MANAG_PASP` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MANAG_ISSUED` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MANAG_DATE` date NOT NULL,
  `MANAG_BORN` date NOT NULL,
  `MANAG_SEX` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `MANAG_FILIAL` int NOT NULL,
  `MANAG_PHONE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `MANAG_LOGIN` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MANAG_ID`),
  KEY `Номер филиала_idx` (`MANAG_FILIAL`),
  CONSTRAINT `filial_id` FOREIGN KEY (`MANAG_FILIAL`) REFERENCES `filial` (`FILIAL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manag`
--

LOCK TABLES `manag` WRITE;
/*!40000 ALTER TABLE `manag` DISABLE KEYS */;
INSERT INTO `manag` VALUES (1,'Волосатов','Ярослав Сергеевич','1234567','УФМС по Кр. Краю','2014-10-12','2000-05-08','М',1,'89011017760','djkp2345'),(2,'Нечепуренко','Екатерина Андреевна','2345678','УФМС по Кр. Краю','2017-03-17','2003-10-12','Ж',2,'88574852194','54ugktuy'),(3,'Руденко','Николай Александрович','3456789','УФМС по Кр. Краю','2014-12-31','2000-01-13','М',3,'88138686628','987ghvcm'),(4,'Ковальский','Сергей Андреевич','4567900','УФМС по Кр. Краю','2013-01-16','1999-12-17','М',4,'87702521062','poghvn65'),(5,'Федорук','Дмитрий Константинович','5679011','УФМС по Кр. Краю','2003-02-13','1989-02-19','М',5,'87266355496','jgnvhf65'),(6,'Харченко','Анна Владимировна','6790122','УФМС по Кр. Краю','2008-03-20','1994-09-16','Ж',6,'86830189930','zncvkg90'),(7,'Герцеп','Кирилл Андреевич','7901233','УФМС по Кр. Краю','2001-01-21','1997-02-13','М',7,'86394024364','12erhgvn'),(8,'Ладейко','Алёна Сергеевна','9012344','УФМС по Кр. Краю','2009-05-22','1995-05-25','Ж',8,'85957858798','mbvf5764'),(9,'Сидоренкова','Надежда Михайловна','10123455','УФМС по Кр. Краю','2007-06-13','1994-08-24','Ж',9,'85521693232','pogvnd32'),(10,'Наумова','Мария Игоревна','11234566','УФМС по Кр. Краю','2010-07-25','1996-06-28','Ж',10,'85085527666','1234fgvb');
/*!40000 ALTER TABLE `manag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `MARK` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MARKS_ID` int NOT NULL,
  PRIMARY KEY (`MARKS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES ('Opel',2345),('Mazda',3456),('Jeep',4567),('Lada',5678),('Lada',6789),('Mercedes',7900),('Audi',9011),('Audi',10122),('Chevrolet',11233),('Lada',12344);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `MARK_ID` int NOT NULL,
  `MODEL` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SIDENIA` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ID_AUTO` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ID_SALARY` int NOT NULL,
  PRIMARY KEY (`MARK_ID`),
  CONSTRAINT `id_mark` FOREIGN KEY (`MARK_ID`) REFERENCES `marks` (`MARKS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (2345,'Astra','2','универсал','2345',1),(3456,'CX-5','4','седан','3456',1),(4567,'GT-X','4','седан','4567',1),(5678,'Largus','4','седан','5678',1),(6789,'Priora','4','седан','6789',1),(7900,'E200','4','седан','7900',1),(9011,'A3','4','седан','9011',1),(10122,'A5','4','седан','10122',1),(11233,'Lanos','4','седан','11233',1),(12344,'Granta','4','седан','12344',1);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ORDER_ID` int NOT NULL,
  `ORDER_AUTO` int NOT NULL,
  `ORDER_MANAG` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `ORDER_CUST` int NOT NULL,
  `ORDER_SUM` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `DATA_START` date NOT NULL,
  `DATA_TIME` date NOT NULL,
  `DATA_END` date NOT NULL,
  `ORDER_DELIVERY` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `Кузновной номер_idx` (`ORDER_AUTO`),
  KEY `Покупатель_idx` (`ORDER_CUST`),
  CONSTRAINT `Manager` FOREIGN KEY (`ORDER_ID`) REFERENCES `manag` (`MANAG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Кузновной номер` FOREIGN KEY (`ORDER_AUTO`) REFERENCES `marks` (`MARKS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Покупатель` FOREIGN KEY (`ORDER_CUST`) REFERENCES `customer` (`CUST_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2345,'1',1,'5870647','2021-05-11','2020-06-11','2021-05-14','1'),(2,3456,'2',2,'5870647','2021-01-28','2020-02-28','2021-01-31','1'),(3,4567,'3',3,'8092869','2021-03-14','2021-04-14','2021-04-18','1'),(4,5678,'4',4,'9203980','2021-04-18','2021-05-18','2021-04-21','1'),(5,6789,'5',5,'315091','2021-07-14','2021-08-14','2021-07-18','1'),(6,7900,'6',6,'426202','2021-06-23','2021-07-23','2021-06-27','1'),(7,9011,'7',7,'1537313','2021-07-14','2021-08-14','2021-07-18','1'),(8,10122,'8',8,'648424','2021-08-21','2021-09-21','2021-08-25','1'),(9,11233,'9',9,'759535','2021-09-25','2021-10-25','2021-09-29','1'),(10,12344,'10',10,'870646','2021-10-19','2021-11-19','2021-10-23','1');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `ID_MANAG` int NOT NULL,
  `SALARY` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `DATA_SALARY` date NOT NULL,
  `PREMIYA` int NOT NULL,
  PRIMARY KEY (`ID_MANAG`),
  CONSTRAINT `Менеджер` FOREIGN KEY (`ID_MANAG`) REFERENCES `manag` (`MANAG_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'13200','2020-11-29',13),(2,'14500','2020-10-13',14),(3,'15800','2020-09-27',15),(4,'17100','2020-08-14',17),(5,'18400','2020-07-25',18),(6,'19700','2020-06-01',19),(7,'21000','2020-06-11',21),(8,'22300','2020-05-18',22),(9,'23600','2020-04-13',23),(10,'24900','2020-03-17',24);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'autoshow'
--

--
-- Dumping routines for database 'autoshow'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-10 14:41:51
