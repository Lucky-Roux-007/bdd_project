SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monster_hunter_db`
-- Only contains data differences from setup.sql
--

--
-- Dumping data for table `Hunters`
--

INSERT INTO `Hunters` (`Hunter_ID`, `username`, `password`, `rank`, `created_at`, `favorite_game`, `favorite_monster_id`, `profile_picture`, `rank_type`, `rank_level`, `palico_name`, `hunter_screenshot`, `favorite_weapon`) VALUES
(1, 'Zentai', '$2y$10$mO0YCXsasNgyThpaQXpXKeGtnkzZeNWcNfPv0bpk/rzCSRuayCX/a', 'Novice', '2025-12-24 17:26:36', 'Monster Hunter', NULL, 'default_hunter.png', NULL, 1, 'Palico', NULL, 'Great Sword'),
(2, 'Zentai_Kun', '$2y$10$uW8PO43MewwBExQdQvW2He.QgSd9a0Bj7xLTG/hwGHacZpS0BzVLi', 'Novice', '2025-12-24 17:28:20', 'Monster Hunter', NULL, 'default_hunter.png', NULL, 1, 'Palico', NULL, 'Great Sword'),
(3, 'ZentaiZeppeli', '$2y$10$jcAiviF8SOh/pvnTZ9ueDeKx4Ri0zOmjFZp4DrrcLCaLbsVw0DuwG', 'Hunter Rank 74', '2025-12-24 17:46:39', 'MH World: Iceborne', 9, 'default_hunter.png', NULL, 1, 'Palico', NULL, 'Great Sword'),
(4, 'ZentaiKennedy', '$2y$10$gmEig1dhMcR6dzahCocmLeCcEuftPM.SEYfqp5dXP1oIjHomeA5na', 'Novice', '2025-12-24 17:56:28', 'MH World: Iceborne', 38, 'hunter_4_1766600386.png', 'MR', 54, 'Miso', 'shot_4_1766600386.png', 'Dual Blades'),
(5, 'ZentaiFist', '$2y$10$nIFLxS0rI4rHIBa3k/G0fOJwejVyjBTfSv1qe9Ph0/gK0XUwbWvka', 'Novice', '2026-01-18 15:55:43', 'MH World: Iceborne', 38, 'hunter_ZentaiFist_1768751743.jpg', 'MR', 25, 'Miso', NULL, 'Dual Blades'),
(6, 'ZentaiTest', '$2y$10$gmEig1dhMcR6dzahCocmLeCcEuftPM.SEYfqp5dXP1oIjHomeA5na', 'Novice', '2026-01-18 16:10:26', 'MH Wilds', 38, 'hunter_ZentaiTest_1768752625.jpg', 'MR', 25, 'Miso', NULL, 'Dual Blades');

--
-- Data for table `Item`
--

INSERT INTO `Item` (`Item_ID`, `Name`, `Rarity`) VALUES
(1, 'Gleaming Shell', 6),
(2, 'Shimmering Scale', 6),
(3, 'Valstrax Claw+', 6),
(4, 'Valstrax Spineshell', 6),
(5, 'Valstrax Tail', 6),
(6, 'Crimson Liquid', 6),
(7, 'Rouge Spikewing', 6),
(8, 'Red Dragon Orb', 7),
(9, 'Glittering Shell', 10),
(10, 'Shimmering Shard', 10),
(11, 'Valstrax Talon', 10),
(12, 'Valstrax Spineshell+', 10),
(13, 'Valstrax Helixtail', 10),
(14, 'Seething Crimson Liquid', 10),
(15, 'Rouge Lancewing+', 11),
(16, 'Red Dragonsphire', 12),
(17, 'Great Jagras Scale+', 6),
(18, 'Great Jagras Hide+', 6),
(19, 'Great Jagras Claw+', 6),
(20, 'Great Jagras Mane', 6),
(21, 'Great Jagras Shard', 9),
(22, 'Great Jagras Thickhide', 9),
(23, 'Great Jagras Hardclaw', 9),
(24, 'Great Jagras Mane+', 9),
(25, 'Kulu-Ya-Ku Scale+', 6),
(26, 'Kulu-Ya-Ku Hide+', 6),
(27, 'Kulu-Ya-Ku Beak+', 6),
(28, 'Kulu-Ya-Ku Plume+', 6),
(29, 'Kulu-Ya-Ku Shard', 9),
(30, 'Kulu-Ya-Ku Thickhide', 9),
(31, 'Kulu-Ya-Ku Hardbeak', 9),
(32, 'Kulu-Ya-Ku Large Plume', 9),
(33, 'Pukei-Pukei Scale+', 6),
(34, 'Pukei-Pukei Carapace', 6),
(35, 'Pukei-Pukei Sac+', 6),
(36, 'Pukei-Pukei Quill', 6),
(37, 'Pukei-Pukei Tail', 6),
(38, 'Pukei-Pukei Cortex', 9),
(39, 'Pukei-Pukei Fellwing', 9),
(40, 'Pukei-Pukei Lash', 9),
(41, 'Pukei-Pukei Shard', 9),
(42, 'Large Toxin Sac', 9),
(43, 'Barroth Carapace', 6),
(44, 'Barroth Ridge+', 6),
(45, 'Barroth Claw+', 6),
(46, 'Barroth Scalp', 6),
(47, 'Barroth Tail', 6),
(48, 'Wyvern Gem', 7),
(49, 'Barroth Cortex', 9),
(50, 'Barroth Chine', 9),
(51, 'Barroth Hardclaw', 9),
(52, 'Barroth Crown', 9),
(53, 'Barroth Lash', 9),
(54, 'Jyuratodus Scale+', 6),
(55, 'Jyuratodus Carapace', 6),
(56, 'Jyuratodus Fang+', 6),
(57, 'Jyuratodus Fin+', 6),
(58, 'Jyuratodus Cortex', 9),
(59, 'Jyuratodus Hardfang', 9),
(60, 'Jyuratodus Grandfin', 9),
(61, 'Jyuratodus Shard', 9),
(62, 'Tobi-Kadachi Scale+', 6),
(63, 'Tobi-Kadachi Pelt+', 6),
(64, 'Tobi-Kadachi Electrode+', 6),
(65, 'Tobi-Kadachi Membrane', 6),
(66, 'Tobi-Kadachi Claw+', 6),
(67, 'Tobi-Kadachi Shard', 9),
(68, 'Tobi-Kadachi Thickfur', 9),
(69, 'Tobi-Kadachi Hardclaw', 9),
(70, 'Tobi-Kadachi Membrane+', 9),
(71, 'Tobi-Kadachi Cathode', 9),
(72, 'Anjanath Scale+', 6),
(73, 'Anjanath Pelt+', 6),
(74, 'Anjanath Fang+', 6),
(75, 'Anjanath Nosebone+', 6),
(76, 'Anjanath Tail', 6),
(77, 'Anjanath Plate', 5),
(78, 'Anjanath Gem', 7),
(79, 'Inferno Sac', 6),
(80, 'Anjanath Shard', 9),
(81, 'Anjanath Fur', 9),
(82, 'Anjanath Hardfang', 9),
(83, 'Heavy Anjanath Nosebone', 9),
(84, 'Anjanath Lash', 9),
(85, 'Anjanath Mantle', 11),
(86, 'Conflagrant Sac', 9),
(87, 'Rathalos Scale+', 6),
(88, 'Rathalos Carapace', 6),
(89, 'Rathalos Wing', 6),
(90, 'Rathalos Webbing', 6),
(91, 'Rathalos Tail', 6),
(92, 'Rathalos Marrow', 6),
(93, 'Rathalos Medulla', 6),
(94, 'Rathalos Plate', 5),
(95, 'Rathalos Ruby', 7),
(96, 'Rath Wingtalon+', 6),
(97, 'Rathalos Shard', 9),
(98, 'Rathalos Cortex', 9),
(99, 'Rathalos Fellwing', 9),
(100, 'Rathalos Lash', 9),
(101, 'Rathalos Mantle', 11),
(102, 'Rath Wingripper', 9),
(103, 'Diablos Ridge+', 6),
(104, 'Diablos Carapace', 6),
(105, 'Diablos Fang', 6),
(106, 'Diablos Tailcase', 6),
(107, 'Diablos Marrow', 6),
(108, 'Blos Medulla', 7),
(109, 'Twisted Horn', 6),
(110, 'Majestic Horn', 7),
(111, 'Dash Extract', 4),
(112, 'Diablos Cortex', 9),
(113, 'Diablos Chine', 9),
(114, 'Diablos Hardfang', 9),
(115, 'Twisted Stouthorn', 9),
(116, 'Diablos Lash', 9),
(117, 'Paolumu Scale+', 6),
(118, 'Paolumu Carapace', 6),
(119, 'Paolumu Webbing', 6),
(120, 'Paolumu Pelt+', 6),
(121, 'Paolumu Wing', 6),
(122, 'Paolumu Shard', 9),
(123, 'Paolumu Cortex', 9),
(124, 'Paolumu Thickfur', 9),
(125, 'Paolumu Fellwing', 9),
(126, 'Legiana Scale+', 6),
(127, 'Legiana Hide+', 6),
(128, 'Legiana Claw+', 6),
(129, 'Legiana Webbing', 6),
(130, 'Legiana Tail Webbing', 6),
(131, 'Legiana Plate', 5),
(132, 'Legiana Gem', 7),
(133, 'Freezer Sac', 6),
(134, 'Legiana Shard', 10),
(135, 'Legiana Thickhide', 10),
(136, 'Legiana Hardclaw', 10),
(137, 'Legiana Mantle', 11),
(138, 'Cryo Sac', 9),
(139, 'Odogaron Scale+', 6),
(140, 'Odogaron Sinew+', 6),
(141, 'Odogaron Claw+', 6),
(142, 'Odogaron Tail', 6),
(143, 'Odogaron Fang+', 6),
(144, 'Odogaron Plate', 5),
(145, 'Odogaron Gem', 7),
(146, 'Odogaron Shard', 10),
(147, 'Odogaron Cortex', 10),
(148, 'Odogaron Hardclaw', 10),
(149, 'Odogaron Hardfang', 10),
(150, 'Odogaron Lash', 10),
(151, 'Odogaron Mantle', 11),
(152, 'Dodogama Hide+', 6),
(153, 'Dodogama Jaw', 6),
(154, 'Dodogama Tail', 6),
(155, 'Dodogama Talon', 6),
(156, 'Dodogama Thickhide', 9),
(157, 'Dodogama Hardclaw', 9),
(158, 'Dodogama Lash', 9),
(159, 'Dodogama Mandible', 9),
(160, 'Immortal Dragonscale', 7),
(161, 'Nergigante Carapace', 7),
(162, 'Nergigante Talon', 7),
(163, 'Nergigante Tail', 7),
(164, 'Nergigante Horn+', 7),
(165, 'Nergigante Regrowth Plate', 7),
(166, 'Nergigante Gem', 8),
(167, 'Banbaro Cortex', 10),
(168, 'Banbaro Chine', 10),
(169, 'Banbaro Great Horn', 10),
(170, 'Banbaro Lash', 10),
(171, 'Beotodus Shard', 10),
(172, 'Beotodus Cortex', 10),
(173, 'Beotodus Hardhorn', 10),
(174, 'Beotodus Grandfin', 10),
(175, 'Barioth Cortex', 10),
(176, 'Barioth Thickfur', 10),
(177, 'Barioth Hardclaw', 10),
(178, 'Barioth Greatspike', 10),
(179, 'Barioth Lash', 10),
(180, 'Nargacuga Shard', 10),
(181, 'Nargacuga Blackfur+', 10),
(182, 'Nargacuga Hardfang', 10),
(183, 'Nargacuga Cutwing+', 10),
(184, 'Nargacuga Lash', 10),
(185, 'Nargacuga Tailspear', 10),
(186, 'Nargacuga Mantle', 11),
(187, 'Tigrex Shard', 10),
(188, 'Tigrex Cortex', 10),
(189, 'Tigrex Hardclaw', 10),
(190, 'Tigrex Hardfang', 10),
(191, 'Tigrex Lash', 10),
(192, 'Tigrex Maw', 10),
(193, 'Tigrex Mantle', 11),
(194, 'Glavenus Shard', 10),
(195, 'Glavenus Cortex', 10),
(196, 'Glavenus Hardfang', 10),
(197, 'Glavenus Pyroshell', 10),
(198, 'Glavenus Tailedge', 10),
(199, 'Glavenus Mantle', 11),
(200, 'Brachydios Cortex', 10),
(201, 'Brachydios Ebonshell+', 10),
(202, 'Brachydios Pounder+', 10),
(203, 'Brachydios Lash', 10),
(204, 'Brachydios Crown', 10),
(205, 'Brachydios Pallium', 11),
(206, 'Zinogre Cortex', 10),
(207, 'Zinogre Hardclaw', 10),
(208, 'Zinogre Deathly Shocker', 10),
(209, 'Zinogre Hardhorn', 10),
(210, 'Zinogre Lash', 10),
(211, 'Zinogre Skymerald', 11),
(212, 'Rajang Hardfang', 11),
(213, 'Rajang Wildpelt', 11),
(214, 'Rajang Hardclaw', 11),
(215, 'Rajang Tail', 11),
(216, 'Gold Rajang Pelt', 11),
(217, 'Rajang Heart', 12),
(218, 'Daora Dragon Scale+', 7),
(219, 'Daora Carapace', 7),
(220, 'Daora Claw+', 7),
(221, 'Daora Horn+', 7),
(222, 'Daora Webbing', 7),
(223, 'Daora Tail', 7),
(224, 'Daora Gem', 8),
(225, 'Daora Cortex', 11),
(226, 'Daora Shard', 11),
(227, 'Daora Hardclaw', 11),
(228, 'Daora Hardhorn', 11),
(229, 'Daora Fellwing', 11),
(230, 'Daora Lash', 11),
(231, 'Large Elder Dragon Gem', 12),
(232, 'Teostra Carapace', 7),
(233, 'Fire Dragon Scale+', 7),
(234, 'Teostra Mane', 7),
(235, 'Teostra Claw+', 7),
(236, 'Teostra Horn+', 7),
(237, 'Teostra Webbing', 7),
(238, 'Teostra Tail', 7),
(239, 'Teostra Powder', 7),
(240, 'Teostra Gem', 8),
(241, 'Teostra Cortex', 11),
(242, 'Hellfire Shard', 11),
(243, 'Teostra Mane+', 11),
(244, 'Teostra Hardclaw', 11),
(245, 'Teostra Hardhorn', 11),
(246, 'Teostra Fellwing', 11),
(247, 'Teostra Lash', 11),
(248, 'Lunastra Carapace', 7),
(249, 'Lunastra Scale+', 7),
(250, 'Lunastra Mane', 7),
(251, 'Lunastra Wing', 7),
(252, 'Lunastra Horn', 7),
(253, 'Lunastra Tail', 7),
(254, 'Lunastra Gem', 8),
(255, 'Lunastra Cortex', 11),
(256, 'Lunastra Shard', 11),
(257, 'Lunastra Mane+', 11),
(258, 'Lunastra Hardhorn', 11),
(259, 'Lunastra Fellwing', 11),
(260, 'Lunastra Lash', 11),
(261, 'Vaal Hazak Carapace', 7),
(262, 'Vaal Hazak Fang+', 7),
(263, 'Vaal Hazak Gem', 8),
(264, 'Vaal Hazak Talon', 7),
(265, 'Vaal Hazak Membrane', 7),
(266, 'Vaal Hazak Tail', 7),
(267, 'Vaal Hazak Wing', 7),
(268, 'Vaal Hazak Cortex', 11),
(269, 'Vaal Hazak Hardfang', 11),
(270, 'Vaal Hazak Fellwing', 11),
(271, 'Kirin Hide+', 7),
(272, 'Kirin Azure Horn', 7),
(273, 'Kirin Thundertail', 7),
(274, 'Kirin Mane', 7),
(275, 'Kirin Fine Hide', 11),
(276, 'Kirin Silver Mane', 11),
(277, 'Kirin Azure Horn+', 11),
(278, 'Namielle Cortex', 11),
(279, 'Namielle Hardclaw', 11),
(280, 'Namielle Fellwing', 11),
(281, 'Namielle Whisker', 11),
(282, 'Namielle Lash', 11),
(283, 'Abyssal LED', 12),
(284, 'Velkhana Cortex', 11),
(285, 'Velkhana Hardclaw', 11),
(286, 'Velkhana Crownhorn', 11),
(287, 'Velkhana Fellwing', 11),
(288, 'Velkhana Lash', 11),
(289, 'Velkhana Crystal', 12),
(290, 'Deathweaver Cortex', 11),
(291, 'Blackveil Fellwing', 11),
(292, 'Deathweaver Limb', 11),
(293, 'Deathweaver Membrane', 11),
(294, 'Kulve Taroth Golden Scale', 8),
(295, 'Golden Spiral Horn', 8),
(296, 'Glimstone', 8),
(297, 'Kulve Taroth Golden Shell', 8),
(298, 'Kulve Taroth Golden Nugget', 8),
(299, 'Golden Dragonsphire', 12),
(300, 'Immortal Shard', 11),
(301, 'Nergigante Cortex', 11),
(302, 'Nergigante Hardclaw', 11),
(303, 'Nergigante Lash', 11),
(304, 'Annihilating Greathorn', 12),
(305, 'Eternal Regrowth Plate', 12),
(306, 'Shara Ishvalda Tenderplate', 12),
(307, 'Shara Ishvalda Petalstone', 12),
(308, 'Shara Ishvalda Tenderclaw', 12),
(309, 'Shara Ishvalda Gem', 12),
(310, 'Safi\'jiiva Cortex', 12),
(311, 'Safi\'jiiva Hardhorn', 12),
(312, 'Safi\'jiiva Fellwing', 12),
(313, 'Safi\'jiiva Lash', 12),
(314, 'Safi\'jiiva Shard', 12),
(315, 'Zionium Crystal', 12),
(316, 'Alatreon Cortex', 12),
(317, 'Alatreon Riptalon', 12),
(318, 'Alatreon Direwing', 12),
(319, 'Alatreon Diretail', 12),
(320, 'Skyswayer', 12),
(321, 'Azure Dragonsphire', 12),
(322, 'Fatalis Cortex', 12),
(323, 'Fatalis Pectus', 12),
(324, 'Fatalis Hardhorn', 12),
(325, 'Fatalis Shard', 12),
(326, 'Fatalis Evil Eye', 12);

-- --------------------------------------------------------

--
-- Table structure for table `Monster`
--

DROP TABLE IF EXISTS `Monster`;
CREATE TABLE `Monster` (
  `Monster_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `min_Size` decimal(10,2) DEFAULT NULL,
  `max_Size` decimal(10,2) DEFAULT NULL,
  `Hunter_Rank` int(11) NOT NULL,
  `Species_ID` int(11) DEFAULT NULL,
  `Habitat_ID` int(11) DEFAULT NULL,
  `Quest_Star_Rank` varchar(20) GENERATED ALWAYS AS (case when `Hunter_Rank` between 1 and 5 then concat('LR ',`Hunter_Rank`,'★') when `Hunter_Rank` between 6 and 9 then concat('HR ',`Hunter_Rank`,'★') when `Hunter_Rank` >= 10 then concat('MR ',`Hunter_Rank` - 9,'★') else 'Unknown' end) VIRTUAL,
  `Icon` varchar(255) DEFAULT NULL

-- ========================================
-- DATA INSERTS ONLY
-- ========================================

--
-- Data for table `Hunters`
--

INSERT INTO `Monster` (`Monster_ID`, `Name`, `Title`, `Description`, `min_Size`, `max_Size`, `Hunter_Rank`, `Species_ID`, `Habitat_ID`, `Icon`) VALUES
(1, 'Crimson Glow Valstrax', 'Silver Winged Star', 'A variant of the Valstrax Elder Dragon that has been driven mad by its own overflowing dragon energy. It dashes through the heavens like a crimson comet, indiscriminately hunting down anything in its sight. Its unstable energy causes it to constantly glow red, and it is known to unleash a devastating ambush from the stratosphere that can level entire ecosystems.', 1836.88, 2551.22, 18, 12, 8, 'valstrax.png'),
(2, 'Great Jagras', 'The Glutton', 'The alpha leader of the Jagras pack. It is famous for its distensible jaw and massive stomach, allowing it to swallow prey like Kestodon whole. When gorged, its belly drags on the ground, making it sluggish but adding immense weight to its rolling attacks. It regurgitates food to feed its smaller kin.', 1100.00, 1300.00, 2, 1, 1, 'great_jagras.png'),
(3, 'Kulu-Ya-Ku', 'Scratching Bird', 'A peculiar Bird Wyvern with developed forelimbs capable of grasping objects. It is known to dig up rocks to use as shields or blunt weapons against predators. Its favorite meal is monster eggs, which it steals with surprising dexterity and cracks open using stone tools.', 850.00, 1000.00, 2, 4, 1, 'kulu_ya_ku.png'),
(4, 'Pukei-Pukei', 'Poison Bird', 'A Bird Wyvern known for the toxic venom it stores in its throat and tail. It consumes various flora like Scatteranuts, storing them in its mouth to mix with poison before spitting the volatile mixture at threats. When enraged, its tongue lolls out, and its feathers flush with color.', 1050.00, 1250.00, 3, 4, 1, 'pukei_pukei.png'),
(5, 'Barroth', 'Landslide Wyvern', 'A Brute Wyvern that thrives in the harsh desert heat. It wallows in mud to cool off and protect its carapace from parasites. This hardened mud serves as armor that must be broken off. It possesses a uniquely shaped crown used for plowing through terrain and smashing rivals.', 1300.00, 1700.00, 3, 3, 2, 'barroth.png'),
(6, 'Jyuratodus', 'Mud Fish', 'A Piscine Wyvern that dominates the muddy swamps of the Wildspire Waste. Unlike other aquatic monsters, it thrives in thick muck, using it to coat its body and trap prey. It is fiercely territorial and engages in turf wars with Barroth over the best mud baths.', 1400.00, 1600.00, 4, 5, 2, 'jyuratodus.png'),
(7, 'Tobi-Kadachi', 'Thunder Squirrel', 'A Fanged Wyvern that dwells in the forest canopy. By brushing its fur against bark and the ground, it builds up static electricity, which it stores in its electrodes. When fully charged, its fur stands on end and it enters a glowing, electrified state, unleashing lightning-fast strikes.', 1100.00, 1400.00, 4, 1, 1, 'tobi_kadachi.png'),
(8, 'Anjanath', 'Fierce Jaw', 'A belligerent Brute Wyvern that aggressively patrols the Ancient Forest. It possesses a specialized organ in its throat that allows it to breathe streams of fire. When provoked, it extends a sail-like fin from its back and flares its nasal bone, signaling an imminent fiery outburst.', 1500.00, 2000.00, 5, 3, 1, 'anjanath.png'),
(9, 'Rathalos', 'King of the Skies', 'The undisputed apex predator of the Ancient Forest. A Flying Wyvern that descends from the heavens to strike with poison-tipped talons and devastating fireballs. Its mastery of flight allows it to patrol vast territories, marking its domain with scorched earth.', 1600.00, 2200.00, 6, 2, 1, 'rathalos.png'),
(10, 'Diablos', 'Horned Tyrant', 'The apex monster of the Wildspire Waste. Despite being a herbivore that feeds on cacti, it is exceptionally aggressive towards any intruder. It uses its massive, twisted horns to gore enemies and can burrow underground to ambush prey from below with tremors.', 1900.00, 2400.00, 6, 2, 2, 'diablos.png'),
(11, 'Paolumu', 'Floating Wyvern', 'A Flying Wyvern from the Coral Highlands that feeds on eggs and coral polyps. It possesses a unique neck pouch that inflates with air, allowing it to float like a balloon. It uses this buoyancy to maneuver in the air and unleash compressed blasts of wind.', 1000.00, 1300.00, 4, 2, 3, 'paolumu.png'),
(12, 'Legiana', 'Apex of the Coral', 'The elegant apex predator of the Coral Highlands. Its sleek, leather-like hide and specialized wing membrane allow it to emit chilling winds, freezing prey in its tracks. It is known for its graceful, acrobatic flight and piercing screech.', 1500.00, 1800.00, 6, 2, 3, 'legiana.png'),
(13, 'Odogaron', 'Ebony Dog', 'A terrifying Fanged Wyvern that prowls the Rotten Vale. Its metabolism is incredibly high, forcing it to constantly hunt and scavenge for carrion. Its double row of claws causes severe bleeding wounds, and it is known to drag prey back to its lair to consume later.', 1300.00, 1600.00, 7, 1, 4, 'odogaron.png'),
(14, 'Dodogama', 'Rock Eater', 'A Fanged Wyvern that feeds on the volatile rocks of the Elders Recess. Its saliva reacts with the minerals in the stone, creating explosive compounds that it spits at threats. Despite its massive jaw and destructive power, it is generally docile unless provoked.', 1100.00, 1400.00, 6, 1, 5, 'dodogama.png'),
(15, 'Nergigante', 'Extinction Dragon', 'An Elder Dragon that feeds on other Elder Dragons. It possesses a unique regenerative ability where it grows white spikes that harden into black, indestructible armor over time. It fights with reckless abandon, often damaging its own body to destroy its enemies.', 1800.00, 2300.00, 9, 12, 5, 'nergigante.png'),
(16, 'Banbaro', 'Horn Wyvern', 'A brute wyvern with massive antlers that it uses to gore enemies. It charges through the snow, picking up trees and boulders to hurl at hunters. Despite its size, it is surprisingly agile and will travel across ecosystems.', 1900.00, 2600.00, 10, 3, 6, 'banbaro.png'),
(17, 'Beotodus', 'Snow Fish Wyvern', 'A piscine wyvern that swims freely through the deep snow of the Hoarfrost Reach. It uses its sharp horn to cut through frozen terrain and ambush prey from below. It wraps its body in snow armor to protect itself.', 1400.00, 1900.00, 10, 5, 6, 'beotodus.png'),
(18, 'Barioth', 'Tusk Wyvern', 'The ruler of the frozen tundra. This flying wyvern uses its spikes and tail to grip the ice, allowing it to move with terrifying speed. Its massive tusks can crush armor, and it unleashes powerful ice tornados.', 1800.00, 2300.00, 11, 2, 6, 'barioth.png'),
(19, 'Nargacuga', 'Swift Wyvern', 'A flying wyvern that has evolved to live in thick forests. It stalks prey from the shadows before striking with lightning speed. Its tail is covered in razor-sharp spikes that it can launch at enemies.', 1700.00, 2200.00, 11, 2, 1, 'nargacuga.png'),
(20, 'Tigrex', 'Roaring Wyvern', 'A flying wyvern known for its deafening roar and brute strength. It charges recklessly at foes, using its massive claws and jaws to tear through anything in its path. It is a primal force of nature.', 1700.00, 2400.00, 11, 2, 2, 'tigrex.png'),
(21, 'Glavenus', 'Cutting Wyvern', 'A brute wyvern that wields its tail like a great sword. It sharpens its tail with its fangs, heating it up to deliver searing slash attacks. It is one of the Fated Four.', 2200.00, 2800.00, 11, 3, 2, 'glavenus.png'),
(22, 'Brachydios', 'Crushing Wyvern', 'A brute wyvern that covers its fists and horn in a unique explosive slime. This slime detonates on impact or over time, allowing Brachydios to create minefields and deliver explosive punches.', 1500.00, 2000.00, 12, 3, 5, 'brachydios.png'),
(23, 'Zinogre', 'Thunder Wolf Wyvern', 'A fanged wyvern that gathers Thunderbugs to charge its body with electricity. When fully charged, it enters a super-state where its speed and power increase dramatically. It is extremely acrobatic.', 1400.00, 1900.00, 12, 1, 1, 'zinogre.png'),
(24, 'Rajang', 'Gold Lion', 'An ultra-aggressive fanged beast that hunts Kirin for their thunder horns. When enraged, its fur turns gold and it gains the ability to harden its arms. It is widely considered one of the most dangerous non-elder dragons.', 1000.00, 1400.00, 15, 7, 7, 'rajang.png'),
(25, 'Kushala Daora', 'Steel Dragon', 'An elder dragon shielded by powerful winds. Its metallic skin reflects light, and it can summon storms to keep enemies at bay. It sheds its rusted skin to maintain its steel-like armor.', 1800.00, 2400.00, 14, 12, 5, 'kushala_daora.png'),
(26, 'Teostra', 'Flame King Dragon', 'A male elder dragon clad in flames. It scatters explosive powder from its wings, which it ignites with its teeth to create massive explosions. It rules over volcanic environments.', 1700.00, 2200.00, 14, 12, 5, 'teostra.png'),
(27, 'Lunastra', 'Flame Queen Dragon', 'The female counterpart to Teostra. Her blue flames burn hotter than normal fire and cannot be extinguished easily. She fights with a calculated fury, often teaming up with her mate.', 1700.00, 2200.00, 14, 12, 5, 'lunastra.png'),
(28, 'Vaal Hazak', 'Corpse Coat Dragon', 'An elder dragon that inhabits the Rotten Vale. It covers itself in decaying flesh to cultivate deadly effluvium bacteria, which it uses to drain the life force of other creatures.', 1900.00, 2500.00, 14, 12, 4, 'vaal_hazak.png'),
(29, 'Kirin', 'Phantom Beast', 'An elder dragon resembling a unicorn. It summons lightning from the sky and moves faster than the eye can see. Its hide is incredibly tough, deflecting most attacks.', 500.00, 700.00, 13, 12, 3, 'kirin.png'),
(30, 'Xeno\'jiiva', 'Dark Light Dragon', 'A mysterious elder dragon born from the energy of the New World. It is translucent and glows with pure bio-energy. It is the larval form of a catastrophic being.', 4000.00, 4500.00, 16, 12, 5, 'xeno_jiiva.png'),
(31, 'Kulve Taroth', 'Golden Goddess', 'An elder dragon with a magnificent coat of gold. It hoards weapons and armor from fallen hunters, melting them down to add to its golden mantle. It resides deep within the Caverns of El Dorado.', 4500.00, 5000.00, 16, 12, 5, 'kulve_taroth.png'),
(32, 'Velkhana', 'Iceborne Wyvern', 'An elder dragon with the power to freeze all in its path. It controls the battlefield with walls of ice and breathes a liquid that freezes instantly upon contact. It is the flagship of the Hoarfrost Reach.', 2000.00, 2600.00, 15, 12, 6, 'velkhana.png'),
(33, 'Namielle', 'Abyssal Dragon', 'An elder dragon that controls water and electricity. Its wings glow with bioluminescent patterns, mesmerizing prey before it unleashes a high-voltage steam explosion.', 2000.00, 2500.00, 15, 12, 3, 'namielle.png'),
(34, 'Blackveil Vaal Hazak', 'Death Stench Dragon', 'A variant of Vaal Hazak infested with spores. It spreads effluvium over a much wider area and does not require the Rotten Vale to survive.', 1900.00, 2500.00, 15, 12, 1, 'blackveil_vaal_hazak.png'),
(35, 'Ruiner Nergigante', 'Devourer of Elders', 'A battle-hardened Nergigante with metallic spikes. It has survived countless battles and grown stronger, capable of launching spikes that cause bleeding.', 1800.00, 2300.00, 16, 12, 7, 'ruiner_nergigante.png'),
(36, 'Shara Ishvalda', 'Old Everwyrm', 'An elder dragon that manipulates the earth with vibrations. It covers itself in rock armor, appearing like a moving mountain before revealing its true, terrifying form.', 2500.00, 3000.00, 16, 12, 7, 'shara_ishvalda.png'),
(37, 'Safi\'jiiva', 'Red Dragon', 'The mature form of Xeno\'jiiva. It has absorbed enough energy to molt into a perfect red dragon. It can drain the energy of the land itself to heal its wounds.', 4500.00, 5000.00, 17, 12, 7, 'safi_jiiva.png'),
(38, 'Alatreon', 'Blazing Black Dragon', 'A legendary elder dragon known as a living natural disaster. It can control Fire, Ice, Thunder, Water, and Dragon elements, shifting its active state to destroy foes.', 2800.00, 3200.00, 18, 12, 7, 'alatreon.png'),
(39, 'Fatalis', 'The Black Dragon', 'A legendary dragon said to have destroyed a kingdom in a single night. Its fire is hot enough to melt steel instantly. It is the top of the food chain.', 4000.00, 4200.00, 19, 12, 7, 'fatalis.png');

-- --------------------------------------------------------

--
-- Table structure for table `Monster_Dmg_Element`
--

DROP TABLE IF EXISTS `Monster_Dmg_Element`;
CREATE TABLE `Monster_Dmg_Element` (
  `Monster_ID` int(11) DEFAULT NULL,
  `Element_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Monster_Dmg_Element`
--

INSERT INTO `Monster_Dmg_Element` (`Monster_ID`, `Element_ID`) VALUES
(1, 5),
(4, 6),
(7, 3),
(8, 1),
(9, 1),
(9, 6),
(12, 4),
(14, 9),
(6, 2),
(17, 4),
(18, 4),
(21, 1),
(22, 9),
(23, 3),
(24, 3),
(32, 4),
(33, 2),
(26, 1),
(27, 1),
(29, 3),
(31, 1),
(39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Monster_Weakness`
--

DROP TABLE IF EXISTS `Monster_Weakness`;
CREATE TABLE `Monster_Weakness` (
  `Monster_ID` int(11) DEFAULT NULL,
  `Element_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Monster_Weakness`
--

INSERT INTO `Monster_Weakness` (`Monster_ID`, `Element_ID`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 3),
(2, 1),
(3, 2),
(4, 3),
(5, 1),
(5, 2),
(6, 3),
(7, 2),
(8, 2),
(9, 5),
(9, 3),
(10, 4),
(11, 1),
(12, 3),
(13, 4),
(14, 3),
(15, 3),
(16, 5),
(17, 1),
(18, 1),
(19, 3),
(20, 3),
(21, 2),
(22, 4),
(23, 4),
(24, 4),
(25, 3),
(26, 2),
(27, 4),
(28, 1),
(29, 1),
(30, 6),
(31, 3),
(32, 1),
(33, 1),
(34, 1),
(35, 5),
(36, 4),
(37, 5),
(39, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Species`
--

DROP TABLE IF EXISTS `Species`;
CREATE TABLE `Species` (
  `Species_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Species`
--

INSERT INTO `Species` (`Species_ID`, `Name`, `Description`) VALUES
(1, 'Fanged Wyvern', 'Quadrupedal wyverns with heavy builds and developed limbs, often resembling wolves or lizards.'),
(2, 'Flying Wyvern', 'The most common classification, typically possessing wings and strong legs.'),
(3, 'Brute Wyvern', 'Bipedal wyverns adapted for land, known for brute strength and heavy plating.'),
(4, 'Bird Wyvern', 'Smaller, often feathered wyverns that mimic avian characteristics.'),
(5, 'Piscine Wyvern', 'Fish-like wyverns adapted for swimming in water, mud, or even lava.'),
(6, 'Leviathan', 'Large marine reptiles that dominate aquatic environments.'),
(7, 'Fanged Beast', 'Mammalian monsters that lack wings, ranging from bear-like to primate-like creatures.'),
(8, 'Amphibian', 'Frog-like monsters capable of extreme physical shifts, often using rocks or ice.'),
(9, 'Temnoceran', 'Arachnid-like monsters capable of spinning webs or using claws to mimic other species.'),
(10, 'Snake Wyvern', 'Serpentine monsters that use their long bodies to strike or coil around prey.'),
(11, 'Carapaceon', 'Crustacean-like monsters with hard shells, often using monster skulls for protection.'),
(12, 'Elder Dragon', 'Creatures that defy standard classification and possess power capable of altering ecosystems.'),
(13, 'Relict', 'Ancient creatures from other worlds or times (e.g., Leshen).'),
(14, 'Neopteron', 'Insect-like monsters that often swarm or use fluids to attack.');

-- --------------------------------------------------------

--
-- Table structure for table `Weapon`
--

DROP TABLE IF EXISTS `Weapon`;
CREATE TABLE `Weapon` (
  `Weapon_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Weapon_Type_ID` int(11) DEFAULT NULL,
  `Attack_Power` int(11) NOT NULL,
  `Element_ID` int(11) DEFAULT NULL,
  `Element_Value` int(11) DEFAULT 0,
  `Affinity` int(11) DEFAULT 0,
  `Rarity` int(11) DEFAULT 1,
  `Monster_ID` int(11) DEFAULT NULL,
  `Defense` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Weapon`
--

INSERT INTO `Weapon` (`Weapon_ID`, `Name`, `Weapon_Type_ID`, `Attack_Power`, `Element_ID`, `Element_Value`, `Affinity`, `Rarity`, `Monster_ID`, `Defense`) VALUES
(1, 'Reddnaught Giantwing', 1, 340, 5, 52, 0, 10, 1, 10),
(2, 'Reddnaught Blade', 2, 330, 5, 48, 0, 10, 1, 0),
(3, 'Reddnaught Splendor', 4, 320, 5, 55, 0, 10, 1, 0),
(4, 'Reddnaught Hammer', 7, 350, 5, 45, 0, 10, 1, 0),
(5, 'Reddnaught Thundrbow', 14, 300, 5, 38, 0, 10, 1, 0),
(6, 'Fatalis Zaggespanon', 2, 350, 5, 150, -30, 12, 39, 0),
(7, 'Black Fatalis Blade', 1, 1682, 5, 180, -30, 12, 39, 0),
(8, 'Fatalis Dual Skies', 4, 518, 5, 120, -30, 12, NULL, 0),
(9, 'Alatreon Commandment', 14, 336, 5, 600, 0, 12, 38, 0),
(10, 'Alatreon Revival', 8, 1176, 5, 780, 0, 12, 38, 0),
(11, 'Alatreon Metamorph', 7, 1456, 5, 720, 0, 12, 38, 0),
(12, 'Xeno Ra\'atz +', 10, 1008, 5, 240, 15, 12, 37, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Weapon_Crafting`
--

DROP TABLE IF EXISTS `Weapon_Crafting`;
CREATE TABLE `Weapon_Crafting` (
  `Weapon_ID` int(11) DEFAULT NULL,
  `Item_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Weapon_Crafting`
--

INSERT INTO `Weapon_Crafting` (`Weapon_ID`, `Item_ID`, `Quantity`) VALUES
(8, 326, 1),
(8, 324, 2),
(8, 231, 1),
(8, 323, 2),
(6, 326, 1),
(6, 324, 2),
(6, 231, 1),
(6, 323, 2),
(1, 326, 1),
(1, 324, 2),
(1, 231, 1),
(1, 323, 2),
(7, 326, 1),
(7, 324, 2),
(7, 231, 1),
(7, 323, 2),
(1, 6, 1),
(1, 7, 2),
(1, 8, 1),
(2, 6, 1),
(2, 7, 2),
(2, 8, 1),
(3, 6, 1),
(3, 7, 2),
(3, 8, 1),
(4, 6, 1),
(4, 7, 2),
(4, 8, 1),
(5, 6, 1),
(5, 7, 2),
(5, 8, 1),
(10, 318, 1),
(10, 320, 2),
(10, 317, 2),
(10, 321, 1),
(9, 318, 1),
(9, 320, 2),
(9, 317, 2),
(9, 321, 1),
(11, 318, 1),
(11, 320, 2),
(11, 317, 2),
(11, 321, 1),
(12, 311, 4),
(12, 310, 8),
(12, 314, 6),
(12, 312, 7);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
