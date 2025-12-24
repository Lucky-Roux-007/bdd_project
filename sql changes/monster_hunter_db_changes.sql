ALTER TABLE Weapon ADD COLUMN Monster_ID INT;

ALTER TABLE Weapon ADD CONSTRAINT `fk_weapon_monster` 
FOREIGN KEY (`Monster_ID`) REFERENCES `Monster` (`Monster_ID`);

-- Insert Crimson Glow Valstrax Weapons
-- Columns used: Name, Type_ID, Rarity, Attack_Power, Affinity, Element_ID, Element_Value, Monster_ID

-- Great Sword (Type 1)
INSERT INTO Weapon (Name, Weapon_Type_ID, Rarity, Attack_Power, Affinity, Element_ID, Element_Value, Monster_ID)
VALUES ('Reddnaught Giantwing', 1, 10, 340, 0, 5, 52, 1);

-- Long Sword (Type 2)
INSERT INTO Weapon (Name, Weapon_Type_ID, Rarity, Attack_Power, Affinity, Element_ID, Element_Value, Monster_ID)
VALUES ('Reddnaught Blade', 2, 10, 330, 0, 5, 48, 1);

-- Dual Blades (Type 4)
INSERT INTO Weapon (Name, Weapon_Type_ID, Rarity, Attack_Power, Affinity, Element_ID, Element_Value, Monster_ID)
VALUES ('Reddnaught Splendor', 4, 10, 320, 0, 5, 55, 1);

-- Hammer (Type 7)
INSERT INTO Weapon (Name, Weapon_Type_ID, Rarity, Attack_Power, Affinity, Element_ID, Element_Value, Monster_ID)
VALUES ('Reddnaught Hammer', 7, 10, 350, 0, 5, 45, 1);

-- Bow (Type 14)
INSERT INTO Weapon (Name, Weapon_Type_ID, Rarity, Attack_Power, Affinity, Element_ID, Element_Value, Monster_ID)
VALUES ('Reddnaught Thundrbow', 14, 10, 300, 0, 5, 38, 1);

-- 1. Add the Defense column (Defaults to 0)
ALTER TABLE Weapon ADD COLUMN Defense INT DEFAULT 0;
UPDATE Weapon SET Defense = 10 WHERE Name = 'Reddnaught Giantwing';

-- --------------------------------------------------------
-- 1. INSERT MONSTERS (Lore-Rich Descriptions)
-- --------------------------------------------------------
INSERT INTO Monster (Name, Title, Description, min_Size, max_Size, Hunter_Rank, Species_ID, Habitat_ID, Icon) VALUES
(
    'Great Jagras', 'The Glutton', 
    'The alpha leader of the Jagras pack. It is famous for its distensible jaw and massive stomach, allowing it to swallow prey like Kestodon whole. When gorged, its belly drags on the ground, making it sluggish but adding immense weight to its rolling attacks. It regurgitates food to feed its smaller kin.', 
    1100.00, 1300.00, 2, 1, 1, 'great_jagras.png'
),
(
    'Kulu-Ya-Ku', 'Scratching Bird', 
    'A peculiar Bird Wyvern with developed forelimbs capable of grasping objects. It is known to dig up rocks to use as shields or blunt weapons against predators. Its favorite meal is monster eggs, which it steals with surprising dexterity and cracks open using stone tools.', 
    850.00, 1000.00, 2, 4, 1, 'kulu_ya_ku.png'
),
(
    'Pukei-Pukei', 'Poison Bird', 
    'A Bird Wyvern known for the toxic venom it stores in its throat and tail. It consumes various flora like Scatteranuts, storing them in its mouth to mix with poison before spitting the volatile mixture at threats. When enraged, its tongue lolls out, and its feathers flush with color.', 
    1050.00, 1250.00, 3, 4, 1, 'pukei_pukei.png'
),
(
    'Barroth', 'Landslide Wyvern', 
    'A Brute Wyvern that thrives in the harsh desert heat. It wallows in mud to cool off and protect its carapace from parasites. This hardened mud serves as armor that must be broken off. It possesses a uniquely shaped crown used for plowing through terrain and smashing rivals.', 
    1300.00, 1700.00, 3, 3, 2, 'barroth.png'
),
(
    'Jyuratodus', 'Mud Fish', 
    'A Piscine Wyvern that dominates the muddy swamps of the Wildspire Waste. Unlike other aquatic monsters, it thrives in thick muck, using it to coat its body and trap prey. It is fiercely territorial and engages in turf wars with Barroth over the best mud baths.', 
    1400.00, 1600.00, 4, 5, 2, 'jyuratodus.png'
),
(
    'Tobi-Kadachi', 'Thunder Squirrel', 
    'A Fanged Wyvern that dwells in the forest canopy. By brushing its fur against bark and the ground, it builds up static electricity, which it stores in its electrodes. When fully charged, its fur stands on end and it enters a glowing, electrified state, unleashing lightning-fast strikes.', 
    1100.00, 1400.00, 4, 1, 1, 'tobi_kadachi.png'
),
(
    'Anjanath', 'Fierce Jaw', 
    'A belligerent Brute Wyvern that aggressively patrols the Ancient Forest. It possesses a specialized organ in its throat that allows it to breathe streams of fire. When provoked, it extends a sail-like fin from its back and flares its nasal bone, signaling an imminent fiery outburst.', 
    1500.00, 2000.00, 5, 3, 1, 'anjanath.png'
),
(
    'Rathalos', 'King of the Skies', 
    'The undisputed apex predator of the Ancient Forest. A Flying Wyvern that descends from the heavens to strike with poison-tipped talons and devastating fireballs. Its mastery of flight allows it to patrol vast territories, marking its domain with scorched earth.', 
    1600.00, 2200.00, 6, 2, 1, 'rathalos.png'
),
(
    'Diablos', 'Horned Tyrant', 
    'The apex monster of the Wildspire Waste. Despite being a herbivore that feeds on cacti, it is exceptionally aggressive towards any intruder. It uses its massive, twisted horns to gore enemies and can burrow underground to ambush prey from below with tremors.', 
    1900.00, 2400.00, 6, 2, 2, 'diablos.png'
),
(
    'Paolumu', 'Floating Wyvern', 
    'A Flying Wyvern from the Coral Highlands that feeds on eggs and coral polyps. It possesses a unique neck pouch that inflates with air, allowing it to float like a balloon. It uses this buoyancy to maneuver in the air and unleash compressed blasts of wind.', 
    1000.00, 1300.00, 4, 2, 3, 'paolumu.png'
),
(
    'Legiana', 'Apex of the Coral', 
    'The elegant apex predator of the Coral Highlands. Its sleek, leather-like hide and specialized wing membrane allow it to emit chilling winds, freezing prey in its tracks. It is known for its graceful, acrobatic flight and piercing screech.', 
    1500.00, 1800.00, 6, 2, 3, 'legiana.png'
),
(
    'Odogaron', 'Ebony Dog', 
    'A terrifying Fanged Wyvern that prowls the Rotten Vale. Its metabolism is incredibly high, forcing it to constantly hunt and scavenge for carrion. Its double row of claws causes severe bleeding wounds, and it is known to drag prey back to its lair to consume later.', 
    1300.00, 1600.00, 7, 1, 4, 'odogaron.png'
),
(
    'Dodogama', 'Rock Eater', 
    'A Fanged Wyvern that feeds on the volatile rocks of the Elders Recess. Its saliva reacts with the minerals in the stone, creating explosive compounds that it spits at threats. Despite its massive jaw and destructive power, it is generally docile unless provoked.', 
    1100.00, 1400.00, 6, 1, 5, 'dodogama.png'
),
(
    'Nergigante', 'Extinction Dragon', 
    'An Elder Dragon that feeds on other Elder Dragons. It possesses a unique regenerative ability where it grows white spikes that harden into black, indestructible armor over time. It fights with reckless abandon, often damaging its own body to destroy its enemies.', 
    1800.00, 2300.00, 9, 12, 5, 'nergigante.png'
);

-- --------------------------------------------------------
-- 2. INSERT WEAKNESSES (Tactical Data)
-- --------------------------------------------------------
-- Great Jagras (Weak to Fire)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Great Jagras';

-- Kulu-Ya-Ku (Weak to Water)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Kulu-Ya-Ku';

-- Pukei-Pukei (Weak to Thunder)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Pukei-Pukei';

-- Barroth (Weak to Fire when muddy, Water when clean - Generalized to Fire/Water)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Barroth';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Barroth';

-- Jyuratodus (Weak to Thunder)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Jyuratodus';

-- Tobi-Kadachi (Weak to Water)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Tobi-Kadachi';

-- Anjanath (Weak to Water)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Anjanath';

-- Rathalos (Weak to Dragon & Thunder)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Dragon') FROM Monster WHERE Name='Rathalos';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Rathalos';

-- Diablos (Weak to Ice)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Diablos';

-- Paolumu (Weak to Fire)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Paolumu';

-- Legiana (Weak to Thunder)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Legiana';

-- Odogaron (Weak to Ice)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Odogaron';

-- Dodogama (Weak to Thunder)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Dodogama';

-- Nergigante (Weak to Thunder)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Nergigante';


-- --------------------------------------------------------
-- 3. INSERT ATTACK ELEMENTS (What they hit you with)
-- --------------------------------------------------------
-- Pukei-Pukei (Poison)
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Poison') FROM Monster WHERE Name='Pukei-Pukei';

-- Tobi-Kadachi (Thunder)
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Tobi-Kadachi';

-- Anjanath (Fire)
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Anjanath';

-- Rathalos (Fire, Poison)
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Rathalos';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Poison') FROM Monster WHERE Name='Rathalos';

-- Legiana (Ice)
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Legiana';

-- Dodogama (Blast)
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Blast') FROM Monster WHERE Name='Dodogama';

-- Jyuratodus (Water)
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Jyuratodus';

-- --------------------------------------------------------
-- 1. INSERT ICEBORNE MONSTERS
-- --------------------------------------------------------
INSERT INTO Monster (Name, Title, Description, min_Size, max_Size, Hunter_Rank, Species_ID, Habitat_ID, Icon) VALUES
('Banbaro', 'Horn Wyvern', 'A brute wyvern with massive antlers that it uses to gore enemies. It charges through the snow, picking up trees and boulders to hurl at hunters. Despite its size, it is surprisingly agile and will travel across ecosystems.', 1900.00, 2600.00, 10, 3, 6, 'banbaro.png'),
('Beotodus', 'Snow Fish Wyvern', 'A piscine wyvern that swims freely through the deep snow of the Hoarfrost Reach. It uses its sharp horn to cut through frozen terrain and ambush prey from below. It wraps its body in snow armor to protect itself.', 1400.00, 1900.00, 10, 5, 6, 'beotodus.png'),
('Barioth', 'Tusk Wyvern', 'The ruler of the frozen tundra. This flying wyvern uses its spikes and tail to grip the ice, allowing it to move with terrifying speed. Its massive tusks can crush armor, and it unleashes powerful ice tornados.', 1800.00, 2300.00, 11, 2, 6, 'barioth.png'),
('Nargacuga', 'Swift Wyvern', 'A flying wyvern that has evolved to live in thick forests. It stalks prey from the shadows before striking with lightning speed. Its tail is covered in razor-sharp spikes that it can launch at enemies.', 1700.00, 2200.00, 11, 2, 1, 'nargacuga.png'),
('Tigrex', 'Roaring Wyvern', 'A flying wyvern known for its deafening roar and brute strength. It charges recklessly at foes, using its massive claws and jaws to tear through anything in its path. It is a primal force of nature.', 1700.00, 2400.00, 11, 2, 2, 'tigrex.png'),
('Glavenus', 'Cutting Wyvern', 'A brute wyvern that wields its tail like a great sword. It sharpens its tail with its fangs, heating it up to deliver searing slash attacks. It is one of the Fated Four.', 2200.00, 2800.00, 11, 3, 2, 'glavenus.png'),
('Brachydios', 'Crushing Wyvern', 'A brute wyvern that covers its fists and horn in a unique explosive slime. This slime detonates on impact or over time, allowing Brachydios to create minefields and deliver explosive punches.', 1500.00, 2000.00, 12, 3, 5, 'brachydios.png'),
('Zinogre', 'Thunder Wolf Wyvern', 'A fanged wyvern that gathers Thunderbugs to charge its body with electricity. When fully charged, it enters a super-state where its speed and power increase dramatically. It is extremely acrobatic.', 1400.00, 1900.00, 12, 1, 1, 'zinogre.png'),
('Rajang', 'Gold Lion', 'An ultra-aggressive fanged beast that hunts Kirin for their thunder horns. When enraged, its fur turns gold and it gains the ability to harden its arms. It is widely considered one of the most dangerous non-elder dragons.', 1000.00, 1400.00, 15, 7, 7, 'rajang.png');

-- --------------------------------------------------------
-- 2. INSERT ELDER DRAGONS (World & Iceborne)
-- --------------------------------------------------------
INSERT INTO Monster (Name, Title, Description, min_Size, max_Size, Hunter_Rank, Species_ID, Habitat_ID, Icon) VALUES
('Kushala Daora', 'Steel Dragon', 'An elder dragon shielded by powerful winds. Its metallic skin reflects light, and it can summon storms to keep enemies at bay. It sheds its rusted skin to maintain its steel-like armor.', 1800.00, 2400.00, 14, 12, 5, 'kushala_daora.png'),
('Teostra', 'Flame King Dragon', 'A male elder dragon clad in flames. It scatters explosive powder from its wings, which it ignites with its teeth to create massive explosions. It rules over volcanic environments.', 1700.00, 2200.00, 14, 12, 5, 'teostra.png'),
('Lunastra', 'Flame Queen Dragon', 'The female counterpart to Teostra. Her blue flames burn hotter than normal fire and cannot be extinguished easily. She fights with a calculated fury, often teaming up with her mate.', 1700.00, 2200.00, 14, 12, 5, 'lunastra.png'),
('Vaal Hazak', 'Corpse Coat Dragon', 'An elder dragon that inhabits the Rotten Vale. It covers itself in decaying flesh to cultivate deadly effluvium bacteria, which it uses to drain the life force of other creatures.', 1900.00, 2500.00, 14, 12, 4, 'vaal_hazak.png'),
('Kirin', 'Phantom Beast', 'An elder dragon resembling a unicorn. It summons lightning from the sky and moves faster than the eye can see. Its hide is incredibly tough, deflecting most attacks.', 500.00, 700.00, 13, 12, 3, 'kirin.png'),
('Xeno\'jiiva', 'Dark Light Dragon', 'A mysterious elder dragon born from the energy of the New World. It is translucent and glows with pure bio-energy. It is the larval form of a catastrophic being.', 4000.00, 4500.00, 16, 12, 5, 'xeno_jiiva.png'),
('Kulve Taroth', 'Golden Goddess', 'An elder dragon with a magnificent coat of gold. It hoards weapons and armor from fallen hunters, melting them down to add to its golden mantle. It resides deep within the Caverns of El Dorado.', 4500.00, 5000.00, 16, 12, 5, 'kulve_taroth.png'),
('Velkhana', 'Iceborne Wyvern', 'An elder dragon with the power to freeze all in its path. It controls the battlefield with walls of ice and breathes a liquid that freezes instantly upon contact. It is the flagship of the Hoarfrost Reach.', 2000.00, 2600.00, 15, 12, 6, 'velkhana.png'),
('Namielle', 'Abyssal Dragon', 'An elder dragon that controls water and electricity. Its wings glow with bioluminescent patterns, mesmerizing prey before it unleashes a high-voltage steam explosion.', 2000.00, 2500.00, 15, 12, 3, 'namielle.png'),
('Blackveil Vaal Hazak', 'Death Stench Dragon', 'A variant of Vaal Hazak infested with spores. It spreads effluvium over a much wider area and does not require the Rotten Vale to survive.', 1900.00, 2500.00, 15, 12, 1, 'blackveil_vaal_hazak.png'),
('Ruiner Nergigante', 'Devourer of Elders', 'A battle-hardened Nergigante with metallic spikes. It has survived countless battles and grown stronger, capable of launching spikes that cause bleeding.', 1800.00, 2300.00, 16, 12, 7, 'ruiner_nergigante.png'),
('Shara Ishvalda', 'Old Everwyrm', 'An elder dragon that manipulates the earth with vibrations. It covers itself in rock armor, appearing like a moving mountain before revealing its true, terrifying form.', 2500.00, 3000.00, 16, 12, 7, 'shara_ishvalda.png'),
('Safi\'jiiva', 'Red Dragon', 'The mature form of Xeno\'jiiva. It has absorbed enough energy to molt into a perfect red dragon. It can drain the energy of the land itself to heal its wounds.', 4500.00, 5000.00, 17, 12, 7, 'safi_jiiva.png'),
('Alatreon', 'Blazing Black Dragon', 'A legendary elder dragon known as a living natural disaster. It can control Fire, Ice, Thunder, Water, and Dragon elements, shifting its active state to destroy foes.', 2800.00, 3200.00, 18, 12, 7, 'alatreon.png'),
('Fatalis', 'The Black Dragon', 'A legendary dragon said to have destroyed a kingdom in a single night. Its fire is hot enough to melt steel instantly. It is the top of the food chain.', 4000.00, 4200.00, 19, 12, 7, 'fatalis.png');

-- --------------------------------------------------------
-- 3. LINK WEAKNESSES
-- --------------------------------------------------------
-- Helper to insert weakness by Name (Assumes Monster & Element Names are unique)
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Dragon') FROM Monster WHERE Name='Banbaro';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Beotodus';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Barioth';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Nargacuga';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Tigrex';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Glavenus';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Brachydios';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Zinogre';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Rajang';

-- Elders Weaknesses
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Kushala Daora';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Teostra';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Lunastra';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Vaal Hazak';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Kirin';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Poison') FROM Monster WHERE Name='Xeno\'jiiva';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Kulve Taroth';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Velkhana';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Namielle';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Blackveil Vaal Hazak';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Dragon') FROM Monster WHERE Name='Ruiner Nergigante';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Shara Ishvalda';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Dragon') FROM Monster WHERE Name='Safi\'jiiva';
INSERT INTO Monster_Weakness (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Dragon') FROM Monster WHERE Name='Fatalis';

-- --------------------------------------------------------
-- 4. LINK ATTACK ELEMENTS
-- --------------------------------------------------------
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Beotodus';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Barioth';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Glavenus';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Blast') FROM Monster WHERE Name='Brachydios';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Zinogre';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Rajang';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Ice') FROM Monster WHERE Name='Velkhana';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Water') FROM Monster WHERE Name='Namielle';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Teostra';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Lunastra';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Thunder') FROM Monster WHERE Name='Kirin';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Kulve Taroth';
INSERT INTO Monster_Dmg_Element (Monster_ID, Element_ID) SELECT Monster_ID, (SELECT Element_ID FROM Element WHERE Name='Fire') FROM Monster WHERE Name='Fatalis';

-- Add a constraint so a Monster cannot drop the same Item twice
ALTER TABLE Drops ADD UNIQUE KEY `unique_monster_item` (`Monster_ID`, `Item_ID`);

-- 1. Insert Materials for the First 3 Monsters
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Great Jagras
('Great Jagras Scale+', 6), 
('Great Jagras Hide+', 6), 
('Great Jagras Claw+', 6), 
('Great Jagras Mane', 6),
('Great Jagras Shard', 9), 
('Great Jagras Thickhide', 9), 
('Great Jagras Hardclaw', 9), 
('Great Jagras Mane+', 9),

-- Kulu-Ya-Ku
('Kulu-Ya-Ku Scale+', 6), 
('Kulu-Ya-Ku Hide+', 6), 
('Kulu-Ya-Ku Beak+', 6), 
('Kulu-Ya-Ku Plume+', 6),
('Kulu-Ya-Ku Shard', 9), 
('Kulu-Ya-Ku Thickhide', 9), 
('Kulu-Ya-Ku Hardbeak', 9), 
('Kulu-Ya-Ku Large Plume', 9),

-- Pukei-Pukei
('Pukei-Pukei Scale+', 6), 
('Pukei-Pukei Carapace', 6), 
('Pukei-Pukei Sac+', 6), 
('Pukei-Pukei Quill', 6), 
('Pukei-Pukei Tail', 6),
('Pukei-Pukei Cortex', 9), 
('Pukei-Pukei Fellwing', 9), 
('Pukei-Pukei Lash', 9), 
('Pukei-Pukei Shard', 9), 
('Large Toxin Sac', 9);

-- 2. Link Drops (Great Jagras, Kulu-Ya-Ku, Pukei-Pukei)

-- GREAT JAGRAS
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.35 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.25 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Hide+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Mane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Claw+';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.32 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.24 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Thickhide';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Mane+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Great Jagras' AND i.Name='Great Jagras Hardclaw';

-- KULU-YA-KU
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.32 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.24 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Hide+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Plume+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Beak+';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.22 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Thickhide';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Large Plume';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Kulu-Ya-Ku' AND i.Name='Kulu-Ya-Ku Hardbeak';

-- PUKEI-PUKEI
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.22 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Quill';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Sac+';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Pukei-Pukei Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Pukei-Pukei' AND i.Name='Large Toxin Sac';


-- 1. Insert Materials for Barroth, Jyuratodus, Tobi-Kadachi
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Barroth (High Rank & Master Rank)
('Barroth Carapace', 6), 
('Barroth Ridge+', 6), 
('Barroth Claw+', 6), 
('Barroth Scalp', 6), 
('Barroth Tail', 6), 
('Wyvern Gem', 7),
('Barroth Cortex', 9), 
('Barroth Chine', 9), 
('Barroth Hardclaw', 9), 
('Barroth Crown', 9), 
('Barroth Lash', 9),

-- Jyuratodus (High Rank & Master Rank)
('Jyuratodus Scale+', 6), 
('Jyuratodus Carapace', 6), 
('Jyuratodus Fang+', 6), 
('Jyuratodus Fin+', 6),
('Jyuratodus Cortex', 9), 
('Jyuratodus Hardfang', 9), 
('Jyuratodus Grandfin', 9), 
('Jyuratodus Shard', 9),

-- Tobi-Kadachi (High Rank & Master Rank)
('Tobi-Kadachi Scale+', 6), 
('Tobi-Kadachi Pelt+', 6), 
('Tobi-Kadachi Electrode+', 6), 
('Tobi-Kadachi Membrane', 6), 
('Tobi-Kadachi Claw+', 6),
('Tobi-Kadachi Shard', 9), 
('Tobi-Kadachi Thickfur', 9), 
('Tobi-Kadachi Hardclaw', 9), 
('Tobi-Kadachi Membrane+', 9), 
('Tobi-Kadachi Cathode', 9);

-- 2. Link Drops (Barroth, Jyuratodus, Tobi-Kadachi)

-- BARROTH
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Scalp';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Ridge+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Claw+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Wyvern Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Chine';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Crown';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Barroth' AND i.Name='Barroth Lash';

-- JYURATODUS
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.22 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Fin+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Fang+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Wyvern Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Jyuratodus' AND i.Name='Jyuratodus Grandfin';

-- TOBI-KADACHI
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Pelt+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Claw+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Membrane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Electrode+';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Thickfur';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Membrane+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Tobi-Kadachi' AND i.Name='Tobi-Kadachi Cathode';

-- 1. Insert Materials for Anjanath, Rathalos, Diablos
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Anjanath (High & Master Rank)
('Anjanath Scale+', 6), ('Anjanath Pelt+', 6), ('Anjanath Fang+', 6), ('Anjanath Nosebone+', 6), ('Anjanath Tail', 6), ('Anjanath Plate', 5), ('Anjanath Gem', 7), ('Inferno Sac', 6),
('Anjanath Shard', 9), ('Anjanath Fur', 9), ('Anjanath Hardfang', 9), ('Heavy Anjanath Nosebone', 9), ('Anjanath Lash', 9), ('Anjanath Mantle', 11), ('Conflagrant Sac', 9),

-- Rathalos (High & Master Rank)
('Rathalos Scale+', 6), ('Rathalos Carapace', 6), ('Rathalos Wing', 6), ('Rathalos Webbing', 6), ('Rathalos Tail', 6), ('Rathalos Marrow', 6), ('Rathalos Medulla', 6), ('Rathalos Plate', 5), ('Rathalos Ruby', 7), ('Rath Wingtalon+', 6),
('Rathalos Shard', 9), ('Rathalos Cortex', 9), ('Rathalos Fellwing', 9), ('Rathalos Lash', 9), ('Rathalos Mantle', 11), ('Rath Wingripper', 9),

-- Diablos (High & Master Rank)
('Diablos Ridge+', 6), ('Diablos Carapace', 6), ('Diablos Fang', 6), ('Diablos Tailcase', 6), ('Diablos Marrow', 6), ('Blos Medulla', 7), ('Twisted Horn', 6), ('Majestic Horn', 7), ('Dash Extract', 4),
('Diablos Cortex', 9), ('Diablos Chine', 9), ('Diablos Hardfang', 9), ('Twisted Stouthorn', 9), ('Diablos Lash', 9);

-- 2. Link Drops (Anjanath, Rathalos, Diablos)

-- ANJANATH
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Pelt+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Fang+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Nosebone+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Plate';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Gem';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Inferno Sac';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Fur';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Heavy Anjanath Nosebone';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Anjanath Mantle';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Anjanath' AND i.Name='Conflagrant Sac';

-- RATHALOS
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.25 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Wing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Webbing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Marrow';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Plate';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.02 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Ruby';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Inferno Sac';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rath Medulla';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Rathalos Mantle';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Rathalos' AND i.Name='Conflagrant Sac';

-- DIABLOS
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.25 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Ridge+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Fang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Tailcase';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Blos Medulla';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Twisted Horn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Majestic Horn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Wyvern Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Chine';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Diablos Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Diablos' AND i.Name='Twisted Stouthorn';

-- 1. Insert Materials for Paolumu, Legiana, Odogaron, Dodogama
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Paolumu (High & Master Rank)
('Paolumu Scale+', 6), ('Paolumu Carapace', 6), ('Paolumu Webbing', 6), ('Paolumu Pelt+', 6), ('Paolumu Wing', 6),
('Paolumu Shard', 9), ('Paolumu Cortex', 9), ('Paolumu Thickfur', 9), ('Paolumu Fellwing', 9),

-- Legiana (High & Master Rank)
('Legiana Scale+', 6), ('Legiana Hide+', 6), ('Legiana Claw+', 6), ('Legiana Webbing', 6), ('Legiana Tail Webbing', 6), ('Legiana Plate', 5), ('Legiana Gem', 7), ('Freezer Sac', 6),
('Legiana Shard', 10), ('Legiana Thickhide', 10), ('Legiana Hardclaw', 10), ('Legiana Mantle', 11), ('Cryo Sac', 9),

-- Odogaron (High & Master Rank)
('Odogaron Scale+', 6), ('Odogaron Sinew+', 6), ('Odogaron Claw+', 6), ('Odogaron Tail', 6), ('Odogaron Fang+', 6), ('Odogaron Plate', 5), ('Odogaron Gem', 7),
('Odogaron Shard', 10), ('Odogaron Cortex', 10), ('Odogaron Hardclaw', 10), ('Odogaron Hardfang', 10), ('Odogaron Lash', 10), ('Odogaron Mantle', 11),

-- Dodogama (High & Master Rank)
('Dodogama Hide+', 6), ('Dodogama Jaw', 6), ('Dodogama Tail', 6), ('Dodogama Talon', 6),
('Dodogama Thickhide', 9), ('Dodogama Hardclaw', 9), ('Dodogama Lash', 9), ('Dodogama Mandible', 9);

-- 2. Link Drops (Paolumu, Legiana, Odogaron, Dodogama)

-- PAOLUMU
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Pelt+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Wing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Webbing';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Thickfur';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Paolumu' AND i.Name='Paolumu Fellwing';

-- LEGIANA
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Hide+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Claw+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Webbing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Tail Webbing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Plate';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Gem';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Freezer Sac';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Thickhide';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Legiana Mantle';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Legiana' AND i.Name='Cryo Sac';

-- ODOGARON
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Sinew+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Fang+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Claw+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Plate';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Odogaron' AND i.Name='Odogaron Mantle';

-- DODOGAMA
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Hide+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Jaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Talon';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Tail';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Thickhide';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Mandible';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Dodogama' AND i.Name='Dodogama Lash';

-- 1. Insert Materials for Nergigante, Banbaro, Beotodus
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Nergigante (High Rank)
('Immortal Dragonscale', 7), 
('Nergigante Carapace', 7), 
('Nergigante Talon', 7), 
('Nergigante Tail', 7), 
('Nergigante Horn+', 7), 
('Nergigante Regrowth Plate', 7), 
('Nergigante Gem', 8),

-- Banbaro (Master Rank)
('Banbaro Cortex', 10), 
('Banbaro Chine', 10), 
('Banbaro Great Horn', 10), 
('Banbaro Lash', 10),

-- Beotodus (Master Rank)
('Beotodus Shard', 10), 
('Beotodus Cortex', 10), 
('Beotodus Hardhorn', 10), 
('Beotodus Grandfin', 10);

-- 2. Link Drops (Nergigante, Banbaro, Beotodus)

-- NERGIGANTE
-- High Rank Only
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Nergigante' AND i.Name='Immortal Dragonscale';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Nergigante' AND i.Name='Nergigante Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Nergigante' AND i.Name='Nergigante Talon';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Nergigante' AND i.Name='Nergigante Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Nergigante' AND i.Name='Nergigante Horn+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Nergigante' AND i.Name='Nergigante Regrowth Plate';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Nergigante' AND i.Name='Nergigante Gem';

-- BANBARO
-- Master Rank Only
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.32 FROM Monster m, Item i WHERE m.Name='Banbaro' AND i.Name='Banbaro Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.22 FROM Monster m, Item i WHERE m.Name='Banbaro' AND i.Name='Banbaro Chine';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Banbaro' AND i.Name='Banbaro Great Horn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Banbaro' AND i.Name='Banbaro Lash';

-- BEOTODUS
-- Master Rank Only
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Beotodus' AND i.Name='Beotodus Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.25 FROM Monster m, Item i WHERE m.Name='Beotodus' AND i.Name='Beotodus Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Beotodus' AND i.Name='Beotodus Grandfin';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Beotodus' AND i.Name='Beotodus Hardhorn';

-- 1. Insert Materials for Barioth, Nargacuga, Tigrex
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Barioth (Master Rank)
('Barioth Cortex', 10), 
('Barioth Thickfur', 10), 
('Barioth Hardclaw', 10), 
('Barioth Greatspike', 10), 
('Barioth Lash', 10),

-- Nargacuga (Master Rank)
('Nargacuga Shard', 10), 
('Nargacuga Blackfur+', 10), 
('Nargacuga Hardfang', 10), 
('Nargacuga Cutwing+', 10), 
('Nargacuga Lash', 10), 
('Nargacuga Tailspear', 10), 
('Nargacuga Mantle', 11),

-- Tigrex (Master Rank)
('Tigrex Shard', 10), 
('Tigrex Cortex', 10), 
('Tigrex Hardclaw', 10), 
('Tigrex Hardfang', 10), 
('Tigrex Lash', 10), 
('Tigrex Maw', 10), 
('Tigrex Mantle', 11);

-- 2. Link Drops (Barioth, Nargacuga, Tigrex)

-- BARIOTH
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Barioth' AND i.Name='Barioth Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Barioth' AND i.Name='Barioth Thickfur';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Barioth' AND i.Name='Barioth Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Barioth' AND i.Name='Barioth Greatspike';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Barioth' AND i.Name='Barioth Lash';

-- NARGACUGA
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Nargacuga' AND i.Name='Nargacuga Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Nargacuga' AND i.Name='Nargacuga Blackfur+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Nargacuga' AND i.Name='Nargacuga Cutwing+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Nargacuga' AND i.Name='Nargacuga Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Nargacuga' AND i.Name='Nargacuga Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Nargacuga' AND i.Name='Nargacuga Tailspear';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Nargacuga' AND i.Name='Nargacuga Mantle';

-- TIGREX
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Tigrex' AND i.Name='Tigrex Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Tigrex' AND i.Name='Tigrex Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Tigrex' AND i.Name='Tigrex Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Tigrex' AND i.Name='Tigrex Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Tigrex' AND i.Name='Tigrex Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Tigrex' AND i.Name='Tigrex Maw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Tigrex' AND i.Name='Tigrex Mantle';

-- 1. Insert Materials for Glavenus, Brachydios, Zinogre
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Glavenus (Master Rank)
('Glavenus Shard', 10), 
('Glavenus Cortex', 10), 
('Glavenus Hardfang', 10), 
('Glavenus Pyroshell', 10), 
('Glavenus Tailedge', 10), 
('Glavenus Mantle', 11),

-- Brachydios (Master Rank)
('Brachydios Cortex', 10), 
('Brachydios Ebonshell+', 10), 
('Brachydios Pounder+', 10), 
('Brachydios Lash', 10), 
('Brachydios Crown', 10), 
('Brachydios Pallium', 11),

-- Zinogre (Master Rank)
('Zinogre Cortex', 10), 
('Zinogre Hardclaw', 10), 
('Zinogre Deathly Shocker', 10), 
('Zinogre Hardhorn', 10), 
('Zinogre Lash', 10), 
('Zinogre Skymerald', 11);

-- 2. Link Drops (Glavenus, Brachydios, Zinogre)

-- GLAVENUS
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Glavenus' AND i.Name='Glavenus Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Glavenus' AND i.Name='Glavenus Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Glavenus' AND i.Name='Glavenus Pyroshell';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Glavenus' AND i.Name='Glavenus Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Glavenus' AND i.Name='Glavenus Tailedge';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Glavenus' AND i.Name='Glavenus Mantle';

-- BRACHYDIOS
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Brachydios' AND i.Name='Brachydios Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Brachydios' AND i.Name='Brachydios Ebonshell+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Brachydios' AND i.Name='Brachydios Pounder+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Brachydios' AND i.Name='Brachydios Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Brachydios' AND i.Name='Brachydios Crown';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Brachydios' AND i.Name='Brachydios Pallium';

-- ZINOGRE
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Zinogre' AND i.Name='Zinogre Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Zinogre' AND i.Name='Zinogre Deathly Shocker';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Zinogre' AND i.Name='Zinogre Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Zinogre' AND i.Name='Zinogre Hardhorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Zinogre' AND i.Name='Zinogre Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Zinogre' AND i.Name='Zinogre Skymerald';

-- 1. Insert Materials for Rajang, Kushala, Teostra, Lunastra
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Rajang (Master Rank)
('Rajang Hardfang', 11), 
('Rajang Wildpelt', 11), 
('Rajang Hardclaw', 11), 
('Rajang Tail', 11), 
('Gold Rajang Pelt', 11), 
('Rajang Heart', 12),

-- Kushala Daora (High & Master Rank)
('Daora Dragon Scale+', 7), ('Daora Carapace', 7), ('Daora Claw+', 7), ('Daora Horn+', 7), ('Daora Webbing', 7), ('Daora Tail', 7), ('Daora Gem', 8),
('Daora Cortex', 11), ('Daora Shard', 11), ('Daora Hardclaw', 11), ('Daora Hardhorn', 11), ('Daora Fellwing', 11), ('Daora Lash', 11), ('Large Elder Dragon Gem', 12),

-- Teostra (High & Master Rank)
('Teostra Carapace', 7), ('Fire Dragon Scale+', 7), ('Teostra Mane', 7), ('Teostra Claw+', 7), ('Teostra Horn+', 7), ('Teostra Webbing', 7), ('Teostra Tail', 7), ('Teostra Powder', 7), ('Teostra Gem', 8),
('Teostra Cortex', 11), ('Hellfire Shard', 11), ('Teostra Mane+', 11), ('Teostra Hardclaw', 11), ('Teostra Hardhorn', 11), ('Teostra Fellwing', 11), ('Teostra Lash', 11),

-- Lunastra (High & Master Rank)
('Lunastra Carapace', 7), ('Lunastra Scale+', 7), ('Lunastra Mane', 7), ('Lunastra Wing', 7), ('Lunastra Horn', 7), ('Lunastra Tail', 7), ('Lunastra Gem', 8),
('Lunastra Cortex', 11), ('Lunastra Shard', 11), ('Lunastra Mane+', 11), ('Lunastra Hardhorn', 11), ('Lunastra Fellwing', 11), ('Lunastra Lash', 11);

-- 2. Link Drops (Rajang, Kushala, Teostra, Lunastra)

-- RAJANG (Master Rank)
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Rajang' AND i.Name='Rajang Wildpelt';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Rajang' AND i.Name='Gold Rajang Pelt';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Rajang' AND i.Name='Rajang Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Rajang' AND i.Name='Rajang Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Rajang' AND i.Name='Rajang Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Rajang' AND i.Name='Rajang Heart';

-- KUSHALA DAORA
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Dragon Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.22 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Claw+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Webbing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Horn+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Daora Hardhorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Kushala Daora' AND i.Name='Large Elder Dragon Gem';

-- TEOSTRA
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Fire Dragon Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Mane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Webbing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Powder';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Horn+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Hellfire Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Mane+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Teostra Hardhorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Teostra' AND i.Name='Large Elder Dragon Gem';

-- LUNASTRA
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Scale+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Mane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Wing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Horn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Mane+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Lunastra Hardhorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Lunastra' AND i.Name='Large Elder Dragon Gem';

-- 1. Insert Materials for Vaal Hazak, Kirin, Namielle, Velkhana, Blackveil
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Vaal Hazak (High & Master Rank)
('Vaal Hazak Carapace', 7), ('Vaal Hazak Fang+', 7), ('Vaal Hazak Gem', 8), ('Vaal Hazak Talon', 7), ('Vaal Hazak Membrane', 7), ('Vaal Hazak Tail', 7), ('Vaal Hazak Wing', 7),
('Vaal Hazak Cortex', 11), ('Vaal Hazak Hardfang', 11), ('Vaal Hazak Fellwing', 11),

-- Kirin (High & Master Rank)
('Kirin Hide+', 7), ('Kirin Azure Horn', 7), ('Kirin Thundertail', 7), ('Kirin Mane', 7),
('Kirin Fine Hide', 11), ('Kirin Silver Mane', 11), ('Kirin Azure Horn+', 11),

-- Namielle (Master Rank)
('Namielle Cortex', 11), ('Namielle Hardclaw', 11), ('Namielle Fellwing', 11), ('Namielle Whisker', 11), ('Namielle Lash', 11), ('Abyssal LED', 12),

-- Velkhana (Master Rank)
('Velkhana Cortex', 11), ('Velkhana Hardclaw', 11), ('Velkhana Crownhorn', 11), ('Velkhana Fellwing', 11), ('Velkhana Lash', 11), ('Velkhana Crystal', 12),

-- Blackveil Vaal Hazak (Master Rank)
('Deathweaver Cortex', 11), ('Blackveil Fellwing', 11), ('Deathweaver Limb', 11), ('Deathweaver Membrane', 11);

-- 2. Link Drops (Vaal Hazak, Kirin, Namielle, Velkhana, Blackveil)

-- VAAL HAZAK
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.25 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Carapace';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Fang+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Talon';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Membrane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Wing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.08 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Tail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Gem';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Hardfang';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Vaal Hazak Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Vaal Hazak' AND i.Name='Large Elder Dragon Gem';

-- KIRIN
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Kirin Hide+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Kirin Mane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Kirin Azure Horn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Kirin Thundertail';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Kirin Fine Hide';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Kirin Silver Mane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Kirin Azure Horn+';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Kirin' AND i.Name='Large Elder Dragon Gem';

-- NAMIELLE
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Namielle' AND i.Name='Namielle Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Namielle' AND i.Name='Namielle Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Namielle' AND i.Name='Namielle Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Namielle' AND i.Name='Namielle Whisker';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Namielle' AND i.Name='Namielle Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.02 FROM Monster m, Item i WHERE m.Name='Namielle' AND i.Name='Abyssal LED';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Namielle' AND i.Name='Large Elder Dragon Gem';

-- VELKHANA
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Velkhana' AND i.Name='Velkhana Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Velkhana' AND i.Name='Velkhana Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Velkhana' AND i.Name='Velkhana Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Velkhana' AND i.Name='Velkhana Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Velkhana' AND i.Name='Velkhana Crownhorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.02 FROM Monster m, Item i WHERE m.Name='Velkhana' AND i.Name='Velkhana Crystal';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Velkhana' AND i.Name='Large Elder Dragon Gem';

-- BLACKVEIL VAAL HAZAK
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.30 FROM Monster m, Item i WHERE m.Name='Blackveil Vaal Hazak' AND i.Name='Deathweaver Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Blackveil Vaal Hazak' AND i.Name='Blackveil Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.18 FROM Monster m, Item i WHERE m.Name='Blackveil Vaal Hazak' AND i.Name='Deathweaver Limb';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Blackveil Vaal Hazak' AND i.Name='Deathweaver Membrane';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Blackveil Vaal Hazak' AND i.Name='Large Elder Dragon Gem';

-- 1. Insert Materials for End Game Elders
INSERT IGNORE INTO Item (Name, Rarity) VALUES
-- Kulve Taroth (High & Master Rank)
('Kulve Taroth Golden Scale', 8), ('Golden Spiral Horn', 8), ('Glimstone', 8), ('Kulve Taroth Golden Shell', 8), ('Kulve Taroth Golden Nugget', 8),
('Golden Dragonsphire', 12),

-- Ruiner Nergigante (Master Rank)
('Immortal Shard', 11), 
('Nergigante Cortex', 11), 
('Nergigante Hardclaw', 11), 
('Nergigante Lash', 11),
('Annihilating Greathorn', 12), 
('Eternal Regrowth Plate', 12), 
('Large Elder Dragon Gem', 12),

-- Shara Ishvalda (Master Rank)
('Shara Ishvalda Tenderplate', 12), 
('Shara Ishvalda Petalstone', 12), 
('Shara Ishvalda Tenderclaw', 12), 
('Shara Ishvalda Gem', 12),

-- Safi'jiiva (Master Rank)
('Safi\'jiiva Cortex', 12), 
('Safi\'jiiva Hardhorn', 12), 
('Safi\'jiiva Fellwing', 12), 
('Safi\'jiiva Lash', 12), 
('Safi\'jiiva Shard', 12), 
('Zionium Crystal', 12),

-- Alatreon (Master Rank)
('Alatreon Cortex', 12), 
('Alatreon Riptalon', 12), 
('Alatreon Direwing', 12), 
('Alatreon Diretail', 12), 
('Skyswayer', 12), 
('Azure Dragonsphire', 12),

-- Fatalis (Master Rank)
('Fatalis Cortex', 12), 
('Fatalis Pectus', 12), 
('Fatalis Hardhorn', 12), 
('Fatalis Shard', 12), 
('Fatalis Evil Eye', 12);

-- 2. Link Drops (Kulve, Ruiner, Shara, Safi, Alatreon, Fatalis)

-- KULVE TAROTH
-- High Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.35 FROM Monster m, Item i WHERE m.Name='Kulve Taroth' AND i.Name='Kulve Taroth Golden Scale';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.25 FROM Monster m, Item i WHERE m.Name='Kulve Taroth' AND i.Name='Kulve Taroth Golden Shell';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Kulve Taroth' AND i.Name='Kulve Taroth Golden Nugget';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Kulve Taroth' AND i.Name='Golden Spiral Horn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Kulve Taroth' AND i.Name='Glimstone';
-- Master Rank
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Kulve Taroth' AND i.Name='Golden Dragonsphire';

-- RUINER NERGIGANTE
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Ruiner Nergigante' AND i.Name='Nergigante Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Ruiner Nergigante' AND i.Name='Immortal Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Ruiner Nergigante' AND i.Name='Nergigante Hardclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Ruiner Nergigante' AND i.Name='Nergigante Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Ruiner Nergigante' AND i.Name='Annihilating Greathorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Ruiner Nergigante' AND i.Name='Eternal Regrowth Plate';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Ruiner Nergigante' AND i.Name='Large Elder Dragon Gem';

-- SHARA ISHVALDA
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.25 FROM Monster m, Item i WHERE m.Name='Shara Ishvalda' AND i.Name='Shara Ishvalda Petalstone';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Shara Ishvalda' AND i.Name='Shara Ishvalda Tenderclaw';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Shara Ishvalda' AND i.Name='Shara Ishvalda Tenderplate';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Shara Ishvalda' AND i.Name='Shara Ishvalda Gem';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.03 FROM Monster m, Item i WHERE m.Name='Shara Ishvalda' AND i.Name='Large Elder Dragon Gem';

-- SAFI'JIIVA
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Safi\'jiiva' AND i.Name='Safi\'jiiva Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Safi\'jiiva' AND i.Name='Safi\'jiiva Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Safi\'jiiva' AND i.Name='Safi\'jiiva Hardhorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Safi\'jiiva' AND i.Name='Safi\'jiiva Fellwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Safi\'jiiva' AND i.Name='Safi\'jiiva Lash';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Safi\'jiiva' AND i.Name='Zionium Crystal';

-- ALATREON
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Alatreon' AND i.Name='Alatreon Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Alatreon' AND i.Name='Alatreon Riptalon';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Alatreon' AND i.Name='Alatreon Direwing';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Alatreon' AND i.Name='Alatreon Diretail';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.10 FROM Monster m, Item i WHERE m.Name='Alatreon' AND i.Name='Skyswayer';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.05 FROM Monster m, Item i WHERE m.Name='Alatreon' AND i.Name='Azure Dragonsphire';

-- FATALIS
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.28 FROM Monster m, Item i WHERE m.Name='Fatalis' AND i.Name='Fatalis Cortex';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.20 FROM Monster m, Item i WHERE m.Name='Fatalis' AND i.Name='Fatalis Shard';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.15 FROM Monster m, Item i WHERE m.Name='Fatalis' AND i.Name='Fatalis Pectus';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.12 FROM Monster m, Item i WHERE m.Name='Fatalis' AND i.Name='Fatalis Hardhorn';
INSERT IGNORE INTO Drops (Monster_ID, Item_ID, Drop_Rate) SELECT m.Monster_ID, i.Item_ID, 0.07 FROM Monster m, Item i WHERE m.Name='Fatalis' AND i.Name='Fatalis Evil Eye';


