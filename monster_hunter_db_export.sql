/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.1.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: monster_hunter_db
-- ------------------------------------------------------
-- Server version	12.1.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Drops`
--

DROP TABLE IF EXISTS `Drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drops` (
  `Drop_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Monster_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Drop_Rate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Drop_ID`),
  KEY `Monster_ID` (`Monster_ID`),
  KEY `Item_ID` (`Item_ID`),
 FOREIGN KEY (`Monster_ID`) REFERENCES `Monster` (`Monster_ID`),
 FOREIGN KEY (`Item_ID`) REFERENCES `Item` (`Item_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drops`
--

LOCK TABLES `Drops` WRITE;
/*!40000 ALTER TABLE `Drops` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Drops` VALUES
(1,1,1,0.24),
(2,1,2,0.26),
(3,1,3,0.20),
(4,1,4,0.13),
(5,1,8,0.03),
(6,1,9,0.14),
(7,1,10,0.24),
(8,1,11,0.19),
(9,1,12,0.13),
(10,1,16,0.02);
/*!40000 ALTER TABLE `Drops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Element`
--

DROP TABLE IF EXISTS `Element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Element` (
  `Element_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Element_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Element`
--

LOCK TABLES `Element` WRITE;
/*!40000 ALTER TABLE `Element` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Element` VALUES
(1,'Fire','Fire.png'),
(2,'Water','Water.png'),
(3,'Thunder','Thunder.png'),
(4,'Ice','Ice.png'),
(5,'Dragon','Dragon.png'),
(6,'Poison','Poison.png'),
(7,'Sleep','Sleep.png'),
(8,'Paralysis','Paralysis.png'),
(9,'Blast','Blast.png'),
(10,'Stun','Stun.png');
/*!40000 ALTER TABLE `Element` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Habitat`
--

DROP TABLE IF EXISTS `Habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Habitat` (
  `Habitat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Habitat_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Habitat`
--

LOCK TABLES `Habitat` WRITE;
/*!40000 ALTER TABLE `Habitat` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Habitat` VALUES
(1,'Ancient Forest','A vast, complex forest ecosystem with a giant tree at its center.','loc_ancient_forest.png'),
(2,'Wildspire Waste','A mix of arid desert and swampy marshlands, home to diverse life.','loc_wildspire_waste.png'),
(3,'Coral Highlands','A mysterious mountaintop that resembles an underwater reef, but on land.','loc_coral_highlands.png'),
(4,'Rotten Vale','A graveyard for monsters where decomposition creates a toxic, effluvial environment.','loc_rotten_vale.png'),
(5,'Elders Recess','A volcanic region filled with crystallized energy, attracting Elder Dragons.','loc_elders_recess.png'),
(6,'Hoarfrost Reach','A frozen continent of eternal snow and ice.','loc_hoarfrost_reach.png'),
(7,'Guiding Lands','A mysterious island amalgamating features of all other ecosystems.','loc_guiding_lands.png'),
(8,'Shrine Ruins','A desolate mountain shrine reclaimed by nature.','loc_shrine_ruins.png'),
(9,'Frost Islands','A gigantic dragon skeleton lies in the center of this frozen archipelago.','loc_frost_islands.png'),
(10,'Sandy Plains','A desolate wasteland with searing days and freezing nights.','loc_sandy_plains.png'),
(11,'Flooded Forest','A dense jungle submerged in water, filled with ancient ruins.','loc_flooded_forest.png'),
(12,'Lava Caverns','A volcanic network of caves flowing with magma and water.','loc_lava_caverns.png'),
(13,'Jungle','A classic seaside jungle with dense vegetation and underground caves.','loc_jungle.png'),
(14,'Citadel','An abandoned fortress surrounded by frozen peaks and toxic forests.','loc_citadel.png');
/*!40000 ALTER TABLE `Habitat` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Hunter`
--

DROP TABLE IF EXISTS `Hunter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hunter` (
  `Hunter_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Hunter_Rank` varchar(20) DEFAULT 'LR 1',
  PRIMARY KEY (`Hunter_ID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hunter`
--

LOCK TABLES `Hunter` WRITE;
/*!40000 ALTER TABLE `Hunter` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Hunter` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Hunter_Record`
--

DROP TABLE IF EXISTS `Hunter_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hunter_Record` (
  `Record_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hunter_ID` int(11) DEFAULT NULL,
  `Monster_ID` int(11) DEFAULT NULL,
  `Kills` int(11) DEFAULT 0,
  `Captures` int(11) DEFAULT 0,
  PRIMARY KEY (`Record_ID`),
  UNIQUE KEY `Hunter_ID` (`Hunter_ID`,`Monster_ID`),
  KEY `Monster_ID` (`Monster_ID`),
 FOREIGN KEY (`Hunter_ID`) REFERENCES `Hunter` (`Hunter_ID`),
 FOREIGN KEY (`Monster_ID`) REFERENCES `Monster` (`Monster_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hunter_Record`
--

LOCK TABLES `Hunter_Record` WRITE;
/*!40000 ALTER TABLE `Hunter_Record` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Hunter_Record` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item` (
  `Item_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Rarity` int(11) NOT NULL DEFAULT 1,
  `Rank_Tier` varchar(20) GENERATED ALWAYS AS (case when `Rarity` between 1 and 4 then 'Low Rank' when `Rarity` between 5 and 9 then 'High Rank' when `Rarity` >= 10 then 'Master Rank' else 'Unknown' end) VIRTUAL,
  `Rank_Color` varchar(20) GENERATED ALWAYS AS (case when `Rarity` between 1 and 4 then 'blue' when `Rarity` between 5 and 9 then 'orange' when `Rarity` >= 10 then 'gold' else 'gray' end) VIRTUAL,
  PRIMARY KEY (`Item_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Item` VALUES
(1,'Gleaming Shell',6,'High Rank','orange'),
(2,'Shimmering Scale',6,'High Rank','orange'),
(3,'Valstrax Claw+',6,'High Rank','orange'),
(4,'Valstrax Spineshell',6,'High Rank','orange'),
(5,'Valstrax Tail',6,'High Rank','orange'),
(6,'Crimson Liquid',6,'High Rank','orange'),
(7,'Rouge Spikewing',6,'High Rank','orange'),
(8,'Red Dragon Orb',7,'High Rank','orange'),
(9,'Glittering Shell',10,'Master Rank','gold'),
(10,'Shimmering Shard',10,'Master Rank','gold'),
(11,'Valstrax Talon',10,'Master Rank','gold'),
(12,'Valstrax Spineshell+',10,'Master Rank','gold'),
(13,'Valstrax Helixtail',10,'Master Rank','gold'),
(14,'Seething Crimson Liquid',10,'Master Rank','gold'),
(15,'Rouge Lancewing+',11,'Master Rank','gold'),
(16,'Red Dragonsphire',12,'Master Rank','gold');
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Monster`
--

DROP TABLE IF EXISTS `Monster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Monster` (
  `Monster_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `min_Size` decimal(10,2) DEFAULT NULL,
  `max_Size` decimal(10,2) DEFAULT NULL,
  `Hunter_Rank` int(11) NOT NULL,
  `Species_ID` int(11) DEFAULT NULL,
  `Habitat_ID` int(11) DEFAULT NULL,
  `Quest_Star_Rank` varchar(20) GENERATED ALWAYS AS (case when `Hunter_Rank` between 1 and 5 then concat('LR ',`Hunter_Rank`,'★') when `Hunter_Rank` between 6 and 9 then concat('HR ',`Hunter_Rank`,'★') when `Hunter_Rank` >= 10 then concat('MR ',`Hunter_Rank` - 9,'★') else 'Unknown' end) VIRTUAL,
  `Icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Monster_ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `Species_ID` (`Species_ID`),
  KEY `Habitat_ID` (`Habitat_ID`),
 FOREIGN KEY (`Species_ID`) REFERENCES `Species` (`Species_ID`),
 FOREIGN KEY (`Habitat_ID`) REFERENCES `Habitat` (`Habitat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monster`
--

LOCK TABLES `Monster` WRITE;
/*!40000 ALTER TABLE `Monster` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Monster` VALUES
(1,'Crimson Glow Valstrax','Silver Winged Star','A variant of the Valstrax Elder Dragon that has been driven mad by its own overflowing dragon energy. It dashes through the heavens like a crimson comet, indiscriminately hunting down anything in its sight. Its unstable energy causes it to constantly glow red, and it is known to unleash a devastating ambush from the stratosphere that can level entire ecosystems.',1836.88,2551.22,18,12,8,'MR 9★','valstrax.png');
/*!40000 ALTER TABLE `Monster` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Monster_Dmg_Element`
--

DROP TABLE IF EXISTS `Monster_Dmg_Element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Monster_Dmg_Element` (
  `Monster_ID` int(11) DEFAULT NULL,
  `Element_ID` int(11) DEFAULT NULL,
  KEY `Monster_ID` (`Monster_ID`),
  KEY `Element_ID` (`Element_ID`),
 FOREIGN KEY (`Monster_ID`) REFERENCES `Monster` (`Monster_ID`),
 FOREIGN KEY (`Element_ID`) REFERENCES `Element` (`Element_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monster_Dmg_Element`
--

LOCK TABLES `Monster_Dmg_Element` WRITE;
/*!40000 ALTER TABLE `Monster_Dmg_Element` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Monster_Dmg_Element` VALUES
(1,5);
/*!40000 ALTER TABLE `Monster_Dmg_Element` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Monster_Weakness`
--

DROP TABLE IF EXISTS `Monster_Weakness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Monster_Weakness` (
  `Monster_ID` int(11) DEFAULT NULL,
  `Element_ID` int(11) DEFAULT NULL,
  KEY `Monster_ID` (`Monster_ID`),
  KEY `Element_ID` (`Element_ID`),
 FOREIGN KEY (`Monster_ID`) REFERENCES `Monster` (`Monster_ID`),
 FOREIGN KEY (`Element_ID`) REFERENCES `Element` (`Element_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monster_Weakness`
--

LOCK TABLES `Monster_Weakness` WRITE;
/*!40000 ALTER TABLE `Monster_Weakness` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Monster_Weakness` VALUES
(1,1),
(1,2),
(1,4),
(1,3);
/*!40000 ALTER TABLE `Monster_Weakness` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Species`
--

DROP TABLE IF EXISTS `Species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Species` (
  `Species_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`Species_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Species`
--

LOCK TABLES `Species` WRITE;
/*!40000 ALTER TABLE `Species` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Species` VALUES
(1,'Fanged Wyvern','Quadrupedal wyverns with heavy builds and developed limbs, often resembling wolves or lizards.'),
(2,'Flying Wyvern','The most common classification, typically possessing wings and strong legs.'),
(3,'Brute Wyvern','Bipedal wyverns adapted for land, known for brute strength and heavy plating.'),
(4,'Bird Wyvern','Smaller, often feathered wyverns that mimic avian characteristics.'),
(5,'Piscine Wyvern','Fish-like wyverns adapted for swimming in water, mud, or even lava.'),
(6,'Leviathan','Large marine reptiles that dominate aquatic environments.'),
(7,'Fanged Beast','Mammalian monsters that lack wings, ranging from bear-like to primate-like creatures.'),
(8,'Amphibian','Frog-like monsters capable of extreme physical shifts, often using rocks or ice.'),
(9,'Temnoceran','Arachnid-like monsters capable of spinning webs or using claws to mimic other species.'),
(10,'Snake Wyvern','Serpentine monsters that use their long bodies to strike or coil around prey.'),
(11,'Carapaceon','Crustacean-like monsters with hard shells, often using monster skulls for protection.'),
(12,'Elder Dragon','Creatures that defy standard classification and possess power capable of altering ecosystems.'),
(13,'Relict','Ancient creatures from other worlds or times (e.g., Leshen).'),
(14,'Neopteron','Insect-like monsters that often swarm or use fluids to attack.');
/*!40000 ALTER TABLE `Species` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Weapon`
--

DROP TABLE IF EXISTS `Weapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Weapon` (
  `Weapon_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Weapon_Type_ID` int(11) DEFAULT NULL,
  `Attack_Power` int(11) NOT NULL,
  `Element_ID` int(11) DEFAULT NULL,
  `Element_Value` int(11) DEFAULT 0,
  `Affinity` int(11) DEFAULT 0,
  `Rarity` int(11) DEFAULT 1,
  PRIMARY KEY (`Weapon_ID`),
  KEY `Weapon_Type_ID` (`Weapon_Type_ID`),
  KEY `Element_ID` (`Element_ID`),
 FOREIGN KEY (`Weapon_Type_ID`) REFERENCES `Weapon_Type` (`Weapon_Type_ID`),
 FOREIGN KEY (`Element_ID`) REFERENCES `Element` (`Element_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Weapon`
--

LOCK TABLES `Weapon` WRITE;
/*!40000 ALTER TABLE `Weapon` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Weapon` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Weapon_Crafting`
--

DROP TABLE IF EXISTS `Weapon_Crafting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Weapon_Crafting` (
  `Weapon_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  KEY `Weapon_ID` (`Weapon_ID`),
  KEY `Item_ID` (`Item_ID`),
 FOREIGN KEY (`Weapon_ID`) REFERENCES `Weapon` (`Weapon_ID`),
 FOREIGN KEY (`Item_ID`) REFERENCES `Item` (`Item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Weapon_Crafting`
--

LOCK TABLES `Weapon_Crafting` WRITE;
/*!40000 ALTER TABLE `Weapon_Crafting` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `Weapon_Crafting` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Weapon_Type`
--

DROP TABLE IF EXISTS `Weapon_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Weapon_Type` (
  `Weapon_Type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Weapon_Type_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Weapon_Type`
--

LOCK TABLES `Weapon_Type` WRITE;
/*!40000 ALTER TABLE `Weapon_Type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Weapon_Type` VALUES
(1,'Great Sword','wep_gs.png'),
(2,'Long Sword','wep_ls.png'),
(3,'Sword and Shield','wep_sns.png'),
(4,'Dual Blades','wep_db.png'),
(5,'Lance','wep_lance.png'),
(6,'Gunlance','wep_gl.png'),
(7,'Hammer','wep_hammer.png'),
(8,'Hunting Horn','wep_hh.png'),
(9,'Switch Axe','wep_sa.png'),
(10,'Charge Blade','wep_cb.png'),
(11,'Insect Glaive','wep_ig.png'),
(12,'Light Bowgun','wep_lbg.png'),
(13,'Heavy Bowgun','wep_hbg.png'),
(14,'Bow','wep_bow.png');
/*!40000 ALTER TABLE `Weapon_Type` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-12-18 19:38:22
